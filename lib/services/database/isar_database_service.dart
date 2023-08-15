import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/isar/isar_book.dart';
import 'package:audiobookly/isar/isar_chapter.dart';
import 'package:audiobookly/isar/isar_preferences.dart';
import 'package:audiobookly/isar/isar_track.dart';
import 'package:audiobookly/models/book.dart';
import 'package:audiobookly/models/chapter.dart';
import 'package:audiobookly/models/preferences.dart';
import 'package:audiobookly/models/track.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/subjects.dart';

Future<Isar> initIsar() async {
  return await Isar.open(
    [IsarBookSchema, IsarChapterSchema, IsarTrackSchema, IsarPreferencesSchema],
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
    return _db.isarBooks
        .where()
        .sortByDownloadedAtDesc()
        .watch(fireImmediately: true)
        .map((isarBooks) => isarBooks.map((book) => book.toBook()).toList());
  }

  @override
  Future<Book?> getBookById(String id) async {
    return (await _db.isarBooks.getByExId(id))?.toBook();
  }

  @override
  Stream<Book?> watchBookById(String id) {
    return _db.isarBooks
        .watchLazy(fireImmediately: true)
        .map((_) => _db.isarBooks.getByExIdSync(id)?.toBook());
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
    return _db.isarTracks
        .where()
        .watch(fireImmediately: true)
        .map((tracks) => tracks.map((track) => track.toTrack()).toList());
  }

  @override
  Future<int> deleteTracks(List<Track> tracks) async {
    int count = 0;
    await _db.writeTxn(() async {
      count = await _db.isarTracks
          .deleteAllById(tracks.map((track) => track.id).toList());
    });
    return count;
  }

  @override
  Future<Track?> getTrack(String id) async {
    return (await _db.isarTracks.getById(id))?.toTrack();
  }

  @override
  Future updateTrackDownloadProgress(
      String taskId, double progress, bool completed) async {
    IsarTrack? track = await _db.isarTracks.getByDownloadTaskId(taskId);
    if (track != null) {
      await _db.writeTxn(() async {
        await _db.isarTracks.put(
          track.copyWith(
            downloadProgress: progress,
            isDownloaded: completed,
            downloadedAt: completed ? DateTime.now() : null,
          ),
        );
      });
    }
  }

  Map<String, BehaviorSubject<Map<String, Track>>> trackListeners = {};

  @override
  Stream<List<Track>> getTracksForBookId(String bookId) {
    return _db.isarTracks
        .filter()
        .bookIdEqualTo(bookId)
        .watch(fireImmediately: true)
        .map(
          (tracks) => [
            for (final track in tracks) track.toTrack(),
          ],
        );
  }

  @override
  Future<Track?> getTrackByDownloadTask(String taskId) async {
    return (await _db.isarTracks.getByDownloadTaskId(taskId))?.toTrack();
  }

  @override
  Future insertTrack(Track track) async {
    return _db.writeTxn(() async {
      await _db.isarTracks.putById(IsarTrack.fromTrack(track));
    });
  }

  @override
  Future insertTracks(List<Track> tracks) async {
    return _db.writeTxn(() async {
      await _db.isarTracks.putAllById(
        tracks.map((track) => IsarTrack.fromTrack(track)).toList(),
      );
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
        id: chapter.id,
        title: chapter.title,
        duration: chapter.duration ?? Duration.zero,
        downloadProgress: progress,
        isDownloaded: progress == 1,
        downloadPath: path,
        serverPath: '',
        bookId: bookId,
        downloadTaskId: downloadTaskId,
        downloadTaskStatus: 0,
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
  Future<List<Chapter>> getChaptersForBook(String bookId) async {
    return _db.isarChapters
        .filter()
        .bookIdEqualTo(bookId)
        .sortByStart()
        .findAll();
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
      await _db.isarBooks.deleteByExId(book.id);
    });
  }

  @override
  Future insertPreferences(Preferences prefs) {
    return _db.writeTxn(() async {
      await _db.isarPreferences.put(IsarPreferences.fromPreferences(prefs));
    });
  }

  @override
  Preferences getPreferencesSync() {
    if (_db.isarPreferences.countSync() < 1) {
      _db.writeTxnSync(() => _db.isarPreferences.putSync(IsarPreferences()));
    }
    return _db.isarPreferences.getSync(0)!.toPreferences();
  }

  @override
  Stream<Preferences?> watchPreferences() {
    return _db.isarPreferences
        .watchObject(0)
        .map((prefs) => prefs?.toPreferences());
  }
}
