import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;
import '../viewmodels/ai_market_viewmodel.dart';
import '../viewmodels/ai_detail_viewmodel.dart';
import 'ai_detail.dart';

class AiMarketPage extends StatefulWidget {
  final AiMarketViewModel viewModel;
  final void Function(AiDetailViewModel)? onOpenDetail;
  const AiMarketPage(
      {super.key,
      this.viewModel = const AiMarketViewModel(),
      this.onOpenDetail});

  @override
  State<AiMarketPage> createState() => _AiMarketPageState();
}

class _SlowScrollPhysics extends ClampingScrollPhysics {
  const _SlowScrollPhysics({super.parent});
  @override
  _SlowScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return _SlowScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    return super.applyPhysicsToUserOffset(position, offset * 0.6);
  }
}

class _NoBarSlowScrollBehavior extends ScrollBehavior {
  const _NoBarSlowScrollBehavior();
  @override
  Widget buildScrollbar(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const _SlowScrollPhysics();
  }
}

class _AiMarketPageState extends State<AiMarketPage>
    with AutomaticKeepAliveClientMixin {
  final Set<String> _selectedCats = {};
  final Set<int> _hoveredItems = {};
  final Set<int> _hoveredBanners = {};
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  bool get wantKeepAlive => true; // 保持组件状态

  bool get _isDesktop {
    if (kIsWeb) return true;
    return Platform.isMacOS || Platform.isWindows || Platform.isLinux;
  }

  List<MarketRobot> get _filtered {
    var list = widget.viewModel.robots;
    final baseCats = widget.viewModel.categories;
    if (_selectedCats.isNotEmpty && !_selectedCats.contains('全部')) {
      final Set<String> selected = {..._selectedCats};
      final bool includeOthers = selected.remove('其他');
      list = list.where((r) {
        final inSelected = selected.contains(r.category);
        final isOther = !baseCats.contains(r.category);
        return includeOthers ? (inSelected || isOther) : inSelected;
      }).toList();
    }
    if (_searchQuery.isNotEmpty) {
      final q = _searchQuery.toLowerCase();
      list = list
          .where((r) =>
              r.name.toLowerCase().contains(q) ||
              r.intro.toLowerCase().contains(q))
          .toList();
    }
    return list;
  }

  Color _categoryColor(String c) {
    switch (c) {
      case '全部':
        return const Color(0xFF607D8B);
      case '游戏':
        return const Color(0xFF7C4DFF);
      case '客服':
        return const Color(0xFF03A9F4);
      case '营销':
        return const Color(0xFFFF7043);
      case '教育':
        return const Color(0xFF4CAF50);
      case '提效':
        return const Color(0xFFFFC107);
      case '陪伴':
        return const Color(0xFFE91E63);
      case '信息':
        return const Color(0xFF00BCD4);
      case '硬件':
        return const Color(0xFF3F51B5);
      case '其他':
        return const Color(0xFF9E9E9E);
      default:
        return const Color(0xFF999999);
    }
  }

  void _toggleCategory(String cat) {
    setState(() {
      if (cat == '全部') {
        _selectedCats.clear();
        return;
      }
      _selectedCats.remove('全部');
      if (_selectedCats.contains(cat)) {
        _selectedCats.remove(cat);
      } else {
        _selectedCats.add(cat);
      }
    });
  }

  void _openDetail(MarketRobot r) {
    final vm = AiDetailViewModel(
      name: r.name,
      category: r.category,
      bannerUrl: r.bannerUrl,
      avatarUrl:
          'https://www.iiimaster.com/files/4cbdb3035714ab67db6c23421634e3cd.jpg',
      intro: '这是一款面向多场景的智能机器人，支持丰富的对话与内容理解能力，能够在游戏、客服、营销、教育、信息与硬件等领域提供稳定可靠的辅助。',
      scenarios:
          '适用场景：\n1）客户咨询与服务：自动回答常见问题并引导用户。\n2）学习辅导：提供学习建议与资料整理。\n3）内容创作与营销：协助撰写文案与渠道规划。\n4）日常陪伴与情绪支持：进行耐心、尊重的交流。',
      websiteUrl: 'https://www.iiimaster.com/products/${r.name.toLowerCase()}',
      tags: const ['推荐'],
      usageCount: 12890,
      publishedAt: '2025-11-20 发布',
      views: r.views,
      follows: r.follows,
      media: const [
        AiMediaItem(
            type: 'image',
            url:
                'https://www.iiimaster.com/files/4cbdb3035714ab67db6c23421634e3cd.jpg'),
        AiMediaItem(
            type: 'image',
            url:
                'https://www.iiimaster.com/files/27ada7ffe0a4d57bbf66b162629fbb11.jpg'),
      ],
      owner: const AiOwnerSummary(
          name: 'Alice', avatarUrl: 'https://i.pravatar.cc/150?img=3'),
    );
    if (widget.onOpenDetail != null && _isDesktop) {
      widget.onOpenDetail!(vm);
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => AiDetailPage(vm: vm)));
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // 必须调用

    final cs = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('AI 市场'),
      ),
      body: ScrollConfiguration(
        behavior: const _NoBarSlowScrollBehavior(),
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            SizedBox(
              height: 250,
              child: _isDesktop
                  ? ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.viewModel.robots.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (_, i) {
                        final r = widget.viewModel.robots[i];
                        final hovered = _hoveredBanners.contains(i);
                        final shadow = hovered
                            ? [
                                BoxShadow(
                                  color: const Color(0xFF000000)
                                      .withValues(alpha: 0.18),
                                  blurRadius: 16,
                                  offset: const Offset(0, 8),
                                ),
                              ]
                            : [
                                BoxShadow(
                                  color: const Color(0xFF000000)
                                      .withValues(alpha: 0.08),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ];
                        final borderColor = cs.outlineVariant
                            .withValues(alpha: hovered ? 0.28 : 0.14);
                        return MouseRegion(
                          onEnter: (_) =>
                              setState(() => _hoveredBanners.add(i)),
                          onExit: (_) =>
                              setState(() => _hoveredBanners.remove(i)),
                          child: AnimatedScale(
                            scale: hovered ? 1.03 : 1.0,
                            duration: const Duration(milliseconds: 150),
                            curve: Curves.easeOut,
                            child: InkWell(
                              onTap: () => _openDetail(r),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: borderColor),
                                  boxShadow: shadow,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        width: 500,
                                        height: 250,
                                        child: Image.network(
                                          r.bannerUrl,
                                          fit: BoxFit.cover,
                                          errorBuilder: (c, e, s) =>
                                              const ColoredBox(
                                                  color: Colors.black12),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        bottom: 0,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 8),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF000000)
                                                .withValues(alpha: 0.38),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      r.name,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 6,
                                                        vertical: 2),
                                                    decoration: BoxDecoration(
                                                      color: _categoryColor(
                                                              r.category)
                                                          .withValues(
                                                              alpha: 0.2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    child: Text(
                                                      r.category,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 6),
                                              Row(
                                                children: [
                                                  Icon(Icons.bar_chart,
                                                      size: 14,
                                                      color: Colors.white70),
                                                  const SizedBox(width: 4),
                                                  Text('${r.usage}',
                                                      style: const TextStyle(
                                                          color: Colors.white)),
                                                  const SizedBox(width: 12),
                                                  Icon(Icons.visibility,
                                                      size: 14,
                                                      color: Colors.white70),
                                                  const SizedBox(width: 4),
                                                  Text('${r.views}',
                                                      style: const TextStyle(
                                                          color: Colors.white)),
                                                  const SizedBox(width: 12),
                                                  Icon(Icons.favorite_outline,
                                                      size: 14,
                                                      color: Colors.white70),
                                                  const SizedBox(width: 4),
                                                  Text('${r.follows}',
                                                      style: const TextStyle(
                                                          color: Colors.white)),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : PageView.builder(
                      controller: PageController(viewportFraction: 1.0),
                      itemCount: widget.viewModel.robots.length,
                      itemBuilder: (_, i) {
                        final r = widget.viewModel.robots[i];
                        return Padding(
                          padding: EdgeInsets.only(
                              right: i == widget.viewModel.robots.length - 1
                                  ? 0
                                  : 12),
                          child: InkWell(
                            onTap: () => _openDetail(r),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Stack(
                                children: [
                                  Image.network(
                                    r.bannerUrl,
                                    fit: BoxFit.cover,
                                    errorBuilder: (c, e, s) =>
                                        const ColoredBox(color: Colors.black12),
                                  ),
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 8),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF000000)
                                            .withValues(alpha: 0.38),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  r.name,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 6,
                                                        vertical: 2),
                                                decoration: BoxDecoration(
                                                  color:
                                                      _categoryColor(r.category)
                                                          .withValues(
                                                              alpha: 0.2),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Text(
                                                  r.category,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 11),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 6),
                                          Row(
                                            children: [
                                              Icon(Icons.bar_chart,
                                                  size: 14,
                                                  color: Colors.white70),
                                              const SizedBox(width: 4),
                                              Text('${r.usage}',
                                                  style: const TextStyle(
                                                      color: Colors.white)),
                                              const SizedBox(width: 12),
                                              Icon(Icons.visibility,
                                                  size: 14,
                                                  color: Colors.white70),
                                              const SizedBox(width: 4),
                                              Text('${r.views}',
                                                  style: const TextStyle(
                                                      color: Colors.white)),
                                              const SizedBox(width: 12),
                                              Icon(Icons.favorite_outline,
                                                  size: 14,
                                                  color: Colors.white70),
                                              const SizedBox(width: 4),
                                              Text('${r.follows}',
                                                  style: const TextStyle(
                                                      color: Colors.white)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
            const SizedBox(height: 25),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                '全部',
                ...widget.viewModel.categories,
                '其他',
              ].map((cat) {
                final selected = _selectedCats.contains(cat);
                final base = _categoryColor(cat);
                final color = base;
                final bg = base.withValues(alpha: selected ? 0.24 : 0.16);
                return InkWell(
                  onTap: () => _toggleCategory(cat),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                    decoration: BoxDecoration(
                      color: bg,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: base.withValues(alpha: selected ? 0.9 : 0.5),
                      ),
                    ),
                    child:
                        Text(cat, style: TextStyle(color: color, fontSize: 13)),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: _searchController,
              onChanged: (v) => setState(() => _searchQuery = v.trim()),
              decoration: InputDecoration(
                isDense: true,
                hintText: '搜索机器人',
                prefixIcon: const Icon(Icons.search, size: 18),
                suffixIcon: _searchQuery.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.close, size: 18),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _searchQuery = '');
                        },
                      ),
                filled: true,
                fillColor: cs.surfaceContainerHighest,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                      color: cs.outlineVariant.withValues(alpha: 0.1)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                      color: cs.outlineVariant.withValues(alpha: 0.1)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:
                      BorderSide(color: cs.primary.withValues(alpha: 0.1)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            LayoutBuilder(builder: (context, constraints) {
              final double spacing = 12;
              final int crossAxisCount = 3;
              final double itemWidth =
                  (constraints.maxWidth - spacing * (crossAxisCount - 1)) /
                      crossAxisCount;
              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: List.generate(_filtered.length, (i) {
                  final r = _filtered[i];
                  final hovered = _hoveredItems.contains(i);
                  final borderColor = cs.outlineVariant
                      .withValues(alpha: hovered ? 0.30 : 0.14);
                  final shadow = hovered
                      ? [
                          BoxShadow(
                            color:
                                const Color(0xFF000000).withValues(alpha: 0.22),
                            blurRadius: 16,
                            offset: const Offset(0, 8),
                          ),
                        ]
                      : [
                          BoxShadow(
                            color:
                                const Color(0xFF000000).withValues(alpha: 0.08),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ];
                  return SizedBox(
                      width: itemWidth,
                      child: MouseRegion(
                        onEnter: (_) => setState(() => _hoveredItems.add(i)),
                        onExit: (_) => setState(() => _hoveredItems.remove(i)),
                        child: AnimatedScale(
                          scale: hovered ? 1.03 : 1.0,
                          duration: const Duration(milliseconds: 150),
                          curve: Curves.easeOut,
                          child: InkWell(
                            onTap: () => _openDetail(r),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 150),
                                curve: Curves.easeOut,
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? const Color(0xFF1E1E1E)
                                      : cs.surface,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: borderColor),
                                  boxShadow: shadow,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: itemWidth * 0.4,
                                      width: double.infinity,
                                      child: Image.network(
                                        r.bannerUrl,
                                        fit: BoxFit.cover,
                                        errorBuilder: (c, e, s) =>
                                            const ColoredBox(
                                                color: Colors.black12),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            r.name,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(height: 6),
                                          Wrap(
                                            spacing: 8,
                                            runSpacing: 4,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.center,
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 6,
                                                        vertical: 2),
                                                decoration: BoxDecoration(
                                                  color:
                                                      _categoryColor(r.category)
                                                          .withValues(
                                                              alpha: 0.15),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Text(
                                                  r.category,
                                                  style: TextStyle(
                                                      color: _categoryColor(
                                                          r.category),
                                                      fontSize: 11),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(Icons.visibility,
                                                      size: 14,
                                                      color:
                                                          cs.onSurfaceVariant),
                                                  const SizedBox(width: 4),
                                                  Text('${r.views}',
                                                      style: TextStyle(
                                                          color: cs.onSurface,
                                                          fontSize: 12)),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(Icons.favorite_outline,
                                                      size: 14,
                                                      color:
                                                          cs.onSurfaceVariant),
                                                  const SizedBox(width: 4),
                                                  Text('${r.follows}',
                                                      style: TextStyle(
                                                          color: cs.onSurface,
                                                          fontSize: 12)),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            r.intro,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: cs.onSurfaceVariant,
                                                fontSize: 12,
                                                height: 1.3),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ));
                }),
              );
            }),
          ],
        ),
      ),
    );
  }
}
