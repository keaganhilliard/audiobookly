import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/core/models/user.dart';
import 'package:audiobookly/core/services/audio_handler.dart';
import 'package:audiobookly/core/services/server_communicator.dart';
import 'package:audiobookly/cubit/settings/settings_state.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final ServerCommunicator _communicator;
  User currentUser;

  SettingsCubit(this._communicator) : super(SettingsState.initial());

  Future<void> getUser() async {
    try {
      emit(SettingsState.loading());
      currentUser = await _communicator.getUser();
      emit(SettingsState.loaded(user: currentUser));
    } on Exception {
      emit(SettingsState.error("Couldn't fetch user. Is the device online?"));
    }
  }

  Future<void> signOut() async {
    final _prefs = await SharedPreferences.getInstance();
    await _prefs.remove(SharedPrefStrings.PLEX_TOKEN);
    await _prefs.remove(SharedPrefStrings.PLEX_LIBRARY);
    await _prefs.remove(SharedPrefStrings.PLEX_SERVER);
  }
}
