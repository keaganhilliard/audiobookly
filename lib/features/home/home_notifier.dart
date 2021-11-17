import 'package:audiobookly/constants/app_constants.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/features/home/home_state.dart';
import 'package:audiobookly/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeStateProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier(ref.watch(mediaRepositoryProvider));
});

class HomeNotifier extends StateNotifier<HomeState> {
  final MediaRepository? _repository;

  HomeNotifier(this._repository) : super(const HomeState.initial());

  Future<void> getBooks() async {
    try {
      state = const HomeState.loading();
      final recentlyAdded =
          await _repository!.getChildren(MediaIds.RECENTLY_ADDED);
      final recentlyPlayed =
          await _repository!.getChildren(MediaIds.RECENTLY_PLAYED);
      state = HomeState.loaded(
          recentlyAdded: recentlyAdded, recentlyPlayed: recentlyPlayed);
    } on Exception {
      state =
          const HomeState.error("Couldn't fetch books. Is the device online?");
    }
  }
}
