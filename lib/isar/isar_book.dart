import 'package:audiobookly/models/book.dart';
import 'package:audiobookly/models/download_status.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:isar/isar.dart';

part 'isar_book.g.dart';

@Collection()
class IsarBook {
  Id get id => exId.fastHash;

  @Index(unique: true, replace: true)
  final String exId;
  final String title;
  final String author;
  final List<IsarAuthor> authors;
  final List<IsarSeries> series;
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
  final bool read;
  @ignore
  DateTime? get lastUpdate => isarLastUpdate == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(isarLastUpdate!);
  final int? isarLastUpdate;

  final DateTime? downloadedAt;

  Book toBook() => Book(
        id: exId,
        title: title,
        author: author,
        authors:
            authors.map((e) => (id: e.id ?? '', name: e.name ?? '')).toList(),
        series: series
            .map((e) => (
                  id: e.id ?? '',
                  name: e.name ?? '',
                  position: e.position ?? ''
                ))
            .toList(),
        narrator: narrator,
        description: description,
        artPath: artPath,
        duration: duration,
        lastPlayedPosition: lastPlayedPosition,
        read: read,
        lastUpdate: lastUpdate,
        downloadStatus: downloadStatus,
        downloadedAt: downloadedAt,
      );

  IsarBook(
    this.exId,
    this.title,
    this.author,
    this.authors,
    this.series,
    this.narrator,
    this.description,
    this.artPath,
    this.isarDuration,
    this.isarLastPlayedPosition,
    this.read,
    this.isarLastUpdate,
    this.downloadedAt, [
    this.downloadStatus = DownloadStatus.none,
  ]);

  IsarBook copyWith({
    int? id,
    String? exId,
    String? title,
    String? author,
    List<IsarAuthor>? authors,
    List<IsarSeries>? series,
    String? narrator,
    String? description,
    String? artPath,
    Duration? duration,
    Duration? lastPlayedPosition,
    bool? read,
    DateTime? lastUpdate,
    DateTime? downloadedAt,
    DownloadStatus? downloadStatus,
  }) =>
      IsarBook(
        exId ?? this.exId,
        title ?? this.title,
        author ?? this.author,
        authors ?? this.authors,
        series ?? this.series,
        narrator ?? this.narrator,
        description ?? this.description,
        artPath ?? this.artPath,
        duration?.inMicroseconds ?? isarDuration,
        lastPlayedPosition?.inMicroseconds ?? isarLastPlayedPosition,
        read ?? this.read,
        lastUpdate?.millisecondsSinceEpoch ?? isarLastUpdate,
        downloadedAt ?? this.downloadedAt,
        downloadStatus ?? this.downloadStatus,
      );

  factory IsarBook.fromBook(Book book) => IsarBook(
        book.id,
        book.title,
        book.author,
        book.authors?.map((e) => IsarAuthor(id: e.id, name: e.name)).toList() ??
            [],
        book.series
                ?.map((e) =>
                    IsarSeries(id: e.id, name: e.name, position: e.position))
                .toList() ??
            [],
        book.narrator,
        book.description,
        book.artPath,
        book.duration.inMicroseconds,
        book.lastPlayedPosition.inMicroseconds,
        book.read,
        book.lastUpdate?.millisecondsSinceEpoch,
        book.downloadedAt,
        book.downloadStatus,
      );
}

@embedded
class IsarAuthor {
  String? id;
  String? name;

  IsarAuthor({this.id, this.name});
}

@embedded
class IsarSeries {
  String? id;
  String? name;
  String? position;

  IsarSeries({this.id, this.name, this.position});
}
