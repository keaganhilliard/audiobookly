import 'dart:async';
import 'dart:developer';

import 'package:audiobookly/models/book.dart';
import 'package:audiobookly/models/chapter.dart';
import 'package:audiobookly/models/download_status.dart';
import 'package:audiobookly/models/track.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/domain/book_details/book_details_state.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:audiobookly/services/download/download_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bookDetailsStateProvider =
    StateNotifierProvider.family<BookDetailsNotifier, BookDetailsState, String>(
        (ref, mediaId) {
  return BookDetailsNotifier(ref.watch(mediaRepositoryProvider), mediaId,
      ref.watch(databaseServiceProvider), ref.watch(downloadServiceProvider));
});

class BookDetailsNotifier extends StateNotifier<BookDetailsState> {
  final MediaRepository? _repository;
  final DatabaseService? _databaseService;
  final DownloadService? _downloadService;
  final String _mediaId;

  StreamSubscription? _dbBookListener;
  StreamSubscription? _tracksListener;

  BookDetailsNotifier(this._repository, this._mediaId, this._databaseService,
      this._downloadService)
      : super(const BookDetailsState.initial()) {
    getBook();
  }

  Future<void> markPlayed() async {
    await _repository!.markPlayed(_mediaId);
    await getDetails();
  }

  Future<void> downloadBook() async {
    state.whenOrNull(
      loaded: (book, chapters) async {
        await _downloadService!.downloadBook(book!, chapters!);
      },
    );
  }

  Future<void> getDetails() async {
    _dbBookListener ??= _databaseService!.watchBookById(_mediaId).listen(
      (book) async {
        if (book != null) {
          Book? checkBook = await _databaseService!.getBookById(book.id);
          List<Chapter>? chapters =
              await _databaseService!.getChaptersForBook(book.id);
          checkBook ??= book.copyWith(chapters: chapters);
          state = state.maybeMap(
            orElse: () => BookDetailsState.loaded(book: book),
            loaded: (loaded) => loaded.copyWith(book: book),
          );
        }
      },
    );

    Book? book;
    List<Track>? tracks;
    Book? dbBook = await _databaseService?.getBookById(_mediaId);
    try {
      book = await _repository!.getAlbumFromId(_mediaId);
      tracks = await _repository!.getTracksForBook(_mediaId);
    } catch (e, stack) {
      log('No data from server $e, $stack');
      log('State $state');
      if (state is BookDetailsStateLoaded) {
        log('State loaded');
        final oldState = (state as BookDetailsStateLoaded);
        state = oldState.copyWith(
          book: oldState.book,
          tracks: oldState.tracks,
        );
      } else {
        log('State not loaded');
        state = const BookDetailsState.loading();
      }
    }

    if (state is BookDetailsStateLoaded) {
      state = BookDetailsState.loaded(
        book: book?.copyWith(downloadStatus: dbBook?.downloadStatus) ?? dbBook,
        tracks: tracks,
      );
    }

    state = BookDetailsState.loaded(
      book: book?.copyWith(downloadStatus: dbBook?.downloadStatus) ?? dbBook,
      tracks: tracks,
    );
  }

  Future refreshForDownloads() async {
    await getDetails();
  }

  Future<void> markUnplayed() async {
    await _repository!.markUnplayed(_mediaId);
    await getDetails();
  }

  Future<void> getBook() async {
    state = const BookDetailsState.loading();
    getDetails();
  }

  @override
  void dispose() {
    _dbBookListener?.cancel();
    _tracksListener?.cancel();
    super.dispose();
  }
}
