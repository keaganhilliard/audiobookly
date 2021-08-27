import 'dart:async';
import 'dao/download_task_dao.dart';
import 'dao/track_dao.dart';
import 'entity/download_task.dart';
import 'entity/track.dart';
import 'converters/duration_converter.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:audiobookly/database/dao/book_dao.dart';
import 'package:audiobookly/database/entity/book.dart';

part 'database.g.dart'; // the generated code will be there

@TypeConverters([DurationConverter])
@Database(version: 3, entities: [Book, Track, DownloadTask])
abstract class AppDatabase extends FloorDatabase {
  BookDao get bookDao;
  TrackDao get trackDao;
  DownloadTaskDao get downloadTaskDao;
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
