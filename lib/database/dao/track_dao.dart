import 'package:audiobookly/database/entity/track.dart';
import 'package:floor/floor.dart';

@dao
abstract class TrackDao {
  @Query('SELECT * FROM tracks')
  Stream<List<Track>> findAllTracks();

  @Query('SELECT * FROM tracks WHERE id = :id')
  Stream<Track?> findTrackById(String id);

  @Query('SELECT * FROM tracks WHERE bookId = :bookId')
  Future<List<Track>> findTracksForBookId(String bookId);

  @Query('SELECT * FROM tracks WHERE downloadTaskId = :taskId')
  Future<Track?> findTracksForDownloadTaskId(String taskId);

  @Query('SELECT * FROM tracks WHERE bookId = :bookId')
  Stream<List<Track>> streamTracksForBookId(String bookId);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertTrack(Track track);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertTracks(List<Track> track);

  @delete
  Future<int> deleteTracks(List<Track> tracks);

  @Query(
    'UPDATE tracks SET downloadProgress = :progress WHERE downloadTaskId = :taskId',
  )
  Future<Track?> updateProgress(String taskId, double progress);
}
