import 'dart:async';
import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:audiobookly/services/download/download_service.dart';
import 'package:emby_api/emby_api.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart' as pathProvider;

class EmbyDownloadService extends DownloadService {
  final EmbyApi _api;
  final DatabaseService _db;
  EmbyDownloadService(this._api, this._db);

  Future createDirIfNotExists(String path) async {
    final dir = new Directory(path);
    bool dirExists = await dir.exists();
    if (!dirExists) {
      await dir.create(recursive: true);
    }
  }

  Future downloadBook(MediaItem book, List<MediaItem> chapters) async {
    Directory? baseDir;
    try {
      final something = await pathProvider.getExternalStorageDirectories(
          type: pathProvider.StorageDirectory.music);
      something?.forEach((element) {
        print(element.path);
      });
      baseDir = something?[0];
    } catch (e) {
      print('We does not support storageDirectories');
    }
    if (baseDir == null) {
      baseDir = await pathProvider.getApplicationDocumentsDirectory();
    }

    await _db.insertBook(getBook(book, true, false, false));

    for (MediaItem chapter in chapters) {
      String path = p.join(
        baseDir.path,
        'Audiobooks',
        book.artist ?? 'Unknown',
        book.title,
      );
      await _db.insertTrack(getTrack(chapter, book.id, 0, path));
      String url = _api.getDownloadUrl(chapter.id);
      double currentProgress = 0.0;
      try {
        await downloadFile(url, path, (fileName) {
          path = p.join(path, fileName);
        }, (progress) async {
          if (progress - currentProgress > 0.01) {
            print('Progress callback: $progress');
            await _db.insertTrack(getTrack(chapter, book.id, progress, path));
            currentProgress = progress;
          }
        });
        await _db.insertTrack(getTrack(chapter, book.id, 1, path));
      } catch (e, s) {
        _db.insertBook(getBook(book, true, false, true));
        print('DownloadError: $e');
        print('DownloadErrorStack: $s');
        rethrow;
      }
    }
    _db.insertBook(getBook(book, true, true, false));
  }

  Future downloadFile(
    String url,
    String path, [
    Function(String)? onFileName,
    Future Function(double)? onProgress,
    int saved = 0,
  ]) async {
    StreamSubscription? sub;
    Completer completer = Completer();
    try {
      HttpClient client = HttpClient();
      HttpClientRequest request = await client.getUrl(Uri.parse(url));
      request.headers.set('Accept', '*/*');
      request.headers.set('Connection', 'keep-alive');
      request.headers.set(HttpHeaders.rangeHeader, 'bytes=$saved');

      HttpClientResponse response = await request.close();
      final total = response.headers.contentLength;
      print(url);
      print(response.headers.value('content-disposition'));
      String fileName = RegExp(r'(["])(?:(?=(\\?))\2.)*?\1')
          .firstMatch(response.headers.value('content-disposition')!)!
          .group(0)!
          .replaceAll(RegExp(r'"'), '');
      onFileName?.call(fileName);
      final file = File(p.join(path, fileName));
      await file.create(recursive: true);

      final fileSink = await file.open(mode: FileMode.writeOnlyAppend);
      sub = response.asBroadcastStream().listen((data) async {
        sub!.pause();
        await fileSink.writeFrom(data);
        final currentProgress = saved + data.length;
        print('${(currentProgress / total).toStringAsPrecision(2)}');
        saved = currentProgress;
        await onProgress?.call(currentProgress / total);
        sub.resume();
      }, onDone: () async {
        await fileSink.close();
        completer.complete();
      });
    } catch (e, stack) {
      completer.completeError(e, stack);
      print(e.toString());
      print(stack.toString());
    }
    return completer.future;
  }

  Future<List<MediaItem>> getDownloadedItems() async {
    return [];
  }
}
