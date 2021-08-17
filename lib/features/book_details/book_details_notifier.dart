import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/features/book_details/book_details_state.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bookDetailsStateProvider =
    StateNotifierProviderFamily<BookDetailsNotifier, BookDetailsState, String>(
        (ref, mediaId) {
  return BookDetailsNotifier(ref.watch(mediaRepositoryProdiver), mediaId,
      ref.watch(databaseServiceProvider));
});

class BookDetailsNotifier extends StateNotifier<BookDetailsState> {
  final MediaRepository? _repository;
  final DatabaseService? _databaseService;
  final String _mediaId;

  BookDetailsNotifier(this._repository, this._mediaId, this._databaseService)
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
      final dbBook = await _databaseService!.watchBookById(_mediaId);
      final tracks = await _databaseService!.getTracksForBookId(_mediaId);
      return BookDetailsState.loaded(
        book: book,
        chapters: chapters,
        dbBook: dbBook,
        tracks: tracks,
      );
    } on Exception {
      return BookDetailsState.error(
        "Couldn't fetch book details. Is the device online?",
      );
    }
  }

  Future refreshForDownloads() async {
    state = await getDetails();
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
