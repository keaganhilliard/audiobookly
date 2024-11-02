import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:audiobookly/models/download_status.dart';
import 'package:audiobookly/models/track.dart';
import 'package:audiobookly/services/download/downloader.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:path/path.dart' as p;

class DesktopDownloader extends Downloader {
  DesktopDownloader(super.db);

  @override
  Future downloadFile(
    Track track,
    Uri url,
    String path, [
    String? fileName,
  ]) async {
    late StreamSubscription sub;
    Completer completer = Completer();
    try {
      HttpClient client = HttpClient();
      HttpClientRequest request = await client.getUrl(url);
      request.headers.set('Accept', '*/*');
      request.headers.set('Connection', 'keep-alive');
      request.headers.set(HttpHeaders.rangeHeader, 'bytes=0');
      track = track.copyWith(downloadTaskId: track.id);

      HttpClientResponse response = await request.close();
      final total = response.headers.contentLength;
      try {
        fileName ??= RegExp(r'(["])(?:(?=(\\?))\2.)*?\1')
            .firstMatch(response.headers.value('content-disposition')!)!
            .group(0)!
            .replaceAll(RegExp(r'"'), '');
      } catch (e) {
        fileName ??= track.id;
      }
      final downloadPath = p.join(
        (await Utils.getBasePath()).path,
        path,
        fileName,
      );
      final file = File(downloadPath);
      await file.create(recursive: true);

      int saved = 0;
      double debouncer = 0;
      final fileSink = await file.open(mode: FileMode.writeOnlyAppend);
      sub = response.asBroadcastStream().listen((data) async {
        sub.pause();
        await fileSink.writeFrom(data);
        final currentProgress = saved + data.length;
        final currentPercentage = currentProgress / total;
        saved = currentProgress;
        if (currentPercentage - debouncer > 0.01) {
          await db.insertTrack(track.copyWith(
            downloadProgress: currentPercentage,
            downloadTaskId: track.id,
          ));
          debouncer = currentPercentage;
        }
        sub.resume();
      }, onDone: () async {
        await fileSink.close();
        await db.insertTrack(
          track.copyWith(
            downloadProgress: 1,
            downloadPath: p.join(path, fileName),
            isDownloaded: true,
          ),
        );
        completer.complete();
      });
    } catch (e, stack) {
      completer.completeError(e, stack);
      log(e.toString());
      log(stack.toString());
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
        .where((tracks) => tracks.every((track) => track.isDownloaded))
        .listen((tracks) async {
      trackSub?.cancel();

      final book = await db.getBookById(parentId);
      if (book != null) {
        await db.insertBook(
          book.copyWith(
            downloadStatus: DownloadStatus.succeeded,
          ),
        );
        completer.complete();
      }
    });
    return completer.future;
  }
}
