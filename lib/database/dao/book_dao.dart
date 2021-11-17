import 'package:audiobookly/database/entity/sql_book.dart';
import 'package:floor/floor.dart';

@dao
abstract class BookDao {
  @Query('SELECT * FROM books ORDER BY author, title')
  Stream<List<SqlBook>> findAllBooks();

  @Query(
      'SELECT * FROM books WHERE downloadCompleted = 1 ORDER BY author, title')
  Stream<List<SqlBook>> getAllDownloadedBooks();

  @Query('SELECT * FROM books WHERE id = :id')
  Stream<SqlBook?> findBookById(String id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertBook(SqlBook book);

  @update
  Future<void> updateBook(SqlBook book);
}
