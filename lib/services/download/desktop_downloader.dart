import 'dart:async';
import 'dart:io';

import 'package:audiobookly/services/database/database_service.dart';
import 'package:audiobookly/services/download/downloader.dart';
import 'package:path/path.dart' as p;

class DesktopDownloader extends Downloader {
  DesktopDownloader(DatabaseService _db) : super(_db);

  @override
  Future downloadFile(
    String id,
    String url,
    String path, [
    String? filename,
  ]) async {
    StreamSubscription? sub;
    Completer completer = Completer();
    print(url);
    try {
      final track = await db.getTrack(id);

      HttpClient client = HttpClient();
      HttpClientRequest request = await client.getUrl(Uri.parse(url));
      request.headers.set('Accept', '*/*');
      request.headers.set('Connection', 'keep-alive');
      request.headers.set(HttpHeaders.rangeHeader, 'bytes=0');

      HttpClientResponse response = await request.close();
      final total = response.headers.contentLength;
      try {
        filename ??= RegExp(r'(["])(?:(?=(\\?))\2.)*?\1')
            .firstMatch(response.headers.value('content-disposition')!)!
            .group(0)!
            .replaceAll(RegExp(r'"'), '');
      } catch (e, stack) {
        filename ??= id;
      }
      final downloadPath = p.join(path, filename);
      final file = File(downloadPath);
      await file.create(recursive: true);

      int saved = 0;
      double debouncer = 0;
      final fileSink = await file.open(mode: FileMode.writeOnlyAppend);
      sub = response.asBroadcastStream().listen((data) async {
        sub!.pause();
        await fileSink.writeFrom(data);
        final currentProgress = saved + data.length;
        final currentPercentage = currentProgress / total;
        saved = currentProgress;
        if (currentPercentage - debouncer > 0.01) {
          if (track != null) {
            await db.insertTrack(
                track.copyWith(downloadProgress: currentPercentage));
          }
          debouncer = currentPercentage;
        }
        sub.resume();
      }, onDone: () async {
        await fileSink.close();
        // final track = await db.getTrack(id);
        if (track != null) {
          await db.insertTrack(
            track.copyWith(
              downloadProgress: 1,
              downloadPath: downloadPath,
              isDownloaded: true,
            ),
          );
        }
        completer.complete();
      });
    } catch (e, stack) {
      completer.completeError(e, stack);
      print(e.toString());
      print(stack.toString());
    }
    return completer.future;
  }

  @override
  Future cancelDownloads(String parentId) async {}

  @override
  Future whenAllDone(String parentId) async {
    final completer = Completer();
    StreamSubscription? trackSub;
    trackSub = db
        .getTracksForBookId(parentId)
        .where((tracks) => tracks.values.every((track) => track.isDownloaded))
        .listen((tracks) async {
      trackSub?.cancel();
      print('ALL DONE');

      final book = await db.getBookById(parentId);
      if (book != null) {
        await db.insertBook(
          book.copyWith(
            downloadRequested: true,
            downloadCompleted: true,
            downloadFailed: false,
          ),
        );
        completer.complete();
      }
    });
    return completer.future;
  }
}
