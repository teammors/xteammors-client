import 'package:flutter/material.dart';
import '../viewmodels/messages_viewmodel.dart';

class MessagesPage extends StatelessWidget {
  final MessagesViewModel viewModel;
  const MessagesPage({super.key, this.viewModel = const MessagesViewModel()});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search messages',
              prefixIcon: const Icon(Icons.search),
              border: const OutlineInputBorder(),
              isDense: true,
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: viewModel.items.length,
            separatorBuilder: (_, __) => Divider(
              height: 1,
              thickness: 0.5,
              color: cs.outlineVariant.withValues(alpha: 0.4),
            ),
            itemBuilder: (context, index) {
              final item = viewModel.items[index];
              return SizedBox(
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      const CircleAvatar(radius: 24),
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
              );
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
