import 'package:flutter/material.dart';
import '../viewmodels/user_profile_viewmodel.dart';

class UserProfilePage extends StatelessWidget {
  final UserProfileViewModel vm;
  const UserProfilePage(
      {super.key, this.vm = const UserProfileViewModel.sample()});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: [
          _buildHeader(context, cs),
          const SizedBox(height: 12),
          _buildActionsPanel(context, cs),
          const SizedBox(height: 16),
          _buildGroupsSection(context, cs),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, ColorScheme cs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              _avatar(vm.avatarUrl, 40),
              if (vm.online)
                Positioned(
                  bottom: -2,
                  right: -2,
                  child: Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1DB954),
                      shape: BoxShape.circle,
                      border: Border.all(color: cs.surface, width: 2),
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(vm.name,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: cs.onSurface)),
        const SizedBox(height: 6),
        if (vm.bio != null)
          Text(vm.bio!,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: cs.onSurfaceVariant)),
      ],
    );
  }

  Widget _avatar(String? url, double radius) {
    if (url != null && url.isNotEmpty) {
      return CircleAvatar(backgroundImage: NetworkImage(url), radius: radius);
    }
    return CircleAvatar(
        radius: radius, child: Text(vm.name.isNotEmpty ? vm.name[0] : '?'));
  }

  Widget _panelTitle(String title, ColorScheme cs) {
    return Row(
      children: [
        Text(title,
            style: TextStyle(
                color: cs.onSurface,
                fontSize: 14,
                fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget _buildActionsPanel(BuildContext context, ColorScheme cs) {
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
            itemCount: 4,
            separatorBuilder: (c, i) => Divider(
                height: 1,
                color: Theme.of(context).dividerColor.withValues(alpha: 0.08)),
            itemBuilder: (c, i) {
              switch (i) {
                case 0:
                  return ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    leading: Icon(Icons.message_outlined, color: cs.onSurface),
                    title: Text('消息',
                        style: TextStyle(color: cs.onSurface, fontSize: 15)),
                    trailing:
                        Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
                    onTap: () {},
                  );
                case 1:
                  return ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    leading: Icon(Icons.videocam_outlined, color: cs.onSurface),
                    title: Text('视频',
                        style: TextStyle(color: cs.onSurface, fontSize: 15)),
                    trailing:
                        Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
                    onTap: () {},
                  );
                case 2:
                  return ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    leading: Icon(Icons.call_outlined, color: cs.onSurface),
                    title: Text('语音',
                        style: TextStyle(color: cs.onSurface, fontSize: 15)),
                    trailing:
                        Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
                    onTap: () {},
                  );
                default:
                  return ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    leading: Icon(Icons.block, color: cs.onSurface),
                    title: Text('屏蔽',
                        style: TextStyle(color: cs.onSurface, fontSize: 15)),
                    trailing:
                        Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
                    onTap: () {},
                  );
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildGroupsSection(BuildContext context, ColorScheme cs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _panelTitle('共同群组', cs),
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
            itemCount: vm.sharedGroups.length,
            separatorBuilder: (c, i) => Divider(
                height: 1,
                color: Theme.of(context).dividerColor.withValues(alpha: 0.08)),
            itemBuilder: (c, i) {
              final g = vm.sharedGroups[i];
              return ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                leading: _groupAvatar(g.avatarUrl),
                title: Text(g.name,
                    style: TextStyle(color: cs.onSurface, fontSize: 15)),
                subtitle: Text('${g.members} 人',
                    style: TextStyle(color: cs.onSurfaceVariant, fontSize: 12)),
                trailing: Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _groupAvatar(String? url) {
    if (url != null && url.isNotEmpty) {
      return CircleAvatar(backgroundImage: NetworkImage(url), radius: 18);
    }
    return const CircleAvatar(radius: 18, child: Text('#'));
  }
}
