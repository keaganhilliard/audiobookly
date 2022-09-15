import 'package:audiobookly/models/chapter.dart';
import 'package:isar/isar.dart';

part 'isar_chapter.g.dart';

@Collection()
class IsarChapter implements Chapter {
  IsarChapter({
    required this.id,
    required this.isarId,
    required this.start,
    required this.end,
    required this.title,
    required this.bookId,
  });

  Id? isarId = isarAutoIncrementId;

  @override
  double end;

  @override
  String id;

  @override
  double start;

  @override
  String title;

  @override
  int bookId;

  factory IsarChapter.fromChapter(Chapter chapter) => IsarChapter(
        id: '${chapter.bookId}.${chapter.id}',
        isarId: '${chapter.bookId}.${chapter.id}'.hashCode,
        start: chapter.start,
        end: chapter.end,
        title: chapter.title,
        bookId: chapter.bookId,
      );

  factory IsarChapter.fromJson(Map<String, dynamic> json) => IsarChapter(
        id: json["id"],
        isarId: json["id"].hashCode,
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
