import 'package:flutter/material.dart';
import '../../viewmodels/chat_viewmodel.dart';

class ReplyHeader extends StatelessWidget {
  final MessageType type;
  final String? preview;
  final String? thumbUrl;
  final bool isDark;
  final bool isMe;
  const ReplyHeader({required this.type, this.preview, this.thumbUrl, required this.isDark, required this.isMe});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final bg = isDark ? Colors.white12 : Colors.black12;
    final Color textColor = isMe ? Colors.white : cs.onSurfaceVariant;

  Widget? media;
  String label;
  switch (type) {
    case MessageType.text:
      label = 'Text';
      break;
    case MessageType.image:
      label = 'Photo';
      media = ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: SizedBox(
          width: 40,
          height: 40,
          child: thumbUrl != null
              ? Image.network(
                  thumbUrl!,
                  fit: BoxFit.cover,
                  loadingBuilder: (c, child, p) => p == null
                      ? child
                      : Center(
                          child: SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))),
                  errorBuilder: (c, e, s) => ColoredBox(
                    color: Colors.grey[800]!,
                    child: const Icon(Icons.broken_image, size: 16),
                  ),
                )
              : const ColoredBox(color: Colors.grey),
        ),
      );
      break;
    case MessageType.video:
      label = 'Video';
      media = Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: SizedBox(
              width: 40,
              height: 40,
              child: thumbUrl != null
                  ? Image.network(
                      thumbUrl!,
                      fit: BoxFit.cover,
                      loadingBuilder: (c, child, p) => p == null
                          ? child
                          : Center(
                              child: SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))),
                      errorBuilder: (c, e, s) => ColoredBox(
                        color: Colors.grey[800]!,
                        child: const Icon(Icons.broken_image, size: 16),
                      ),
                    )
                  : const ColoredBox(color: Colors.black12),
            ),
          ),
          const Icon(Icons.play_arrow, size: 16, color: Colors.white),
        ],
      );
      break;
    case MessageType.voice:
      label = 'Voice message';
      break;
    case MessageType.file:
      label = 'File';
      break;
    case MessageType.emoji:
      label = 'Emoji';
      break;
    default:
      label = preview ?? '';
  }

    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
        border: const Border(left: BorderSide(color: Color(0xFF0088CC), width: 3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (media != null) media,
          if (media != null) const SizedBox(width: 8),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 240),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: TextStyle(color: textColor, fontSize: 12, fontWeight: FontWeight.w600)),
                if (type != MessageType.image && type != MessageType.video && (preview?.isNotEmpty ?? false))
                  Text(preview!, overflow: TextOverflow.ellipsis, softWrap: false, style: TextStyle(color: textColor, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
