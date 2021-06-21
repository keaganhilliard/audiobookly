import 'package:audiobookly/database/entity/track.dart';
import 'package:floor/floor.dart';

@dao
abstract class TrackDao {
  @Query('SELECT * FROM tracks')
  Stream<List<Track>> findAllTracks();

  @Query('SELECT * FROM tracks WHERE id = :id')
  Stream<Track?> findTrackById(int id);

  @Query('SELECT * FROM tracks WHERE bookId = :bookId')
  Future<List<Track>> findTracksForBookId(String bookId);

  @Query('SELECT * FROM tracks WHERE bookId = :bookId')
  Stream<List<Track>> streamTracksForBookId(String bookId);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertTrack(Track track);
}
