import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/models/chapter.dart';
import 'package:audiobookly/models/download_status.dart';
import 'package:audiobookly/utils/utils.dart';

class Book {
  final String id;
  final String title;
  final String author;
  final List<({String id, String name})>? authors;
  final List<({String id, String name, String position})>? series;
  final String narrator;
  final String description;
  final String artPath;
  final String? largeArtPath;
  final Duration duration;
  final Duration lastPlayedPosition;
  final bool read;
  final String? publishedYear;
  final DownloadStatus downloadStatus;
  final DateTime? lastUpdate;
  final DateTime? downloadedAt;
  final List<Chapter>? chapters;
  double get progress {
    if (duration == Duration.zero) {
      return 0;
    }
    return lastPlayedPosition.inMilliseconds / duration.inMilliseconds;
  }

  Book({
    required this.id,
    required this.title,
    required this.author,
    this.authors,
    this.series,
    this.publishedYear,
    required this.narrator,
    required this.description,
    required this.artPath,
    required this.duration,
    required this.lastPlayedPosition,
    required this.read,
    this.lastUpdate,
    this.downloadedAt,
    this.largeArtPath,
    this.chapters,
    this.downloadStatus = DownloadStatus.none,
  });

  Book copyWith({
    String? id,
    String? title,
    String? author,
    List<({String id, String name})>? authors,
    List<({String id, String name, String position})>? series,
    String? narrator,
    String? description,
    String? artPath,
    String? largeArtPath,
    Duration? duration,
    Duration? lastPlayedPosition,
    bool? read,
    DateTime? lastUpdate,
    DateTime? downloadedAt,
    List<Chapter>? chapters,
    DownloadStatus? downloadStatus,
    String? publishedYear,
  }) =>
      Book(
        id: id ?? this.id,
        title: title ?? this.title,
        author: author ?? this.author,
        authors: authors ?? this.authors,
        series: series ?? this.series,
        narrator: narrator ?? this.narrator,
        description: description ?? this.description,
        artPath: artPath ?? this.artPath,
        duration: duration ?? this.duration,
        lastPlayedPosition: lastPlayedPosition ?? this.lastPlayedPosition,
        read: read ?? this.read,
        lastUpdate: lastUpdate ?? this.lastUpdate,
        downloadedAt: downloadedAt ?? this.downloadedAt,
        largeArtPath: largeArtPath ?? this.largeArtPath,
        chapters: chapters ?? this.chapters,
        downloadStatus: downloadStatus ?? this.downloadStatus,
        publishedYear: publishedYear ?? this.publishedYear,
      );
  MediaItem toMediaItem() => MediaItem(
        id: id,
        title: title,
        album: title,
        artist: author,
        displayDescription: description,
        playable: true,
        artUri: artPath.uri,
        duration: duration,
        extras: <String, dynamic>{
          'cached': downloadStatus == DownloadStatus.succeeded,
          'played': read,
          'narrator': narrator,
          'viewOffset': lastPlayedPosition.inMilliseconds,
          'largeThumbnail': largeArtPath,
          if (chapters != null)
            'chapters': [
              for (final chapter in chapters!) chapter.toJson(),
            ]
        },
      );

  @override
  String toString() =>
      'Book(id: $id, title: $title, author: $author, narrator: $narrator, description: $description, artPath: $artPath, duration: $duration, lastPlayedPosition: $lastPlayedPosition, read: $read, lastUpdate: $lastUpdate, downloadStatus: $downloadStatus)';
}
