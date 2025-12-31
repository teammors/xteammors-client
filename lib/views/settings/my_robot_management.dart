import 'package:flutter/material.dart';
import '../../viewmodels/my_robot_management_viewmodel.dart';
import '../../utils/toast_utils.dart';

class MyRobotManagementPage extends StatefulWidget {
  final MyRobotManagementViewModel viewModel;
  const MyRobotManagementPage(
      {super.key, this.viewModel = const MyRobotManagementViewModel()});

  @override
  State<MyRobotManagementPage> createState() => _MyRobotManagementPageState();
}

class _MyRobotManagementPageState extends State<MyRobotManagementPage> {
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的机器人管理'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              ToastUtils.showTopToast(
                context: context,
                message: '创建机器人未实现',
                backgroundColor: Colors.redAccent,
                textColor: Colors.white,
                icon: Icons.info_outline,
              );
            },
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Container(
            decoration: BoxDecoration(
              color: cs.primary.withValues(alpha: 0.04),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Theme.of(context).dividerColor.withValues(alpha: 0.15),
              ),
            ),
            child: Column(
              children: [
                for (int i = 0; i < widget.viewModel.robots.length; i++)
                  _RobotItem(
                    robot: widget.viewModel.robots[i],
                    showDivider: i < widget.viewModel.robots.length - 1,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RobotItem extends StatelessWidget {
  final MyRobotSummary robot;
  final bool showDivider;
  const _RobotItem({required this.robot, this.showDivider = false});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Column(
      children: [
        ListTile(
          leading: _avatar(robot.avatarUrl),
          title: Row(
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
              _CategoryChip(label: robot.category),
              const SizedBox(width: 8),
              _StatusChip(status: robot.status),
            ],
          ),
          subtitle: const Text('机器人'),
          trailing: Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          onTap: () {
            ToastUtils.showTopToast(
              context: context,
              message: '进入机器人配置未实现',
              backgroundColor: Colors.redAccent,
              textColor: Colors.white,
              icon: Icons.info_outline,
            );
          },
        ),
        if (showDivider)
          Divider(
            height: 0,
            thickness: 0.5,
            color: Theme.of(context).dividerColor.withValues(alpha: 0.08),
          ),
      ],
    );
  }

  Widget _avatar(String? url) {
    if (url != null && url.isNotEmpty) {
      return const CircleAvatar(radius: 22);
    }
    return const CircleAvatar(radius: 22, child: Icon(Icons.smart_toy_outlined));
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  const _CategoryChip({required this.label});

  Color _colorFor(String c) {
    switch (c) {
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
      default:
        return const Color(0xFF999999);
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _colorFor(label);
    final bg = color.withValues(alpha: 0.15);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(color: color, fontSize: 11),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final MyRobotStatus status;
  const _StatusChip({required this.status});

  String get _label {
    switch (status) {
      case MyRobotStatus.online:
        return '上线';
      case MyRobotStatus.offline:
        return '下线';
      case MyRobotStatus.developing:
        return '开发中';
    }
  }

  Color get _color {
    switch (status) {
      case MyRobotStatus.online:
        return const Color(0xFF1DB954);
      case MyRobotStatus.offline:
        return const Color(0xFF9E9E9E);
      case MyRobotStatus.developing:
        return const Color(0xFFFFA000);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bg = _color.withValues(alpha: 0.15);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        _label,
        style: TextStyle(color: _color, fontSize: 11),
      ),
    );
  }
}
