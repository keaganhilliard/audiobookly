import 'package:audiobookly/models/book.dart';
import 'package:hive/hive.dart';

part 'hive_book.g.dart';

@HiveType(typeId: 1)
class HiveBook implements Book {
  @override
  @HiveField(0)
  final String id;

  @override
  @HiveField(1)
  final String title;

  @override
  @HiveField(2)
  final String author;

  @override
  @HiveField(3)
  final String narrator;

  @override
  @HiveField(4)
  final String description;

  @override
  @HiveField(5)
  final String artPath;

  @override
  @HiveField(6)
  final Duration duration;

  @override
  @HiveField(7)
  final Duration lastPlayedPosition;

  @override
  @HiveField(8)
  final bool downloadRequested;

  @override
  @HiveField(9)
  final bool downloadCompleted;

  @override
  @HiveField(10)
  final bool downloadFailed;

  @override
  @HiveField(11)
  final bool read;

  @override
  @HiveField(13)
  final DateTime? lastUpdate;

  @HiveField(12)
  HiveList? tracks;

  HiveBook(
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
      this.lastUpdate);

  @override
  HiveBook copyWith({
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
      HiveBook(
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
