import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/core/services/shared_preferences_service.dart';
import 'package:audiobookly/new_project_structure/repositories/media/media_repository.dart';
import 'package:audiobookly/new_project_structure/state_notifiers/library_select/library_select_state.dart';
import 'package:audiobookly/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final libraryStateProvider =
    StateNotifierProvider<LibrarySelectNotifier>((ref) {
  return LibrarySelectNotifier(ref.watch(mediaRepositoryProdiver),
      ref.watch(sharedPreferencesServiceProvider));
});

class LibrarySelectNotifier extends StateNotifier<LibrarySelectState> {
  final MediaRepository _repository;
  final SharedPreferencesService _sharedPreferencesService;

  LibrarySelectNotifier(this._repository, this._sharedPreferencesService)
      : super(LibrarySelectState.initial()) {
    getLibraries();
  }

  Future<void> setLibrary(String id) async {
    _sharedPreferencesService.setLibraryId(id);
  }

  Future<void> getLibraries() async {
    try {
      state = LibrarySelectState.loading();
      final libs = await _repository.getLibraries();
      state = LibrarySelectState.loaded(libraries: libs);
    } on Exception {
      state = LibrarySelectState.error(
          "Couldn't fetch libraries. Is the device online?");
    }
  }
}
