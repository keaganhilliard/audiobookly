import 'package:audiobookly/isar/datetime_converter.dart';
import 'package:audiobookly/isar/duration_converter.dart';
import 'package:audiobookly/models/book.dart';
import 'package:isar/isar.dart';

part 'isar_book.g.dart';

@Collection()
class IsarBook implements Book {
  @Id()
  int? isarId;

  @override
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
  @DurationConverter()
  final Duration duration;

  @override
  @DurationConverter()
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
  @DateTimeConverter()
  final DateTime? lastUpdate;

  IsarBook(
    this.isarId,
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
  IsarBook copyWith({
    int? isarId,
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
      IsarBook(
        isarId ?? this.isarId,
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
        lastUpdate ?? this.lastUpdate,
      );
}
