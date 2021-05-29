import 'package:audiobookly/constants/app_constants.dart';
import 'package:audiobookly/features/books/books_state.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final StateNotifierProviderFamily<BooksNotifier, BooksState, String?>?
    booksStateProvider =
    StateNotifierProvider.family<BooksNotifier, BooksState, String?>(
        (ref, parentId) {
  return BooksNotifier(ref.watch(mediaRepositoryProdiver), parentId);
});

class BooksNotifier extends StateNotifier<BooksState> {
  final MediaRepository? _repository;
  final String? _parentId;

  BooksNotifier(this._repository, this._parentId) : super(BooksState.initial());

  Future<void> getBooks() async {
    try {
      state = BooksState.loading();
      final books =
          await _repository!.getChildren(_parentId ?? MediaIds.BOOKS_ID);
      state = BooksState.loaded(books: books, currentParent: _parentId);
    } on Exception {
      state = BooksState.error("Couldn't fetch books. Is the device online?");
    }
  }
}
