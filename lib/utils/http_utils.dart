import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../security/im_security.dart';
import '../paras/parameters.dart';
import '../utils/teammors_log.dart';


class ImHttpUtils {
  //静态属性——该类的实例
  static ImHttpUtils? _instance;

  ImHttpUtils._internal();

  static ImHttpUtils getInstance() {
    _instance ??= ImHttpUtils._internal();
    return _instance!;
  }

  Future<dynamic> requestData(BuildContext context, Map<String, String> paras, String urls) async {
    var responseData = {};

    try {

      if (ParametersManager.getInstance().startId == '' || ParametersManager.getInstance().startIdUseCount == 5) {
        await _loadStartPage();
      }

      ParametersManager.getInstance().startIdUseCount++;

      final headers = <String, String>{};
      headers['Content-Type'] = 'application/json';
      headers['Cache-Control'] = 'no-cache';
      headers['Accept'] = '*/*';
      headers['Authorization'] = 'Bearer ${ParametersManager.getInstance().httpToken}';
      headers['startId'] = '${ParametersManager.getInstance().startId}';


      if (ParametersManager.getInstance().captchaId != "") {
        headers['captchaId'] = ParametersManager.getInstance().captchaId!;
      }

      Map<String, String> newParas = enSecText(paras);

      final response = await http.post(
        Uri.parse(urls),
        headers: headers,
        body: jsonEncode(newParas),
      );

      final resData = json.decode(const Utf8Decoder().convert(response.bodyBytes));

      String? message = "";
      if (resData["status"] != null) {
        String status = resData["status"];
        if (status == "fail") {
          message = resData["message"];
        }
      } else {
        if (resData['extData'] != null) {
          String extData = resData['extData'];
          responseData = deSecText(extData);
          message = responseData['message'];
        }
      }

      // 处理错误
      if (response.statusCode != 200) {
        if (context.mounted) {
          _showMyDialog(context, message!, 1);
        }
      }

      if (message!.contains("401:Token已過期") || message!.contains("401:無效的Token")) {


      }
    } on http.ClientException catch (e) {
      //TeammorsLogUtils.tlog("reques error t=$e");
      String message = "进入首页失败，网络错误";
      if (context.mounted) {
        _showMyDialog(context, message, 1);
      }
    } on FormatException {
      String message = "进入首页失败，JSON 解析错误";
      if (context.mounted) {
        _showMyDialog(context, message, 1);
      }
    } finally {}

    return responseData;
  }

  Future<dynamic> requestDataNoContext(Map<String, String> paras, String urls) async {
    var responseData = {};

    try {

      if (ParametersManager.getInstance().startId == '') {
        TeammorsLogUtils.tlog("startId Reset");
        await _loadStartPage();
      }


      final headers = <String, String>{};
      headers['Content-Type'] = 'application/json';
      headers['Cache-Control'] = 'no-cache';
      headers['Accept'] = '*/*';
      headers['Authorization'] = 'Bearer ${ParametersManager.getInstance().httpToken}';
      headers['startId'] = '${ParametersManager.getInstance().startId}';


      if (ParametersManager.getInstance().captchaId != "") {
        headers['captchaId'] = ParametersManager.getInstance().captchaId!;
      }

      Map<String, String> newParas = enSecText(paras);

      final response = await http.post(
        Uri.parse(urls),
        headers: headers,
        body: jsonEncode(newParas),
      );

      if (response.statusCode != 200) {
        return {'status': 'fail', 'message': 'HTTP请求失败，状态码: ${response.statusCode}'};
      }

      final resData = json.decode(const Utf8Decoder().convert(response.bodyBytes));

      String? message = "";
      if (resData["status"] != null) {
        String status = resData["status"];
        if (status == "fail") {
          message = resData["message"];
        }
      } else {
        if (resData['extData'] != null) {
          String extData = resData['extData'];
          responseData = deSecText(extData);
          message = responseData['message'];
        }
      }

      if (message!.contains("401:Token已過期") || message!.contains("401:無效的Token")) {


      }

      return responseData;
    } on http.ClientException catch (e) {
      return {'status': 'fail', 'message': '网络连接异常: $e'};
    } on FormatException catch (e) {
      return {'status': 'fail', 'message': 'JSON解析异常: $e'};
    } catch (e) {
      return {'status': 'fail', 'message': '其他异常: $e'};
    }
  }

  Future<void> _showMyDialog(BuildContext context, String message, int type) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // 点击外部是否关闭
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFFBF4EA),
          // 背景颜色
          shape: RoundedRectangleBorder(
            // 边框形状
            borderRadius: BorderRadius.circular(5),
          ),
          title: const Text("提示", style: TextStyle(color: Colors.black87, fontSize: 18)),
          content: Text(message, style: const TextStyle(color: Colors.black54, fontSize: 16)),
          actions: [
            TextButton(
              child: const Text("確定", style: TextStyle(color: Colors.red)),
              onPressed: () => doExit(type, context),
            )
          ],
        );
      },
    );
  }

  Future<void> _loadStartPage() async {
    try {
      final response = await http.get(Uri.parse("${ParametersManager.getInstance().serverUrl}/startPage"));
      if (response.statusCode == 200) {
        ParametersManager.getInstance().startId = response.headers['start-id']!;
      }
    } catch (e) {
      TeammorsLogUtils.tlog("_loadStartPage=$e");
    }
  }

  void doExit(int type, context) {
    Future.delayed(Duration.zero, () {
      Navigator.pop(context);
    });
  }

  enSecText(Map<String, String> paras) {
    String content = json.encode(paras);

    String encTxt = "";
    String stKey = ParametersManager.getInstance().startId;
    String secKey = AESEncrypt.createKey(stKey);
    encTxt = AESEncrypt.aesEncoded(content, secKey);

    Map<String, String> newParas = {"data": encTxt};

    return newParas;
  }

  deSecText(String message) {
    String decTxt = "";
    String stKey = ParametersManager.getInstance().startId;
    String secKey = AESEncrypt.createKey(stKey);
    decTxt = AESEncrypt.aesDecrypted(message, secKey);
    return json.decode(decTxt);
  }
}
