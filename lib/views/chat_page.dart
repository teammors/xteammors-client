// chat_page.dart
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:io';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';
import 'package:audioplayers/audioplayers.dart';
import 'chat/chat_bubble.dart';
import 'chat/chat_input.dart';
import 'chat/video_player_dialog.dart';
import 'chat/image_viewer_dialog.dart';
import 'chat/video_player_page.dart';
import 'chat/image_viewer_page.dart';
import '../utils/web_download_stub.dart'
    if (dart.library.html) '../utils/web_download.dart' as web_dl;
import '../utils/toast_utils.dart';
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
  final AudioRecorder _recorder = AudioRecorder();
  final AudioPlayer _audioPlayer = AudioPlayer();
  int? _playingVoiceIndex;
  bool _isRecording = false;
  Timer? _recordTimer;
  Duration _recordElapsed = Duration.zero;
  String? _recordFilePath;
  List<int> _selectedMessages = [];
  bool _showSearchBar = false;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      setState(() {
        _hasText = _textController.text.isNotEmpty;
      });
    });
    _initRecorder();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        try {
          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        } catch (_) {}
      }
    });
  }

  Future<void> _togglePlayVoice(int index) async {
    final msg = widget.viewModel.messages[index];
    final url = msg.voiceUrl;
    if (url == null) return;
    if (_playingVoiceIndex == index) {
      await _audioPlayer.stop();
      setState(() => _playingVoiceIndex = null);
      return;
    }
    await _audioPlayer.stop();
    setState(() => _playingVoiceIndex = index);
    _audioPlayer.onPlayerComplete.listen((_) {
      setState(() => _playingVoiceIndex = null);
    });
    await _audioPlayer.play(DeviceFileSource(url));
  }

  void _openVideo(String? url) {
    if (url == null) return;
    final urls = widget.viewModel.messages
        .where((m) => m.type == MessageType.video && m.videoUrl != null)
        .map((m) => m.videoUrl!)
        .toList();
    final startIndex = urls.indexOf(url);
    final useDialog = kIsWeb ||
        (defaultTargetPlatform == TargetPlatform.macOS ||
            defaultTargetPlatform == TargetPlatform.windows ||
            defaultTargetPlatform == TargetPlatform.linux);
    if (useDialog) {
      showDialog(
        context: context,
        barrierDismissible: true,
        barrierColor: Colors.black.withValues(alpha: 0.7),
        builder: (_) => VideoPlayerDialog(
            urls: urls, initialIndex: startIndex >= 0 ? startIndex : 0),
      );
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => VideoPlayerPage(url: url)));
    }
  }

  void _openImageViewer(String? url) {
    if (url == null) return;
    final urls = widget.viewModel.messages
        .where((m) => m.type == MessageType.image && m.imageUrl != null)
        .map((m) => m.imageUrl!)
        .toList();
    final startIndex = urls.indexOf(url);
    final useDialog = kIsWeb ||
        (defaultTargetPlatform == TargetPlatform.macOS ||
            defaultTargetPlatform == TargetPlatform.windows ||
            defaultTargetPlatform == TargetPlatform.linux);
    if (useDialog) {
      showDialog(
        context: context,
        barrierDismissible: true,
        barrierColor: Colors.black.withValues(alpha: 0.7),
        builder: (_) => ImageViewerDialog(
            urls: urls, initialIndex: startIndex >= 0 ? startIndex : 0),
      );
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => ImageViewerPage(url: url)));
    }
  }

  Future<void> _downloadFile(String? url, String? name) async {
    if (url == null) return;
    try {
      if (kIsWeb) {
        final uri = Uri.parse(url);
        final last = uri.pathSegments.isNotEmpty ? uri.pathSegments.last : '';
        final dot = last.lastIndexOf('.');
        String ext = 'dat';
        if (dot != -1 && dot + 1 < last.length) {
          final e = last.substring(dot + 1).toLowerCase();
          if (e.isNotEmpty && e.length <= 8) ext = e;
        }
        final ts = DateTime.now().millisecondsSinceEpoch;
        final fname = (name ?? 'file') + '_$ts.$ext';
        final ok = await web_dl.triggerWebDownload(url, fname);
        if (!ok) {
          ToastUtils.showTopToast(
            context: context,
            message: 'Download failed',
            backgroundColor: Colors.red,
            textColor: Colors.white,
            icon: Icons.info_outline,
          );
        }
        return;
      }

      final uri = Uri.parse(url);
      final client = HttpClient();
      final resp = await (await client.getUrl(uri)).close();
      if (resp.statusCode != 200) {
        ToastUtils.showTopToast(
          context: context,
          message: 'Download failed',
          backgroundColor: Colors.red,
          textColor: Colors.white,
          icon: Icons.info_outline,
        );
        return;
      }
      final bytes =
          await resp.fold<List<int>>(<int>[], (acc, data) => acc..addAll(data));
      final downloadsDir = await getDownloadsDirectory();
      final baseDir = downloadsDir?.path ??
          (Platform.environment['HOME'] != null
              ? '${Platform.environment['HOME']}/Downloads'
              : (await getTemporaryDirectory()).path);
      final last = uri.pathSegments.isNotEmpty ? uri.pathSegments.last : '';
      final dot = last.lastIndexOf('.');
      String ext = 'dat';
      if (dot != -1 && dot + 1 < last.length) {
        final e = last.substring(dot + 1).toLowerCase();
        if (e.isNotEmpty && e.length <= 8) ext = e;
      }
      final ts = DateTime.now().millisecondsSinceEpoch;
      final fname = (name ?? 'file') + '_$ts.$ext';
      final file = File('$baseDir/$fname');
      await file.writeAsBytes(bytes);
      ToastUtils.showTopToast(
        context: context,
        message: 'File saved to downlads',
        backgroundColor: Colors.green,
        textColor: Colors.white,
        icon: Icons.info_outline,
      );
    } catch (_) {
      ToastUtils.showTopToast(
        context: context,
        message: 'Download failed',
        backgroundColor: Colors.red,
        textColor: Colors.white,
        icon: Icons.info_outline,
      );
    }
  }

  Future<void> _initRecorder() async {
    try {
      final hasPermission = await _recorder.hasPermission();
      if (!hasPermission) {
        // 在部分平台会自动请求权限；如果未授权，后续开始录音会失败
      }
    } catch (_) {}
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    _inputFocusNode.dispose();
    _searchController.dispose();
    _searchFocusNode.dispose();
    _recordTimer?.cancel();
    if (_isRecording) {
      try {
        _recorder.stop();
      } catch (_) {}
    }
    _recorder.dispose();
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

  Future<void> _toggleRecord() async {
    if (!_isRecording) {
      final now = DateTime.now();
      final dir = await getTemporaryDirectory();
      final filePath = '${dir.path}/audio_${now.millisecondsSinceEpoch}.m4a';
      try {
        _recordElapsed = Duration.zero;
        await _recorder.start(
          const RecordConfig(
            encoder: AudioEncoder.aacLc,
            bitRate: 128000,
            sampleRate: 44100,
          ),
          path: filePath,
        );
        setState(() {
          _isRecording = true;
          _recordFilePath = filePath;
        });
        _recordTimer?.cancel();
        _recordTimer = Timer.periodic(const Duration(seconds: 1), (_) {
          setState(() {
            _recordElapsed += const Duration(seconds: 1);
          });
        });
      } catch (_) {}
      return;
    }

    try {
      final path = await _recorder.stop();
      _recordTimer?.cancel();
      final seconds = _recordElapsed.inSeconds;
      setState(() {
        _isRecording = false;
        _recordElapsed = Duration.zero;
      });
      if (seconds >= 2) {
        final now = DateTime.now();
        final hh = now.hour.toString().padLeft(2, '0');
        final mm = now.minute.toString().padLeft(2, '0');
        final m = ChatMessage(
          type: MessageType.voice,
          isMe: true,
          voiceDurationSec: seconds,
          voiceUrl: path ?? _recordFilePath,
          time: '$hh:$mm',
          status: ReadMark.singleGrey,
        );
        setState(() {
          widget.viewModel.messages.add(m);
        });
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_scrollController.hasClients) {
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
            );
          }
          _inputFocusNode.requestFocus();
        });
      }
    } catch (_) {
      setState(() {
        _isRecording = false;
      });
      _recordTimer?.cancel();
    }
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
      //backgroundColor: isDark ? const Color(0xFF1A1A1A) : const Color(0xFFF0F0F0),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.08),
        foregroundColor: isDark ? Colors.white : Colors.black,
        titleSpacing: 0,
        title: Row(
          children: [
            const SizedBox(width: 10),
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
            icon: Icon(Icons.search_outlined,
                color: isDark ? Colors.grey[400] : Colors.grey[700]),
            onPressed: () {
              setState(() {
                _showSearchBar = true;
              });
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _searchFocusNode.requestFocus();
              });
            },
          ),
          Builder(
            builder: (btnCtx) {
              return IconButton(
                icon: Icon(Icons.more_vert,
                    color: isDark ? Colors.grey[400] : Colors.grey[700]),
                onPressed: () {
                  final overlay = Overlay.of(btnCtx).context.findRenderObject()
                      as RenderBox;
                  final box = btnCtx.findRenderObject() as RenderBox;
                  final offset = box.localToGlobal(Offset.zero);
                  final rect = Rect.fromLTWH(
                      offset.dx, offset.dy, box.size.width, box.size.height);
                  final items = <PopupMenuEntry<int>>[];
                  if (widget.viewModel.chatType == ChatType.private) {
                    items.addAll([
                      PopupMenuItem(
                        height: 34,
                        child: Row(children: [
                          Icon(Icons.delete_sweep_outlined,
                              size: 16,
                              color: Theme.of(btnCtx).colorScheme.onSurface),
                          const SizedBox(width: 12),
                          Text('Clear all messages',
                              style: TextStyle(
                                  color:
                                      Theme.of(btnCtx).colorScheme.onSurface)),
                        ]),
                      ),
                      PopupMenuItem(
                        height: 34,
                        child: Row(children: [
                          Icon(Icons.delete_outline,
                              size: 16,
                              color: Theme.of(btnCtx).colorScheme.onSurface),
                          const SizedBox(width: 12),
                          Text('Delete conversations',
                              style: TextStyle(
                                  color:
                                      Theme.of(btnCtx).colorScheme.onSurface)),
                        ]),
                      ),
                      PopupMenuItem(
                        height: 34,
                        child: Row(children: [
                          Icon(Icons.schedule_outlined,
                              size: 16,
                              color: Theme.of(btnCtx).colorScheme.onSurface),
                          const SizedBox(width: 12),
                          Text('Set clear time',
                              style: TextStyle(
                                  color:
                                      Theme.of(btnCtx).colorScheme.onSurface)),
                        ]),
                      ),
                      PopupMenuItem(
                        height: 34,
                        child: Row(children: [
                          Icon(Icons.notifications_off_outlined,
                              size: 16,
                              color: Theme.of(btnCtx).colorScheme.onSurface),
                          const SizedBox(width: 12),
                          Text('Block notifications',
                              style: TextStyle(
                                  color:
                                      Theme.of(btnCtx).colorScheme.onSurface)),
                        ]),
                      ),
                      PopupMenuItem(
                        height: 34,
                        child: Row(children: [
                          Icon(Icons.block,
                              size: 16,
                              color: Theme.of(btnCtx).colorScheme.onSurface),
                          const SizedBox(width: 12),
                          Text('Block the user',
                              style: TextStyle(
                                  color:
                                      Theme.of(btnCtx).colorScheme.onSurface)),
                        ]),
                      ),
                    ]);
                  } else {
                    items.addAll([
                      PopupMenuItem(
                        height: 34,
                        child: Row(children: [
                          Icon(Icons.delete_sweep_outlined,
                              size: 16,
                              color: Theme.of(btnCtx).colorScheme.onSurface),
                          const SizedBox(width: 12),
                          Text('Clear all messages',
                              style: TextStyle(
                                  color:
                                      Theme.of(btnCtx).colorScheme.onSurface)),
                        ]),
                      ),
                      PopupMenuItem(
                        height: 34,
                        child: Row(children: [
                          Icon(Icons.exit_to_app,
                              size: 16,
                              color: Theme.of(btnCtx).colorScheme.onSurface),
                          const SizedBox(width: 12),
                          Text('Leave the group',
                              style: TextStyle(
                                  color:
                                      Theme.of(btnCtx).colorScheme.onSurface)),
                        ]),
                      ),
                      PopupMenuItem(
                        height: 34,
                        child: Row(children: [
                          Icon(Icons.schedule_outlined,
                              size: 16,
                              color: Theme.of(btnCtx).colorScheme.onSurface),
                          const SizedBox(width: 12),
                          Text('Set a clear time',
                              style: TextStyle(
                                  color:
                                      Theme.of(btnCtx).colorScheme.onSurface)),
                        ]),
                      ),
                      PopupMenuItem(
                        height: 34,
                        child: Row(children: [
                          Icon(Icons.notifications_off_outlined,
                              size: 16,
                              color: Theme.of(btnCtx).colorScheme.onSurface),
                          const SizedBox(width: 12),
                          Text('Block notifications',
                              style: TextStyle(
                                  color:
                                      Theme.of(btnCtx).colorScheme.onSurface)),
                        ]),
                      ),
                    ]);
                  }
                  showMenu(
                    context: btnCtx,
                    position:
                        RelativeRect.fromRect(rect, Offset.zero & overlay.size),
                    items: items,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          if (_showSearchBar)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color:
                    isDark ? const Color(0xFF2A2A2A) : const Color(0xFFF5F5F5),
                border: Border(
                  bottom: BorderSide(
                    color:
                        Theme.of(context).dividerColor.withValues(alpha: 0.2),
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      focusNode: _searchFocusNode,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                          color: isDark ? Colors.grey[500] : Colors.grey[600],
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                      ),
                      textInputAction: TextInputAction.search,
                      maxLines: 1,
                      style: TextStyle(
                        color: isDark ? Colors.white : Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close,
                        color: isDark ? Colors.grey[400] : Colors.grey[700],
                        size: 20),
                    onPressed: () {
                      setState(() {
                        _showSearchBar = false;
                      });
                      _searchController.clear();
                    },
                  ),
                ],
              ),
            ),
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
                      return ChatBubble(
                        message: m,
                        isDark: isDark,
                        chatType: widget.viewModel.chatType,
                        isSelected: isSelected,
                        onTap: () => _toggleMessageSelection(index),
                        onShowMenu: (context, tapPosition) {
                          _showMessageMenu(context, index, tapPosition);
                        },
                        isVoicePlaying: _playingVoiceIndex == index,
                        onVoiceTap: () => _togglePlayVoice(index),
                        onVideoTap: () => _openVideo(m.videoUrl),
                        onImageTap: () => _openImageViewer(m.imageUrl),
                        onFileTap: () => _downloadFile(m.fileUrl, m.fileName),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          if (_isRecording)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.red.withValues(alpha: 0.08),
                border: Border(
                  top: BorderSide(
                      color: Theme.of(context)
                          .dividerColor
                          .withValues(alpha: 0.2)),
                  bottom: BorderSide(
                      color: Theme.of(context)
                          .dividerColor
                          .withValues(alpha: 0.2)),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.fiber_manual_record,
                          color: Colors.red, size: 14),
                      const SizedBox(width: 8),
                      Text(
                        '${_recordElapsed.inMinutes.toString().padLeft(2, '0')}:${(_recordElapsed.inSeconds % 60).toString().padLeft(2, '0')}',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize: 13),
                      ),
                      const SizedBox(width: 8),
                      Text('Recording...',
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                              fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
          ChatInput(
            isDark: isDark,
            textController: _textController,
            hasText: _hasText,
            onSend: _sendMessage,
            focusNode: _inputFocusNode,
            isRecording: _isRecording,
            onMicPressed: _toggleRecord,
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
