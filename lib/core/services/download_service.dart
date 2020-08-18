import 'dart:io';
import 'dart:async';
import 'package:audiobookly/core/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart' as p;

class DownloadService {
  static List<String> ports = List();
  static bool isSpawned = false;

  static void connect(String portName) {}

  static Future<bool> download(String url, String path, String fileName) async {
    try {
      path = Utils.cleanPath(path);
      fileName = Utils.cleanFileName(fileName);
      Dio d = Dio();
      await d.download(url, p.join(path, fileName),
          onReceiveProgress: (rec, total) {
        print(rec / total);
      });
      return true;
    } catch (e) {
      print(e.toString());
    }
    return false;
  }

  static Stream<double> downloadFile(String url, String path, String fileName,
      [double saved = 0.0, int tries = 0, int total]) async* {
    HttpClient client = HttpClient();

    path = Utils.cleanPath(path);
    fileName = Utils.cleanFileName(fileName);

    await createDirIfNotExists(path);

    var fileSaver = File(p.join(path, fileName));

    HttpClientRequest request = await client.getUrl(Uri.parse(url));
    request.headers.set('Accept', '*/*');
    request.headers.set('Connection', 'keep-alive');
    if (saved > 0)
      request.headers.set('Range', 'bytes=${saved.toInt() + 1}-$total/*');
    HttpClientResponse response = await request.close();
    total = total ?? response.headers.contentLength;
    print(response.headers);

    bool first = true;
    try {
      List<List<int>> datas = List<List<int>>();
      await for (final data in response) {
        datas.add(data);
        fileSaver = await fileSaver.writeAsBytes(data,
            mode: first ? FileMode.write : FileMode.append);
        first = false;
        saved += data.length;
        yield saved / total;
      }
    } catch (e) {
      print('Try try again: $tries');
      if (tries < 2)
        yield* downloadFile(url, path, fileName, saved, ++tries, total);
      // await for (double d
      //     in downloadFile(url, path, fileName, saved, ++tries, total)) {
      //   yield d;
      // }
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
