import 'package:audiobookly/database/entity/download_task.dart';
import 'package:floor/floor.dart';

@dao
abstract class DownloadTaskDao {
  @Query('SELECT * FROM downloads')
  Stream<List<DownloadTask>> findAllDownloads();

  @Query('SELECT * FROM downloads WHERE id = :id')
  Stream<DownloadTask?> findDownloadById(int id);

  @Query('SELECT * FROM downloads WHERE trackId in (:trackIds)')
  Stream<List<DownloadTask>> findDownloadsForTrackIds(List<int> trackIds);

  @insert
  Future<void> insertDownloadTask(DownloadTask task);
}
