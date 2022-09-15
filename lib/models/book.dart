import 'package:audiobookly/models/download_status.dart';

class Book {
  final int id;
  final String exId;
  final String title;
  final String author;
  final String narrator;
  final String description;
  final String artPath;
  final Duration duration;
  final Duration lastPlayedPosition;
  final bool downloadRequested;
  final bool downloadCompleted;
  final bool downloadFailed;
  final bool read;
  final DownloadStatus downloadStatus;
  final DateTime? lastUpdate;

  Book(
    this.id,
    this.exId,
    this.title,
    this.author,
    this.narrator,
    this.description,
    this.artPath,
    this.duration,
    this.lastPlayedPosition,
    this.downloadRequested,
    this.downloadCompleted,
    this.downloadFailed,
    this.read,
    this.lastUpdate, [
    this.downloadStatus = DownloadStatus.none,
  ]);

  Book copyWith({
    int? id,
    String? exId,
    String? title,
    String? author,
    String? narrator,
    String? description,
    String? artPath,
    Duration? duration,
    Duration? lastPlayedPosition,
    bool? downloadRequested,
    bool? downloadCompleted,
    bool? downloadFailed,
    bool? read,
    DateTime? lastUpdate,
    DownloadStatus? downloadStatus,
  }) =>
      Book(
        id ?? this.id,
        exId ?? this.exId,
        title ?? this.title,
        author ?? this.author,
        narrator ?? this.narrator,
        description ?? this.description,
        artPath ?? this.artPath,
        duration ?? this.duration,
        lastPlayedPosition ?? this.lastPlayedPosition,
        downloadRequested ?? this.downloadRequested,
        downloadCompleted ?? this.downloadCompleted,
        downloadFailed ?? this.downloadFailed,
        read ?? this.read,
        lastUpdate ?? this.lastUpdate,
        downloadStatus ?? this.downloadStatus,
      );
}
