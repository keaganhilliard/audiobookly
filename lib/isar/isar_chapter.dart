import 'package:audiobookly/models/chapter.dart';
import 'package:isar/isar.dart';

part 'isar_chapter.g.dart';

@Collection()
class IsarChapter {
  IsarChapter({
    this.isarId,
    required this.id,
    required this.start,
    required this.end,
    required this.title,
    required this.bookId,
  });

  Id? isarId = Isar.autoIncrement;

  double end;

  @Index(unique: true, replace: true)
  String id;

  double start;

  String title;

  @Index()
  String bookId;

  factory IsarChapter.fromChapter(Chapter chapter) => IsarChapter(
        id: '${chapter.bookId}.${chapter.id}',
        start: chapter.start,
        end: chapter.end,
        title: chapter.title,
        bookId: chapter.bookId,
      );

  factory IsarChapter.fromJson(Map<String, dynamic> json) => IsarChapter(
        id: json["id"],
        start: json["start"].toDouble(),
        end: json["end"].toDouble(),
        title: json["title"],
        bookId: json["bookId"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "isarId": isarId,
        "start": start,
        "end": end,
        "title": title,
        "bookId": bookId,
      };
}
