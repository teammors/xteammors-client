import 'package:flutter/foundation.dart';

@immutable
class AIRobotSummary {
  final String name;
  final String category;
  final String intro;
  final String? avatarUrl;
  const AIRobotSummary({
    required this.name,
    required this.category,
    required this.intro,
    this.avatarUrl,
  });
}

@immutable
class AIViewModel {
  final List<AIRobotSummary> robots;
  const AIViewModel({
    this.robots = const [
      AIRobotSummary(
        name: 'GameMaster',
        category: '游戏',
        intro: '提供游戏策略与陪玩互动。',
      ),
      AIRobotSummary(
        name: 'SupportBot',
        category: '客服',
        intro: '智能客服，应答常见问题。',
      ),
      AIRobotSummary(
        name: 'GrowthMarketer',
        category: '营销',
        intro: '营销文案生成与渠道建议。',
      ),
      AIRobotSummary(
        name: 'EduTutor',
        category: '教育',
        intro: '学习辅导与题解讲解。',
      ),
      AIRobotSummary(
        name: 'EfficiencyPro',
        category: '提效',
        intro: '流程优化与待办管理。',
      ),
      AIRobotSummary(
        name: 'CompanionAI',
        category: '陪伴',
        intro: '情感陪伴与每日聊天。',
      ),
      AIRobotSummary(
        name: 'InfoScout',
        category: '信息',
        intro: '资讯聚合与摘要速览。',
      ),
      AIRobotSummary(
        name: 'HardwareGuru',
        category: '硬件',
        intro: '设备诊断与硬件选型建议。',
      ),
    ],
  });
}
