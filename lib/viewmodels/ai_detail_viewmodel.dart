import 'package:flutter/foundation.dart';

@immutable
class AiOwnerSummary {
  final String name;
  final String? avatarUrl;
  const AiOwnerSummary({required this.name, this.avatarUrl});
}

@immutable
class AiMediaItem {
  final String type;
  final String url;
  final String? thumbUrl;
  const AiMediaItem({required this.type, required this.url, this.thumbUrl});
}

@immutable
class AiDetailViewModel {
  final String name;
  final String category;
  final String bannerUrl;
  final String? avatarUrl;
  final String intro;
  final String scenarios;
  final String websiteUrl;
  final List<String> tags;
  final int usageCount;
  final String publishedAt;
  final int views;
  final int follows;
  final List<AiMediaItem> media;
  final AiOwnerSummary owner;
  const AiDetailViewModel({
    required this.name,
    required this.category,
    required this.bannerUrl,
    this.avatarUrl,
    required this.intro,
    required this.scenarios,
    required this.websiteUrl,
    this.tags = const [],
    this.usageCount = 0,
    this.publishedAt = '',
    required this.views,
    required this.follows,
    required this.media,
    required this.owner,
  });

  factory AiDetailViewModel.sample() {
    return AiDetailViewModel(
      name: 'CompanionAI',
      category: '陪伴',
      bannerUrl:
          'https://www.iiimaster.com/files/27ada7ffe0a4d57bbf66b162629fbb11.jpg',
      avatarUrl:
          'https://www.iiimaster.com/files/4cbdb3035714ab67db6c23421634e3cd.jpg',
      intro:
          'CompanionAI 致力于提供贴近人心的情感陪伴与日常交流体验。通过自然语言理解与生成技术，它能够在多种对话情境下与用户进行耐心、尊重且有温度的沟通，从而帮助用户缓解孤独、整理思绪、记录心情，还可以协助规划生活与学习目标。产品在设计上注重私密与安全，支持本地偏好与话题定制，能够根据用户的表达习惯逐步形成个性化沟通风格。除了日常聊天外，CompanionAI 还提供轻量级的任务提醒与日程管理能力，在碎片时间里帮助用户完成微小但持续的成长。对于更复杂的场景，它会主动给出多种建议方案，并提供清晰的利弊分析，帮助用户做出更稳妥的选择。我们希望它不仅是一位贴心的朋友，更是一位可靠的辅助者，陪伴你度过每一个需要支持的时刻。',
      scenarios:
          '适用场景示例：\n1）情绪陪伴与压力缓解：在繁忙或孤独时，进行温暖、尊重的对话，帮助梳理思绪并给出有效的建议。\n2）轻量任务与日程提醒：以非打扰的方式跟进学习与生活目标，让碎片时间得到更好利用。\n3）学习与成长建议：根据个人偏好提供学习方法、资料整理与行动计划。\n4）社交表达练习：模拟对话与不同情境交流，提升表达与沟通能力。',
      websiteUrl: 'https://www.iiimaster.com/products/companion-ai',
      tags: const ['推荐', '热门'],
      usageCount: 23145,
      publishedAt: '2025-11-20 发布',
      views: 12435,
      follows: 892,
      media: const [
        AiMediaItem(
            type: 'image',
            url:
                'https://www.iiimaster.com/files/4cbdb3035714ab67db6c23421634e3cd.jpg'),
        AiMediaItem(
            type: 'image',
            url:
                'https://www.iiimaster.com/files/27ada7ffe0a4d57bbf66b162629fbb11.jpg'),
        AiMediaItem(
            type: 'image',
            url:
                'https://www.iiimaster.com/files/d473271e1c6809d620a31fc640a55b0c.jpg'),
        AiMediaItem(
            type: 'image',
            url:
                'https://www.iiimaster.com/files/162790459bbd97655f6f1a8b33ff7bee.jpg'),
      ],
      owner: const AiOwnerSummary(
        name: 'Alice',
        avatarUrl: 'https://i.pravatar.cc/150?img=3',
      ),
    );
  }
}
