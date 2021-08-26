import 'dart:async';
import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/database/entity/track.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:audiobookly/services/download/download_service.dart';
import 'package:emby_api/emby_api.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:dio/dio.dart';

class DownloadRequest {
  final MediaItem book;
  final List<MediaItem> chapters;
  CancelToken token = CancelToken();

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
    if (!_isDownloading) await processNextBook();
  }

  Future cancelBookDownload(MediaItem book) async {
    DownloadRequest? req = toDownload
        .firstWhere((req) => req!.book.id == book.id, orElse: () => null);
    req?.token.cancel('Requested');
    if (req == null) deleteDownload(book);
  }

  Future processNextBook() async {
    if (toDownload.isEmpty) return;
    _isDownloading = true;
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

    bool cancelled = false;
    for (MediaItem chapter in chapters) {
      if (cancelled) break;

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

      await _db.insertTrack(getTrack(chapter, book.id, 0, path));
      String url = _api.getDownloadUrl(chapter.id);
      double currentProgress = 0.0;
      try {
        await downloadFile(chapter.id, url, path, req.token, (fileName) {
          path = p.join(path, fileName);
        }, (progress) {
          if (progress - currentProgress > 0.01) {
            print('Progress callback: $progress');
            _db.insertTrack(getTrack(chapter, book.id, progress, path));
            currentProgress = progress;
          }
        }, () {
          cancelled = true;
          if (track != null) _db.deleteTracks([track]);
        });
        await _db.insertTrack(getTrack(chapter, book.id, 1, path));
      } catch (e, s) {
        _db.insertBook(getBook(book, true, false, true));
        print('DownloadError: $e');
        print('DownloadErrorStack: $s');
        rethrow;
      }
    }
    _isDownloading = false;
    if (!cancelled)
      await _db.insertBook(getBook(book, true, true, false));
    else
      await _db.insertBook(getBook(book, false, false, false));
    toDownload.removeAt(0);
    await processNextBook();
  }

  Future downloadFile(
    String id,
    String url,
    String path,
    CancelToken cancelToken, [
    Function(String)? onFileName,
    Function(double)? onProgress,
    Function()? onCancel,
    int saved = 0,
  ]) async {
    // StreamSubscription? sub;
    Completer completer = Completer();
    // try {
    //   HttpClient client = HttpClient();
    //   HttpClientRequest request = await client.getUrl(Uri.parse(url));
    //   request.headers.set('Accept', '*/*');
    //   request.headers.set('Connection', 'keep-alive');
    //   request.headers.set(HttpHeaders.rangeHeader, 'bytes=$saved');

    final dio = Dio();
    dio
        .download(
          url,
          (Headers headers) {
            late String fileName;
            try {
              fileName = RegExp(r'(["])(?:(?=(\\?))\2.)*?\1')
                  .firstMatch(headers.value('content-disposition')!)!
                  .group(0)!
                  .replaceAll(RegExp(r'"'), '');
            } catch (e, stack) {
              fileName = id;
            }
            onFileName?.call(fileName);
            return p.join(path, fileName);
          },
          cancelToken: cancelToken,
          onReceiveProgress: (received, total) {
            print('${(received / total).toStringAsPrecision(2)}');
            onProgress?.call(received / total);
          },
          deleteOnError: true,
        )
        .then((value) => completer.complete())
        .catchError((e) {
      if (CancelToken.isCancel(e)) {
        onCancel?.call();
        completer.complete();
      } else {
        completer.completeError(e);
      }
    });

    //   HttpClientResponse response = await request.close();
    //   final total = response.headers.contentLength;
    //   print(url);
    //   print(response.headers.value('content-disposition'));
    //   late String fileName;
    //   try {
    //     fileName = RegExp(r'(["])(?:(?=(\\?))\2.)*?\1')
    //         .firstMatch(response.headers.value('content-disposition')!)!
    //         .group(0)!
    //         .replaceAll(RegExp(r'"'), '');
    //   } catch (e, stack) {
    //     fileName = id;
    //   }
    //   onFileName?.call(fileName);
    //   final file = File(p.join(path, fileName));
    //   await file.create(recursive: true);

    //   final fileSink = await file.open(mode: FileMode.writeOnlyAppend);
    //   sub = response.asBroadcastStream().listen((data) async {
    //     sub!.pause();
    //     await fileSink.writeFrom(data);
    //     final currentProgress = saved + data.length;
    //     print('${(currentProgress / total).toStringAsPrecision(2)}');
    //     saved = currentProgress;
    //     await onProgress?.call(currentProgress / total);
    //     sub.resume();
    //   }, onDone: () async {
    //     await fileSink.close();
    //     completer.complete();
    //   });
    // } catch (e, stack) {
    //   completer.completeError(e, stack);
    //   print(e.toString());
    //   print(stack.toString());
    // }
    return completer.future;
  }

  Future<List<MediaItem>> getDownloadedItems() async {
    return [];
  }
}
