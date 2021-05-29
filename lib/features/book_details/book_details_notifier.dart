import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/features/book_details/book_details_state.dart';
import 'package:audiobookly/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bookDetailsStateProvider =
    StateNotifierProviderFamily<BookDetailsNotifier, BookDetailsState, String>(
        (ref, mediaId) {
  return BookDetailsNotifier(ref.watch(mediaRepositoryProdiver), mediaId);
});

class BookDetailsNotifier extends StateNotifier<BookDetailsState> {
  final MediaRepository? _repository;
  final String _mediaId;

  BookDetailsNotifier(this._repository, this._mediaId)
      : super(BookDetailsState.initial()) {
    getBook();
  }

  Future<void> markPlayed() async {
    await _repository!.markPlayed(_mediaId);
    state = await getDetails();
  }

  Future<BookDetailsState> getDetails() async {
    try {
      final book = await _repository!.getAlbumFromId(_mediaId);
      final chapters = await _repository!.getTracksForBook(_mediaId);
      return BookDetailsState.loaded(book: book, chapters: chapters);
    } on Exception {
      return BookDetailsState.error(
          "Couldn't fetch book details. Is the device online?");
    }
  }

  Future<void> markUnplayed() async {
    await _repository!.markUnplayed(_mediaId);
    state = await getDetails();
  }

  Future<void> getBook() async {
    state = BookDetailsState.loading();
    state = await getDetails();
  }
}
