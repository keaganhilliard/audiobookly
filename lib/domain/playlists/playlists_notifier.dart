import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/domain/playlists/playlists_state.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/utils/refresher_state_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final playlistsStateProvider =
    StateNotifierProvider<PlaylistsNotifier, PlaylistsState>((ref) {
  return PlaylistsNotifier(ref.watch(mediaRepositoryProvider));
});

class PlaylistsNotifier extends RefresherStateNotifier<PlaylistsState> {
  final MediaRepository? _repository;

  PlaylistsNotifier(this._repository) : super(const PlaylistsState.initial());

  Future<void> getPlaylists() async {
    try {
      state = const PlaylistsState.loading();
      final playlists = await _repository!.getPlaylists();
      state = PlaylistsState.loaded(playlists: playlists);
    } on Exception {
      state = const PlaylistsState.error(
          "Couldn't fetch authors. Is the device online?");
    }
  }

  Future<void> refresh() async {
    try {
      final playlists = await _repository!.getPlaylists();
      state = PlaylistsState.loaded(playlists: playlists);
    } on Exception {
      state = const PlaylistsState.error(
          "Couldn't fetch authors. Is the device online?");
    }
  }
}
