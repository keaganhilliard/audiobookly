import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/models/book.dart';
import 'package:audiobookly/models/track.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final Provider<DatabaseService> databaseServiceProvider =
    Provider<DatabaseService>(((ref) => throw UnimplementedError()));

abstract class DatabaseService {
  DatabaseService();

  Stream<List<Book>> getBooks();
  Future<Book?> getBookById(String id);
  Stream<Book?> watchBookById(String id);
  Future insertBook(Book book);
  // Stream<List<DownloadTask>> getDownloadTasks();
  // Future insertDownloadTask(DownloadTask task);
  Stream<List<Track>> getTracks();
  Future<int> deleteTracks(List<Track> tracks);
  Future<Track?> getTrack(String id);
  Future updateTrackDownloadProgress(String taskId, double progress);
  Stream<Map<String, Track>> getTracksForBookId(String bookId);
  Future<Track?> getTrackByDownloadTask(String taskId);
  Future insertTrack(Track track);
  Future insertTracks(List<Track> tracks);

  Track getTrackFromMediaItem(
    MediaItem chapter,
    String bookId,
    double progress,
    String path, [
    String downloadTaskId = '',
  ]);

  Book getBookFromMediaItem(
    MediaItem book,
    bool downloadRequested,
    bool downloadCompleted,
    bool downloadFailed,
  );
}
