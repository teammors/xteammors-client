import 'package:flutter/material.dart';
import 'dart:io';
import '../../viewmodels/chat_viewmodel.dart';
import '../../viewmodels/messages_viewmodel.dart';
import 'avatar.dart';
import 'reply_header.dart';
import 'status_icon.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage message;
  final bool isDark;
  final ChatType chatType;
  final bool isSelected;
  final VoidCallback onTap;
  final Function(BuildContext, Offset?) onShowMenu;
  final bool isVoicePlaying;
  final VoidCallback? onVoiceTap;
  final VoidCallback? onVideoTap;
  final VoidCallback? onImageTap;
  final VoidCallback? onFileTap;

  const ChatBubble({
    required this.message,
    required this.isDark,
    required this.chatType,
    required this.isSelected,
    required this.onTap,
    required this.onShowMenu,
    this.isVoicePlaying = false,
    this.onVoiceTap,
    this.onVideoTap,
    this.onImageTap,
    this.onFileTap,
  });

  void _handleDoubleTap(BuildContext context) {
    onShowMenu(context, null);
  }

  @override
  Widget build(BuildContext context) {
    final isMe = message.isMe;
    final isMedia =
        message.type == MessageType.image || message.type == MessageType.video;
    final isEmoji = message.type == MessageType.emoji;

    Color bubbleColor;
    Color textColor;

    if (isMe) {
      bubbleColor =
          (isMedia || isEmoji) ? Colors.transparent : const Color(0xFF3E90C7);
      textColor = (isMedia || isEmoji) ? Colors.white : Colors.white;
    } else {
      bubbleColor = (isMedia || isEmoji)
          ? Colors.transparent
          : (isDark ? const Color(0xFF2B2B2B) : const Color(0xFFE8E8E8));
      textColor = isDark ? Colors.white : Colors.black;
    }

    final showAvatar = !isMe && chatType == ChatType.group;

    return GestureDetector(
      onLongPressStart: (details) =>
          onShowMenu(context, details.globalPosition),
      onDoubleTap: () => _handleDoubleTap(context),
      onSecondaryTapDown: (details) =>
          onShowMenu(context, details.globalPosition),
      child: Container(
        margin: EdgeInsets.only(
          top: 4,
          bottom: 4,
          left: isMe ? 0 : 8,
          right: isMe ? 8 : 0,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected
              ? (isDark
                  ? Colors.white.withValues(alpha: 0.08)
                  : Colors.black.withValues(alpha: 0.08))
              : Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showAvatar)
              Avatar(isDark: isDark, senderName: message.senderName),
            Flexible(
              child: Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.75),
                child: Column(
                  crossAxisAlignment:
                      isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: [
                    if (showAvatar && message.senderName != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 0, bottom: 2),
                        child: Text(
                          message.senderName!,
                          style: TextStyle(
                              fontSize: 12,
                              color:
                                  isDark ? Colors.grey[400] : Colors.grey[600],
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    Container(
                      padding: isMedia
                          ? EdgeInsets.zero
                          : (isEmoji
                              ? const EdgeInsets.all(5)
                              : const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5)),
                      decoration: BoxDecoration(
                          color: bubbleColor,
                          borderRadius: isMe
                              ? BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.zero, // 右下角保持直角
                                )
                              : BorderRadius.only(
                                  topLeft: Radius.zero,
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (message.replyType != null)
                            ReplyHeader(
                                type: message.replyType!,
                                preview: message.replyPreview,
                                thumbUrl: message.replyThumbUrl,
                                isDark: isDark,
                                isMe: isMe),
                          _bubbleContent(isMe, message, textColor, context,
                              isVoicePlaying: isVoicePlaying,
                              onVoiceTap: onVoiceTap,
                              onVideoTap: onVideoTap,
                              onImageTap: onImageTap,
                              onFileTap: onFileTap),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: EdgeInsets.only(
                          left: isMe ? 0 : (showAvatar ? 8 : 0),
                          right: isMe ? 0 : 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: isMe
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          if (message.time != null)
                            Text(message.time!,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: isDark
                                        ? Colors.grey[500]
                                        : Colors.grey[600])),
                          if (message.isEdited) ...[
                            const SizedBox(width: 6),
                            Text('edited',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: isDark
                                        ? Colors.grey[500]
                                        : Colors.grey[600])),
                          ],
                          if (isMe && message.status != null) ...[
                            const SizedBox(width: 4),
                            StatusIcon(status: message.status!),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (!isMe && !showAvatar) const SizedBox(width: 40),
          ],
        ),
      ),
    );
  }

  Widget _bubbleContent(
      bool isMe, ChatMessage m, Color textColor, BuildContext context,
      {bool isVoicePlaying = false,
      VoidCallback? onVoiceTap,
      VoidCallback? onVideoTap,
      VoidCallback? onImageTap,
      VoidCallback? onFileTap}) {
    switch (m.type) {
      case MessageType.text:
        return Text(m.text ?? '',
            style: TextStyle(fontSize: 14, height: 1.4, color: textColor));
      case MessageType.emoji:
        return Text(m.emoji ?? '', style: const TextStyle(fontSize: 60));
      case MessageType.image:
        {
          final w = (m.imageWidth ?? 300).toDouble();
          final h = (m.imageHeight ?? 200).toDouble();
          double maxSide = 300;
          double rw = w, rh = h;
          if (w >= h) {
            if (w > maxSide) {
              rw = maxSide;
              rh = h * (rw / w);
            }
          } else {
            if (h > maxSide) {
              rh = maxSide;
              rw = w * (rh / h);
            }
          }
          final img = ClipRRect(
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.zero, // 右下角保持直角
                  )
                : BorderRadius.only(
                    topLeft: Radius.zero,
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
            child: SizedBox(
              width: rw,
              height: rh,
              child: m.imageUrl != null
                  ? (_isNetworkUrl(m.imageUrl!)
                      ? Image.network(
                          m.imageUrl!,
                          fit: BoxFit.cover,
                          loadingBuilder: (c, child, progress) {
                            if (progress == null) return child;
                            return Container(
                              color: Colors.grey[800],
                              child: Center(
                                  child: SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.grey[400]!),
                                      ))),
                            );
                          },
                          errorBuilder: (c, e, s) => ColoredBox(
                            color: Colors.grey[800]!,
                            child: const Icon(Icons.broken_image,
                                color: Colors.grey),
                          ),
                        )
                      : Image.file(
                          File(m.imageUrl!),
                          fit: BoxFit.cover,
                          errorBuilder: (c, e, s) => ColoredBox(
                            color: Colors.grey[800]!,
                            child: const Icon(Icons.broken_image,
                                color: Colors.grey),
                          ),
                        ))
                  : const ColoredBox(color: Colors.grey),
            ),
          );
          return GestureDetector(onTap: onImageTap, child: img);
        }
      case MessageType.video:
        {
          final w = (m.videoWidth ?? 300).toDouble();
          final h = (m.videoHeight ?? 200).toDouble();
          double maxSide = 300;
          double rw = w, rh = h;
          if (w >= h) {
            if (w > maxSide) {
              rw = maxSide;
              rh = h * (rw / w);
            }
          } else {
            if (h > maxSide) {
              rh = maxSide;
              rw = w * (rh / h);
            }
          }
          final thumb = Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: isMe
                    ? BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.zero, // 右下角保持直角
                      )
                    : BorderRadius.only(
                        topLeft: Radius.zero,
                        topRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8)),
                child: SizedBox(
                  width: rw,
                  height: rh,
                  child: m.videoThumbUrl != null
                      ? Image.network(
                          m.videoThumbUrl!,
                          fit: BoxFit.cover,
                          loadingBuilder: (c, child, progress) {
                            if (progress == null) return child;
                            return Container(
                              color: Colors.grey[800],
                              child: Center(
                                  child: SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.grey[400]!),
                                      ))),
                            );
                          },
                          errorBuilder: (c, e, s) => ColoredBox(
                            color: Colors.grey[800]!,
                            child: const Icon(Icons.broken_image,
                                color: Colors.grey),
                          ),
                        )
                      : const ColoredBox(color: Colors.black12),
                ),
              ),
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                    color: Colors.black54, shape: BoxShape.circle),
                child:
                    const Icon(Icons.play_arrow, size: 32, color: Colors.white),
              ),
            ],
          );
          return GestureDetector(onTap: onVideoTap, child: thumb);
        }
      case MessageType.voice:
        final d = m.voiceDurationSec ?? 0;
        final mm = (d ~/ 60).toString().padLeft(2, '0');
        final ss = (d % 60).toString().padLeft(2, '0');
        return InkWell(
          onTap: onVoiceTap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(isVoicePlaying ? Icons.stop : Icons.play_arrow,
                  size: 24, color: textColor),
              const SizedBox(width: 8),
              Text('$mm:$ss', style: TextStyle(color: textColor, fontSize: 14)),
            ],
          ),
        );
      case MessageType.file:
        return InkWell(
          onTap: onFileTap,
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.insert_drive_file, size: 24, color: textColor),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(m.fileName ?? 'File',
                        style: TextStyle(color: textColor, fontSize: 14)),
                    if (m.fileSize != null)
                      Text(m.fileSize!,
                          style: TextStyle(
                              color: textColor.withOpacity(0.7), fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
        );
    }
  }

  bool _isNetworkUrl(String u) {
    return u.startsWith('http://') || u.startsWith('https://');
  }
}
