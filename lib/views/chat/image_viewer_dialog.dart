import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../../utils/web_download_stub.dart'
    if (dart.library.html) '../../utils/web_download.dart' as web_dl;
import '../../utils/toast_utils.dart';

class ImageViewerDialog extends StatefulWidget {
  final List<String> urls;
  final int initialIndex;
  const ImageViewerDialog({required this.urls, required this.initialIndex});

  @override
  State<ImageViewerDialog> createState() => _ImageViewerDialogState();
}

class _ImageViewerDialogState extends State<ImageViewerDialog> {
  late int _index;

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex;
  }

  Future<void> _downloadCurrent() async {
    try {
      if (kIsWeb) {
        final uri = Uri.parse(widget.urls[_index]);
        final last = uri.pathSegments.isNotEmpty ? uri.pathSegments.last : '';
        final dot = last.lastIndexOf('.');
        String ext = 'jpg';
        if (dot != -1 && dot + 1 < last.length) {
          final e = last.substring(dot + 1).toLowerCase();
          if (e.isNotEmpty && e.length <= 5) ext = e;
        }
        final ts = DateTime.now().millisecondsSinceEpoch;
        final ok = await web_dl.triggerWebDownload(widget.urls[_index], 'image_$ts.$ext');
        if (!ok && mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Download failed')));
        }
        return;
      }
      final uri = Uri.parse(widget.urls[_index]);
      final client = HttpClient();
      final resp = await (await client.getUrl(uri)).close();
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
      String ext = 'jpg';
      final last = uri.pathSegments.isNotEmpty ? uri.pathSegments.last : '';
      final dot = last.lastIndexOf('.');
      if (dot != -1 && dot + 1 < last.length) {
        final e = last.substring(dot + 1).toLowerCase();
        if (e.isNotEmpty && e.length <= 5) ext = e;
      }
      final ts = DateTime.now().millisecondsSinceEpoch;
      final file = File('$dirPath/image_$ts.$ext');
      await file.writeAsBytes(bytes);
      if (mounted) {
        ToastUtils.showTopToast(
          context: context,
          message: 'Image saved to download',
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

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: InteractiveViewer(
                child: Image.network(widget.urls[_index], fit: BoxFit.contain),
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Row(
              children: [
                IconButton(
                  tooltip: 'Download',
                  icon: const Icon(Icons.download, color: Colors.white),
                  onPressed: _downloadCurrent,
                ),
                IconButton(
                  tooltip: 'Close',
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
          Positioned(
            left: 8,
            bottom: 8,
            child: IconButton(
              icon: const Icon(Icons.chevron_left, color: Colors.white, size: 28),
              onPressed: () {
                setState(() {
                  _index = (_index - 1 + widget.urls.length) % widget.urls.length;
                });
              },
            ),
          ),
          Positioned(
            right: 8,
            bottom: 8,
            child: IconButton(
              icon: const Icon(Icons.chevron_right, color: Colors.white, size: 28),
              onPressed: () {
                setState(() {
                  _index = (_index + 1) % widget.urls.length;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
