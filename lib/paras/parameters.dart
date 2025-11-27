
class ParametersManager {
  static ParametersManager? _instance;

  ParametersManager._internal() {}

  static ParametersManager getInstance() {
    _instance ??= ParametersManager._internal();
    return _instance!;
  }

  bool isDebug = false;

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


}
