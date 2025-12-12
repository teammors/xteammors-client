import 'dart:convert' as convert;

import '../beans/message_body.dart';


class JSONUtils {
  static String toJSONFromMessageBody(MessageBody messageBody) {
    final map = <String, String>{};
    map["eventId"] = messageBody.eventId;
    map["fromUid"] = messageBody.fromUid;
    map["token"] = messageBody.token;
    map["channelId"] = messageBody.channelId;

    map["toUid"] = messageBody.toUid;
    map["mType"] = messageBody.mType;
    map["cTimest"] = messageBody.cTimest;
    map["sTimest"] = messageBody.sTimest;
    map["dataBody"] = messageBody.dataBody;

    map["isGroup"] = messageBody.isGroup;
    map["groupId"] = messageBody.groupId;
    map["groupName"] = messageBody.groupName;

    map["isAck"] = messageBody.isAck;

    map["isCache"] = messageBody.isCache;
    map["deviceId"] = messageBody.deviceId;
    map["isRobot"] = messageBody.isRobot;

    map[""] = messageBody.dataBody;

    String jsonString = convert.jsonEncode(map);
    return jsonString;
  }

  static bool isJson(String input) {
    // 步骤1：快速预检
    final trimmed = input.trim();
    if (trimmed.isEmpty) return false;

    final firstChar = trimmed[0];
    final lastChar = trimmed[trimmed.length - 1];

    // 检查是否被 {} 或 [] 包裹
    final isWrapperValid = (firstChar == '{' && lastChar == '}') || (firstChar == '[' && lastChar == ']');

    // 检查是否基础JSON类型（字符串/数字/布尔/null）
    final isBasicType = (firstChar == '"' && lastChar == '"') || _isJsonNumber(trimmed) || _isJsonBoolean(trimmed) || trimmed == 'null';

    if (!isWrapperValid && !isBasicType) return false;

    // 步骤2：尝试解析
    try {
      convert.json.decode(trimmed);
      return true;
    } catch (_) {
      return false;
    }
  }

  static bool _isJsonNumber(String s) {
    return double.tryParse(s) != null;
  }

  static bool _isJsonBoolean(String s) {
    return s == 'true' || s == 'false';
  }
}
