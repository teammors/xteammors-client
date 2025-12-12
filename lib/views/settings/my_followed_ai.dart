import 'package:flutter/material.dart';

import '../../viewmodels/ai_detail_viewmodel.dart';
import '../../viewmodels/my_followed_ai_viewmodel.dart';
import '../ai_detail.dart';


class MyFollowedAIListPage extends StatefulWidget {
  final AIViewModel viewModel;
  final void Function(AiDetailViewModel)? onOpenDetail;
  const MyFollowedAIListPage(
      {super.key, this.viewModel = const AIViewModel(), this.onOpenDetail});

  @override
  State<MyFollowedAIListPage> createState() => _MyFollowedAIListPageState();
}

class _MyFollowedAIListPageState extends State<MyFollowedAIListPage> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';

  List<AIRobotSummary> get _filtered {
    if (_query.isEmpty) return widget.viewModel.robots;
    final q = _query.toLowerCase();
    return widget.viewModel.robots
        .where((r) =>
            r.name.toLowerCase().contains(q) ||
            r.category.toLowerCase().contains(q) ||
            r.intro.toLowerCase().contains(q))
        .toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('我关注的机器人'),
        centerTitle: false,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            height: 55,
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: '搜索关注的机器人',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:
                      BorderSide(color: Colors.grey.withValues(alpha: 0.4)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:
                      BorderSide(color: Colors.grey.withValues(alpha: 0.4)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:
                      BorderSide(color: Colors.grey.withValues(alpha: 0.6)),
                ),
                isDense: true,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: _filtered.length,
              separatorBuilder: (_, __) => Divider(
                height: 0,
                thickness: 0.5,
                indent: 72,
                color: cs.outlineVariant.withValues(alpha: 0.2),
              ),
              itemBuilder: (context, index) {
                final r = _filtered[index];
                return _RobotItem(robot: r, onOpenDetail: widget.onOpenDetail);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _RobotItem extends StatefulWidget {
  final AIRobotSummary robot;
  final void Function(AiDetailViewModel)? onOpenDetail;
  const _RobotItem({required this.robot, this.onOpenDetail});

  @override
  State<_RobotItem> createState() => _RobotItemState();
}

class _RobotItemState extends State<_RobotItem> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: InkWell(
        onTap: () {
          final detailVm = AiDetailViewModel(
            name: widget.robot.name,
            category: widget.robot.category,
            bannerUrl:
                'https://www.iiimaster.com/files/27ada7ffe0a4d57bbf66b162629fbb11.jpg',
            avatarUrl:
                'https://www.iiimaster.com/files/4cbdb3035714ab67db6c23421634e3cd.jpg',
            intro:
                '这是一款面向多场景的智能机器人，支持丰富的对话与内容理解能力，能够在游戏、客服、营销、教育、信息与硬件等领域提供稳定可靠的辅助。它关注用户隐私与安全，通过可配置的偏好与上下文管理，为你带来持续且有温度的互动体验。',
            scenarios:
                '适用场景：\n1）客户咨询与服务：自动回答常见问题并引导用户。\n2）学习辅导：提供学习建议与资料整理。\n3）内容创作与营销：协助撰写文案与渠道规划。\n4）日常陪伴与情绪支持：进行耐心、尊重的交流。',
            websiteUrl:
                'https://www.iiimaster.com/products/${widget.robot.name.toLowerCase()}',
            tags: const ['推荐'],
            usageCount: 12890,
            publishedAt: '2025-11-20 发布',
            views: 10234,
            follows: 532,
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
                name: 'Alice', avatarUrl: 'https://i.pravatar.cc/150?img=3'),
          );
          if (widget.onOpenDetail != null) {
            widget.onOpenDetail!(detailVm);
          } else {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => AiDetailPage(vm: detailVm)),
            );
          }
        },
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          color: _hover
              ? Theme.of(context)
                  .colorScheme
                  .surfaceContainerHighest
                  .withValues(alpha: 0.12)
              : Colors.transparent,
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                child: Text(
                    widget.robot.name.isNotEmpty ? widget.robot.name[0] : '?'),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.robot.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          widget.robot.category,
                          style: TextStyle(
                            color: cs.onSurfaceVariant.withOpacity(0.8),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.robot.intro,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: isDark
                            ? cs.onSurfaceVariant.withOpacity(0.4)
                            : cs.onSurfaceVariant.withOpacity(0.6),
                        fontSize: 12,
                        height: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 数据模型已在 viewmodel 中声明
