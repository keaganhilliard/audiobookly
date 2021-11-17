import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/hive/hive_book.dart';
import 'package:audiobookly/hive/hive_track.dart';
import 'package:audiobookly/hive/type_adapters/duration_adapter.dart';
import 'package:audiobookly/models/book.dart';
import 'package:audiobookly/models/track.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:plex_api/plex_api.dart';
import 'package:rxdart/subjects.dart';

Future initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DurationAdapter());
  Hive.registerAdapter(HiveBookAdapter());
  Hive.registerAdapter(HiveTrackAdapter());
  await Hive.openBox<HiveBook>('books');
  await Hive.openBox<HiveTrack>('tracks');
}

class HiveDatabaseService implements DatabaseService {
  final Box<HiveBook> _bookBox;
  final Box<HiveTrack> _trackBox;

  HiveDatabaseService(this._bookBox, this._trackBox);

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
    return await _bookBox.put(book.id, book as HiveBook);
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
    HiveTrack track = _trackBox.values
        .firstWhere((element) => element.downloadTaskId == taskId);
    await _trackBox.put(track.id, track.copyWith(downloadProgress: progress));
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
    // _trackSubscription ??= _trackBox.watch().listen((event) {
    //   Map<String, Map<String, Track>> bookToTrack = {};
    //   for (final track in _trackBox.values) {
    //     bookToTrack
    //         .putIfAbsent(track.bookId, () => <String, Track>{})
    //         .putIfAbsent(track.id, () => track);
    //   }

    //   for (var subject in trackListeners.entries) {
    //     if (bookToTrack.containsKey(subject.key)) {
    //       subject.value.add(bookToTrack[subject.key]!);
    //     }
    //   }
    // });
    // return trackListeners.putIfAbsent(
    //     bookId,
    //     () => BehaviorSubject.seeded({
    //           for (var track
    //               in _trackBox.values.where((track) => track.bookId == bookId))
    //             track.id: track
    //         }));
  }

  @override
  Future<Track?> getTrackByDownloadTask(String taskId) async {
    return _trackBox.values
        .firstWhere((element) => element.downloadTaskId == taskId);
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
      );
}
