// chat_page.dart
import 'package:flutter/material.dart';
import '../viewmodels/chat_viewmodel.dart';
import '../viewmodels/messages_viewmodel.dart';

class ChatPage extends StatefulWidget {
  final ChatViewModel viewModel;
  const ChatPage({super.key, required this.viewModel});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textController = TextEditingController();
  bool _hasText = false;
  final ScrollController _scrollController = ScrollController();
  final FocusNode _inputFocusNode = FocusNode();
  List<int> _selectedMessages = [];

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      setState(() {
        _hasText = _textController.text.isNotEmpty;
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        try {
          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        } catch (_) {}
      }
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    _inputFocusNode.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final t = _textController.text.trim();
    if (t.isEmpty) return;
    final now = DateTime.now();
    final hh = now.hour.toString().padLeft(2, '0');
    final mm = now.minute.toString().padLeft(2, '0');
    final m = ChatMessage(
      type: MessageType.text,
      text: t,
      isMe: true,
      time: '$hh:$mm',
      status: ReadMark.singleGrey,
    );
    setState(() {
      widget.viewModel.messages.add(m);
      _textController.clear();
      _hasText = false;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController
            .animateTo(
              _scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
            )
            .then((_) => _inputFocusNode.requestFocus());
      } else {
        _inputFocusNode.requestFocus();
      }
    });
  }

  void _toggleMessageSelection(int index) {
    setState(() {
      if (_selectedMessages.contains(index)) {
        _selectedMessages.remove(index);
      } else {
        _selectedMessages.add(index);
      }
    });
  }

  void _clearSelection() {
    setState(() {
      _selectedMessages.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? const Color(0xFF1A1A1A) : const Color(0xFFF0F0F0),
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            isDark ? const Color(0xFF1A1A1A) : const Color(0xFFF0F0F0),
        foregroundColor: isDark ? Colors.white : Colors.black,
        titleSpacing: 0,
        title: Row(
          children: [
            const SizedBox(width: 8),
            // 根据聊天类型显示不同的图标
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDark ? Colors.grey[700] : Colors.grey[300],
              ),
              child: Icon(
                widget.viewModel.chatType == ChatType.group
                    ? Icons.group
                    : Icons.person,
                size: 20,
                color: isDark ? Colors.grey[400] : Colors.grey[600],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.viewModel.partnerName,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    widget.viewModel.lastSeen,
                    style: TextStyle(
                      fontSize: 13,
                      color: isDark ? Colors.grey[400] : Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.videocam_outlined,
                color: isDark ? Colors.grey[400] : Colors.grey[700]),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.call_outlined,
                color: isDark ? Colors.grey[400] : Colors.grey[700]),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert,
                color: isDark ? Colors.grey[400] : Colors.grey[700]),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: _clearSelection,
              child: Container(
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF0F0F0F) : Colors.white,
                  // image: DecorationImage(
                  //   image: NetworkImage(
                  //       isDark
                  //           ? 'https://www.iiimaster.com/files/162790459bbd97655f6f1a8b33ff7bee.jpg'
                  //           : 'https://www.iiimaster.com/files/d473271e1c6809d620a31fc640a55b0c.jpg'
                  //   ),
                  //   fit: BoxFit.cover,
                  // ),
                ),
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(scrollbars: false),
                  child: ListView.builder(
                    controller: _scrollController,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    itemCount: widget.viewModel.messages.length,
                    itemBuilder: (context, index) {
                      final m = widget.viewModel.messages[index];
                      final isSelected = _selectedMessages.contains(index);
                      return _ChatBubble(
                        message: m,
                        isDark: isDark,
                        chatType: widget.viewModel.chatType,
                        isSelected: isSelected,
                        onTap: () => _toggleMessageSelection(index),
                        onShowMenu: (context, tapPosition) {
                          _showMessageMenu(context, index, tapPosition);
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          _ChatInput(
            isDark: isDark,
            textController: _textController,
            hasText: _hasText,
            onSend: _sendMessage,
            focusNode: _inputFocusNode,
          ),
        ],
      ),
    );
  }

  void _showMessageMenu(BuildContext context, int index,
      [Offset? tapPosition]) {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final Size s = overlay.size;
    final Offset pos = tapPosition ?? Offset(s.width / 2, s.height / 2);
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(pos, pos),
      Offset.zero & s,
    );

    setState(() {
      if (!_selectedMessages.contains(index)) {
        _selectedMessages.add(index);
      }
    });

    showMenu(
      context: context,
      position: position,
      items: [
        PopupMenuItem(
          height: 34,
          child: Row(
            children: [
              Icon(Icons.reply_all_outlined,
                  size: 16, color: Theme.of(context).colorScheme.onSurface),
              const SizedBox(width: 12),
              Text('Reply',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface)),
            ],
          ),
          onTap: () {
            // 回复消息逻辑
          },
        ),
        PopupMenuItem(
          height: 34,
          child: Row(
            children: [
              Icon(Icons.edit_calendar_outlined,
                  size: 16, color: Theme.of(context).colorScheme.onSurface),
              const SizedBox(width: 12),
              Text('Edit',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface)),
            ],
          ),
          onTap: () {
            // 编辑消息逻辑
          },
        ),
        PopupMenuItem(
          height: 34,
          child: Row(
            children: [
              Icon(Icons.translate_sharp,
                  size: 16, color: Theme.of(context).colorScheme.onSurface),
              const SizedBox(width: 12),
              Text('Translate',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface)),
            ],
          ),
          onTap: () {
            // 翻译消息逻辑
          },
        ),
        PopupMenuItem(
          height: 34,
          child: Row(
            children: [
              Icon(Icons.content_copy,
                  size: 16, color: Theme.of(context).colorScheme.onSurface),
              const SizedBox(width: 12),
              Text('Copy',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface)),
            ],
          ),
          onTap: () {
            // 复制消息逻辑
            final message = widget.viewModel.messages[index];
            if (message.text != null) {
              // 复制文本到剪贴板
            }
          },
        ),
        PopupMenuItem(
          height: 34,
          child: Row(
            children: [
              Icon(Icons.forward_to_inbox_sharp,
                  size: 16, color: Theme.of(context).colorScheme.onSurface),
              const SizedBox(width: 12),
              Text('Forward',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface)),
            ],
          ),
          onTap: () {
            // 转发消息逻辑
          },
        ),
        PopupMenuItem(
          height: 34,
          child: Row(
            children: [
              Icon(Icons.filter,
                  size: 16, color: Theme.of(context).colorScheme.onSurface),
              const SizedBox(width: 12),
              Text('Select',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface)),
            ],
          ),
          onTap: () {
            // 多选消息逻辑
          },
        ),
        PopupMenuItem(
          height: 34,
          child: Row(
            children: [
              Icon(Icons.star_border,
                  size: 18, color: Theme.of(context).colorScheme.onSurface),
              const SizedBox(width: 12),
              Text('Add to Saved',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface)),
            ],
          ),
          onTap: () {
            // 收藏消息逻辑
          },
        ),
        PopupMenuItem(
          height: 34,
          child: Row(
            children: [
              Icon(Icons.delete, size: 18, color: Colors.red),
              const SizedBox(width: 12),
              Text('Delete', style: TextStyle(color: Colors.red)),
            ],
          ),
          onTap: () {
            // 删除消息逻辑
          },
        ),
      ],
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ).then((value) {
      // 菜单关闭后的处理
      _clearSelection();
    });
  }
}

class _ChatBubble extends StatelessWidget {
  final ChatMessage message;
  final bool isDark;
  final ChatType chatType;
  final bool isSelected;
  final VoidCallback onTap;
  final Function(BuildContext, Offset?) onShowMenu;

  const _ChatBubble({
    required this.message,
    required this.isDark,
    required this.chatType,
    required this.isSelected,
    required this.onTap,
    required this.onShowMenu,
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
          (isMedia || isEmoji) ? Colors.transparent : const Color(0xFF0088CC);
      textColor = (isMedia || isEmoji) ? Colors.white : Colors.white;
    } else {
      bubbleColor = (isMedia || isEmoji)
          ? Colors.transparent
          : (isDark ? const Color(0xFF2B2B2B) : const Color(0xFFE8E8E8));
      textColor = isDark ? Colors.white : Colors.black;
    }

    // 判断是否需要显示头像
    final showAvatar = !isMe && chatType == ChatType.group;

    return GestureDetector(
      onLongPress: () => onShowMenu(context, null),
      onDoubleTap: () => _handleDoubleTap(context),
      onSecondaryTapDown: (details) =>
          onShowMenu(context, details.globalPosition),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 2),
        padding: const EdgeInsets.symmetric(horizontal: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
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
            // 左侧头像（群聊且不是自己的消息）
            if (showAvatar)
              _Avatar(isDark: isDark, senderName: message.senderName),

            Flexible(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.75,
                ),
                child: Column(
                  crossAxisAlignment:
                      isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: [
                    // 群聊昵称（在气泡上方）
                    if (showAvatar && message.senderName != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 8, bottom: 2),
                        child: Text(
                          message.senderName!,
                          style: TextStyle(
                            fontSize: 12,
                            color: isDark ? Colors.grey[400] : Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                    // 消息气泡
                    Container(
                      padding: isMedia
                          ? EdgeInsets.zero
                          : (isEmoji
                              ? const EdgeInsets.all(5)
                              : const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8)),
                      decoration: BoxDecoration(
                        color: bubbleColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (message.replyType != null)
                            _ReplyHeader(
                              type: message.replyType!,
                              preview: message.replyPreview,
                              thumbUrl: message.replyThumbUrl,
                              isDark: isDark,
                              isMe: isMe,
                            ),
                          _bubbleContent(message, textColor, context),
                        ],
                      ),
                    ),

                    // 时间戳和状态
                    const SizedBox(height: 4),
                    Padding(
                      padding: EdgeInsets.only(
                        left: isMe ? 0 : (showAvatar ? 8 : 0),
                        right: isMe ? 0 : 8,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: isMe
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          if (message.time != null)
                            Text(
                              message.time!,
                              style: TextStyle(
                                  fontSize: 11,
                                  color: isDark
                                      ? Colors.grey[500]
                                      : Colors.grey[600]),
                            ),
                          if (message.isEdited) ...[
                            const SizedBox(width: 6),
                            Text('edited',
                                style: TextStyle(
                                    fontSize: 11,
                                    color: isDark
                                        ? Colors.grey[500]
                                        : Colors.grey[600])),
                          ],
                          if (isMe && message.status != null) ...[
                            const SizedBox(width: 4),
                            _StatusIcon(status: message.status!),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 右侧占位（为了对齐）
            if (!isMe && !showAvatar) const SizedBox(width: 40),
          ],
        ),
      ),
    );
  }
}

Widget _bubbleContent(ChatMessage m, Color textColor, BuildContext context) {
  switch (m.type) {
    case MessageType.text:
      return Text(m.text ?? '',
          style: TextStyle(fontSize: 16, height: 1.4, color: textColor));
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
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            width: rw,
            height: rh,
            child: m.imageUrl != null
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
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.grey[400]!),
                                ))),
                      );
                    },
                    errorBuilder: (c, e, s) => ColoredBox(
                      color: Colors.grey[800]!,
                      child: const Icon(Icons.broken_image, color: Colors.grey),
                    ),
                  )
                : const ColoredBox(color: Colors.grey),
          ),
        );
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
        return Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
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
                                      valueColor: AlwaysStoppedAnimation<Color>(
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
              decoration: BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.play_arrow, size: 32, color: Colors.white),
            ),
          ],
        );
      }
    case MessageType.voice:
      final d = m.voiceDurationSec ?? 0;
      final mm = (d ~/ 60).toString().padLeft(2, '0');
      final ss = (d % 60).toString().padLeft(2, '0');
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.play_circle_fill, size: 24, color: textColor),
            const SizedBox(width: 8),
            Text('$mm:$ss', style: TextStyle(color: textColor, fontSize: 14)),
            const SizedBox(width: 16),
            Container(
              width: 80,
              height: 2,
              color: textColor.withOpacity(0.5),
            ),
          ],
        ),
      );
    case MessageType.file:
      return Container(
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
      );
  }
}

class _ReplyHeader extends StatelessWidget {
  final MessageType type;
  final String? preview;
  final String? thumbUrl;
  final bool isDark;
  final bool isMe;
  const _ReplyHeader(
      {required this.type,
      this.preview,
      this.thumbUrl,
      required this.isDark,
      required this.isMe});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final bg = isDark ? Colors.white12 : Colors.black12;
    final Color textColor = isMe ? Colors.white : cs.onSurfaceVariant;

    Widget? media;
    String label;
    switch (type) {
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
                            child: SizedBox(
                                width: 16,
                                height: 16,
                                child:
                                    CircularProgressIndicator(strokeWidth: 2))),
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
                                child: SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(
                                        strokeWidth: 2))),
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
        border: Border(
          left: BorderSide(
            color: const Color(0xFF0088CC),
            width: 3,
          ),
        ),
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
                Text(label,
                    style: TextStyle(
                        color: textColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600)),
                if (type != MessageType.image &&
                    type != MessageType.video &&
                    (preview?.isNotEmpty ?? false))
                  Text(
                    preview!,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: TextStyle(color: textColor, fontSize: 12),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final bool isDark;
  final String? senderName;

  const _Avatar({required this.isDark, this.senderName});

  @override
  Widget build(BuildContext context) {
    // 根据昵称生成头像颜色
    Color getAvatarColor(String name) {
      final colors = [
        const Color(0xFF598BF6),
        const Color(0xFF34C759),
        const Color(0xFFFF9500),
        const Color(0xFFFF3B30),
        const Color(0xFFAF52DE),
      ];
      final index = name.codeUnits.fold(0, (a, b) => a + b) % colors.length;
      return colors[index];
    }

    // 获取昵称首字符
    String getInitials(String name) {
      if (name.isEmpty) return '?';
      if (name.length == 1) return name;
      return name.substring(0, 1);
    }

    return Container(
      width: 32,
      height: 32,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: senderName != null
            ? getAvatarColor(senderName!)
            : (isDark ? Colors.grey[700] : Colors.grey[300]),
      ),
      child: Center(
        child: Text(
          senderName != null ? getInitials(senderName!) : '?',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _ChatInput extends StatelessWidget {
  final bool isDark;
  final TextEditingController textController;
  final bool hasText;
  final VoidCallback onSend;
  final FocusNode? focusNode;

  const _ChatInput({
    required this.isDark,
    required this.textController,
    required this.hasText,
    required this.onSend,
    this.focusNode,
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
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                  ),
                  textInputAction: TextInputAction.send,
                  onSubmitted: (_) => onSend(),
                  maxLines: 1,
                  style: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            // 表情图标或发送图标
            IconButton(
              icon: Icon(
                hasText ? Icons.send : Icons.emoji_emotions_outlined,
                color: hasText
                    ? const Color(0xFF0088CC)
                    : (isDark ? Colors.grey[400] : Colors.grey[600]),
                size: 20,
              ),
              onPressed: hasText
                  ? onSend
                  : () {
                      // 表情包功能
                    },
            ),
            const SizedBox(width: 4),
            IconButton(
              icon: Icon(Icons.mic_none_outlined,
                  color: isDark ? Colors.grey[400] : Colors.grey[600],
                  size: 20),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusIcon extends StatelessWidget {
  final ReadMark status;
  const _StatusIcon({required this.status});

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case ReadMark.singleGrey:
        return Icon(Icons.done, color: Colors.grey, size: 16);
      case ReadMark.doubleGreen:
        return Icon(Icons.done_all, color: const Color(0xFF98E774), size: 16);
    }
  }
}
