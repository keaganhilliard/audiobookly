import 'package:audiobookly/domain/narrators/narrators_state.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final narratorsStateProvider =
    StateNotifierProvider<NarratorsNotifier, NarratorsState>((ref) {
  return NarratorsNotifier(ref.watch(mediaRepositoryProvider));
});

class NarratorsNotifier extends StateNotifier<NarratorsState> {
  final MediaRepository? _repository;

  NarratorsNotifier(this._repository) : super(const NarratorsState.initial());

  Future refresh() async {
    await getNarrators();
  }

  Future<void> getNarrators() async {
    try {
      final narrators = await _repository!.getNarrators();
      state = NarratorsState.loaded(narrators: narrators);
    } on Exception {
      state = const NarratorsState.error(
        message: "Couldn't fetch authors. Is the device online?",
      );
    }
  }
}
