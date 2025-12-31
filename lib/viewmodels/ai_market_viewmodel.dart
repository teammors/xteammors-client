import 'package:flutter/foundation.dart';

@immutable
class MarketRobot {
  final String name;
  final String category;
  final String intro;
  final String bannerUrl;
  final int usage;
  final int views;
  final int follows;
  const MarketRobot({
    required this.name,
    required this.category,
    required this.intro,
    required this.bannerUrl,
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
    this.categories = const [
      '游戏',
      '客服',
      '营销',
      '教育',
      '提效',
      '陪伴',
      '信息',
      '硬件',
    ],
    this.robots = const [
      MarketRobot(
        name: 'CompanionAI',
        category: '陪伴',
        intro: '温暖陪伴与日常交流，支持个性化偏好与场景化互动。',
        bannerUrl:
            'https://www.iiimaster.com/files/27ada7ffe0a4d57bbf66b162629fbb11.jpg',
        usage: 23145,
        views: 12435,
        follows: 892,
      ),
      MarketRobot(
        name: 'SupportBot',
        category: '客服',
        intro: '常见问题应答与智能分流，提高客服效率与满意度。',
        bannerUrl:
            'https://www.iiimaster.com/files/162790459bbd97655f6f1a8b33ff7bee.jpg',
        usage: 18902,
        views: 9876,
        follows: 543,
      ),
      MarketRobot(
        name: 'GrowthMarketer',
        category: '营销',
        intro: '营销文案生成与渠道分析，支持多平台推广建议。',
        bannerUrl:
            'https://www.iiimaster.com/files/d473271e1c6809d620a31fc640a55b0c.jpg',
        usage: 14567,
        views: 7654,
        follows: 432,
      ),
      MarketRobot(
        name: 'EduTutor',
        category: '教育',
        intro: '学习辅导与题解讲解，帮助制定学习计划与复习策略。',
        bannerUrl:
            'https://www.iiimaster.com/files/4cbdb3035714ab67db6c23421634e3cd.jpg',
        usage: 12034,
        views: 6543,
        follows: 321,
      ),
      MarketRobot(
        name: 'InfoScout',
        category: '信息',
        intro: '资讯聚合与摘要速览，快速把握重点与上下文。',
        bannerUrl:
            'https://www.iiimaster.com/files/27ada7ffe0a4d57bbf66b162629fbb11.jpg',
        usage: 9800,
        views: 5400,
        follows: 280,
      ),
      MarketRobot(
        name: 'HardwareGuru',
        category: '硬件',
        intro: '设备诊断与选型建议，覆盖常见硬件场景。',
        bannerUrl:
            'https://www.iiimaster.com/files/162790459bbd97655f6f1a8b33ff7bee.jpg',
        usage: 7600,
        views: 4200,
        follows: 210,
      ),
    ],
  });
}
