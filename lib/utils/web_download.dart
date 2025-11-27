// Only compiled on web
import 'dart:html' as html;

Future<bool> triggerWebDownload(String url, String filename) async {
  try {
    final resp = await html.HttpRequest.request(url, responseType: 'blob');
    final blob = resp.response as html.Blob?;
    if (blob == null) return false;
    final objectUrl = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: objectUrl)
      ..download = filename
      ..style.display = 'none';
    html.document.body?.append(anchor);
    anchor.click();
    anchor.remove();
    html.Url.revokeObjectUrl(objectUrl);
    return true;
  } catch (_) {
    return false;
  }
}
