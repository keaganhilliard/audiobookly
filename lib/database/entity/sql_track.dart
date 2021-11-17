import 'package:audiobookly/models/track.dart';
import 'package:floor/floor.dart';
import 'package:audiobookly/database/entity/sql_book.dart';

@Entity(tableName: 'tracks', foreignKeys: [
  ForeignKey(childColumns: ['bookId'], parentColumns: ['id'], entity: SqlBook)
])
class SqlTrack implements Track {
  @override
  @PrimaryKey()
  final String id;
  @override
  final String title;
  @override
  final Duration duration;
  @override
  final double downloadProgress;
  @override
  final bool isDownloaded;
  @override
  final String downloadPath;
  @override
  final String bookId;
  @override
  final String downloadTaskId;
  @override
  final int downloadTaskStatus;

  SqlTrack(
    this.id,
    this.title,
    this.duration,
    this.downloadProgress,
    this.isDownloaded,
    this.downloadPath,
    this.bookId,
    this.downloadTaskId,
    this.downloadTaskStatus,
  );

  @override
  SqlTrack copyWith({
    String? id,
    String? title,
    Duration? duration,
    double? downloadProgress,
    bool? isDownloaded,
    String? downloadPath,
    String? bookId,
    String? downloadTaskId,
    int? downloadTaskStatus,
  }) =>
      SqlTrack(
        id ?? this.id,
        title ?? this.title,
        duration ?? this.duration,
        downloadProgress ?? this.downloadProgress,
        isDownloaded ?? this.isDownloaded,
        downloadPath ?? this.downloadPath,
        bookId ?? this.bookId,
        downloadTaskId ?? this.downloadTaskId,
        downloadTaskStatus ?? this.downloadTaskStatus,
      );
}
