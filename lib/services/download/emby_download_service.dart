import 'dart:async';
import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/database/database.dart';
import 'package:audiobookly/database/entities.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:audiobookly/services/download/download_service.dart';
import 'package:emby_api/emby_api.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class EmbyDownloadService extends DownloadService {
  final EmbyApi _api;
  final DatabaseService _db;
  EmbyDownloadService(this._api, this._db);

  // Future<bool> downloadItem(DownloadTask task) async {
  //   print(task.path);
  //   await for (double progress in downloadFile(
  //     task.url,
  //     task.path,
  //   )) {
  //     print('Downloaded $progress');
  //   }
  //   return true;
  // }

  Future createDirIfNotExists(String path) async {
    final dir = new Directory(path);
    bool dirExists = await dir.exists();
    if (!dirExists) {
      await dir.create(recursive: true);
    }
  }

  Stream<double> downloadFile(String url, String path) async* {
    HttpClient client = HttpClient();
    HttpClientRequest request = await client.getUrl(Uri.parse(url));
    request.headers.set('Accept', '*/*');
    request.headers.set('Connection', 'keep-alive');

    HttpClientResponse response = await request.close();
    var total = response.headers.contentLength;
    String fileName = RegExp(r'(["])(?:(?=(\\?))\2.)*?\1')
        .firstMatch(response.headers.value('content-disposition'))
        .group(0)
        .replaceAll(RegExp(r'"'), '');
    var fileSaver = File(p.join(path, fileName));
    int saved = 0;

    bool first = true;
    try {
      await for (final data in response) {
        fileSaver = await fileSaver.writeAsBytes(
          data,
          mode: first ? FileMode.write : FileMode.append,
        );
        first = false;
        saved += data.length;
        yield saved / total;
      }
    } catch (e, stack) {
      print(e.toString());
      print(stack.toString());
    }
  }

  Future<List<MediaItem>> getDownloadedItems() async {}
}
