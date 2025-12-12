import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/export.dart';

import '../utils/teammors_log.dart';

class RSAUtil {
  // 加密长文本（自动分段）
  static String encryptLongString(String plaintext, String publicKeyPem) {
    RSAPublicKey publicKey = parsePublicKeyFromPem(publicKeyPem);

    final encryptor = Encrypter(RSA(publicKey: publicKey));

    // RSA 每次能加密的块大小（字节）
    final blockSize = publicKey.modulus!.bitLength ~/ 8 - 11;
    final encoded = utf8.encode(plaintext);
    final bytes = Uint8List.fromList(encoded);

    final blocks = _splitIntoBlocks(bytes, blockSize);
    final encryptedBlocks = <String>[];

    for (final block in blocks) {
      encryptedBlocks.add(encryptor.encryptBytes(block).base64);
    }

    return encryptedBlocks.join('|');
  }

  // 解密长文本（分段解密）
  static String decryptLongString(String encrypted, String privateKeyPem) {
    RSAPrivateKey privateKey = parsePrivateKeyFromPem(privateKeyPem);

    final decryptor = Encrypter(RSA(privateKey: privateKey));
    final blocks = encrypted.split('|');

    final result = <int>[];
    for (final block in blocks) {
      final decrypted = decryptor.decryptBytes(Encrypted.fromBase64(block));
      result.addAll(decrypted);
    }

    return utf8.decode(result);
  }

  // 将数据分割成块
  static List<Uint8List> _splitIntoBlocks(Uint8List data, int blockSize) {
    final blocks = <Uint8List>[];
    for (var i = 0; i < data.length; i += blockSize) {
      final end = min(i + blockSize, data.length);
      blocks.add(data.sublist(i, end));
    }
    return blocks;
  }

  // 从 PEM 格式字符串加载公钥
  static RSAPublicKey parsePublicKeyFromPem(String pem) {
    final publicKey = RSAKeyParser().parse(pem) as RSAPublicKey;
    return publicKey;
  }

  // 从 PEM 格式字符串加载私钥
  static RSAPrivateKey parsePrivateKeyFromPem(String pem) {
    final privateKey = RSAKeyParser().parse(pem) as RSAPrivateKey;
    return privateKey;
  }

  // 解密主函数
  static String hybridDecrypt(String encryptedBase64, String privateKeyPem) {
    try {
      // 1. Base64解码
      Uint8List encryptedData = base64.decode(encryptedBase64);

      TeammorsLogUtils.tlog('解密数据总长度: ${encryptedData.length}');

      // 2. 拆分数据（假设格式：IV + RSA加密的AES密钥 + AES加密的密文）
      int ivLength = 12; // GCM模式IV通常12字节
      int rsaEncryptedKeyLength = 256; // RSA-2048加密后固定256字节

      // 验证数据长度
      if (encryptedData.length < ivLength + rsaEncryptedKeyLength) {
        throw Exception('加密数据长度不足: ${encryptedData.length} < ${ivLength + rsaEncryptedKeyLength}');
      }

      Uint8List iv = encryptedData.sublist(0, ivLength);
      Uint8List encryptedAesKey = encryptedData.sublist(ivLength, ivLength + rsaEncryptedKeyLength);
      Uint8List encryptedMessage = encryptedData.sublist(ivLength + rsaEncryptedKeyLength);

      TeammorsLogUtils.tlog('IV长度: ${iv.length}, AES密钥加密数据长度: ${encryptedAesKey.length}, 消息长度: ${encryptedMessage.length}');

      // 3. 用RSA私钥解密AES密钥
      Uint8List aesKeyBytes = rsaDecrypt(encryptedAesKey, privateKeyPem);

      // 4. 用AES-GCM解密原始数据
      return aesGcmDecrypt(encryptedMessage, aesKeyBytes, iv);
    } catch (e) {
      TeammorsLogUtils.tlog('混合解密错误: $e');
      rethrow;
    }
  }

  // RSA解密（PKCS#1 OAEP）
  static Uint8List rsaDecrypt(Uint8List encrypted, String privateKeyPem) {
    try {
      // 使用现有的解析方法获取私钥
      RSAPrivateKey privateKey = parsePrivateKeyFromPem(privateKeyPem);

      // 初始化RSA引擎
      var rsaEngine = OAEPEncoding(RSAEngine())..init(false, PrivateKeyParameter<RSAPrivateKey>(privateKey));

      return rsaEngine.process(encrypted);
    } catch (e) {
      TeammorsLogUtils.tlog('RSA解密错误: $e');
      TeammorsLogUtils.tlog('加密数据长度: ${encrypted.length}');
      TeammorsLogUtils.tlog('加密数据前16字节: ${encrypted.take(16).toList()}');
      rethrow;
    }
  }

  // AES-GCM解密
  static String aesGcmDecrypt(Uint8List encrypted, Uint8List key, Uint8List iv) {
    final cipher = GCMBlockCipher(AESEngine());
    final params = AEADParameters(
      KeyParameter(key),
      128, // MAC长度（bits）
      iv,
      Uint8List(0), // 可选附加数据（AAD）
    );

    cipher.init(false, params);
    final decrypted = cipher.process(encrypted);

    return utf8.decode(decrypted);
  }
}
