import 'dart:io';

import 'package:web_socket_channel/io.dart';

import '../utils/teammors_log.dart';

class FlutterImSdk {
  getChannel(String imAddress) {
    try {
      final channel = IOWebSocketChannel.connect(
        imAddress,
        pingInterval: const Duration(seconds: 5),
      );

      return channel;
    } on SocketException catch (e) {
      TeammorsLogUtils.tlog('网络连接错误: $e');
      // 显示错误提示给用户
      return null;
    } catch (e) {
      TeammorsLogUtils.tlog('其他错误: $e');
      return null;
    }
  }
}
