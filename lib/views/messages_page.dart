import 'package:flutter/material.dart';
import '../viewmodels/messages_viewmodel.dart';
import 'chat_page.dart';
import 'user_profile_page.dart';
import '../viewmodels/user_profile_viewmodel.dart';
import '../viewmodels/chat_viewmodel.dart';

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
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search messages',
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
            itemCount: viewModel.items.length,
            separatorBuilder: (_, __) => Divider(
              height: 0,
              thickness: 0.5,
              indent: 16,
              endIndent: 12,
              color: cs.outlineVariant.withValues(alpha: 0.05),
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
        return const Icon(Icons.done, color: Colors.grey, size: 18);
      case ReadMark.doubleGreen:
        return const Icon(Icons.done_all, color: Colors.green, size: 18);
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

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final item = widget.item;
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: Container(
        color: _hover
            ? cs.surfaceContainerHighest.withValues(alpha: 0.12)
            : Colors.transparent,
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 12),
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
                  ),
                ),
              );
            }
          },
          child: Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  const CircleAvatar(radius: 24),
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
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
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
                        if (item.retentionLabel != null &&
                            item.retentionColor != null) ...[
                          const SizedBox(width: 8),
                          _RetentionChip(
                              label: item.retentionLabel!,
                              color: item.retentionColor!),
                        ],
                        const SizedBox(width: 8),
                        Text(
                          item.time,
                          style: TextStyle(color: cs.onSurfaceVariant),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            item.message,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: cs.onSurfaceVariant),
                          ),
                        ),
                        const SizedBox(width: 8),
                        _ReadMarkIcon(mark: item.mark),
                      ],
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
        style: TextStyle(color: color, fontSize: 12),
      ),
    );
  }
}
