import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import '../../utils/web_download_stub.dart'
    if (dart.library.html) '../../utils/web_download.dart' as web_dl;
import '../../utils/toast_utils.dart';

class VideoPlayerDialog extends StatefulWidget {
  final List<String> urls;
  final int initialIndex;
  const VideoPlayerDialog({required this.urls, required this.initialIndex});

  @override
  State<VideoPlayerDialog> createState() => _VideoPlayerDialogState();
}

class _VideoPlayerDialogState extends State<VideoPlayerDialog> {
  late VideoPlayerController _controller;
  bool _ready = false;
  bool _isPlaying = true;
  late int _index;

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex;
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.urls[_index]))
      ..initialize().then((_) {
        setState(() => _ready = true);
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.pause();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: _ready ? _controller.value.aspectRatio : 16 / 9,
            child: _ready ? VideoPlayer(_controller) : const Center(child: CircularProgressIndicator()),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Row(
              children: [
                IconButton(
                  tooltip: _isPlaying ? 'Pause' : 'Play',
                  icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white),
                  onPressed: () {
                    if (!_ready) return;
                    if (_isPlaying) {
                      _controller.pause();
                    } else {
                      _controller.play();
                    }
                    setState(() => _isPlaying = !_isPlaying);
                  },
                ),
                IconButton(
                  tooltip: 'Download',
                  icon: const Icon(Icons.download, color: Colors.white),
                  onPressed: _downloadToDesktop,
                ),
                IconButton(
                  tooltip: 'Close',
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
          Positioned(
            left: 8,
            bottom: 8,
            child: IconButton(
              icon: const Icon(Icons.chevron_left, color: Colors.white, size: 28),
              onPressed: () async {
                final prev = (_index - 1 + widget.urls.length) % widget.urls.length;
                await _controller.pause();
                _controller.dispose();
                setState(() {
                  _ready = false;
                  _isPlaying = true;
                  _index = prev;
                  _controller = VideoPlayerController.networkUrl(Uri.parse(widget.urls[_index]))
                    ..initialize().then((_) {
                      setState(() => _ready = true);
                      _controller.play();
                    });
                });
              },
            ),
          ),
          Positioned(
            right: 8,
            bottom: 8,
            child: IconButton(
              icon: const Icon(Icons.chevron_right, color: Colors.white, size: 28),
              onPressed: () async {
                final next = (_index + 1) % widget.urls.length;
                await _controller.pause();
                _controller.dispose();
                setState(() {
                  _ready = false;
                  _isPlaying = true;
                  _index = next;
                  _controller = VideoPlayerController.networkUrl(Uri.parse(widget.urls[_index]))
                    ..initialize().then((_) {
                      setState(() => _ready = true);
                      _controller.play();
                    });
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _downloadToDesktop() async {
    try {
      if (kIsWeb) {
        final uri = Uri.parse(widget.urls[_index]);
        final last = uri.pathSegments.isNotEmpty ? uri.pathSegments.last : '';
        final dot = last.lastIndexOf('.');
        String ext = 'mp4';
        if (dot != -1 && dot + 1 < last.length) {
          final e = last.substring(dot + 1).toLowerCase();
          if (e.isNotEmpty && e.length <= 5) ext = e;
        }
        final ts = DateTime.now().millisecondsSinceEpoch;
        final ok = await web_dl.triggerWebDownload(widget.urls[_index], 'video_$ts.$ext');
        if (!ok && mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Download failed')));
        }
        return;
      }
      final uri = Uri.parse(widget.urls[_index]);
      final client = HttpClient();
      final req = await client.getUrl(uri);
      final resp = await req.close();
      if (resp.statusCode != 200) {
        if (mounted) {
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
      final bytes = await resp.fold<List<int>>(<int>[], (acc, data) => acc..addAll(data));
      final downloadsDir = await getDownloadsDirectory();
      final dirPath = downloadsDir?.path ?? (Platform.environment['HOME'] != null ? '${Platform.environment['HOME']}/Downloads' : (await getTemporaryDirectory()).path);
      final last = uri.pathSegments.isNotEmpty ? uri.pathSegments.last : '';
      final dot = last.lastIndexOf('.');
      String ext = 'mp4';
      if (dot != -1 && dot + 1 < last.length) {
        final e = last.substring(dot + 1).toLowerCase();
        if (e.isNotEmpty && e.length <= 5) {
          ext = e;
        }
      }
      final ts = DateTime.now().millisecondsSinceEpoch;
      final fileName = 'video_${ts}.$ext';
      final file = File('$dirPath/$fileName');
      await file.writeAsBytes(bytes);
      if (mounted) {
        ToastUtils.showTopToast(
          context: context,
          message: 'Video saved to download',
          backgroundColor: Colors.green,
          textColor: Colors.white,
          icon: Icons.info_outline,
        );
      }
    } catch (_) {
      if (mounted) {
        ToastUtils.showTopToast(
          context: context,
          message: 'Download error',
          backgroundColor: Colors.red,
          textColor: Colors.white,
          icon: Icons.info_outline,
        );
      }
    }
  }
}
