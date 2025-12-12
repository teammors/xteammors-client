import 'package:flutter/foundation.dart';

@immutable
class MyRobotSummary {
  final String name;
  final String category;
  final MyRobotStatus status;
  final String intro;
  final String? avatarUrl;
  MyRobotSummary({
    required this.name,
    required this.category,
    required this.status,
    required this.intro,
    this.avatarUrl,
  });
}

enum MyRobotStatus { online, offline, developing }

@immutable
class MyRobotManagementViewModel {
  final List<MyRobotSummary> robots;
  MyRobotManagementViewModel({List<MyRobotSummary>? robots})
      : robots = robots ??
            [
              MyRobotSummary(
                name: 'CompanionAI',
                category: '陪伴',
                status: MyRobotStatus.online,
                intro: '温暖陪伴与日常对话，支持轻量提醒与计划。',
                avatarUrl:
                    'https://www.iiimaster.com/files/header_1758083839030.jpg',
              ),
              MyRobotSummary(
                name: 'SupportBot',
                category: '客服',
                status: MyRobotStatus.offline,
                intro: '应答常见问题与引导用户，自助服务未开启。',
                avatarUrl:
                    'https://www.iiimaster.com/files/header_1757209608769.jpg',
              ),
              MyRobotSummary(
                name: 'GameMaster',
                category: '游戏',
                status: MyRobotStatus.developing,
                intro: '正在开发中，支持策略建议与陪玩互动。',
                avatarUrl:
                    'https://www.iiimaster.com/files/header_1757490645533.jpg',
              ),
            ];
}
