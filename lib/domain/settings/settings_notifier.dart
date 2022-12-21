import 'dart:async';

import 'package:audiobookly/models/library.dart';
import 'package:audiobookly/models/preferences.dart';
import 'package:audiobookly/models/user.dart';
import 'package:audiobookly/domain/settings/settings_state.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final settingsStateProvider =
    StateNotifierProvider<SettingsNotifier, SettingsState>((ref) {
  return SettingsNotifier(ref.watch(preferencesProvider));
});

class SettingsNotifier extends StateNotifier<SettingsState> {
  // User? currentUser;
  StreamSubscription? sub;
  Preferences prefs;

  SettingsNotifier(this.prefs) : super(const SettingsState.initial()) {
    state = SettingsState.loaded(
      user: User(userName: prefs.username, name: prefs.username),
      lib: Library(
        prefs.libraryId,
        prefs.libraryLabel,
      ),
    );
  }

  // Future<void> getUser() async {
  //   try {
  //     DatabaseService db = GetIt.I();
  //     state = const SettingsState.loading();
  //     sub = db.watchPreferences().listen((prefs) {
  //       if (prefs != null) {
  //         currentUser = User(userName: prefs.username, name: prefs.username);
  //         state = SettingsState.loaded(
  //           user: currentUser,
  //           lib: Library(
  //             prefs.libraryId,
  //             prefs.libraryLabel,
  //           ),
  //         );
  //       }
  //     });
  //     final prefs = db.getPreferencesSync();
  //     currentUser = User(userName: prefs.username, name: prefs.username);
  //     state = SettingsState.loaded(
  //       user: currentUser,
  //       lib: Library(
  //         prefs.libraryId,
  //         prefs.libraryLabel,
  //       ),
  //     );
  //   } on Exception {
  //     state = const SettingsState.error(
  //         "Couldn't fetch user. Is the device online?");
  //   }
  // }

  @override
  void dispose() {
    sub?.cancel();
    super.dispose();
  }
}
