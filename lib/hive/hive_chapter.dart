import 'package:audiobookly/models/chapter.dart';
import 'package:hive/hive.dart';

part 'hive_chapter.g.dart';

@HiveType(typeId: 3)
class HiveChapter implements Chapter {
  HiveChapter({
    required this.id,
    required this.start,
    required this.end,
    required this.title,
    required this.bookId,
  });

  @HiveField(3)
  @override
  double end;

  @HiveField(0)
  @override
  String id;

  @HiveField(1)
  @override
  double start;

  @HiveField(2)
  @override
  String title;

  @HiveField(4)
  @override
  String bookId;

  factory HiveChapter.fromChapter(Chapter chapter) => HiveChapter(
        id: chapter.id,
        start: chapter.start,
        end: chapter.end,
        title: chapter.title,
        bookId: chapter.bookId,
      );

  factory HiveChapter.fromJson(Map<String, dynamic> json) => HiveChapter(
        id: json["id"],
        start: json["start"].toDouble(),
        end: json["end"].toDouble(),
        title: json["title"],
        bookId: json["bookId"],
      );
  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "start": start,
        "end": end,
        "title": title,
        "bookId": bookId,
      };
}
