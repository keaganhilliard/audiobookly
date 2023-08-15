import 'package:audiobookly/models/track.dart';
import 'package:isar/isar.dart';

part 'isar_track.g.dart';

@Collection()
class IsarTrack {
  Id? isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  final String id;

  final String title;

  @ignore
  Duration get duration => Duration(microseconds: isarDuration);

  final int isarDuration;

  final double downloadProgress;

  final bool isDownloaded;

  final DateTime? downloadedAt;

  final String downloadPath;
  final String serverPath;

  @Index()
  final String bookId;

  @Index(unique: true)
  final String downloadTaskId;

  final int downloadTaskStatus;

  Track toTrack() => Track(
        id: id,
        title: title,
        duration: duration,
        downloadProgress: downloadProgress,
        isDownloaded: isDownloaded,
        downloadedAt: downloadedAt,
        downloadPath: downloadPath,
        serverPath: serverPath,
        bookId: bookId,
        downloadTaskId: downloadTaskId,
        downloadTaskStatus: downloadTaskStatus,
      );

  IsarTrack(
    this.id,
    this.title,
    this.isarDuration,
    this.downloadProgress,
    this.isDownloaded,
    this.downloadedAt,
    this.downloadPath,
    this.serverPath,
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
    DateTime? downloadedAt,
    String? downloadPath,
    String? serverPath,
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
        downloadedAt ?? this.downloadedAt,
        downloadPath ?? this.downloadPath,
        serverPath ?? this.serverPath,
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
        track.downloadedAt,
        track.downloadPath,
        track.serverPath,
        track.bookId,
        track.downloadTaskId,
        track.downloadTaskStatus,
        null,
      );
}
