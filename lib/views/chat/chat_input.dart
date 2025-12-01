import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  final bool isDark;
  final TextEditingController textController;
  final bool hasText;
  final VoidCallback onSend;
  final FocusNode? focusNode;
  final bool isRecording;
  final VoidCallback? onMicPressed;
  final VoidCallback? onEmojiPressed;
  final LayerLink? emojiAnchorLink;

  const ChatInput({
    required this.isDark,
    required this.textController,
    required this.hasText,
    required this.onSend,
    this.focusNode,
    this.isRecording = false,
    this.onMicPressed,
    this.onEmojiPressed,
    this.emojiAnchorLink,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        height: 50,
        padding: const EdgeInsets.fromLTRB(15, 4, 15, 4),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.08),
        ),
        child: Row(
          children: [
            Builder(
              builder: (btnCtx) {
                return IconButton(
                  icon: Icon(Icons.attach_file,
                      color: isDark ? Colors.grey[400] : Colors.grey[600],
                      size: 20),
                  onPressed: () {
                    final overlay = Overlay.of(btnCtx)
                        .context
                        .findRenderObject() as RenderBox;
                    final box = btnCtx.findRenderObject() as RenderBox;
                    final offset = box.localToGlobal(Offset.zero);
                    final rect = Rect.fromLTWH(
                        offset.dx, offset.dy, box.size.width, box.size.height);
                    showMenu(
                      context: btnCtx,
                      position: RelativeRect.fromRect(
                          rect, Offset.zero & overlay.size),
                      items: [
                        PopupMenuItem(
                          height: 34,
                          child: Row(children: [
                            Icon(Icons.image_outlined,
                                size: 16,
                                color: Theme.of(btnCtx).colorScheme.onSurface),
                            const SizedBox(width: 12),
                            Text('Images',
                                style: TextStyle(
                                    color: Theme.of(btnCtx)
                                        .colorScheme
                                        .onSurface)),
                          ]),
                        ),
                        PopupMenuItem(
                          height: 34,
                          child: Row(children: [
                            Icon(Icons.videocam_outlined,
                                size: 16,
                                color: Theme.of(btnCtx).colorScheme.onSurface),
                            const SizedBox(width: 12),
                            Text('Videos',
                                style: TextStyle(
                                    color: Theme.of(btnCtx)
                                        .colorScheme
                                        .onSurface)),
                          ]),
                        ),
                        PopupMenuItem(
                          height: 34,
                          child: Row(children: [
                            Icon(Icons.insert_drive_file_outlined,
                                size: 16,
                                color: Theme.of(btnCtx).colorScheme.onSurface),
                            const SizedBox(width: 12),
                            Text('Files',
                                style: TextStyle(
                                    color: Theme.of(btnCtx)
                                        .colorScheme
                                        .onSurface)),
                          ]),
                        ),
                        PopupMenuItem(
                          height: 34,
                          child: Row(children: [
                            Icon(Icons.photo_camera_outlined,
                                size: 16,
                                color: Theme.of(btnCtx).colorScheme.onSurface),
                            const SizedBox(width: 12),
                            Text('Webcam',
                                style: TextStyle(
                                    color: Theme.of(btnCtx)
                                        .colorScheme
                                        .onSurface)),
                          ]),
                        ),
                        PopupMenuItem(
                          height: 34,
                          child: Row(children: [
                            Icon(Icons.contacts_outlined,
                                size: 16,
                                color: Theme.of(btnCtx).colorScheme.onSurface),
                            const SizedBox(width: 12),
                            Text('Contacts',
                                style: TextStyle(
                                    color: Theme.of(btnCtx)
                                        .colorScheme
                                        .onSurface)),
                          ]),
                        ),
                      ],
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    );
                  },
                );
              },
            ),
            const SizedBox(width: 4),
            IconButton(
              icon: Icon(Icons.photo_camera_outlined,
                  color: isDark ? Colors.grey[400] : Colors.grey[600],
                  size: 20),
              onPressed: () {},
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Container(
                height: 36,
                padding: const EdgeInsets.only(left: 15, right: 15, top: 7),
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xFF2A2A2A)
                      : const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: textController,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                    hintText: 'Message...',
                    hintStyle: TextStyle(
                        color: isDark ? Colors.grey[500] : Colors.grey[600],
                        fontSize: 14),
                    border: InputBorder.none,
                    isDense: true,
                  ),
                  textInputAction: TextInputAction.send,
                  onSubmitted: (_) => onSend(),
                  maxLines: 1,
                  style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                      fontSize: 14),
                ),
              ),
            ),
            const SizedBox(width: 8),
            hasText
                ? IconButton(
                    icon: const Icon(Icons.send,
                        color: Color(0xFF0088CC), size: 20),
                    onPressed: onSend,
                  )
                : CompositedTransformTarget(
                    link: emojiAnchorLink ?? LayerLink(),
                    child: IconButton(
                      icon: Icon(Icons.emoji_emotions_outlined,
                          color: isDark ? Colors.grey[400] : Colors.grey[600],
                          size: 20),
                      onPressed: onEmojiPressed,
                    ),
                  ),
            const SizedBox(width: 4),
            IconButton(
              icon: Icon(isRecording ? Icons.stop : Icons.mic_none_outlined,
                  color: isRecording
                      ? Colors.red
                      : (isDark ? Colors.grey[400] : Colors.grey[600]),
                  size: 20),
              onPressed: onMicPressed,
            ),
          ],
        ),
      ),
    );
  }
}
