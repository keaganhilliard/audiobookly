import 'package:audiobookly/new_project_structure/repositories/media/media_repository.dart';
import 'package:audiobookly/new_project_structure/state_notifiers/book_details/book_details_state.dart';
import 'package:audiobookly/providers.dart';
import 'package:hooks_riverpod/all.dart';

final bookDetailsStateProvider =
    StateNotifierProviderFamily<BookDetailsNotifier, String>((ref, mediaId) {
  return BookDetailsNotifier(ref.watch(mediaRepositoryProdiver), mediaId);
});

class BookDetailsNotifier extends StateNotifier<BookDetailsState> {
  final MediaRepository _repository;
  final String _mediaId;

  BookDetailsNotifier(this._repository, this._mediaId)
      : super(BookDetailsState.initial()) {
    getBook();
  }

  Future<void> getBook() async {
    try {
      state = BookDetailsState.loading();
      print('getting book: $_mediaId');
      final book = await _repository.getAlbumFromId(_mediaId);
      state = BookDetailsState.loaded(book: book);
    } on Exception {
      state = BookDetailsState.error(
          "Couldn't fetch book details. Is the device online?");
    }
  }
}
