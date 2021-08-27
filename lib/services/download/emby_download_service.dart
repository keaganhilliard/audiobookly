import 'dart:async';
import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/database/entity/track.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:audiobookly/services/download/mobile_downloader.dart';
import 'package:audiobookly/services/download/downloader.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:audiobookly/services/download/download_service.dart';
import 'package:emby_api/emby_api.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:plex_api/plex_api.dart';

class DownloadRequest {
  final MediaItem book;
  final List<MediaItem> chapters;

  DownloadRequest(this.book, this.chapters);
}

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

  Future deleteDownload(MediaItem item) async {
    final tracks = await _db.getTracksForBookId(item.id).first;

    final toDelete = <Track>[];
    for (final track in tracks.entries) {
      final file = File(track.value.downloadPath);
      if (await file.exists()) {
        file.deleteSync();
      }
      toDelete.add(track.value);
    }
    await _db.deleteTracks(toDelete);
    await _db.insertBook(getBook(item, false, false, false));
  }

  List<DownloadRequest?> toDownload = [];
  bool _isDownloading = false;

  Future downloadBook(MediaItem book, List<MediaItem> chapters) async {
    if (toDownload.any((req) => req!.book.id == book.id)) return;
    await _db.insertBook(getBook(book, true, false, false));
    toDownload.add(DownloadRequest(book, chapters));
    // if (!_isDownloading)
    await processNextBook();
  }

  Future cancelBookDownload(MediaItem book) async {
    DownloadRequest? req = toDownload
        .firstWhere((req) => req!.book.id == book.id, orElse: () => null);
    // req?.token.cancel('Requested');
    if (req == null) deleteDownload(book);
  }

  Future processNextBook() async {
    if (toDownload.isEmpty) return;
    // _isDownloading = true;
    final req = toDownload[0]!;
    final book = req.book;
    final chapters = req.chapters;
    Directory? baseDir;
    try {
      final something = await pathProvider.getExternalStorageDirectory();
      baseDir = something;
    } catch (e) {
      print('We does not support storageDirectories');
    }
    if (baseDir == null) {
      baseDir = await pathProvider.getApplicationDocumentsDirectory();
    }

    Downloader d = GetIt.I.get();
    for (MediaItem chapter in chapters) {
      final track = await _db.getTrack(chapter.id);

      if (track != null) {
        final trackFile = File(track.downloadPath);
        if (trackFile.existsSync()) continue;
      }

      String path = p.join(
        baseDir.path,
        'Audiobooks',
        book.artist ?? 'Unknown',
        book.title,
      );

      await createDirIfNotExists(path);

      await _db.insertTrack(getTrack(chapter, book.id, 0, path));
      String url = _api.getDownloadUrl(chapter.id);

      await d.downloadFile(chapter.id, url, path);
      // await _db.insertTrack(getTrack(chapter, book.id, 0, path, id ?? ''));
    }

    await d.whenAllDone(book.id);
    toDownload.removeAt(0);
    await processNextBook();
  }

  Future downloadFile(
    String id,
    String url,
    String path, [
    Function(String)? onFileName,
    Future Function(double)? onProgress,
    Function()? onCancel,
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
      late String fileName;
      try {
        fileName = RegExp(r'(["])(?:(?=(\\?))\2.)*?\1')
            .firstMatch(response.headers.value('content-disposition')!)!
            .group(0)!
            .replaceAll(RegExp(r'"'), '');
      } catch (e, stack) {
        fileName = id;
      }
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
