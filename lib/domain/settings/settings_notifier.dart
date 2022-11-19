import 'package:audiobookly/models/user.dart';
import 'package:audiobookly/domain/settings/settings_state.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final settingsStateProvider =
    StateNotifierProvider<SettingsNotifier, SettingsState>((ref) {
  return SettingsNotifier();
});

class SettingsNotifier extends StateNotifier<SettingsState> {
  User? currentUser;

  SettingsNotifier() : super(const SettingsState.initial()) {
    getUser();
  }

  Future<void> getUser() async {
    try {
      DatabaseService db = GetIt.I();
      state = const SettingsState.loading();
      final prefs = db.getPreferencesSync();
      currentUser = User(userName: prefs.username, name: prefs.username);
      state = SettingsState.loaded(user: currentUser);
    } on Exception {
      state = const SettingsState.error(
          "Couldn't fetch user. Is the device online?");
    }
  }
}
