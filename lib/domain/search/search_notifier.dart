import 'package:audiobookly/constants/app_constants.dart';
import 'package:audiobookly/domain/search/search_state.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchStateProvider =
    StateNotifierProvider<SearchNotifier, SearchState>((ref) {
  return SearchNotifier(ref.watch(mediaRepositoryProvider));
});

class SearchNotifier extends StateNotifier<SearchState> {
  final MediaRepository? _repository;

  SearchNotifier(this._repository) : super(const SearchState.initial());

  Future<void> search(String query) async {
    try {
      state = const SearchState.loading();
      final results = await _repository!.search(
        query,
      );
      state = results.fold<SearchStateLoaded>(
        const SearchStateLoaded(),
        (value, item) {
          late SearchStateLoaded newState;
          if (item.id.startsWith(MediaIds.seriesId)) {
            newState = value
                .copyWith(seriesResults: [...value.seriesResults ?? [], item]);
          } else if (item.id.startsWith(MediaIds.authorsId)) {
            newState = value
                .copyWith(authorResults: [...value.authorResults ?? [], item]);
          } else {
            newState =
                value.copyWith(bookResults: [...value.bookResults ?? [], item]);
          }
          return newState;
        },
      );
    } on Exception {
      state = const SearchState.error(
          "Couldn't fetch authors. Is the device online?");
    }
  }
}
