import 'package:audiobookly/domain/search/search_state.dart';
import 'package:audiobookly/models/model_union.dart';
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
          return switch (item) {
            // ignore: unused_result
            BookValue(value: var book) => value.copyWith(
                bookResults: [
                  ...value.bookResults ?? [],
                  book.toMediaItem(),
                ],
              ),
            // ignore: unused_result
            AuthorValue(value: var author) => value.copyWith(
                authorResults: [
                  ...value.bookResults ?? [],
                  author.toMediaItem()
                ],
              ),
            // ignore: unused_result
            SeriesValue(value: var series) => value.copyWith(
                seriesResults: [
                  ...value.seriesResults ?? [],
                  series.toMediaItem()
                ],
              ),
            _ => value
          };
        },
      );
    } on Exception {
      state = const SearchState.error(
          "Couldn't fetch authors. Is the device online?");
    }
  }
}
