import 'dart:async';

import '../beans/message_body.dart';
import '../paras/parameters.dart';
import '../security/rsa_crypto_utils.dart';
import '../utils/teammors_log.dart';
import '../utils/time_utils.dart';
import 'im_client_manager.dart';


class ImClientHelper {

  //静态属性——该类的实例
  static ImClientHelper? _instance;

  ImClientHelper._internal();

  static ImClientHelper getInstance() {
    _instance ??= ImClientHelper._internal();
    return _instance!;
  }

  initImClient() {

    TeammorsLogUtils.tlog("ImClientHelper: 开始初始化IM客户端");

    ParametersManager.getInstance().fromUid = "...";
    ParametersManager.getInstance().imIPAndPort = "ws://...";
    ParametersManager.getInstance().imTokem = "...";
    ParametersManager.getInstance().deviceId = "...";

    ParametersManager.getInstance().needACK = "1000001,5000004";
    ParametersManager.getInstance().platform = "App";
    ParametersManager.getInstance().isMultiTerminal = "0";

    IMClientManager.getInstance().init();

    TeammorsLogUtils.tlog("ImClientHelper: IM客户端初始化完成");

  }

  void stop() {
    if (ParametersManager.getInstance().isLogined) {
      IMClientManager.getInstance().stop();
    }
  }

  ///发送私聊信息
  Future<bool> sendPriChatMessage(String toUid, String chatString) async {

    //加密
    chatString = await RSACryptoUtils.aesEncryptDataBody(toUid, chatString, false);

    String cTimest = TimeUtils.getTimeEpoch();

    MessageBody messageBody = MessageBody();
    messageBody.eventId = "1000001";
    messageBody.fromUid = ParametersManager.getInstance().fromUid;
    messageBody.toUid = toUid;
    messageBody.cTimest = cTimest;
    messageBody.dataBody = chatString;
    messageBody.mType = "1";
    messageBody.isCache = "1";

    String jsonStr = messageBody.toJSON();
    ParametersManager.getInstance().sendedMessageCache[cTimest] = jsonStr;



    return IMClientManager.getInstance().sendMessage(messageBody);
  }

  //发给自己,多设备
  Future<bool> sendPriMySelfChatMessage(String chatString) async {
    //加密
    chatString = await RSACryptoUtils.aesEncryptMySelfDataBody(chatString, false);

    String cTimest = TimeUtils.getTimeEpoch();

    MessageBody messageBody = MessageBody();
    messageBody.eventId = "1000001";
    messageBody.fromUid = ParametersManager.getInstance().fromUid;
    messageBody.toUid = ParametersManager.getInstance().fromUid;
    messageBody.cTimest = cTimest;
    messageBody.dataBody = chatString;
    messageBody.mType = "1";
    messageBody.isCache = "1";

    String jsonStr = messageBody.toJSON();
    ParametersManager.getInstance().sendedMessageCache[cTimest] = jsonStr;

    return IMClientManager.getInstance().sendMessage(messageBody);
  }


  ///发送私聊信息
  Future<bool> sendWebRtcMessage(String toUid, String chatString) async {
    //加密
    chatString = await RSACryptoUtils.aesEncryptDataBody(toUid, chatString, false);

    String cTimest = TimeUtils.getTimeEpoch();

    MessageBody messageBody = MessageBody();
    messageBody.eventId = "1000001";
    messageBody.deviceId = ParametersManager.getInstance().deviceId;
    messageBody.fromUid = ParametersManager.getInstance().fromUid;
    messageBody.toUid = "${ParametersManager.getInstance().mId}_$toUid";
    messageBody.cTimest = cTimest;
    messageBody.dataBody = chatString;
    messageBody.mType = "webrtc_signaling";
    messageBody.isCache = "0";

    String jsonStr = messageBody.toJSON();
    ParametersManager.getInstance().sendedMessageCache[cTimest] = jsonStr;

    return IMClientManager.getInstance().sendMessage(messageBody);
  }

  ///发送私聊信息
  Future<bool> sendPriChatMessageNoCache(String toUid, String chatString) async {

    //加密
    chatString = await RSACryptoUtils.aesEncryptDataBody(toUid, chatString, false);

    String cTimest = TimeUtils.getTimeEpoch();

    MessageBody messageBody = MessageBody();
    messageBody.eventId = "1000001";
    messageBody.deviceId = ParametersManager.getInstance().deviceId;
    messageBody.fromUid = ParametersManager.getInstance().fromUid;
    messageBody.toUid = toUid;
    messageBody.cTimest = cTimest;
    messageBody.dataBody = chatString;
    messageBody.mType = "1";
    messageBody.isCache = "0";

    String jsonStr = messageBody.toJSON();
    ParametersManager.getInstance().sendedMessageCache[cTimest] = jsonStr;

    return IMClientManager.getInstance().sendMessage(messageBody);
  }

  ///发送群聊信息
  Future<bool> sendGroupChatMessage(String groupId, String chatString) async {
    //加密
    if (chatString.isNotEmpty) {
      chatString = await RSACryptoUtils.aesEncryptDataBody(groupId, chatString, true);
    }

    String cTimest = TimeUtils.getTimeEpoch();

    MessageBody messageBody = MessageBody();
    messageBody.eventId = "5000004";
    messageBody.deviceId = ParametersManager.getInstance().deviceId;
    messageBody.fromUid = ParametersManager.getInstance().fromUid;
    messageBody.groupId = groupId;
    messageBody.isGroup = "1";
    messageBody.cTimest = cTimest;
    messageBody.dataBody = chatString;
    messageBody.mType = "1";
    messageBody.isCache = "1";

    String jsonStr = messageBody.toJSON();
    ParametersManager.getInstance().sendedMessageCache[cTimest] = jsonStr;

    return IMClientManager.getInstance().sendMessage(messageBody);
  }

  ///发送群聊信息
  Future<bool> sendGroupChatMessageNoCache(String groupId, String chatString) async {
    //加密
    if (chatString.isNotEmpty) {
      chatString = await RSACryptoUtils.aesEncryptDataBody(groupId, chatString, true);
    }

    String cTimest = TimeUtils.getTimeEpoch();

    MessageBody messageBody = MessageBody();
    messageBody.eventId = "5000004";
    messageBody.deviceId = ParametersManager.getInstance().deviceId;
    messageBody.fromUid = ParametersManager.getInstance().fromUid;
    messageBody.groupId = groupId;
    messageBody.cTimest = cTimest;
    messageBody.dataBody = chatString;
    messageBody.mType = "1";
    messageBody.isCache = "0";

    String jsonStr = messageBody.toJSON();
    ParametersManager.getInstance().sendedMessageCache[cTimest] = jsonStr;

    return IMClientManager.getInstance().sendMessage(messageBody);
  }
}
