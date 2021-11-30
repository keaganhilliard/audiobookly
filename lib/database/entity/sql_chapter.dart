import 'package:audiobookly/database/entity/sql_book.dart';
import 'package:audiobookly/models/chapter.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'chapters', primaryKeys: [
  'id',
  'bookId'
], foreignKeys: [
  ForeignKey(childColumns: ['bookId'], parentColumns: ['id'], entity: SqlBook)
])
class SqlChapter {
  SqlChapter(
    this.id,
    this.start,
    this.end,
    this.title,
    this.bookId,
  );

  final String id;

  final double end;

  final double start;

  final String title;

  final String bookId;

  factory SqlChapter.fromChapter(Chapter chapter) => SqlChapter(
        chapter.id,
        chapter.start,
        chapter.end,
        chapter.title,
        chapter.bookId,
      );

  factory SqlChapter.fromJson(Map<String, dynamic> json) => SqlChapter(
        json["id"],
        json["start"].toDouble(),
        json["end"].toDouble(),
        json["title"],
        json["bookId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "start": start,
        "end": end,
        "title": title,
        "bookId": bookId,
      };
}
