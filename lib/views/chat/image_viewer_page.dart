import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';

class ImageViewerPage extends StatelessWidget {
  final String url;
  const ImageViewerPage({required this.url});

  Future<void> _saveToGallery(BuildContext context) async {
    try {
      final ok = await GallerySaver.saveImage(url);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ok == true ? 'Saved to gallery' : 'Save failed')));
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Save error')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: () => _saveToGallery(context), icon: const Icon(Icons.download)),
      ]),
      body: Center(
        child: InteractiveViewer(child: Image.network(url, fit: BoxFit.contain)),
      ),
    );
  }
}
