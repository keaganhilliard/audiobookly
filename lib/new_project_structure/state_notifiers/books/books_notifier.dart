import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/new_project_structure/state_notifiers/books/books_state.dart';
import 'package:audiobookly/new_project_structure/repositories/media/media_repository.dart';
import 'package:audiobookly/providers.dart';
import 'package:hooks_riverpod/all.dart';

final booksStateProvider = StateNotifierProvider<BooksNotifier>((ref) {
  return BooksNotifier(ref.watch(mediaRepositoryProdiver));
});

class BooksNotifier extends StateNotifier<BooksState> {
  final MediaRepository _repository;

  BooksNotifier(this._repository) : super(BooksState.initial());

  Future<void> getBooks(String parentId) async {
    try {
      state = BooksState.loading();
      final books =
          await _repository.getChildren(parentId ?? MediaIds.BOOKS_ID);
      state = BooksState.loaded(books: books, currentParent: parentId);
    } on Exception {
      state = BooksState.error("Couldn't fetch books. Is the device online?");
    }
  }
}
