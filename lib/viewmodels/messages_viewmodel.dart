import 'package:flutter/foundation.dart';

enum ReadMark { singleGrey, doubleGreen }

@immutable
class MessageSummary {
  final String name;
  final String message;
  final String time;
  final ReadMark mark;
  const MessageSummary({
    required this.name,
    required this.message,
    required this.time,
    required this.mark,
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
      ),
      MessageSummary(
        name: 'Bob',
        message: 'Can you review the doc?',
        time: '13:21',
        mark: ReadMark.singleGrey,
      ),
      MessageSummary(
        name: 'Charlie',
        message: 'Thanks!',
        time: 'Yesterday',
        mark: ReadMark.doubleGreen,
      ),
      MessageSummary(
        name: 'Design Team',
        message: 'New mockups are ready',
        time: 'Mon',
        mark: ReadMark.singleGrey,
      ),
    ],
  });
}
