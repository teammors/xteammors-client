import 'dart:async';
import 'dart:convert' as convert;

import 'package:web_socket_channel/web_socket_channel.dart';

import '../beans/message_body.dart';
import '../security/im_security.dart';
import '../utils/teammors_log.dart';
import '../utils/time_utils.dart';
import './flutter_im_sdk.dart'
    if (dart.library.io) 'flutter_im_sdk.dart'
    if (dart.library.html) 'web_im_sdk.dart' as platform;
import 'subject.dart';

enum StatusEnum { connect, connecting, close, closing }

class IMWebsocket {
  //静态属性——该类的实例
  static IMWebsocket? _instance;

  //私有的命名构造函数，确保类不能从外部被实例化
  IMWebsocket._internal();

  //通过静态方法getInstance()访问实例
  static IMWebsocket getInstance() {
    _instance ??= IMWebsocket._internal();
    return _instance!;
  }

  late WebSocketChannel channel;
  StatusEnum isConnect = StatusEnum.close; //默认为未连接
  String imAddress = "";
  String fromUid = "";
  bool isLogin = false;
  bool isServerClosed = false;
  String key = "";
  Map<String, String> ackmap = {};

  Subject subject = Subject();

  ///链接服务器
  Future connect() async {
    TeammorsLogUtils.tlog("链接服务器 imwebsocket isConnect=$isConnect");
    if (isConnect == StatusEnum.close) {
      channel = platform.FlutterImSdk().getChannel(imAddress);

      channel.stream.listen((event) {
        isConnect = StatusEnum.connect;
        _onReceive(event);
      }, onError: (error) {
        //监听服务器消息
        isLogin = false;
        isConnect = StatusEnum.close;
        // 移除日志输出
      }, onDone: () {
        //连接错误时调用
        isLogin = false;
        isConnect = StatusEnum.close;
        // 移除日志输出
      }, //关闭时调用
          cancelOnError: true //设置错误时取消订阅
          );
      return true;
    }
  }

  ///关闭链接
  Future disconnect() async {
    try {
      isConnect = StatusEnum.closing;
      await channel?.sink.close(3000, "客户端主动关闭");
      isConnect = StatusEnum.close;
    } catch (e) {}
  }

  ///发送数据给服务器
  bool sendMessage(String text) {
    if (isLogin) {
      channel?.sink.add(text);
      return true;
    }
    return false;
  }

  ///登录
  bool loginToServer(String text) {
    try {
      channel?.sink.add(text);
    } catch (e) {
      /* 移除日志输出 */
    }
    return true;
  }

  ///处理收到的消息
  void _onReceive(message) {
    try {

      String decString = AESEncrypt.aesDecrypted(message, key);

      //TeammorsLogUtils.tlog("接收的 _onReceive=$decString");

      Map<String, dynamic> jsonMap = {};

      bool isJSONFormat = false;

      try {
        jsonMap = convert.jsonDecode(decString);

        isJSONFormat = true;
      } catch (e) {
        TeammorsLogUtils.tlog('消息解码失败: $e');
      }

      if (isJSONFormat) {
        if (jsonMap.containsKey('inEventId')) {
          String inEventId = jsonMap['inEventId'].toString();

          if (inEventId == '1000000') {
            String status = 'fail';
            if (jsonMap.containsKey('status')) {
              status = jsonMap['status'].toString();
              if (status == 'success') {
                isLogin = true;
                isConnect = StatusEnum.connect;
              }
            }
          } else if (inEventId == '3000001') {
            isLogin = false;
            isServerClosed = true;
            disconnect();
          }

          subject.notifyObservers(decString);
        } else {
          if (jsonMap.containsKey('dataBody')) {
            if (ackmap[jsonMap["eventId"]] != null &&
                jsonMap["sTimest"] != null) {
              sendMessage(createACKString(jsonMap["sTimest"]));
            }
            subject.notifyObservers(decString);
          }
        }
      }
    } catch (e) {
      TeammorsLogUtils.tlog('处理收到的消息时出错: $e');
    }
  }

  ///构建ACK
  String createACKString(String sTimest) {
    MessageBody messageBody = MessageBody();
    messageBody.eventId = "1000002";
    messageBody.fromUid = fromUid;
    messageBody.isAck = "1";
    messageBody.sTimest = sTimest;
    messageBody.cTimest = TimeUtils.getTimeEpoch();
    messageBody.isCache = "0";
    messageBody.mType = "1";
    String jsonStr = messageBody.toJSON();
    jsonStr = AESEncrypt.aesEncoded(jsonStr, key);
    return jsonStr;
  }
}
