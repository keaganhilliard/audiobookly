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
import 'package:isar_connect/isar_connect.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/subjects.dart';

Future<Isar> initIsar() async {
  initializeIsarConnect();
  return await Isar.open(
      schemas: [IsarBookSchema, IsarChapterSchema, IsarTrackSchema],
      directory: (await getApplicationSupportDirectory()).path);
}

class IsarDatabaseService implements DatabaseService {
  final Isar _db;

  IsarDatabaseService({
    required Isar db,
  }) : _db = db;

  @override
  Stream<List<Book>> getBooks() {
    return _db.isarBooks.where().watch(initialReturn: true);
  }

  @override
  Future<Book?> getBookById(String id) async {
    return _db.isarBooks.where().filter().idEqualTo(id).findFirst();
  }

  @override
  Stream<Book?> watchBookById(String id) {
    return _db.isarBooks
        .where()
        .filter()
        .idEqualTo(id)
        .watch(initialReturn: true)
        .map((books) => books.isEmpty ? null : books.first);
  }

  @override
  Future insertBook(Book book) async {
    await _db.writeTxn((isar) async {
      return await _db.isarBooks.put(
          (book as IsarBook).copyWith(lastUpdate: DateTime.now()),
          replaceOnConflict: true);
    });
  }

  @override
  Stream<List<Track>> getTracks() {
    return _db.isarTracks.where().watch(initialReturn: true);
  }

  @override
  Future<int> deleteTracks(List<Track> tracks) async {
    return await _db.isarTracks.deleteAll(
        tracks.map((track) => (track as IsarTrack).isarId!).toList());
  }

  @override
  Future<Track?> getTrack(String id) async {
    return _db.isarTracks.where().filter().idEqualTo(id).findFirst();
  }

  @override
  Future updateTrackDownloadProgress(String taskId, double progress) async {
    Track? track = await getTrackByDownloadTask(taskId);
    if (track != null) {
      await _db.writeTxn((isar) async {
        await _db.isarTracks.put(
          (track as IsarTrack).copyWith(downloadProgress: progress),
          replaceOnConflict: true,
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
        .map((tracks) => {for (final track in tracks) track.id: track});
  }

  @override
  Future<Track?> getTrackByDownloadTask(String taskId) async {
    return _db.isarTracks
        .where()
        .filter()
        .downloadTaskIdEqualTo(taskId)
        .findFirst();
  }

  @override
  Future insertTrack(Track track) {
    return _db.writeTxn((isar) async {
      return _db.isarTracks.put(track as IsarTrack, replaceOnConflict: true);
    });
  }

  @override
  Future insertTracks(List<Track> tracks) {
    return _db.writeTxn((isar) async {
      return _db.isarTracks.putAll(tracks.cast(), replaceOnConflict: true);
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
      IsarTrack(
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
      IsarBook(
        null,
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
    await _db.isarChapters.deleteAll(chapters.cast());
  }

  @override
  Future<List<Chapter>> getChaptersForBook(String bookId) async {
    return _db.isarChapters.where().filter().bookIdEqualTo(bookId).findAll();
  }

  @override
  Future insertChapter(Chapter chapter) async {
    return _db.writeTxn((isar) async {
      return _db.isarChapters.put(chapter as IsarChapter);
    });
  }

  @override
  Future insertChapters(List<Chapter> chapters) {
    return _db.writeTxn((isar) async {
      return _db.isarChapters.putAll(
          [for (final chapter in chapters) IsarChapter.fromChapter(chapter)]);
    });
  }

  @override
  Future deleteBook(Book book) async {
    return _db.writeTxn((isar) async {
      await _db.isarBooks.delete((book as IsarBook).isarId!);
    });
  }
}
