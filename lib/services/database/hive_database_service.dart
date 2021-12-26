import 'dart:async';
import 'dart:developer';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/hive/hive_book.dart';
import 'package:audiobookly/hive/hive_chapter.dart';
import 'package:audiobookly/hive/hive_track.dart';
import 'package:audiobookly/hive/type_adapters/datetime_adapter.dart';
import 'package:audiobookly/hive/type_adapters/duration_adapter.dart';
import 'package:audiobookly/models/book.dart';
import 'package:audiobookly/models/chapter.dart';
import 'package:audiobookly/models/track.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:rxdart/subjects.dart';

Future initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DateTimeAdapter());
  Hive.registerAdapter(DurationAdapter());
  Hive.registerAdapter(HiveBookAdapter());
  Hive.registerAdapter(HiveTrackAdapter());
  Hive.registerAdapter(HiveChapterAdapter());
  await Hive.openBox<HiveBook>('books');
  await Hive.openBox<HiveTrack>('tracks');
  await Hive.openBox<HiveChapter>('chapters');
}

class HiveDatabaseService implements DatabaseService {
  final Box<HiveBook> _bookBox;
  final Box<HiveTrack> _trackBox;
  final Box<HiveChapter> _chapterBox;

  HiveDatabaseService({
    required Box<HiveBook> bookBox,
    required Box<HiveTrack> trackBox,
    required Box<HiveChapter> chapterBox,
  })  : _bookBox = bookBox,
        _trackBox = trackBox,
        _chapterBox = chapterBox;

  @override
  Stream<List<Book>> getBooks() {
    StreamSubscription? subscription;
    final subject =
        BehaviorSubject.seeded(_bookBox.values.toList(), onCancel: () {
      print('Cancelled');
      subscription?.cancel();
    });
    subscription = _bookBox.watch().listen((event) {
      subject.add(_bookBox.values.toList());
    });
    return subject;
  }

  @override
  Future<Book?> getBookById(String id) async {
    return _bookBox.get(id);
  }

  @override
  Stream<Book?> watchBookById(String id) {
    StreamSubscription? subscription;
    final subject = BehaviorSubject.seeded(_bookBox.get(id), onCancel: () {
      subscription?.cancel();
    });
    subscription = _bookBox.watch(key: id).listen((event) {
      subject.add(_bookBox.get(id));
    });
    return subject;
  }

  @override
  Future insertBook(Book book) async {
    return await _bookBox.put(
        book.id, book.copyWith(lastUpdate: DateTime.now()) as HiveBook);
  }

  @override
  Stream<List<Track>> getTracks() {
    return _trackBox.watch().map((event) => _trackBox.values.toList());
  }

  @override
  Future<int> deleteTracks(List<Track> tracks) async {
    await _trackBox.deleteAll(tracks.map((e) => e.id));
    return tracks.length;
  }

  @override
  Future<Track?> getTrack(String id) async {
    return _trackBox.get(id);
  }

  @override
  Future updateTrackDownloadProgress(String taskId, double progress) async {
    Track? track = await getTrackByDownloadTask(taskId);
    if (track != null) {
      await _trackBox.put(
          track.id, (track as HiveTrack).copyWith(downloadProgress: progress));
    }
  }

  Map<String, BehaviorSubject<Map<String, Track>>> trackListeners = {};
  StreamSubscription? _trackSubscription;

  @override
  Stream<Map<String, Track>> getTracksForBookId(String bookId) {
    StreamSubscription? subscription;
    Map<String, Track> tracks = {};
    for (final track in _trackBox.values) {
      if (track.bookId == bookId) {
        tracks.putIfAbsent(track.id, () => track);
      }
    }
    final subject = BehaviorSubject.seeded(tracks, onCancel: () {
      subscription?.cancel();
    });
    subscription = _trackBox
        .watch()
        .where((event) => _trackBox.get(event.key)?.bookId == bookId)
        .listen((event) {
      Map<String, Track> tracks = {};
      for (final track in _trackBox.values) {
        if (track.bookId == bookId) {
          tracks.putIfAbsent(track.id, () => track);
        }
      }
      subject.add(tracks);
    });
    return subject;
  }

  @override
  Future<Track?> getTrackByDownloadTask(String taskId) async {
    for (final track in _trackBox.values) {
      if (track.downloadTaskId == taskId) return track;
    }
    return null;
  }

  @override
  Future insertTrack(Track track) {
    return _trackBox.put(track.id, track as HiveTrack);
  }

  @override
  Future insertTracks(List<Track> tracks) {
    return _trackBox
        .putAll({for (var track in tracks.cast<HiveTrack>()) track.id: track});
  }

  @override
  Track getTrackFromMediaItem(
    MediaItem chapter,
    String bookId,
    double progress,
    String path, [
    String downloadTaskId = '',
  ]) =>
      HiveTrack(
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
      HiveBook(
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
    await _chapterBox.deleteAll(
        [for (final chapter in chapters) '${chapter.bookId}.${chapter.id}']);
  }

  @override
  Future<List<Chapter>> getChaptersForBook(String bookId) async {
    List<Chapter> chapters = [];
    for (final chapter in _chapterBox.values) {
      if (chapter.bookId == bookId) {
        chapters.add(chapter);
      }
    }
    return chapters;
  }

  @override
  Future insertChapter(Chapter chapter) async {
    return _chapterBox.put(
      '${chapter.bookId}.${chapter.id}',
      HiveChapter.fromChapter(chapter),
    );
  }

  @override
  Future insertChapters(List<Chapter> chapters) {
    return _chapterBox.putAll({
      for (var chapter in chapters)
        '${chapter.bookId}.${chapter.id}': HiveChapter.fromChapter(chapter)
    });
  }

  @override
  Future deleteBook(Book book) async {
    await _bookBox.delete(book.id);
  }
}
