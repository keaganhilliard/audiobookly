import 'package:audiobookly/database/entity/sql_track.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'downloads', foreignKeys: [
  ForeignKey(childColumns: ['trackId'], parentColumns: ['id'], entity: SqlTrack)
])
class DownloadTask {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final double progress;
  final String status;
  final String path;
  final String url;
  final int trackId;

  DownloadTask(
    this.id,
    this.progress,
    this.status,
    this.path,
    this.url,
    this.trackId,
  );
}
