import 'dart:async';
import 'dart:developer';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/features/book_details/book_details_state.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:rxdart/rxdart.dart';

final bookDetailsStateProvider =
    StateNotifierProvider.family<BookDetailsNotifier, BookDetailsState, String>(
        (ref, mediaId) {
  return BookDetailsNotifier(ref.watch(mediaRepositoryProvider), mediaId,
      ref.watch(databaseServiceProvider));
});

class BookDetailsNotifier extends StateNotifier<BookDetailsState> {
  final MediaRepository? _repository;
  final DatabaseService? _databaseService;
  final String _mediaId;

  StreamSubscription? _dbBookListener;
  StreamSubscription? _tracksListener;

  BookDetailsNotifier(this._repository, this._mediaId, this._databaseService)
      : super(const BookDetailsState.initial()) {
    getBook();
  }

  Future<void> markPlayed() async {
    await _repository!.markPlayed(_mediaId);
    state = await getDetails();
  }

  Future<BookDetailsState> getDetails() async {
    _dbBookListener ??=
        _databaseService!.watchBookById(_mediaId).listen((book) {
      if (book != null) {
        final item = MediaItem(
          id: book.id,
          title: book.title,
          displayDescription: book.description,
          artist: book.author,
          album: book.title,
          duration: book.duration,
          artUri: Uri.parse(book.artPath),
          playable: true,
          extras: <String, dynamic>{
            'played': book.read,
            'narrator': book.narrator,
            'downloading': book.downloadRequested &&
                !book.downloadCompleted &&
                !book.downloadFailed,
            'cached': book.downloadCompleted,
            'viewOffset': book.lastPlayedPosition.inMilliseconds,
          },
        );
        if (state is BookDetailsStateLoaded) {
          state = (state as BookDetailsStateLoaded).copyWith(
            book: item,
          );
        } else {
          state = BookDetailsState.loaded(book: item);
        }
      }
    });

    MediaItem? book;
    List<MediaItem>? chapters;
    try {
      log('Getting for mediaId $_mediaId');
      book = await _repository!.getAlbumFromId(_mediaId);
      chapters = await _repository!.getTracksForBook(book);
    } catch (e, stack) {
      log('No data from server $e, $stack');
      log('State $state');
      if (state is BookDetailsStateLoaded) {
        log('State loaded');
        final oldState = (state as BookDetailsStateLoaded);
        return oldState.copyWith(
          book: oldState.book,
          chapters: oldState.chapters,
        );
      } else {
        log('State not loaded');
        return const BookDetailsState.loading();
      }
    }

    if (state is BookDetailsStateLoaded) {
      return BookDetailsState.loaded(
        book: book.copyWith(
          extras: (state as BookDetailsStateLoaded).book?.extras ?? book.extras,
        ),
        chapters: chapters,
      );
    }

    return BookDetailsState.loaded(
      book: book,
      chapters: chapters,
    );
  }

  Future refreshForDownloads() async {
    _dbBookListener?.cancel();
    _dbBookListener = null;
    state = await getDetails();
  }

  Future<void> markUnplayed() async {
    await _repository!.markUnplayed(_mediaId);
    state = await getDetails();
  }

  Future<void> getBook() async {
    state = const BookDetailsState.loading();
    state = await getDetails();
  }

  @override
  void dispose() {
    _dbBookListener?.cancel();
    _tracksListener?.cancel();
    super.dispose();
  }
}
