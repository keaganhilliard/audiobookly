import 'package:audiobookly/models/chapter.dart';
import 'package:isar/isar.dart';

part 'isar_chapter.g.dart';

@Collection()
class IsarChapter implements Chapter {
  IsarChapter({
    this.isarId,
    required this.id,
    required this.start,
    required this.end,
    required this.title,
    required this.bookId,
  });

  Id? isarId = Isar.autoIncrement;

  @override
  double end;

  @override
  @Index(unique: true, replace: true)
  String id;

  @override
  double start;

  @override
  String title;

  @override
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
  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "isarId": isarId,
        "start": start,
        "end": end,
        "title": title,
        "bookId": bookId,
      };
}
