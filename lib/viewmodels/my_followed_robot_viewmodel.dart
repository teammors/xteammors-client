import 'package:flutter/foundation.dart';

@immutable
class FollowedRobot {
  final String id;
  final String name;
  final String avatarUrl;
  final String description;
  final bool isOnline;
  final String lastMessage;
  final String lastActiveTime;

  const FollowedRobot({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.description,
    this.isOnline = false,
    this.lastMessage = '',
    this.lastActiveTime = '',
  });
}

@immutable
class MyFollowedRobotViewModel {
  final List<FollowedRobot> robots;

  const MyFollowedRobotViewModel({
    this.robots = const [
      FollowedRobot(
        id: 'r_001',
        name: 'CompanionAI',
        avatarUrl: 'https://www.iiimaster.com/files/27ada7ffe0a4d57bbf66b162629fbb11.jpg',
        description: 'Always here to listen.',
        isOnline: true,
        lastMessage: 'Good morning! How are you today?',
        lastActiveTime: 'Now',
      ),
      FollowedRobot(
        id: 'r_002',
        name: 'CodeMaster',
        avatarUrl: 'https://avatars.githubusercontent.com/u/9919?s=200&v=4',
        description: 'Flutter expert helper.',
        isOnline: false,
        lastMessage: 'Check the documentation for more details.',
        lastActiveTime: '2h ago',
      ),
      FollowedRobot(
        id: 'r_003',
        name: 'StoryTeller',
        avatarUrl: 'https://cdn.pixabay.com/photo/2017/01/31/21/23/avatar-2027366_1280.png',
        description: 'Weaving tales for you.',
        isOnline: true,
        lastMessage: 'Once upon a time...',
        lastActiveTime: '5m ago',
      ),
      FollowedRobot(
        id: 'r_004',
        name: 'TranslatorBot',
        avatarUrl: 'https://cdn-icons-png.flaticon.com/512/4712/4712035.png',
        description: 'Instant translation.',
        isOnline: false,
        lastMessage: 'Translation complete.',
        lastActiveTime: '1d ago',
      ),
    ],
  });
}
