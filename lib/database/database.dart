import 'dart:async';
import 'package:audiobookly/database/dao/chapter_dao.dart';
import 'package:audiobookly/database/entity/sql_chapter.dart';

import 'dao/download_task_dao.dart';
import 'dao/track_dao.dart';
import 'entity/download_task.dart';
import 'entity/sql_track.dart';
import 'converters/duration_converter.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:audiobookly/database/dao/book_dao.dart';
import 'package:audiobookly/database/entity/sql_book.dart';

part 'database.g.dart'; // the generated code will be there

@TypeConverters([DurationConverter])
@Database(version: 4, entities: [SqlBook, SqlTrack, DownloadTask, SqlChapter])
abstract class AppDatabase extends FloorDatabase {
  BookDao get bookDao;
  TrackDao get trackDao;
  DownloadTaskDao get downloadTaskDao;
  ChapterDao get chapterDao;
}

final migrate1To2 = Migration(1, 2, (database) async {
  await database
      .execute('ALTER TABLE books ADD COLUMN read INTEGER NOT NULL DEFAULT 0');
});

final migrate2To3 = Migration(2, 3, (database) async {
  await database.execute(
      'ALTER TABLE tracks ADD COLUMN downloadTaskId TEXT NOT NULL DEFAULT \'\'');
  await database.execute(
      'ALTER TABLE tracks ADD COLUMN downloadTaskStatus INTEGER NOT NULL DEFAULT 0');
});

final migrate3To4 = Migration(3, 4, (database) async {
  await database.execute(
      '''CREATE TABLE IF NOT EXISTS `chapters` (`id` TEXT NOT NULL, `end` REAL 
      NOT NULL, `start` REAL NOT NULL, `title` TEXT NOT NULL, `bookId` TEXT NOT 
      NULL, FOREIGN KEY (`bookId`) REFERENCES `books` (`id`) ON UPDATE NO ACTION 
      ON DELETE NO ACTION, PRIMARY KEY (`id`, `bookId`))''');
});
