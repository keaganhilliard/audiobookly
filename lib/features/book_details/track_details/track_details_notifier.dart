import 'dart:async';
import 'dart:developer';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/features/book_details/track_details/track_details_state.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:rxdart/rxdart.dart';

final trackDetailsStateProvider = StateNotifierProvider.family<
    TrackDetailsNotifier, TrackDetailsState, String>((ref, mediaId) {
  return TrackDetailsNotifier(ref.watch(mediaRepositoryProvider), mediaId,
      ref.watch(databaseServiceProvider));
});

class TrackDetailsNotifier extends StateNotifier<TrackDetailsState> {
  final MediaRepository? _repository;
  final DatabaseService? _databaseService;
  final String _mediaId;

  StreamSubscription? _tracksListener;

  TrackDetailsNotifier(this._repository, this._mediaId, this._databaseService)
      : super(const TrackDetailsState.initial()) {
    getTracks();
  }

  Future<TrackDetailsState> getDetails() async {
    log('Starting getDetails $state');

    // print(await _databaseService!.getTrackById(_mediaId));
    _tracksListener ??=
        _databaseService!.getTracksForBookId(_mediaId).listen((trackMap) {
      if (trackMap.isNotEmpty) {
        if (state is TrackDetailsStateLoaded) {
          final oldState = (state as TrackDetailsStateLoaded);
          log('Adding chapters');
          if (oldState.chapters?.isNotEmpty ?? false) {
            state = oldState.copyWith(
              chapters: [
                for (final chapter in oldState.chapters!)
                  chapter.copyWith(
                    extras: {
                      ...(chapter.extras ?? {}),
                      'cached': trackMap[chapter.id]?.isDownloaded,
                      'downloadProgress':
                          trackMap[chapter.id]?.downloadProgress,
                    },
                  )
              ],
            );
          }
        } else {
          state = TrackDetailsState.loaded(chapters: [
            for (final track in trackMap.values)
              MediaItem(
                id: '$_mediaId/${track.id}',
                title: track.title,
                duration: track.duration,
                extras: <String, dynamic>{
                  'cached': track.isDownloaded,
                  'downloadProgress': track.downloadProgress,
                },
              )
          ]);
        }
      }
    });

    MediaItem? book;
    List<MediaItem>? chapters;
    try {
      book = await _repository!.getAlbumFromId(_mediaId);
      chapters = await _repository!.getTracksForBook(book);
    } catch (e) {
      log('No data from server $e');
      log('State $state');
      if (state is TrackDetailsStateLoaded) {
        log('State loaded');
        final oldState = (state as TrackDetailsStateLoaded);
        return oldState.copyWith(
          chapters: oldState.chapters,
        );
      } else {
        log('State not loaded');
        return const TrackDetailsState.loading();
      }
    }
    if (state is TrackDetailsStateLoaded) {
      final oldState = (state as TrackDetailsStateLoaded);

      return TrackDetailsState.loaded(chapters: [
        for (int i = 0; i < chapters.length; i++)
          chapters[i].copyWith(extras: oldState.chapters?[i].extras)
      ]);
    }

    return TrackDetailsState.loaded(
      chapters: chapters,
    );
  }

  Future refreshForDownloads() async {
    state = await getDetails();
  }

  Future<void> getTracks() async {
    state = const TrackDetailsState.loading();
    state = await getDetails();
  }

  @override
  void dispose() {
    _tracksListener?.cancel();
    super.dispose();
  }
}
