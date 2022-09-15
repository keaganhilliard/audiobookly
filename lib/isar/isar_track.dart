import 'package:audiobookly/models/track.dart';
import 'package:isar/isar.dart';

part 'isar_track.g.dart';

@Collection()
class IsarTrack {
  Id? isarId = isarAutoIncrementId;

  final String id;

  final String title;

  @ignore
  Duration get duration => Duration(microseconds: isarDuration);

  final int isarDuration;

  final double downloadProgress;

  final bool isDownloaded;

  final String downloadPath;

  final String bookId;

  final String downloadTaskId;

  final int downloadTaskStatus;

  Track toTrack() => Track(
        id,
        title,
        duration,
        downloadProgress,
        isDownloaded,
        downloadPath,
        bookId,
        downloadTaskId,
        downloadTaskStatus,
      );

  IsarTrack(
    this.id,
    this.title,
    this.isarDuration,
    this.downloadProgress,
    this.isDownloaded,
    this.downloadPath,
    this.bookId,
    this.downloadTaskId,
    this.downloadTaskStatus, [
    this.isarId,
  ]);

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
    Id? isarId,
  }) =>
      IsarTrack(
        id ?? this.id,
        title ?? this.title,
        duration?.inMicroseconds ?? isarDuration,
        downloadProgress ?? this.downloadProgress,
        isDownloaded ?? this.isDownloaded,
        downloadPath ?? this.downloadPath,
        bookId ?? this.bookId,
        downloadTaskId ?? this.downloadTaskId,
        downloadTaskStatus ?? this.downloadTaskStatus,
        isarId ?? this.isarId,
      );

      factory IsarTrack.fromTrack(Track track) => IsarTrack(
        track.id,
        track.title,
        track.duration.inMicroseconds,
        track.downloadProgress,
        track.isDownloaded,
        track.downloadPath,
        track.bookId,
        track.downloadTaskId,
        track.downloadTaskStatus,
        null,
      );
}