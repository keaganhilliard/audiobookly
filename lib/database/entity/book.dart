import 'package:audiobookly/database/entity/track.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'books')
class Book {
  @PrimaryKey()
  final String id;
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

  @ignore
  List<Track>? tracks;

  Book(
    this.id,
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
  );

  Book copyWith({
    String? id,
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
        downloadRequested ?? this.downloadRequested,
        downloadCompleted ?? this.downloadCompleted,
        downloadFailed ?? this.downloadFailed,
        read ?? this.read,
      );
}
