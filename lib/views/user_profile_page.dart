import 'package:flutter/material.dart';
import '../utils/toast_utils.dart';
import '../viewmodels/user_profile_viewmodel.dart';
import 'chat_page.dart';
import '../viewmodels/chat_viewmodel.dart';

class UserProfilePage extends StatefulWidget {
  final UserProfileViewModel vm;
  final VoidCallback? onDelete;
  final void Function(ChatViewModel)? onOpenChat;
  const UserProfilePage(
      {super.key,
      this.vm = const UserProfileViewModel.sample(),
      this.onDelete,
      this.onOpenChat});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  late bool _blocked;

  @override
  void initState() {
    super.initState();
    _blocked = widget.vm.blocked;
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () {
              if (widget.onDelete != null) {
                widget.onDelete!();
              } else {
                ToastUtils.showTopToast(
                  context: context,
                  message: '删除联系人未实现',
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  icon: Icons.info_outline,
                );
              }
            },
          ),
        ],
      ),
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
              _avatar(widget.vm.avatarUrl, 40),
              if (widget.vm.online)
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
        Text(widget.vm.name,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: cs.onSurface)),
        const SizedBox(height: 6),
        if (widget.vm.bio != null)
          Text(widget.vm.bio!,
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
        radius: radius,
        child: Text(widget.vm.name.isNotEmpty ? widget.vm.name[0] : '?'));
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
                    title: Text('Messages',
                        style: TextStyle(color: cs.onSurface, fontSize: 15)),
                    trailing:
                        Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
                    onTap: () {
                      final vm = ChatViewModel.privateFromName(widget.vm.name);
                      if (widget.onOpenChat != null) {
                        widget.onOpenChat!(vm);
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ChatPage(viewModel: vm),
                          ),
                        );
                      }
                    },
                  );
                case 1:
                  return ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    leading: Icon(Icons.videocam_outlined, color: cs.onSurface),
                    title: Text('Videos Call',
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
                    title: Text('Voice Call',
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
                    title: Text('Block',
                        style: TextStyle(color: cs.onSurface, fontSize: 15)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('(${_blocked ? 'Blocked' : 'UnBlocked'})',
                            style: TextStyle(
                                color: _blocked
                                    ? const Color(0xFF1DB954)
                                    : Colors.red,
                                fontSize: 12)),
                        const SizedBox(width: 6),
                        Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        _blocked = !_blocked;
                      });
                      if (_blocked) {
                        ToastUtils.showTopToast(
                          context: context,
                          message: 'This contact has been blocked.',
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          icon: Icons.info_outline,
                        );
                      } else {
                        ToastUtils.showTopToast(
                          context: context,
                          message: 'The block has been removed.',
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          icon: Icons.info_outline,
                        );
                      }
                    },
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
        _panelTitle('Groups', cs),
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
            itemCount: widget.vm.sharedGroups.length,
            separatorBuilder: (c, i) => Divider(
                height: 1,
                color: Theme.of(context).dividerColor.withValues(alpha: 0.08)),
            itemBuilder: (c, i) {
              final g = widget.vm.sharedGroups[i];
              return ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                leading: _groupAvatar(g.avatarUrl),
                title: Text(g.name,
                    style: TextStyle(color: cs.onSurface, fontSize: 15)),
                subtitle: Text('${g.members} 人',
                    style: TextStyle(color: cs.onSurfaceVariant, fontSize: 12)),
                trailing: Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
                onTap: () {
                  final vm = ChatViewModel.groupFromName(g.name,
                      onlineCount: g.members);
                  if (widget.onOpenChat != null) {
                    widget.onOpenChat!(vm);
                  } else {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ChatPage(viewModel: vm),
                      ),
                    );
                  }
                },
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
