import 'package:audiobookly/constants/app_constants.dart';
import 'package:audiobookly/models/user.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/features/settings/settings_state.dart';
import 'package:audiobookly/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final settingsStateProvider =
    StateNotifierProvider<SettingsNotifier, SettingsState>((ref) {
  return SettingsNotifier(ref.watch(mediaRepositoryProdiver));
});

class SettingsNotifier extends StateNotifier<SettingsState> {
  final MediaRepository? _repository;
  User? currentUser;

  SettingsNotifier(this._repository) : super(SettingsState.initial()) {
    getUser();
  }

  Future<void> getUser() async {
    try {
      state = SettingsState.loading();
      currentUser = await _repository!.getUser();
      state = SettingsState.loaded(user: currentUser);
    } on Exception {
      state = SettingsState.error("Couldn't fetch user. Is the device online?");
    }
  }

  Future<void> signOut() async {
    final _prefs = await SharedPreferences.getInstance();
    await _prefs.remove(SharedPrefStrings.PLEX_TOKEN);
    await _prefs.remove(SharedPrefStrings.PLEX_LIBRARY);
    await _prefs.remove(SharedPrefStrings.PLEX_SERVER);
  }
}
