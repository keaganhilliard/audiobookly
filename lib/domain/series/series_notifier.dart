import 'package:audiobookly/constants/app_constants.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/domain/series/series_state.dart';
import 'package:audiobookly/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final seriesStateProvider =
    StateNotifierProvider<SeriesNotifier, SeriesState>((ref) {
  return SeriesNotifier(ref.watch(mediaRepositoryProvider));
});

class SeriesNotifier extends StateNotifier<SeriesState> {
  final MediaRepository? _repository;

  SeriesNotifier(this._repository) : super(const SeriesState.initial());

  Future<void> refresh() async {
    try {
      final series = await _repository!.getChildren(
        MediaIds.seriesId,
      );
      state = SeriesState.loaded(series: series);
    } on Exception {
      state = const SeriesState.error(
          "Couldn't fetch authors. Is the device online?");
    }
  }

  Future<void> getSeries() async {
    try {
      state = const SeriesState.loading();
      final series = await _repository!.getChildren(
        MediaIds.seriesId,
      );
      state = SeriesState.loaded(series: series);
    } on Exception {
      state = const SeriesState.error(
          "Couldn't fetch authors. Is the device online?");
    }
  }
}
