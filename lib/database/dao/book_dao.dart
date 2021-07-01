import 'package:audiobookly/database/entity/book.dart';
import 'package:floor/floor.dart';

@dao
abstract class BookDao {
  @Query('SELECT * FROM books ORDER BY author, title')
  Stream<List<Book>> findAllBooks();

  @Query(
      'SELECT * FROM books WHERE downloadCompleted = 1 ORDER BY author, title')
  Stream<List<Book>> getAllDownloadedBooks();

  @Query('SELECT * FROM books WHERE id = :id')
  Stream<Book?> findBookById(String id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertBook(Book book);

  @update
  Future<void> updateBook(Book book);
}
