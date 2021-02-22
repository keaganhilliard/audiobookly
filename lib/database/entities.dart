import 'package:objectbox/objectbox.dart';

@Entity()
class Book {
  int id;
  String exId;
  String title;
  String author;
  String description;
  int durationInMilliseconds;

  @Backlink()
  final tracks = ToMany<Track>();
}

@Entity()
class Track {
  int id;
  String exId;
  String title;

  final book = ToOne<Book>();

  @Backlink()
  final downloadTasks = ToMany<DownloadTask>();
}

@Entity()
class DownloadTask {
  int id;
  double progress;
  String status;

  final track = ToOne<Track>();
}
