import 'dart:io';
import 'dart:async';
import 'package:path/path.dart' as p;

class DownloadService {
  static Stream<double> downloadFile(String url, String path, String fileName,
      [double saved = 0.0, int tries = 0]) async* {
    HttpClient client = HttpClient();

    await createDirIfNotExists(path);

    var fileSaver = File(p.join(path, fileName));

    HttpClientRequest request = await client.getUrl(Uri.parse(url));
    // if (saved > 0) request.headers.set('Range', 'bytes=${saved.toInt()}-');
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
      print('Try try again: $tries');
      // if (tries < 2)
      //   await for (double d
      //       in downloadFile(url, path, fileName, saved, ++tries)) {
      //     yield d;
      //   }
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
