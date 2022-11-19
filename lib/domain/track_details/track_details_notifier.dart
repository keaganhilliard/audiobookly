import 'dart:async';

import 'package:audiobookly/models/chapter.dart';
import 'package:audiobookly/models/track.dart';
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
    _tracksListener ??=
        _databaseService!.getTracksForBookId(_mediaId).listen((tracks) {
      if (tracks.isEmpty) {
        if (state is TrackDetailsStateLoaded) {
          final oldState = (state as TrackDetailsStateLoaded);
          state = oldState.copyWith(
            tracks: [
              for (final track in oldState.tracks ?? [])
                track.copyWith(
                  isDownloaded: false,
                  downloadProgress: 0,
                )
            ],
          );
        }
      } else {
        final trackMap = {for (final track in tracks) track.id: track};
        if (state is TrackDetailsStateLoaded) {
          final oldState = (state as TrackDetailsStateLoaded);
          if (oldState.tracks?.isNotEmpty ?? false) {
            state = oldState.copyWith(
              tracks: [
                for (final track in oldState.tracks!)
                  track.copyWith(
                    isDownloaded: trackMap[track.id]?.isDownloaded,
                    downloadProgress: trackMap[track.id]?.downloadProgress,
                  )
              ],
            );
          }
        } else {
          state = TrackDetailsState.loaded(tracks: tracks);
        }
      }
    });

    List<Track>? tracks;
    List<Chapter>? chapters;
    try {
      tracks = await _repository!.getTracksForBook(_mediaId);
      chapters = (await _repository!.getAlbumFromId(_mediaId)).chapters;
    } catch (e) {
      if (state is TrackDetailsStateLoaded) {
        final oldState = (state as TrackDetailsStateLoaded);
        return oldState.copyWith(
          tracks: oldState.tracks,
          chapters: oldState.chapters,
        );
      } else {
        return const TrackDetailsState.loading();
      }
    }

    return TrackDetailsState.loaded(tracks: tracks, chapters: chapters);
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
