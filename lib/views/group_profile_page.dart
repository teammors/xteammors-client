import 'package:flutter/material.dart';
import '../viewmodels/group_profile_viewmodel.dart';
import '../viewmodels/user_profile_viewmodel.dart';
import '../utils/toast_utils.dart';

class GroupProfilePage extends StatelessWidget {
  final GroupProfileViewModel vm;
  final void Function(UserProfileViewModel)? onOpenMember;
  final void Function()? onOpenMessages;
  const GroupProfilePage(
      {super.key,
      this.vm = const GroupProfileViewModel.sample(),
      this.onOpenMember,
      this.onOpenMessages});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Group Profile')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: [
          _buildHeader(context, cs),
          const SizedBox(height: 12),
          _buildActionsPanel(context, cs),
          const SizedBox(height: 16),
          _buildMembersSection(context, cs),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, ColorScheme cs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: _avatar(vm.avatarUrl, 40)),
        const SizedBox(height: 10),
        Text(vm.name,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: cs.onSurface)),
        const SizedBox(height: 6),
        if (vm.intro != null)
          Text(vm.intro!,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: cs.onSurfaceVariant)),
      ],
    );
  }

  Widget _avatar(String? url, double radius) {
    if (url != null && url.isNotEmpty) {
      return CircleAvatar(backgroundImage: NetworkImage(url), radius: radius);
    }
    return const CircleAvatar(radius: 40, child: Text('#'));
  }

  Widget _panelTitle(String title, ColorScheme cs) {
    return Row(children: [
      Text(title,
          style: TextStyle(
              color: cs.onSurface, fontSize: 14, fontWeight: FontWeight.w600))
    ]);
  }

  Widget _buildActionsPanel(BuildContext context, ColorScheme cs) {
    final items = <_ActionItem>[
      _ActionItem(
          icon: Icons.message_outlined,
          label: 'Messages',
          onTap: () {
            if (onOpenMessages != null) {
              onOpenMessages!();
            } else {
              ToastUtils.showTopToast(
                context: context,
                message: '进入群聊天未实现',
                backgroundColor: Colors.red,
                textColor: Colors.white,
                icon: Icons.info_outline,
              );
            }
          }),
      _ActionItem(
          icon: Icons.person_add_alt_1_outlined,
          label: 'Add',
          onTap: () {
            ToastUtils.showTopToast(
              context: context,
              message: '添加成员未实现',
              backgroundColor: Colors.red,
              textColor: Colors.white,
              icon: Icons.info_outline,
            );
          }),
      _ActionItem(
          icon: Icons.block,
          label: 'Block',
          onTap: () {
            ToastUtils.showTopToast(
              context: context,
              message: '屏蔽群未实现',
              backgroundColor: Colors.red,
              textColor: Colors.white,
              icon: Icons.info_outline,
            );
          }),
      vm.isOwner
          ? _ActionItem(
              icon: Icons.delete_forever_outlined,
              label: 'Dissolve',
              onTap: () {
                ToastUtils.showTopToast(
                  context: context,
                  message: '解散群未实现',
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  icon: Icons.info_outline,
                );
              })
          : _ActionItem(
              icon: Icons.exit_to_app_outlined,
              label: 'Exit',
              onTap: () {
                ToastUtils.showTopToast(
                  context: context,
                  message: '退出群未实现',
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  icon: Icons.info_outline,
                );
              }),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _panelTitle('Actions', cs),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: cs.primary.withValues(alpha: 0.04),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: Theme.of(context).dividerColor.withValues(alpha: 0.15)),
          ),
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: items.length,
            separatorBuilder: (c, i) => Divider(
                height: 1,
                color: Theme.of(context).dividerColor.withValues(alpha: 0.08)),
            itemBuilder: (c, i) {
              final it = items[i];
              return ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                leading: Icon(it.icon, color: cs.onSurface),
                title: Text(it.label,
                    style: TextStyle(color: cs.onSurface, fontSize: 15)),
                trailing: Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
                onTap: it.onTap,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMembersSection(BuildContext context, ColorScheme cs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _panelTitle('Members（${vm.members.length}成员）', cs),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: cs.primary.withValues(alpha: 0.04),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: Theme.of(context).dividerColor.withValues(alpha: 0.15)),
          ),
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: vm.members.length,
            separatorBuilder: (c, i) => Divider(
                height: 1,
                color: Theme.of(context).dividerColor.withValues(alpha: 0.08)),
            itemBuilder: (c, i) {
              final m = vm.members[i];
              return ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                leading: _memberAvatar(m.avatarUrl),
                title: Text(m.name,
                    style: TextStyle(color: cs.onSurface, fontSize: 15)),
                subtitle: m.online
                    ? Text('Online',
                        style: const TextStyle(
                            color: Color(0xFF1DB954), fontSize: 12))
                    : Text('last seen at ${m.lastSeen ?? ''}',
                        style: TextStyle(
                            color: cs.onSurfaceVariant, fontSize: 12)),
                trailing: Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
                onTap: () {
                  if (onOpenMember != null) {
                    onOpenMember!(UserProfileViewModel(
                        userId: m.id,
                        name: m.name,
                        avatarUrl: m.avatarUrl,
                        online: m.online));
                  }
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _memberAvatar(String? url) {
    if (url != null && url.isNotEmpty) {
      return const CircleAvatar(radius: 18);
    }
    return const CircleAvatar(radius: 18, child: Text('?'));
  }
}

class _ActionItem {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  const _ActionItem({required this.icon, required this.label, this.onTap});
}
