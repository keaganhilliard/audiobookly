import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/isar/isar_book.dart';
import 'package:audiobookly/isar/isar_chapter.dart';
import 'package:audiobookly/isar/isar_track.dart';
import 'package:audiobookly/models/book.dart';
import 'package:audiobookly/models/chapter.dart';
import 'package:audiobookly/models/track.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:isar/isar.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/subjects.dart';

Future<Isar> initIsar() async {
  return await Isar.open(
    [IsarBookSchema, IsarChapterSchema, IsarTrackSchema],
    directory: (await getApplicationSupportDirectory()).path,
    inspector: true,
  );
}

class IsarDatabaseService implements DatabaseService {
  final Isar _db;

  IsarDatabaseService({
    required Isar db,
  }) : _db = db;

  @override
  Stream<List<Book>> getBooks() {
    return _db.isarBooks.where().watch(initialReturn: true).map((isarBooks) => isarBooks.map((book) => book.toBook()).toList());
  }

  @override
  Future<Book?> getBookById(String id) async {
    return (await _db.isarBooks.where().filter().exIdEqualTo(id).findFirst())?.toBook();
  }

  @override
  Stream<Book?> watchBookById(String id) {
    return _db.isarBooks
        .where()
        .filter()
        .exIdEqualTo(id)
        .watch(initialReturn: true)
        .map((books) => books.isEmpty ? null : books.first.toBook());
  }

  @override
  Future insertBook(Book book) async {
    await _db.writeTxn(() async {
      return await _db.isarBooks.put(
        IsarBook.fromBook(book).copyWith(
          lastUpdate: DateTime.now(),
        ),
      );
    });
  }

  @override
  Stream<List<Track>> getTracks() {
    return _db.isarTracks.where().watch(initialReturn: true).map((tracks) => tracks.map((track) => track.toTrack()).toList());
  }

  @override
  Future<int> deleteTracks(List<Track> tracks) async {
    return await _db.isarTracks.deleteAll(
        tracks.map((track) => (track as IsarTrack).isarId!).toList());
  }

  @override
  Future<Track?> getTrack(String id) async {
    return (await _db.isarTracks.where().filter().idEqualTo(id).findFirst())?.toTrack();
  }

  @override
  Future updateTrackDownloadProgress(String taskId, double progress) async {
    Track? track = await getTrackByDownloadTask(taskId);
    if (track != null) {
      await _db.writeTxn(() async {
        await _db.isarTracks.put(
          IsarTrack.fromTrack(track).copyWith(downloadProgress: progress),
        );
      });
    }
  }

  Map<String, BehaviorSubject<Map<String, Track>>> trackListeners = {};

  @override
  Stream<Map<String, Track>> getTracksForBookId(String bookId) {
    return _db.isarTracks
        .where()
        .filter()
        .bookIdEqualTo(bookId)
        .watch(initialReturn: true)
        .map((tracks) => {for (final track in tracks) track.id: track.toTrack()});
  }

  @override
  Future<Track?> getTrackByDownloadTask(String taskId) async {
    return ( await _db.isarTracks
        .where()
        .filter()
        .downloadTaskIdEqualTo(taskId)
        .findFirst())?.toTrack();
  }

  @override
  Future insertTrack(Track track) async {
    final dbTrack =
        await _db.isarTracks.filter().idEqualTo(track.id).findFirst();
    return _db.writeTxn(() async {
      final iTrack = IsarTrack.fromTrack(track);
      if (dbTrack != null) iTrack.isarId = dbTrack.isarId;
      return _db.isarTracks.put(iTrack);
    });
  }

  @override
  Future insertTracks(List<Track> tracks) {
    return _db.writeTxn(() async {
      return _db.isarTracks.putAll(tracks.cast());
    });
  }

  @override
  Track getTrackFromMediaItem(
    MediaItem chapter,
    String bookId,
    double progress,
    String path, [
    String downloadTaskId = '',
  ]) =>
      Track(
        chapter.id,
        chapter.title,
        chapter.duration ?? Duration.zero,
        progress,
        progress == 1,
        path,
        bookId,
        downloadTaskId,
        0,
      );

  @override
  Book getBookFromMediaItem(
    MediaItem book,
    bool downloadRequested,
    bool downloadCompleted,
    bool downloadFailed,
  ) =>
      Book(
        book.id.hashCode,
        book.id,
        book.title,
        book.artist ?? 'Unknown',
        book.narrator ?? 'Unkown',
        book.displayDescription ?? '',
        book.artUri.toString(),
        book.duration ?? Duration.zero,
        book.viewOffset,
        downloadRequested,
        downloadCompleted,
        downloadFailed,
        book.played,
        DateTime.now(),
      );

  @override
  Future deleteChapters(List<Chapter> chapters) async {
    if (chapters.isNotEmpty) {
      final bookId = chapters[0].bookId;
      final dbChapters =
          await _db.isarChapters.filter().bookIdEqualTo(bookId).findAll();
      await _db.writeTxn(() async {
        await _db.isarChapters
            .deleteAll(dbChapters.map((chapter) => chapter.isarId!).toList());
      });
    }
  }

  @override
  Future<List<Chapter>> getChaptersForBook(int bookId) async {
    return _db.isarChapters.where().filter().bookIdEqualTo(bookId).findAll();
  }

  @override
  Future insertChapter(Chapter chapter) async {
    return _db.writeTxn(() async {
      return _db.isarChapters.put(IsarChapter.fromChapter(chapter));
    });
  }

  @override
  Future insertChapters(List<Chapter> chapters) {
    return _db.writeTxn(() async {
      return _db.isarChapters.putAll(
          [for (final chapter in chapters) IsarChapter.fromChapter(chapter)]);
    });
  }

  @override
  Future deleteBook(Book book) async {
    return _db.writeTxn(() async {
        await _db.isarBooks.delete(book.id.hashCode);
    });
  }
}
