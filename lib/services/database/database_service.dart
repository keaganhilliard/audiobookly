import 'package:audiobookly/database/database.dart';
import 'package:audiobookly/database/entity/book.dart';
import 'package:audiobookly/database/entity/download_task.dart';
import 'package:audiobookly/database/entity/track.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final Provider<DatabaseService> databaseServiceProvider =
    Provider<DatabaseService>(((ref) => throw UnimplementedError()));

class DatabaseService {
  final AppDatabase _db;

  DatabaseService(this._db);

  Stream<List<Book>> getBooks() {
    return _db.bookDao.getAllDownloadedBooks();
  }

  Future<Book?> getBookById(String id) async {
    return await _db.bookDao.findBookById(id).first;
  }

  Stream<Book?> watchBookById(String id) {
    return _db.bookDao.findBookById(id);
  }

  Future insertBook(Book book) {
    return _db.bookDao.insertBook(book);
  }

  Stream<List<DownloadTask>> getDownloadTasks() {
    return _db.downloadTaskDao.findAllDownloads();
  }

  Future insertDownloadTask(DownloadTask task) {
    return _db.downloadTaskDao.insertDownloadTask(task);
  }

  Stream<List<Track>> getTracks() {
    return _db.trackDao.findAllTracks();
  }

  Future<int> deleteTracks(List<Track> tracks) async {
    return _db.trackDao.deleteTracks(tracks);
  }

  Future<Track?> getTrack(String id) {
    return _db.trackDao.findTrackById(id).first;
  }

  Future updateTrackDownloadProgress(String taskId, double progress) async {
    return _db.trackDao.updateProgress(taskId, progress);
  }

  Stream<Map<String, Track>> getTracksForBookId(String bookId) {
    return _db.trackDao
        .streamTracksForBookId(bookId)
        .map((tracks) => Map<String, Track>.fromIterable(
              tracks,
              key: (track) => track.id,
              value: (track) => track,
            ));
  }

  Future<Track?> getTrackByDownloadTask(String taskId) {
    return _db.trackDao.findTracksForDownloadTaskId(taskId);
  }

  Future insertTrack(Track track) {
    return _db.trackDao.insertTrack(track);
  }

  Future insertTracks(List<Track> tracks) {
    return _db.trackDao.insertTracks(tracks);
  }
}
