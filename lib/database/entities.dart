import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Book {
  int id;
  String exId;
  String title;
  String author;
  String description;
  int durationInMilliseconds;

  Book({
    this.id = 0,
    required this.exId,
    required this.title,
    required this.author,
    required this.description,
    required this.durationInMilliseconds,
  });

  @Backlink()
  final tracks = ToMany<Track>();
}

@Entity()
class Track {
  int id;
  String exId;
  String title;

  Track({
    this.id = 0,
    required this.exId,
    required this.title,
  });

  final book = ToOne<Book>();

  @Backlink()
  final downloadTasks = ToMany<DownloadTask>();
}

@Entity()
class DownloadTask {
  int id;
  double progress;
  String status;
  String path;
  String url;

  DownloadTask({
    this.id = 0,
    required this.progress,
    required this.status,
    required this.path,
    required this.url,
  });

  final track = ToOne<Track>();
}
