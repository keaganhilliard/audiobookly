import 'package:audiobookly/models/book.dart';
import 'package:audiobookly/models/download_status.dart';
import 'package:isar/isar.dart';

part 'isar_book.g.dart';

@Collection()
class IsarBook {
  final Id id;
  final String exId;
  final String title;
  final String author;
  final String narrator;
  final String description;
  final String artPath;
  @ignore
  Duration get duration => Duration(microseconds: isarDuration);
  final int isarDuration;
  @ignore
  Duration get lastPlayedPosition =>
      Duration(microseconds: isarLastPlayedPosition);
  final int isarLastPlayedPosition;
  @enumerated
  final DownloadStatus downloadStatus;
  final bool downloadRequested;
  final bool downloadCompleted;
  final bool downloadFailed;
  final bool read;
  @ignore
  DateTime? get lastUpdate => isarLastUpdate == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(isarLastUpdate!);
  final int? isarLastUpdate;

  Book toBook() => Book(
        id,
        exId,
        title,
        author,
        narrator,
        description,
        artPath,
        duration,
        lastPlayedPosition,
        downloadRequested,
        downloadCompleted,
        downloadFailed,
        read,
        lastUpdate,
        downloadStatus,
      );

  IsarBook(
    this.id,
    this.exId,
    this.title,
    this.author,
    this.narrator,
    this.description,
    this.artPath,
    this.isarDuration,
    this.isarLastPlayedPosition,
    this.downloadRequested,
    this.downloadCompleted,
    this.downloadFailed,
    this.read,
    this.isarLastUpdate, [
    this.downloadStatus = DownloadStatus.none,
  ]);

  IsarBook copyWith({
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
      IsarBook(
        id ?? this.id,
        exId ?? this.exId,
        title ?? this.title,
        author ?? this.author,
        narrator ?? this.narrator,
        description ?? this.description,
        artPath ?? this.artPath,
        duration?.inMicroseconds ?? isarDuration,
        lastPlayedPosition?.inMicroseconds ?? isarLastPlayedPosition,
        downloadRequested ?? this.downloadRequested,
        downloadCompleted ?? this.downloadCompleted,
        downloadFailed ?? this.downloadFailed,
        read ?? this.read,
        lastUpdate?.millisecondsSinceEpoch ?? isarLastUpdate,
        downloadStatus ?? this.downloadStatus,
      );


    factory IsarBook.fromBook(Book book) => IsarBook(
      book.id,
      book.exId,
      book.title,
      book.author,
      book.narrator,
      book.description,
      book.artPath,
      book.duration.inMicroseconds,
      book.lastPlayedPosition.inMicroseconds,
      book.downloadRequested,
      book.downloadCompleted,
      book.downloadFailed,
      book.read,
      book.lastUpdate?.millisecondsSinceEpoch,
    );
}
