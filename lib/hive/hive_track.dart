import 'package:audiobookly/models/track.dart';
import 'package:hive/hive.dart';

part 'hive_track.g.dart';

@HiveType(typeId: 2)
class HiveTrack implements Track {
  @override
  @HiveField(0)
  final String id;

  @override
  @HiveField(1)
  final String title;

  @override
  @HiveField(2)
  final Duration duration;

  @override
  @HiveField(3)
  final double downloadProgress;

  @override
  @HiveField(4)
  final bool isDownloaded;

  @override
  @HiveField(5)
  final String downloadPath;

  @override
  @HiveField(6)
  final String bookId;

  @override
  @HiveField(7)
  final String downloadTaskId;

  @override
  @HiveField(8)
  final int downloadTaskStatus;

  HiveTrack(
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
  HiveTrack copyWith({
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
      HiveTrack(
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
