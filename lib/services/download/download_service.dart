import 'dart:async';
import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/models/book.dart';
import 'package:audiobookly/models/download_status.dart';
import 'package:audiobookly/models/track.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:audiobookly/services/download/downloader.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart' as p;

class DownloadRequest {
  final Book book;
  final List<Track> tracks;
  bool processing = false;

  DownloadRequest(this.book, this.tracks);
}

class DownloadService {
  final MediaRepository _repo;
  final DatabaseService _db;
  DownloadService(this._repo, this._db);

  void createDirIfNotExists(String path) async {
    final dir = Directory(path);
    bool dirExists = dir.existsSync();
    if (!dirExists) {
      dir.createSync(recursive: true);
    }
  }

  Future deleteDownload(Book book) async {
    final tracks = await _db.getTracksForBookId(book.id).first;
    final chapters = await _db.getChaptersForBook(book.id);

    for (final track in tracks) {
      if (track.downloadPath.isNotEmpty) {
        final fullPath =
            p.join((await Utils.getBasePath()).path, track.downloadPath);
        final file = File(fullPath);
        if (await file.exists()) {
          await file.delete();
        }
      }
    }
    final dbBook = await _db.getBookById(book.id);
    await _db.deleteTracks(tracks);
    await _db.deleteChapters(chapters);
    if (dbBook != null) {
      await _db.insertBook(
        dbBook.copyWith(
          downloadStatus: DownloadStatus.none,
        ),
      );
    }
  }

  List<DownloadRequest> toDownload = [];

  Future downloadBook(Book book, List<Track> tracks) async {
    if (toDownload.any((req) => req.book.id == book.id)) return;
    await _db
        .insertBook(book.copyWith(downloadStatus: DownloadStatus.downloading));
    if (book.chapters?.isNotEmpty ?? false) {
      await _db.insertChapters(book.chapters!);
    }
    toDownload.add(DownloadRequest(book, tracks));
    // if (!_isDownloading)
    processNextBook();
  }

  Future cancelBookDownload(Book book) async {
    await GetIt.I.get<Downloader>().cancelDownloads(book.id);
    toDownload.removeWhere((req) => req.book.id == book.id);
    await deleteDownload(book);
  }

  Future processNextBook() async {
    if (toDownload.isEmpty) return;
    final req = toDownload.first;
    if (req.processing) {
      return;
    } else {
      req.processing = true;
    }
    final DownloadRequest(:book, :tracks) = req;
    final Downloader(:downloadFile, :whenAllDone) = GetIt.I();

    for (Track theTrack in tracks) {
      final track = await _db.getTrack(theTrack.id);

      final dir = await Utils.getBasePath();

      if (track != null) {
        final trackFile = File(p.join(dir.path, track.downloadPath));
        if (trackFile.existsSync()) continue;
      }

      String path = p.join(
        'Audiobooks',
        book.author,
        book.title,
      );

      createDirIfNotExists(p.join(dir.path, path));

      final pieces = theTrack.id.split('/');
      final fileName = pieces.length > 1 ? pieces[1] : null;

      await downloadFile(
        theTrack.copyWith(
          downloadPath: p.join(
            path,
            fileName ?? theTrack.title,
          ),
        ),
        _repo
            .getDownloadUrl(
                theTrack.serverPath.isEmpty ? theTrack.id : theTrack.serverPath)
            .uri!,
        path,
        fileName,
      );
    }

    await whenAllDone(book.id);
    if (toDownload.isNotEmpty) toDownload.remove(req);
    await processNextBook();
  }

  Future<List<MediaItem>> getDownloadedItems() async {
    return [];
  }
}
