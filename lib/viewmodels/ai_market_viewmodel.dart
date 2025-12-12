import 'package:flutter/foundation.dart';

@immutable
class MarketRobot {
  final String name;
  final String category;
  final String bannerUrl;
  final String intro;
  final int usage;
  final int views;
  final int follows;
  const MarketRobot({
    required this.name,
    required this.category,
    required this.bannerUrl,
    required this.intro,
    required this.usage,
    required this.views,
    required this.follows,
  });
}

@immutable
class AiMarketViewModel {
  final List<String> categories;
  final List<MarketRobot> robots;
  const AiMarketViewModel({
    this.categories = const ['游戏', '客服', '营销', '教育', '提效', '陪伴', '信息', '硬件'],
    this.robots = const [
      MarketRobot(
        name: 'GameMaster',
        category: '游戏',
        bannerUrl:
            'https://www.iiimaster.com/files/27ada7ffe0a4d57bbf66b162629fbb11.jpg',
        intro: '提供游戏策略与互动陪玩，支持热门类型与组队建议。',
        usage: 12890,
        views: 12045,
        follows: 532,
      ),
      MarketRobot(
        name: 'SupportBot',
        category: '客服',
        bannerUrl:
            'https://www.iiimaster.com/files/d473271e1c6809d620a31fc640a55b0c.jpg',
        intro: '智能客服与知识库问答，覆盖常见咨询与故障排查。',
        usage: 10432,
        views: 9850,
        follows: 410,
      ),
      MarketRobot(
        name: 'GrowthMarketer',
        category: '营销',
        bannerUrl:
            'https://www.iiimaster.com/files/162790459bbd97655f6f1a8b33ff7bee.jpg',
        intro: '生成营销文案与渠道建议，辅助活动规划与投放优化。',
        usage: 15670,
        views: 14320,
        follows: 689,
      ),
      MarketRobot(
        name: 'EduTutor',
        category: '教育',
        bannerUrl:
            'https://www.iiimaster.com/files/4cbdb3035714ab67db6c23421634e3cd.jpg',
        intro: '学习辅导与题解讲解，支持多学科与个性化练习。',
        usage: 8342,
        views: 7634,
        follows: 312,
      ),
      MarketRobot(
        name: 'EfficiencyPro',
        category: '提效',
        bannerUrl:
            'https://www.iiimaster.com/files/27ada7ffe0a4d57bbf66b162629fbb11.jpg',
        intro: '流程优化与待办管理，帮助团队协作与效率提升。',
        usage: 19012,
        views: 18560,
        follows: 1022,
      ),
      MarketRobot(
        name: 'CompanionAI',
        category: '陪伴',
        bannerUrl:
            'https://www.iiimaster.com/files/d473271e1c6809d620a31fc640a55b0c.jpg',
        intro: '日常陪伴与情绪支持，提供温暖交流与关怀。',
        usage: 9211,
        views: 9120,
        follows: 478,
      ),
      MarketRobot(
        name: 'InfoScout',
        category: '信息',
        bannerUrl:
            'https://www.iiimaster.com/files/162790459bbd97655f6f1a8b33ff7bee.jpg',
        intro: '资讯聚合与摘要速览，追踪热点与主题更新。',
        usage: 14032,
        views: 13200,
        follows: 650,
      ),
      MarketRobot(
        name: 'HardwareGuru',
        category: '硬件',
        bannerUrl:
            'https://www.iiimaster.com/files/4cbdb3035714ab67db6c23421634e3cd.jpg',
        intro: '设备诊断与选型建议，支持维护与采购评估。',
        usage: 8710,
        views: 8455,
        follows: 390,
      ),
    ],
  });
}
