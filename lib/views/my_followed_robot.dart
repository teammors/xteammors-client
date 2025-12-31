import 'package:flutter/material.dart';
import '../viewmodels/my_followed_robot_viewmodel.dart';

class MyFollowedRobotPage extends StatefulWidget {
  final MyFollowedRobotViewModel viewModel;
  final void Function(FollowedRobot)? onOpenRobot;
  final VoidCallback? onOpenMarket;

  const MyFollowedRobotPage({
    super.key,
    this.viewModel = const MyFollowedRobotViewModel(),
    this.onOpenRobot,
    this.onOpenMarket,
  });

  @override
  State<MyFollowedRobotPage> createState() => _MyFollowedRobotPageState();
}

class _MyFollowedRobotPageState extends State<MyFollowedRobotPage> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';
  int? _hoverIndex;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final list = widget.viewModel.robots
        .where((r) =>
            _query.isEmpty ||
            r.name.toLowerCase().contains(_query.toLowerCase()))
        .toList();

    return Column(
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Container(
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .secondary
                  .withValues(alpha: 0.08),
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor.withValues(alpha: 0.2),
                  width: 0.5,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Followed Robots',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add, size: 20),
                  onPressed: widget.onOpenMarket,
                  tooltip: 'Discover More',
                ),
              ],
            ),
          ),
        ),
        // Search
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: TextField(
            controller: _searchController,
            onChanged: (val) => setState(() => _query = val),
            decoration: InputDecoration(
              hintText: 'Search robots',
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
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            ),
          ),
        ),
        // List
        Expanded(
          child: ListView.separated(
            itemCount: list.length,
            separatorBuilder: (c, i) => Divider(
                height: 1,
                color: Theme.of(context).dividerColor.withValues(alpha: 0.05)),
            itemBuilder: (c, i) {
              final robot = list[i];
              final hovered = _hoverIndex == i;
              return MouseRegion(
                onEnter: (_) => setState(() => _hoverIndex = i),
                onExit: (_) => setState(() => _hoverIndex = null),
                child: Container(
                  color: hovered
                      ? cs.primary.withValues(alpha: 0.06)
                      : Colors.transparent,
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(robot.avatarUrl),
                      radius: 20,
                    ),
                    title: Text(robot.name,
                        style: TextStyle(fontSize: 16, color: cs.onSurface)),
                    subtitle: Text(
                      robot.lastMessage.isNotEmpty
                          ? robot.lastMessage
                          : robot.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 13,
                          color: cs.onSurface.withValues(alpha: 0.6)),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (robot.lastActiveTime.isNotEmpty)
                          Text(
                            robot.lastActiveTime,
                            style: TextStyle(
                                fontSize: 11,
                                color: cs.onSurface.withValues(alpha: 0.4)),
                          ),
                        const SizedBox(height: 4),
                        if (robot.isOnline)
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                    onTap: () {
                      if (widget.onOpenRobot != null) {
                        widget.onOpenRobot!(robot);
                      }
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
