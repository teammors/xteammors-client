import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;
import '../viewmodels/messages_viewmodel.dart';
import 'chat_page.dart';
import 'user_profile_page.dart';
import 'group_profile_page.dart';
import '../viewmodels/user_profile_viewmodel.dart';
import '../viewmodels/chat_viewmodel.dart';
import '../utils/toast_utils.dart';

class MessagesPage extends StatelessWidget {
  final MessagesViewModel viewModel;
  final void Function(MessageSummary)? onOpenChat;
  const MessagesPage({
    super.key,
    this.viewModel = const MessagesViewModel(),
    this.onOpenChat,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Container(
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.08),
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor.withValues(alpha: 0.2),
                  width: 0.5,
                ),
              ),
            ),
            child: Text(
              'Messages',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 55,
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 8),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search messages',
              prefixIcon: const Icon(
                Icons.search,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide:
                    BorderSide(color: Colors.grey.withValues(alpha: 0.4)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide:
                    BorderSide(color: Colors.grey.withValues(alpha: 0.4)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide:
                    BorderSide(color: Colors.grey.withValues(alpha: 0.6)),
              ),
              isDense: true,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.separated(
            itemCount: viewModel.items.length,
            separatorBuilder: (_, __) => Divider(
              height: 0,
              thickness: 0.5,
              indent: 72,
              //endIndent: 12,
              color: cs.outlineVariant.withValues(alpha: 0.2),
            ),
            itemBuilder: (context, index) {
              final item = viewModel.items[index];
              return _MessageItem(item: item, onOpenChat: onOpenChat);
            },
          ),
        ),
      ],
    );
  }
}

class _ReadMarkIcon extends StatelessWidget {
  final ReadMark mark;
  const _ReadMarkIcon({required this.mark});

  @override
  Widget build(BuildContext context) {
    switch (mark) {
      case ReadMark.singleGrey:
        return const Icon(Icons.done, color: Colors.grey, size: 16);
      case ReadMark.doubleGreen:
        return const Icon(Icons.done_all, color: Colors.green, size: 16);
    }
  }
}

class _MessageItem extends StatefulWidget {
  final MessageSummary item;
  final void Function(MessageSummary)? onOpenChat;
  const _MessageItem({required this.item, this.onOpenChat});

  @override
  State<_MessageItem> createState() => _MessageItemState();
}

class _MessageItemState extends State<_MessageItem> {
  bool _hover = false;
  bool _menuActive = false;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final item = widget.item;
    final bool isDesktop =
        kIsWeb || Platform.isMacOS || Platform.isWindows || Platform.isLinux;

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: Container(
        color: _menuActive
            ? (isDark
                ? Colors.white.withValues(alpha: 0.12)
                : cs.primary.withValues(alpha: 0.12))
            : (_hover
                ? cs.surfaceContainerHighest.withValues(alpha: 0.12)
                : Colors.transparent),
        height: 70,
        child: GestureDetector(
          onLongPress: isDesktop ? null : () => _showItemMenu(context, null),
          onSecondaryTapDown: isDesktop
              ? (details) => _showItemMenu(context, details.globalPosition)
              : null,
          child: InkWell(
            onTap: () {
              if (widget.onOpenChat != null) {
                widget.onOpenChat!(item);
              } else {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ChatPage(
                      viewModel: ChatViewModel.fromSummary(item),
                      onOpenProfile: (UserProfileViewModel vm) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => UserProfilePage(vm: vm),
                          ),
                        );
                      },
                      onOpenGroup: (groupVm) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => GroupProfilePage(
                              vm: groupVm,
                              onOpenMessages: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => ChatPage(
                                      viewModel: ChatViewModel.groupFromName(
                                        groupVm.name,
                                        onlineCount: groupVm.members.length,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              onOpenMemberChat: (cvm) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => ChatPage(viewModel: cvm),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      if (widget.item.avatarUrl != null)
                        ClipOval(
                          child: Image.network(
                            widget.item.avatarUrl!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return CircleAvatar(
                                radius: 25,
                                child: Icon(
                                  widget.item.isGroup
                                      ? Icons.groups_2_outlined
                                      : Icons.person_outline,
                                  color: cs.onSurfaceVariant,
                                ),
                              );
                            },
                          ),
                        )
                      else
                        CircleAvatar(
                          radius: 30,
                          child: Icon(
                            widget.item.isGroup
                                ? Icons.groups_2_outlined
                                : Icons.person_outline,
                            color: cs.onSurfaceVariant,
                          ),
                        ),
                      if (item.isOnline)
                        Positioned(
                          right: -2,
                          bottom: -2,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: cs.surface,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ClipRect(
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          item.name,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      // if (item.retentionLabel != null &&
                                      //     item.retentionColor != null) ...[
                                      //   const SizedBox(width: 8),
                                      //   _RetentionChip(
                                      //       label: item.retentionLabel!,
                                      //       color: item.retentionColor!),
                                      // ],
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  item.time,
                                  style: TextStyle(
                                      color: cs.onSurfaceVariant.withOpacity(0.5),
                                      fontSize: 12,
                                      height: 1.0),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    item.message,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: cs.onSurfaceVariant.withOpacity(0.6),
                                        fontSize: 14,
                                        height: 1.0),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                if (item.unreadCount > 0) ...[
                                  _UnreadBadge(count: item.unreadCount),
                                  const SizedBox(width: 5),
                                ],
                                _ReadMarkIcon(mark: item.mark),
                              ],
                            ),
                          ],
                        ),
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
  }

  Future<void> _showItemMenu(BuildContext context, Offset? position) async {
    final cs = Theme.of(context).colorScheme;
    final isGroup = widget.item.isGroup;

    final List<PopupMenuItem> desktopItems = isGroup
        ? [
            PopupMenuItem(
              height: 34,
              child: Row(children: [
                Icon(Icons.cleaning_services_outlined,
                    size: 16, color: cs.onSurface),
                const SizedBox(width: 12),
                Text('Clear all messages',
                    style: TextStyle(color: cs.onSurface)),
              ]),
              onTap: () {
                ToastUtils.showTopToast(
                    context: context,
                    message: '清空群消息未实现',
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    icon: Icons.info_outline);
              },
            ),
            PopupMenuItem(
              height: 34,
              child: Row(children: [
                Icon(Icons.exit_to_app_outlined, size: 16, color: cs.onSurface),
                const SizedBox(width: 12),
                Text('Leave the group', style: TextStyle(color: cs.onSurface)),
              ]),
              onTap: () {
                ToastUtils.showTopToast(
                    context: context,
                    message: '退出群未实现',
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    icon: Icons.info_outline);
              },
            ),
            PopupMenuItem(
              height: 34,
              child: Row(children: [
                Icon(Icons.schedule_outlined, size: 16, color: cs.onSurface),
                const SizedBox(width: 12),
                Text('Set clear time', style: TextStyle(color: cs.onSurface)),
              ]),
              onTap: () {
                ToastUtils.showTopToast(
                    context: context,
                    message: '设置清理时间未实现',
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    icon: Icons.info_outline);
              },
            ),
            PopupMenuItem(
              height: 34,
              child: Row(children: [
                Icon(Icons.notifications_off_outlined,
                    size: 16, color: cs.onSurface),
                const SizedBox(width: 12),
                Text('Block notifications',
                    style: TextStyle(color: cs.onSurface)),
              ]),
              onTap: () {
                ToastUtils.showTopToast(
                    context: context,
                    message: '屏蔽群通知未实现',
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    icon: Icons.info_outline);
              },
            ),
          ]
        : [
            PopupMenuItem(
              height: 34,
              child: Row(children: [
                Icon(Icons.cleaning_services_outlined,
                    size: 16, color: cs.onSurface),
                const SizedBox(width: 12),
                Text('Clear all messages',
                    style: TextStyle(color: cs.onSurface)),
              ]),
              onTap: () {
                ToastUtils.showTopToast(
                    context: context,
                    message: '清空消息未实现',
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    icon: Icons.info_outline);
              },
            ),
            PopupMenuItem(
              height: 34,
              child: Row(children: [
                Icon(Icons.delete_outline, size: 16, color: cs.onSurface),
                const SizedBox(width: 12),
                Text('Delete conversations',
                    style: TextStyle(color: cs.onSurface)),
              ]),
              onTap: () {
                ToastUtils.showTopToast(
                    context: context,
                    message: '删除会话未实现',
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    icon: Icons.info_outline);
              },
            ),
            PopupMenuItem(
              height: 34,
              child: Row(children: [
                Icon(Icons.schedule_outlined, size: 16, color: cs.onSurface),
                const SizedBox(width: 12),
                Text('Set clear time', style: TextStyle(color: cs.onSurface)),
              ]),
              onTap: () {
                ToastUtils.showTopToast(
                    context: context,
                    message: '设置清理时间未实现',
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    icon: Icons.info_outline);
              },
            ),
            PopupMenuItem(
              height: 34,
              child: Row(children: [
                Icon(Icons.notifications_off_outlined,
                    size: 16, color: cs.onSurface),
                const SizedBox(width: 12),
                Text('Block notifications',
                    style: TextStyle(color: cs.onSurface)),
              ]),
              onTap: () {
                ToastUtils.showTopToast(
                    context: context,
                    message: '屏蔽通知未实现',
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    icon: Icons.info_outline);
              },
            ),
            PopupMenuItem(
              height: 34,
              child: Row(children: [
                Icon(Icons.block, size: 16, color: cs.onSurface),
                const SizedBox(width: 12),
                Text('Block the user', style: TextStyle(color: cs.onSurface)),
              ]),
              onTap: () {
                ToastUtils.showTopToast(
                    context: context,
                    message: '屏蔽该用户未实现',
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    icon: Icons.info_outline);
              },
            ),
          ];

    setState(() => _menuActive = true);

    if (position != null) {
      final overlay =
          Overlay.of(context).context.findRenderObject() as RenderBox?;
      final size = overlay?.size ?? MediaQuery.of(context).size;
      final rect = RelativeRect.fromLTRB(
        position.dx,
        position.dy,
        size.width - position.dx,
        size.height - position.dy,
      );
      await showMenu(context: context, position: rect, items: desktopItems);
      if (mounted) setState(() => _menuActive = false);
      return;
    }

    await showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      builder: (ctx) {
        final tiles = desktopItems.map((e) {
          final row = e.child as Row;
          final children = row.children;
          return ListTile(
            leading: children.first as Widget,
            title: children.last as Widget,
            onTap: () {
              Navigator.of(ctx).pop();
              e.onTap?.call();
            },
          );
        }).toList();
        return SafeArea(
            child: Column(mainAxisSize: MainAxisSize.min, children: tiles));
      },
    );
    if (mounted) setState(() => _menuActive = false);
  }
}

class _RetentionChip extends StatelessWidget {
  final String label;
  final Color color;
  const _RetentionChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    final bg = color.withValues(alpha: 0.15);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        label,
        style: TextStyle(color: color, fontSize: 10),
      ),
    );
  }
}

class _UnreadBadge extends StatelessWidget {
  final int count;
  const _UnreadBadge({required this.count});

  @override
  Widget build(BuildContext context) {
    double dHorizontal = 6;

    String sCount = "$count";
    if (count >= 100) {
      sCount = "99+";
    }

    if (count > 10) {
      dHorizontal = 4;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: dHorizontal, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        sCount,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
        ),
      ),
    );
  }
}
