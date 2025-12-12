import 'dart:async';
import 'dart:math';

import 'package:fast_rsa/fast_rsa.dart';
import 'package:retry/retry.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synchronized/synchronized.dart';

import '../utils/teammors_log.dart';
import '../utils/json_utils.dart';
import '../utils/http_utils.dart';
import '../paras/parameters.dart';
import 'im_security.dart';

/// Flutter RSA加密工具类
/// 使用 fast_rsa 插件实现高性能RSA加密解密
/// 支持密钥对生成、加密、解密
class RSACryptoUtils {
  /// 生成RSA密钥对
  static Future<Map<String, String>> generateKeyPair() async {
    try {
      TeammorsLogUtils.tlog('🔑 开始生成RSA密钥对...');

      var keyPair = await RSA.generate(2048);

      TeammorsLogUtils.tlog(keyPair.publicKey);
      TeammorsLogUtils.tlog(keyPair.privateKey);

      return {
        'publicKey': keyPair.publicKey,
        'privateKey': keyPair.privateKey,
      };
    } catch (e) {
      TeammorsLogUtils.tlog('❌ RSA密钥对生成失败: $e');
      throw Exception('RSA密钥对生成失败: $e');
    }
  }

  // 存储上次请求时间的Map
  static final Map<String, DateTime> _lastRequestTime = {};

  static Future<String> aesEncryptDataBody(String userId, String dataBody, bool isGroup) async {
    try {
      String aesKey = _generateRandomString(32);
      String secDataBody = AESEncrypt.aesEncoded(dataBody, aesKey);

      if (!isGroup) {
        if (userId.contains("_")) {
          userId = userId.split("_")[1];
        }
      }
      String publicKeyPem = ParametersManager.getInstance().userPublicKey[userId] ?? '';
      if (publicKeyPem.isEmpty) {
        publicKeyPem = await getUserPublicKey(userId, isGroup);
      }

      var aesKeyToRsa = await RSA.encryptPKCS1v15(aesKey, publicKeyPem);

      return "${aesKeyToRsa}&&&${secDataBody}";
    } catch (e) {
      TeammorsLogUtils.tlog('❌ RSA加密失败: $e');
      throw Exception('RSA加密失败: $e');
    }
  }

  static Future<String> aesEncryptMySelfDataBody(String dataBody, bool isGroup) async {
    try {
      String aesKey = _generateRandomString(32);
      String secDataBody = AESEncrypt.aesEncoded(dataBody, aesKey);
      String publicKeyPem = ParametersManager.getInstance().publicKey!;
      var aesKeyToRsa = await RSA.encryptPKCS1v15(aesKey, publicKeyPem);
      return "${aesKeyToRsa}&&&${secDataBody}";
    } catch (e) {
      TeammorsLogUtils.tlog('❌ RSA加密失败: $e');
      throw Exception('RSA加密失败: $e');
    }
  }

  // 使用锁确保同一时间只有一个请求进入临界区
  static final Lock _lock = Lock();

  // 缓存正在进行的解密操作，避免重复计算
  static final Map<String, Future<String>> _pendingDecrypts = {};

  static Future<String> aesDecryptDataBody(String encryptedDataBody) async {
    String hashCode = "${encryptedDataBody.hashCode}_${encryptedDataBody.length}";

    // 检查是否已有正在进行的解密任务
    if (_pendingDecrypts.containsKey(hashCode)) {
      // 添加完成回调以验证所有调用都得到了结果
      return _pendingDecrypts[hashCode]!.then((result) {
        return result;
      });
    }

    // 创建新解密任务
    Completer<String> completer = Completer();
    _pendingDecrypts[hashCode] = completer.future;

    return _lock.synchronized(() async {
      try {
        // 再次检查缓存
        String? cachedResultAgain = ParametersManager.getInstance().messageCache[hashCode];
        if (cachedResultAgain != null) {
          completer.complete(cachedResultAgain);
          return cachedResultAgain;
        }

        String dataBody = encryptedDataBody;
        if (encryptedDataBody.contains("&&&") && !JSONUtils.isJson(dataBody)) {
          final data = encryptedDataBody.split("&&&");
          String aesKeyToRsa = data[0];

          if(ParametersManager.getInstance().privateKey =="null"
          || ParametersManager.getInstance().privateKey == null
          || ParametersManager.getInstance().privateKey!.isEmpty){
            final prefs = await SharedPreferences.getInstance();
            String userId = ParametersManager.getInstance().fromUid.split("_")[1];
            ParametersManager.getInstance().privateKey = prefs.getString('ts_${userId}_privateKey');
          }
          String aesKey = await RSA.decryptPKCS1v15(aesKeyToRsa, ParametersManager.getInstance().privateKey!);
          dataBody = AESEncrypt.aesDecrypted(data[1], aesKey);
        }

        completer.complete(dataBody);
        return dataBody;
      } catch (e) {
        TeammorsLogUtils.tlog('❌ AES解密失败: $e, hashCode=$hashCode');
        completer.completeError(e);
        throw Exception('AES解密失败: $e');
      } finally {
        _pendingDecrypts.remove(hashCode);
      }
    });
  }

  // ========== 私有辅助方法 ==========

  /// 生成随机字符串
  static String _generateRandomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random.secure();
    return String.fromCharCodes(Iterable.generate(length, (_) => chars.codeUnitAt(random.nextInt(chars.length))));
  }


  static Future<String> getUserPublicKeyWithRetryPackage(
      String userId,
      bool isGroup,
      ) async {
    final r = RetryOptions(
      maxAttempts: 3,
      delayFactor: Duration(seconds: 1),
      maxDelay: Duration(seconds: 3),
    );

    try {
      return await r.retry(
            () => getUserPublicKey(userId, isGroup),
        retryIf: (e) {
          // 只对非401错误进行重试
          return e.toString().contains("401") == false;
        },
      );
    } catch (e) {
      TeammorsLogUtils.tlog("所有重试尝试均失败: $e");
      return "";
    }
  }

  // 新增：获取用户public key
  static Future<String> getUserPublicKey(String userId, bool isGroup) async {
    // 检查缓存中是否已有public key
    String? cachedPublicKey = ParametersManager.getInstance().userPublicKey[userId];
    if (cachedPublicKey != null && cachedPublicKey.isNotEmpty) {
      // 检查上次请求时间
      DateTime? lastRequest = _lastRequestTime[userId];
      if (lastRequest != null) {
        // 计算距离上次请求的时间间隔
        Duration timeSinceLastRequest = DateTime.now().difference(lastRequest);
        // 如果间隔少于2分钟，直接返回缓存的public key
        if (timeSinceLastRequest.inMinutes < 2) {
          TeammorsLogUtils.tlog("📱 使用缓存的public key，距离上次请求: ${timeSinceLastRequest.inSeconds}秒");
          return cachedPublicKey;
        }
      }
    }

    String publicKey = "";
    try {
      String groupFlag = "0";
      if (isGroup) {
        groupFlag = "1";
      }
      final paras = {'userId': userId, 'isGroup': groupFlag};
      TeammorsLogUtils.tlog(paras.toString());

      String urls = "${ParametersManager.getInstance().serverUrl}/getPublicKey";

      final responseData = await ImHttpUtils.getInstance().requestDataNoContext(paras, urls);

      if (responseData['status'] != null && responseData['status'].contains("success")) {
        publicKey = responseData['data'];
        ParametersManager.getInstance().userPublicKey[userId] = publicKey.toString();
        // 更新上次请求时间
        _lastRequestTime[userId] = DateTime.now();
      } else {
        TeammorsLogUtils.tlog("❌ 获取用户public key失败");
        TeammorsLogUtils.tlog("错误信息: ${responseData['message'] ?? '未知错误'}");
        //状态码: 401
        if(responseData['message'].toString().contains("401")) {
          try {
            // final success = await AccountService().appExtLogout();
            // if (success) {
            //   await globalNavigatorKey.currentState
            //       ?.pushNamedAndRemoveUntil('/login', (route) => false);
            // }
          } catch (e) {
            TeammorsLogUtils.tlog("e=$e");
          }
        }
      }
    } catch (e) {
      TeammorsLogUtils.tlog("❌ 获取用户public key时发生异常: $e");
    }
    return publicKey;
  }
}
