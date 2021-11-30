import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/database/database.dart';
import 'package:audiobookly/database/entity/sql_book.dart';
import 'package:audiobookly/database/entity/download_task.dart';
import 'package:audiobookly/database/entity/sql_chapter.dart';
import 'package:audiobookly/database/entity/sql_track.dart';
import 'package:audiobookly/models/book.dart';
import 'package:audiobookly/models/chapter.dart';
import 'package:audiobookly/models/track.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/utils/utils.dart';

final Provider<SqlDatabaseService> databaseServiceProvider =
    Provider<SqlDatabaseService>(((ref) => throw UnimplementedError()));

class SqlDatabaseService implements DatabaseService {
  final AppDatabase _db;

  SqlDatabaseService(this._db);

  @override
  Stream<List<Book>> getBooks() {
    return _db.bookDao.getAllDownloadedBooks();
  }

  @override
  Future<Book?> getBookById(String id) async {
    return await _db.bookDao.findBookById(id).first;
  }

  @override
  Stream<Book?> watchBookById(String id) {
    return _db.bookDao.findBookById(id);
  }

  @override
  Future insertBook(Book book) {
    return _db.bookDao.insertBook(book as SqlBook);
  }

  Stream<List<DownloadTask>> getDownloadTasks() {
    return _db.downloadTaskDao.findAllDownloads();
  }

  Future insertDownloadTask(DownloadTask task) {
    return _db.downloadTaskDao.insertDownloadTask(task);
  }

  @override
  Stream<List<Track>> getTracks() {
    return _db.trackDao.findAllTracks();
  }

  @override
  Future<int> deleteTracks(List<Track> tracks) async {
    return _db.trackDao.deleteTracks(tracks.cast());
  }

  @override
  Future<Track?> getTrack(String id) {
    return _db.trackDao.findTrackById(id).first;
  }

  @override
  Future updateTrackDownloadProgress(String taskId, double progress) async {
    return _db.trackDao.updateProgress(taskId, progress);
  }

  @override
  Stream<Map<String, Track>> getTracksForBookId(String bookId) {
    return _db.trackDao
        .streamTracksForBookId(bookId)
        .map((tracks) => {for (var track in tracks) track.id: track});
  }

  @override
  Future<Track?> getTrackByDownloadTask(String taskId) {
    return _db.trackDao.findTracksForDownloadTaskId(taskId);
  }

  @override
  Future insertTrack(Track track) {
    return _db.trackDao.insertTrack(track as SqlTrack);
  }

  @override
  Future insertTracks(List<Track> tracks) {
    return _db.trackDao.insertTracks(tracks.cast());
  }

  @override
  Track getTrackFromMediaItem(
    MediaItem chapter,
    String bookId,
    double progress,
    String path, [
    String downloadTaskId = '',
  ]) =>
      SqlTrack(
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
      SqlBook(
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

  @override
  Future deleteChapters(List<Chapter> chapters) async {
    await _db.chapterDao.deleteChapters(
      [for (final chapter in chapters) SqlChapter.fromChapter(chapter)],
    );
  }

  @override
  Future<List<Chapter>> getChaptersForBook(String bookId) async {
    return [
      for (final chapter in await _db.chapterDao.findChaptersForBookId(bookId))
        Chapter.fromJson(chapter.toJson(), bookId)
    ];
  }

  @override
  Future insertChapter(Chapter chapter) async {
    return await _db.chapterDao.insertChapter(SqlChapter.fromChapter(chapter));
  }

  @override
  Future insertChapters(List<Chapter> chapters) async {
    print('Inserting chapters: ${chapters.length}');
    return await _db.chapterDao.insertChapters(
      [for (final chapter in chapters) SqlChapter.fromChapter(chapter)],
    );
  }
}
