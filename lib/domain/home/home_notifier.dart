import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/constants/app_constants.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/domain/home/home_state.dart';
import 'package:audiobookly/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeStateProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier(ref.watch(mediaRepositoryProvider));
});

class HomeNotifier extends StateNotifier<HomeState> {
  final MediaRepository? _repository;

  HomeNotifier(this._repository) : super(const HomeState.initial()) {
    getBooks();
  }

  Future refresh() async {
    List<MediaItem>? recentlyPlayed;
    List<MediaItem>? recentlyAdded;

    try {
      recentlyPlayed = await _repository!.getChildren(MediaIds.RECENTLY_PLAYED);
    } catch (e) {
      print(e);
    }
    try {
      recentlyAdded = await _repository!.getChildren(MediaIds.RECENTLY_ADDED);
    } catch (e) {
      print(e);
    }
    final downloaded = await _repository!.getChildren(MediaIds.DOWNLOADS);
    state = HomeState.loaded(
      recentlyPlayed: recentlyPlayed,
      recentlyAdded: recentlyAdded,
      downloaded: downloaded,
    );
  }

  Future<void> getBooks() async {
    try {
      state = const HomeState.loading();
      await refresh();
    } on Exception {
      state =
          const HomeState.error("Couldn't fetch books. Is the device online?");
    }
  }
}
