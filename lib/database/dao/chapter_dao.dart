import 'package:audiobookly/database/entity/sql_chapter.dart';
import 'package:floor/floor.dart';

@dao
abstract class ChapterDao {
  @Query('SELECT * FROM chapters')
  Stream<List<SqlChapter>> findAllChapters();

  @Query('SELECT * FROM chapters WHERE id = :id')
  Stream<SqlChapter?> findChapterById(String id);

  @Query('SELECT * FROM chapters WHERE bookId = :bookId')
  Future<List<SqlChapter>> findChaptersForBookId(String bookId);

  @Query('SELECT * FROM chapters WHERE downloadTaskId = :taskId')
  Future<SqlChapter?> findChaptersForDownloadTaskId(String taskId);

  @Query('SELECT * FROM chapters WHERE bookId = :bookId')
  Stream<List<SqlChapter>> streamChaptersForBookId(String bookId);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertChapter(SqlChapter chapter);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertChapters(List<SqlChapter> chapter);

  @delete
  Future<int> deleteChapters(List<SqlChapter> chapters);
}
