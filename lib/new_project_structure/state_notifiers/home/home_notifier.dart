import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/cubit/books/books_state.dart';
import 'package:audiobookly/new_project_structure/repositories/media/media_repository.dart';
import 'package:audiobookly/new_project_structure/state_notifiers/home/home_state.dart';
import 'package:audiobookly/providers.dart';
import 'package:hooks_riverpod/all.dart';

final homeStateProvider = StateNotifierProvider<HomeNotifier>((ref) {
  return HomeNotifier(ref.watch(mediaRepositoryProdiver));
});

class HomeNotifier extends StateNotifier<HomeState> {
  final MediaRepository _repository;

  HomeNotifier(this._repository) : super(HomeState.initial());

  Future<void> getBooks() async {
    try {
      state = HomeState.loading();
      final recentlyAdded =
          await _repository.getChildren(MediaIds.RECENTLY_ADDED);
      final recentlyPlayed =
          await _repository.getChildren(MediaIds.RECENTLY_PLAYED);
      state = HomeState.loaded(
          recentlyAdded: recentlyAdded, recentlyPlayed: recentlyPlayed);
    } on Exception {
      state = HomeState.error("Couldn't fetch books. Is the device online?");
    }
  }
}
