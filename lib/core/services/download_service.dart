import 'dart:io';
import 'dart:async';
import 'package:path/path.dart' as p;

class DownloadService {
  static Stream<double> downloadFile(
      String url, String path, String fileName) async* {
    HttpClient client = HttpClient();

    await createDirIfNotExists(path);

    var fileSaver = File(p.join(path, fileName));
    var saved = 0.0;

    HttpClientRequest request = await client.getUrl(Uri.parse(url));
    HttpClientResponse response = await request.close();
    var total = response.headers.contentLength;

    bool first = true;
    try {
      await for (final data in response) {
        fileSaver = await fileSaver.writeAsBytes(data,
            mode: first ? FileMode.write : FileMode.append);
        first = false;
        saved += data.length;
        yield saved / total;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static Future createDirIfNotExists(String path) async {
    final dir = new Directory(path);
    bool dirExists = await dir.exists();
    if (!dirExists) {
      await dir.create(recursive: true);
    }
  }
}
