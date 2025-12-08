import 'package:flutter/material.dart';
import '../viewmodels/my_ai_viewmodel.dart';

class MyAIListPage extends StatefulWidget {
  final AIViewModel viewModel;
  const MyAIListPage({super.key, this.viewModel = const AIViewModel()});

  @override
  State<MyAIListPage> createState() => _MyAIListPageState();
}

class _MyAIListPageState extends State<MyAIListPage> {
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
        title: const Text('My AI'),
        centerTitle: false,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            height: 55,
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search AI Bots',
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
                return _RobotItem(robot: r);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _RobotItem extends StatelessWidget {
  final AIRobotSummary robot;
  const _RobotItem({required this.robot});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            child: Text(robot.name.isNotEmpty ? robot.name[0] : '?'),
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
                        robot.name,
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
                      robot.category,
                      style: TextStyle(
                        color: cs.onSurfaceVariant.withOpacity(0.8),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  robot.intro,
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
    );
  }
}

// 数据模型已在 viewmodel 中声明
