import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/constants/app_constants.dart';
import 'package:audiobookly/domain/books/books_state.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final StateNotifierProviderFamily<BooksNotifier, BooksState, String?>
    booksStateProvider =
    StateNotifierProvider.family<BooksNotifier, BooksState, String?>(
  (ref, parentId) {
    return BooksNotifier(ref.watch(mediaRepositoryProvider), parentId);
  },
);

class BooksNotifier extends StateNotifier<BooksState> {
  final MediaRepository? _repository;
  final String? _parentId;
  var books = <MediaItem>[];
  var totalItems = 0;

  BooksNotifier(this._repository, this._parentId)
      : super(const BooksState.initial()) {
    getBooks();
  }

  Future<void> getBooks() async {
    try {
      state = const BooksState.loading();
      books = await _repository!.getChildren(_parentId ?? MediaIds.BOOKS_ID);
      state = BooksState.loaded(books: books, currentParent: _parentId);
    } catch (e, stack) {
      state = BooksState.error(
          "Could not fetch books, is the device online?", "$e", "$stack");
    }
  }

  Future handleItemCreated(int index) async {}

  Future<void> refresh() async {
    try {
      books = await _repository!.getChildren(
        _parentId ?? MediaIds.BOOKS_ID,
      );
      state = BooksState.loaded(
        books: books,
        currentParent: _parentId,
      );
    } catch (e, stack) {
      state = BooksState.error(
          "Could not fetch books, is the device online?", "$e", "$stack");
    }
  }

  void onSearch(String val) {
    if (val.isNotEmpty) {
      state = BooksState.loaded(
        books: books
            .where((book) => (book.title
                    .toUpperCase()
                    .contains(val.toUpperCase()) ||
                (book.artist != null &&
                    book.artist!.toUpperCase().contains(val.toUpperCase()))))
            .toList(),
        currentParent: _parentId,
      );
    } else {
      state = BooksState.loaded(books: books, currentParent: _parentId);
    }
  }
}
