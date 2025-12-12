import 'dart:async';

import 'package:flutter/cupertino.dart';
import '../beans/message_body.dart';
import '../paras/parameters.dart';
import '../security/im_security.dart';
import '../utils/teammors_log.dart';
import '../utils/time_utils.dart';
import 'im_websocket.dart';
import 'subject.dart';

class IMClientManager {
  //静态属性——该类的实例
  static IMClientManager? _instance;

  IMClientManager._internal();

  static IMClientManager getInstance() {
    _instance ??= IMClientManager._internal();
    return _instance!;
  }

  IMWebsocket? _imWebsocket;

  IMWebsocket get imWebsocket => _imWebsocket ??= IMWebsocket.getInstance();
  final Subject subject = Subject();
  Timer? timerPing;
  Timer? checkNetWorkStatus;

  bool isFirst = true;

  static final ValueNotifier<bool> imConnectionStatus = ValueNotifier(false);

  void init() {
    try {
      if (_imWebsocket == null || !_imWebsocket!.isLogin) {
        _imWebsocket ??= IMWebsocket.getInstance();
        _imWebsocket!.isConnect = StatusEnum.close;

        _imWebsocket!.subject = subject;

        _imWebsocket!.imAddress = ParametersManager.getInstance().imIPAndPort;

        _imWebsocket!.fromUid = ParametersManager.getInstance().fromUid;

        ParametersManager.getInstance().key =
            AESEncrypt.createKey(ParametersManager.getInstance().fromUid);
        _imWebsocket!.key = ParametersManager.getInstance().key;
        var needacks = ParametersManager.getInstance().needACK.split(",");
        for (int i = 0; i < needacks.length; i++) {
          _imWebsocket!.ackmap[needacks[i]] = needacks[i];
        }

        _imWebsocket!.connect();

        _imWebsocket!.loginToServer(createLoginString());

        if (isFirst) {
          startPing();
          checkImStatus();
        }
      }
    } catch (e) {
      // 移除日志输出
      TeammorsLogUtils.tlog(e.toString());
    }
  }

  ///构建登录
  String createLoginString() {
    MessageBody messageBody = MessageBody();
    messageBody.eventId = "1000000";
    messageBody.fromUid = ParametersManager.getInstance().fromUid;
    messageBody.token = ParametersManager.getInstance().imTokem;
    messageBody.deviceId = ParametersManager.getInstance().deviceId;
    messageBody.dataBody = ParametersManager.getInstance().platform;
    messageBody.isMultiTerminal =
        ParametersManager.getInstance().isMultiTerminal;
    messageBody.cTimest = TimeUtils.getTimeEpoch();
    String jsonStr = messageBody.toJSON();
    return jsonStr;
  }

  ///构建Ping
  String createPingString() {
    MessageBody messageBody = MessageBody();
    messageBody.eventId = "9000000";
    messageBody.fromUid = ParametersManager.getInstance().fromUid;
    messageBody.token = ParametersManager.getInstance().imTokem;
    messageBody.deviceId = ParametersManager.getInstance().deviceId;
    messageBody.isMultiTerminal =
        ParametersManager.getInstance().isMultiTerminal;
    messageBody.cTimest = TimeUtils.getTimeEpoch();
    String jsonStr = messageBody.toJSON();
    jsonStr =
        AESEncrypt.aesEncoded(jsonStr, ParametersManager.getInstance().key);
    return jsonStr;
  }

  ///发送消息 f == 0,不需要进入循环，直接丢弃
  bool sendMessage(MessageBody messageBody) {
    String jsonStr = messageBody.toJSON();
    jsonStr =
        AESEncrypt.aesEncoded(jsonStr, ParametersManager.getInstance().key);
    bool sended = _imWebsocket?.sendMessage(jsonStr) ?? false;
    return sended;
  }

  bool reSendMessage(String jsonStr) {
    jsonStr =
        AESEncrypt.aesEncoded(jsonStr, ParametersManager.getInstance().key);
    bool sended = _imWebsocket?.sendMessage(jsonStr) ?? false;
    return sended;
  }

  ///ping
  static const timePing = Duration(seconds: 5);

  void startPing() {
    timerPing = Timer.periodic(timePing, (timer) {
      if (_imWebsocket?.isServerClosed ?? false) {
        serverDoClose();
      } else {
        if (_imWebsocket?.isLogin ?? false) {
          String pingStr = createPingString();
          _imWebsocket?.sendMessage(pingStr);
        }
      }
    });
  }

  /// Check IM Status
  static const timeCheckNetWork = Duration(seconds: 2);

  void checkImStatus() {
    checkNetWorkStatus = Timer.periodic(timeCheckNetWork, (timer) {
      if (_imWebsocket?.isServerClosed ?? false) {
        serverDoClose();
      } else {
        if (!isFirst) {
          IMClientManager.imConnectionStatus.value =
              _imWebsocket?.isLogin ?? false;
          if (!(_imWebsocket?.isLogin ?? false)) {
            TeammorsLogUtils.tlog("im disconnected ,reconnecting........");
            stop();
            init();
          }
        } else {
          isFirst = false;
        }
      }
    });
  }

  void serverDoClose() {
    if (timerPing?.isActive ?? false) {
      timerPing?.cancel();
    }
    if (checkNetWorkStatus?.isActive ?? false) {
      checkNetWorkStatus?.cancel();
    }
    isFirst = true;
  }

  void stop() {
    if (timerPing?.isActive ?? false) {
      timerPing?.cancel();
    }
    if (checkNetWorkStatus?.isActive ?? false) {
      checkNetWorkStatus?.cancel();
    }
    _imWebsocket?.disconnect();
    isFirst = true;
    imConnectionStatus.value = false;
  }

}
