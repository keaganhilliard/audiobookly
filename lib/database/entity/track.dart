import 'package:floor/floor.dart';
import 'package:audiobookly/database/entity/book.dart';

@Entity(tableName: 'tracks', foreignKeys: [
  ForeignKey(childColumns: ['bookId'], parentColumns: ['id'], entity: Book)
])
class Track {
  @PrimaryKey()
  final String id;
  final String title;
  final Duration duration;
  final double downloadProgress;
  final bool isDownloaded;
  final String downloadPath;
  final String bookId;

  Track(
    this.id,
    this.title,
    this.duration,
    this.downloadProgress,
    this.isDownloaded,
    this.downloadPath,
    this.bookId,
  );
}
