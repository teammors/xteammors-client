
import 'dart:async';
import 'package:flutter/foundation.dart';

class ParametersManager {
  static ParametersManager? _instance;

  ParametersManager._internal() {}

  static ParametersManager getInstance() {
    _instance ??= ParametersManager._internal();
    return _instance!;
  }

  bool isLogined = false;

  bool messageHelperObserverAdded = false;

  bool isDebug = true;

  String serverUrl = "https://www.teammors.top/api";

  String mId = "3000";

  ///Html
  String? sessionCookie;
  String captchaId = "";
  String startId = "";
  String httpToken = "";

  ///im parameters
  String imIPAndPort = "";
  String fromUid = "";
  String imTokem = "";
  String osStr = "";
  String deviceId = "";
  String needACK = "";
  String platform = "";
  String isMultiTerminal = "0";
  String key = "";

  ///user parameters
  String userAvatar = "";
  String firstName = "";
  String lastName = "";

  String loginName = "";
  String introduce = "";
  String birthday = "";
  String sex = "";
  String email = "";
  String others = "";

  ///key
  String? publicKey;
  String? privateKey;


  bool waitRefresh = false;
  bool contactsWaitRefresh = false;

  Timer? onlineTimer;
  Timer? sendTimer;
  Timer? reSendTimer;
  Timer? reContectTimer;

  Timer? connectedTimer;
  ValueNotifier<String> appTitle = ValueNotifier<String>("Teammors");

  String priMessageSound = "sounds/default.mp3";
  String groupMessageSound = "sounds/default.mp3";
  String onlineOfflineSound = "sounds/default.mp3";
  String callSound = "sounds/call/default.mp3";

  bool allNoti = true;
  bool groupNoti = true;
  bool priNoti = true;
  bool onlineOffline = true;

  Map<String, bool> thumbnailMap = {};
  Map<String, String> userPublicKey = {};
  Map<String, String> messageCache = {};

  //通过服务器的ack清理，如果出现太多未清理的，证明IM链接有问题
  Map<String, String> sendedMessageCache = {};

  // 全局用户信息缓存，存储用户ID到用户信息的映射
  Map<String, Map<String, dynamic>> userInfoCache = {};

  String chatId = "";
  int badgeCount = 0;

  int startIdUseCount = 0;


}
