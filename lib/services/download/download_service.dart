import 'dart:async';
import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/models/chapter.dart';
import 'package:audiobookly/models/download_status.dart';
import 'package:audiobookly/models/track.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:audiobookly/services/download/downloader.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart' as pathProvider;

class DownloadRequest {
  final MediaItem book;
  final List<MediaItem> chapters;

  DownloadRequest(this.book, this.chapters);
}

class DownloadService {
  final MediaRepository _repo;
  final DatabaseService _db;
  DownloadService(this._repo, this._db);

  Future createDirIfNotExists(String path) async {
    final dir = Directory(path);
    bool dirExists = await dir.exists();
    if (!dirExists) {
      await dir.create(recursive: true);
    }
  }

  Future deleteDownload(MediaItem item) async {
    final tracks = await _db.getTracksForBookId(item.id).first;

    final toUpdate = <Track>[];
    for (final track in tracks.entries) {
      if (track.value.downloadPath.isNotEmpty) {
        final file = File(track.value.downloadPath);
        if (await file.exists()) {
          await file.delete();
        }
      }
      toUpdate.add(track.value.copyWith(
        isDownloaded: false,
        downloadProgress: 0,
        downloadTaskId: '',
      ));
    }
    final book = await _db.getBookById(item.id);
    await _db.insertTracks(toUpdate);
    if (book != null) {
      await _db.insertBook(
        book.copyWith(
          downloadCompleted: false,
          downloadFailed: false,
          downloadRequested: false,
          downloadStatus: DownloadStatus.none,
        ),
      );
    }
  }

  List<DownloadRequest> toDownload = [];
  final bool _isDownloading = false;

  Future downloadBook(MediaItem book, List<MediaItem> tracks) async {
    if (toDownload.any((req) => req.book.id == book.id)) return;
    await _db.insertBook(_db.getBookFromMediaItem(book, true, false, false));
    if (book.chapters.isNotEmpty) await _db.insertChapters(book.chapters);
    toDownload.add(DownloadRequest(book, tracks));
    // if (!_isDownloading)
    await processNextBook();
  }

  Future cancelBookDownload(MediaItem book) async {
    await GetIt.I.get<Downloader>().cancelDownloads(book.id);
    // req?.token.cancel('Requested');
    toDownload.removeWhere((req) => req.book.id == book.id);
    await deleteDownload(book);
  }

  Future processNextBook() async {
    if (toDownload.isEmpty) return;
    // _isDownloading = true;
    final req = toDownload[0];
    final book = req.book;
    final chapters = req.chapters;
    Directory? baseDir;
    try {
      final something = await pathProvider.getExternalStorageDirectory();
      baseDir = something;
    } catch (e) {
      print('We does not support storageDirectories');
    }
    baseDir ??= await pathProvider.getApplicationDocumentsDirectory();

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

      await _db.insertTrack(
        _db.getTrackFromMediaItem(chapter, book.id, 0, path),
      );
      String url = _repo.getDownloadUrl(chapter.partKey ?? chapter.id);

      var pieces = chapter.id.split('/');

      await d.downloadFile(
        chapter.id,
        Uri.parse(url).toString(),
        path,
        pieces.length > 1 ? pieces[1] : null,
      );
    }

    await d.whenAllDone(book.id);
    if (toDownload.isNotEmpty) toDownload.removeAt(0);
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
        print((currentProgress / total).toStringAsPrecision(2));
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
