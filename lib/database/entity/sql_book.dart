import 'package:audiobookly/database/entity/sql_track.dart';
import 'package:audiobookly/models/book.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'books')
class SqlBook implements Book {
  @override
  @PrimaryKey()
  final String id;
  @override
  final String title;
  @override
  final String author;
  @override
  final String narrator;
  @override
  final String description;
  @override
  final String artPath;
  @override
  final Duration duration;
  @override
  final Duration lastPlayedPosition;
  @override
  final bool downloadRequested;
  @override
  final bool downloadCompleted;
  @override
  final bool downloadFailed;
  @override
  final bool read;
  @override
  final DateTime? lastUpdate;

  SqlBook(
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
    this.lastUpdate,
  );

  @override
  SqlBook copyWith({
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
    DateTime? lastUpdate,
  }) =>
      SqlBook(
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
          lastUpdate ?? this.lastUpdate);
}
