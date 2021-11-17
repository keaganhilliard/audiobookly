import 'package:audiobookly/database/entity/sql_track.dart';
import 'package:floor/floor.dart';

@dao
abstract class TrackDao {
  @Query('SELECT * FROM tracks')
  Stream<List<SqlTrack>> findAllTracks();

  @Query('SELECT * FROM tracks WHERE id = :id')
  Stream<SqlTrack?> findTrackById(String id);

  @Query('SELECT * FROM tracks WHERE bookId = :bookId')
  Future<List<SqlTrack>> findTracksForBookId(String bookId);

  @Query('SELECT * FROM tracks WHERE downloadTaskId = :taskId')
  Future<SqlTrack?> findTracksForDownloadTaskId(String taskId);

  @Query('SELECT * FROM tracks WHERE bookId = :bookId')
  Stream<List<SqlTrack>> streamTracksForBookId(String bookId);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertTrack(SqlTrack track);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertTracks(List<SqlTrack> track);

  @delete
  Future<int> deleteTracks(List<SqlTrack> tracks);

  @Query(
    'UPDATE tracks SET downloadProgress = :progress WHERE downloadTaskId = :taskId',
  )
  Future<SqlTrack?> updateProgress(String taskId, double progress);
}
