import 'package:flutter/foundation.dart';

enum MyRobotStatus { online, offline, developing }

@immutable
class MyRobotSummary {
  final String name;
  final String category;
  final String? avatarUrl;
  final MyRobotStatus status;
  const MyRobotSummary({
    required this.name,
    required this.category,
    this.avatarUrl,
    this.status = MyRobotStatus.offline,
  });
}

@immutable
class MyRobotManagementViewModel {
  final List<MyRobotSummary> robots;
  const MyRobotManagementViewModel({
    this.robots = const [
      MyRobotSummary(
        name: 'CompanionAI',
        category: '陪伴',
        status: MyRobotStatus.online,
      ),
      MyRobotSummary(
        name: 'SupportBot',
        category: '客服',
        status: MyRobotStatus.developing,
      ),
      MyRobotSummary(
        name: 'GrowthMarketer',
        category: '营销',
        status: MyRobotStatus.offline,
      ),
    ],
  });
}
