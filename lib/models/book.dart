import 'package:audiobookly/models/download_status.dart';

class Book {
  final String id;
  final String title;
  final String author;
  final String narrator;
  final String description;
  final String artPath;
  final Duration duration;
  final Duration lastPlayedPosition;
  final bool read;
  final DownloadStatus downloadStatus;
  final DateTime? lastUpdate;

  Book(
    this.id,
    this.title,
    this.author,
    this.narrator,
    this.description,
    this.artPath,
    this.duration,
    this.lastPlayedPosition,
    this.read,
    this.lastUpdate, [
    this.downloadStatus = DownloadStatus.none,
  ]);

  Book copyWith({
    String? id,
    String? title,
    String? author,
    String? narrator,
    String? description,
    String? artPath,
    Duration? duration,
    Duration? lastPlayedPosition,
    bool? read,
    DateTime? lastUpdate,
    DownloadStatus? downloadStatus,
  }) =>
      Book(
        id ?? this.id,
        title ?? this.title,
        author ?? this.author,
        narrator ?? this.narrator,
        description ?? this.description,
        artPath ?? this.artPath,
        duration ?? this.duration,
        lastPlayedPosition ?? this.lastPlayedPosition,
        read ?? this.read,
        lastUpdate ?? this.lastUpdate,
        downloadStatus ?? this.downloadStatus,
      );

  @override
  String toString() =>
      'Book(id: $id, title: $title, author: $author, narrator: $narrator, description: $description, artPath: $artPath, duration: $duration, lastPlayedPosition: $lastPlayedPosition, read: $read, lastUpdate: $lastUpdate, downloadStatus: $downloadStatus)';
}
