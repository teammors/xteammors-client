import 'package:flutter/foundation.dart';
import 'dart:ui' show Color;

enum ReadMark { singleGrey, doubleGreen }
enum RetentionPolicy { hour1, week2, month3 }

@immutable
class MessageSummary {
  final String name;
  final String message;
  final String time;
  final ReadMark mark;
  final bool isOnline;
  final RetentionPolicy? retention;
  final String? retentionLabel;
  final Color? retentionColor;
  final bool isGroup;
  final int unreadCount;
  const MessageSummary({
    required this.name,
    required this.message,
    required this.time,
    required this.mark,
    this.isOnline = false,
    this.retention,
    this.retentionLabel,
    this.retentionColor,
    this.isGroup = false,
    this.unreadCount = 0,
  });
}

@immutable
class MessagesViewModel {
  final List<MessageSummary> items;
  const MessagesViewModel({
    this.items = const [
      MessageSummary(
        name: 'Alice',
        message: 'Let\'s meet at 3 PM',
        time: '14:58',
        mark: ReadMark.doubleGreen,
        isOnline: true,
        retention: RetentionPolicy.hour1,
        retentionLabel: 'H',
        retentionColor: const Color(0xFFC95332),
        isGroup: false,
        unreadCount: 2,
      ),
      MessageSummary(
        name: 'Bob',
        message: 'Can you review the doc?New mockups are ready',
        time: '13:21',
        mark: ReadMark.singleGrey,
        isOnline: false,
        retention: RetentionPolicy.week2,
        retentionLabel: 'W',
        retentionColor: const Color(0xFFC97132),
        isGroup: false,
        unreadCount: 5,
      ),
      MessageSummary(
        name: 'Charlie',
        message: 'Thanks!',
        time: 'Yesterday',
        mark: ReadMark.doubleGreen,
        isOnline: true,
        retention: RetentionPolicy.month3,
        retentionLabel: 'M',
        retentionColor: const Color(0xFFF2D863),
        isGroup: false,
        unreadCount: 0,
      ),
      MessageSummary(
        name: 'Design Team',
        message: 'New mockups are ready',
        time: 'Mon',
        mark: ReadMark.singleGrey,
        isOnline: false,
        retention: RetentionPolicy.week2,
        retentionLabel: 'W',
        retentionColor: const Color(0xFFC97132),
        isGroup: true,
        unreadCount: 12,
      ),
    ],
  });
}
