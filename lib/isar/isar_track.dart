import 'package:audiobookly/models/track.dart';
import 'package:isar/isar.dart';
import './duration_converter.dart';

part 'isar_track.g.dart';

@Collection()
class IsarTrack implements Track {
  @Id()
  int? isarId;

  @override
  final String id;

  @override
  final String title;

  @override
  @DurationConverter()
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

  IsarTrack(
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
  IsarTrack copyWith({
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
      IsarTrack(
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
