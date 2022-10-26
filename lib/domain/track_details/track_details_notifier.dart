import 'dart:async';
import 'dart:developer';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/domain/track_details/track_details_state.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
        _databaseService!.getTracksForBookId(_mediaId).listen((tracks) {
      if (tracks.isEmpty) {
        if (state is TrackDetailsStateLoaded) {
          final oldState = (state as TrackDetailsStateLoaded);
          state = oldState.copyWith(
            chapters: [
              for (final chapter in oldState.chapters!)
                chapter.copyWith(
                  extras: {
                    ...(chapter.extras ?? {}),
                    'cached': false,
                    'downloadProgress': 0.0,
                  },
                )
            ],
          );
        }
      } else {
        final trackMap = {for (final track in tracks) track.id: track};
        if (state is TrackDetailsStateLoaded) {
          final oldState = (state as TrackDetailsStateLoaded);
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
            for (final track in tracks)
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

    List<MediaItem>? chapters;
    try {
      chapters = await _repository!.getTracksForBook(_mediaId);
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
