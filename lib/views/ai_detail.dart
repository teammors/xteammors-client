import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;
import '../viewmodels/ai_detail_viewmodel.dart';
import '../views/chat_page.dart';
import '../viewmodels/chat_viewmodel.dart';
import '../utils/toast_utils.dart';
import 'chat/image_viewer_dialog.dart';
import 'chat/video_player_dialog.dart';

class AiDetailPage extends StatefulWidget {
  final AiDetailViewModel vm;
  final void Function(ChatViewModel)? onOpenChatWithRobot;
  final void Function(ChatViewModel)? onOpenChatWithOwner;
  const AiDetailPage(
      {super.key,
      required this.vm,
      this.onOpenChatWithRobot,
      this.onOpenChatWithOwner});

  @override
  State<AiDetailPage> createState() => _AiDetailPageState();
}

class _AiDetailPageState extends State<AiDetailPage> {
  bool _followed = false;

  bool get _isDesktop {
    if (kIsWeb) return true;
    return Platform.isMacOS || Platform.isWindows || Platform.isLinux;
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(title: Text(widget.vm.name)),
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  widget.vm.bannerUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (c, e, s) =>
                      const ColoredBox(color: Colors.black12),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: SizedBox(
                    width: 80,
                    height: 80,
                    child: Image.network(
                      widget.vm.avatarUrl ?? widget.vm.bannerUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (c, e, s) =>
                          const ColoredBox(color: Colors.black12),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText(widget.vm.name,
                          maxLines: 1,
                          style: TextStyle(
                              color: cs.onSurface,
                              fontSize: 20,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          _CategoryChip(label: widget.vm.category),
                          const SizedBox(width: 8),
                          Wrap(
                            spacing: 6,
                            runSpacing: 4,
                            children: widget.vm.tags
                                .map((t) => _SoftChip(label: t))
                                .toList(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          if (widget.vm.owner.avatarUrl != null)
                            InkWell(
                              onTap: () {
                                final vm = ChatViewModel.privateFromName(
                                    widget.vm.owner.name);
                                if (widget.onOpenChatWithOwner != null) {
                                  widget.onOpenChatWithOwner!(vm);
                                } else {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => ChatPage(viewModel: vm),
                                    ),
                                  );
                                }
                              },
                              child: ClipOval(
                                child: Image.network(
                                  widget.vm.owner.avatarUrl!,
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.cover,
                                  errorBuilder: (c, e, s) =>
                                      const CircleAvatar(radius: 10),
                                ),
                              ),
                            )
                          else
                            InkWell(
                              onTap: () {
                                final vm = ChatViewModel.privateFromName(
                                    widget.vm.owner.name);
                                if (widget.onOpenChatWithOwner != null) {
                                  widget.onOpenChatWithOwner!(vm);
                                } else {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => ChatPage(viewModel: vm),
                                    ),
                                  );
                                }
                              },
                              child: const CircleAvatar(radius: 10),
                            ),
                          const SizedBox(width: 6),
                          Text(
                            widget.vm.owner.name,
                            style: TextStyle(
                                color: cs.onSurfaceVariant, fontSize: 12),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            widget.vm.publishedAt,
                            style: TextStyle(
                                color: cs.onSurfaceVariant, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() => _followed = !_followed);
                          },
                          child: Text(_followed ? '已关注' : '关注'),
                        ),
                        const SizedBox(width: 8),
                        OutlinedButton(
                          onPressed: () {
                            final vm =
                                ChatViewModel.privateFromName(widget.vm.name);
                            if (widget.onOpenChatWithRobot != null) {
                              widget.onOpenChatWithRobot!(vm);
                            } else {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => ChatPage(viewModel: vm),
                                ),
                              );
                            }
                          },
                          child: const Text('Chat'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.bar_chart,
                            size: 18, color: cs.onSurfaceVariant),
                        const SizedBox(width: 6),
                        Text('使用量',
                            style: TextStyle(
                                color: cs.onSurfaceVariant, fontSize: 13)),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text('${widget.vm.usageCount}',
                        style: TextStyle(
                            color: cs.onSurface,
                            fontSize: 22,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
                const SizedBox(width: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.visibility,
                            size: 18, color: cs.onSurfaceVariant),
                        const SizedBox(width: 6),
                        Text('浏览量',
                            style: TextStyle(
                                color: cs.onSurfaceVariant, fontSize: 13)),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text('${widget.vm.views}',
                        style: TextStyle(
                            color: cs.onSurface,
                            fontSize: 22,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
                const SizedBox(width: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.favorite_outline,
                            size: 18, color: cs.onSurfaceVariant),
                        const SizedBox(width: 6),
                        Text('关注量',
                            style: TextStyle(
                                color: cs.onSurfaceVariant, fontSize: 13)),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text('${widget.vm.follows}',
                        style: TextStyle(
                            color: cs.onSurface,
                            fontSize: 22,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SelectableText(widget.vm.intro,
                style: TextStyle(
                    color: cs.onSurfaceVariant, fontSize: 14, height: 1.5)),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('适用场景',
                    style: TextStyle(
                        color: cs.onSurface,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                SelectableText(widget.vm.scenarios,
                    style: TextStyle(
                        color: cs.onSurfaceVariant, fontSize: 14, height: 1.6)),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 250,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: widget.vm.media.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (c, i) {
                final m = widget.vm.media[i];
                final w =
                    _isDesktop ? 300.0 : MediaQuery.of(context).size.width;
                final isImage = m.type == 'image';
                return InkWell(
                  onTap: () {
                    if (isImage) {
                      final urls = widget.vm.media
                          .where((mm) => mm.type == 'image')
                          .map((mm) => mm.url)
                          .toList();
                      final startIndex = urls.indexOf(m.url);
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierColor: Colors.black.withValues(alpha: 0.7),
                        builder: (_) => ImageViewerDialog(
                          urls: urls,
                          initialIndex: startIndex >= 0 ? startIndex : 0,
                        ),
                      );
                    } else {
                      final urls = widget.vm.media
                          .where((mm) => mm.type == 'video')
                          .map((mm) => mm.url)
                          .toList();
                      final startIndex = urls.indexOf(m.url);
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierColor: Colors.black.withValues(alpha: 0.7),
                        builder: (_) => VideoPlayerDialog(
                          urls: urls,
                          initialIndex: startIndex >= 0 ? startIndex : 0,
                        ),
                      );
                    }
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      width: w,
                      height: 250,
                      child: Image.network(
                        isImage ? m.url : (m.thumbUrl ?? m.url),
                        fit: BoxFit.cover,
                        errorBuilder: (c, e, s) =>
                            const ColoredBox(color: Colors.black12),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Icon(Icons.public, color: cs.onSurfaceVariant),
                const SizedBox(width: 8),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      final url = widget.vm.websiteUrl;
                      Uri? uri;
                      try {
                        uri = Uri.parse(url);
                      } catch (_) {}
                      if (uri != null && await canLaunchUrl(uri)) {
                        await launchUrl(uri,
                            mode: LaunchMode.externalApplication);
                      } else {
                        await Clipboard.setData(ClipboardData(text: url));
                        ToastUtils.showTopToast(
                          context: context,
                          message: '已复制官网链接',
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          icon: Icons.link,
                        );
                      }
                    },
                    child: Text(
                      widget.vm.websiteUrl,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: cs.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  const _CategoryChip({required this.label});

  Color _colorFor(String c) {
    switch (c) {
      case '游戏':
        return const Color(0xFF7C4DFF);
      case '客服':
        return const Color(0xFF03A9F4);
      case '营销':
        return const Color(0xFFFF7043);
      case '教育':
        return const Color(0xFF4CAF50);
      case '提效':
        return const Color(0xFFFFC107);
      case '陪伴':
        return const Color(0xFFE91E63);
      case '信息':
        return const Color(0xFF00BCD4);
      case '硬件':
        return const Color(0xFF3F51B5);
      default:
        return const Color(0xFF999999);
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _colorFor(label);
    final bg = color.withValues(alpha: 0.15);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(label, style: TextStyle(color: color, fontSize: 11)),
    );
  }
}

class _SoftChip extends StatelessWidget {
  final String label;
  const _SoftChip({required this.label});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: cs.primary.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(label, style: TextStyle(color: cs.primary, fontSize: 11)),
    );
  }
}
