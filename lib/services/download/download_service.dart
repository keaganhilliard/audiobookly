import 'dart:async';
import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/models/download_status.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:audiobookly/services/download/downloader.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class DownloadRequest {
  final MediaItem book;
  final List<MediaItem> chapters;
  bool processing = false;

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

    for (final track in tracks) {
      if (track.downloadPath.isNotEmpty) {
        final fullPath =
            p.join((await Utils.getBasePath())!.path, track.downloadPath);
        final file = File(fullPath);
        if (await file.exists()) {
          await file.delete();
        }
      }
    }
    final book = await _db.getBookById(item.id);
    await _db.deleteTracks(tracks);
    if (book != null) {
      await _db.insertBook(
        book.copyWith(
          downloadStatus: DownloadStatus.none,
        ),
      );
    }
  }

  List<DownloadRequest> toDownload = [];

  Future downloadBook(MediaItem book, List<MediaItem> tracks) async {
    if (toDownload.any((req) => req.book.id == book.id)) return;
    await _db.insertBook(_db.getBookFromMediaItem(
      book,
      DownloadStatus.downloading,
    ));
    if (book.chapters.isNotEmpty) await _db.insertChapters(book.chapters);
    toDownload.add(DownloadRequest(book, tracks));
    // if (!_isDownloading)
    processNextBook();
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
    if (req.processing) {
      return;
    } else {
      req.processing = true;
    }
    final book = req.book;
    final chapters = req.chapters;

    Downloader downloader = GetIt.I();
    for (MediaItem chapter in chapters) {
      final track = await _db.getTrack(chapter.id);

      final dir = await Utils.getBasePath();

      if (track != null) {
        final trackFile = File(p.join(dir!.path, track.downloadPath));
        if (trackFile.existsSync()) continue;
      }

      String path = p.join(
        'Audiobooks',
        book.artist ?? 'Unknown',
        book.title,
      );

      await createDirIfNotExists(p.join(dir!.path, path));

      final pieces = chapter.id.split('/');
      final fileName = pieces.length > 1 ? pieces[1] : null;

      await downloader.downloadFile(
        _db.getTrackFromMediaItem(
            chapter,
            book.id,
            0,
            p.join(
              path,
              fileName ?? chapter.title,
            )),
        Uri.parse(_repo.getDownloadUrl(chapter.partKey ?? chapter.id)),
        path,
        fileName,
      );
    }

    await downloader.whenAllDone(book.id);
    if (toDownload.isNotEmpty) toDownload.remove(req);
    await processNextBook();
  }

  Future<List<MediaItem>> getDownloadedItems() async {
    return [];
  }
}
