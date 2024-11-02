import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/domain/library_select/library_select_state.dart';
import 'package:audiobookly/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final libraryStateProvider =
    StateNotifierProvider<LibrarySelectNotifier, LibrarySelectState>((ref) {
  return LibrarySelectNotifier(ref.watch(mediaRepositoryProvider),
      ref.watch(preferencesProvider.notifier));
});

class LibrarySelectNotifier extends StateNotifier<LibrarySelectState> {
  final MediaRepository? _repository;
  final PreferencesNotifier _preferencesNotifier;

  LibrarySelectNotifier(this._repository, this._preferencesNotifier)
      : super(const LibrarySelectState.initial()) {
    getLibraries();
  }

  Future setLibrary(String id, String? title) async {
    await _preferencesNotifier.savePreferences(
      _preferencesNotifier.state.copyWith(
        libraryId: id,
        libraryLabel: (title ?? ''),
      ),
    );
    _repository!.setLibraryId(id);
    await _repository!.getServerAndLibrary();
  }

  Future<void> getLibraries() async {
    try {
      state = const LibrarySelectState.loading();
      await _repository!.getServerAndLibrary();
      final libs = await _repository!.getLibraries();
      state = LibrarySelectState.loaded(libraries: libs);
    } on Exception {
      state = const LibrarySelectState.error(
          "Couldn't fetch libraries. Is the device online?");
    }
  }
}
