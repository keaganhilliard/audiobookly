import 'dart:async';

import 'package:audiobookly/core/models/user.dart';
import 'package:audiobookly/core/services/navigation_service.dart';
import 'package:audiobookly/core/services/shared_preferences_service.dart';
import 'package:audiobookly/core/utils/in_app_browser.dart';
import 'package:audiobookly/core/viewmodels/library_list_view_model.dart';
import 'package:audiobookly/core/viewmodels/server_list_view_model.dart';
import 'package:audiobookly/new_project_structure/repositories/authentication/emby_auth_repository.dart';
import 'package:audiobookly/new_project_structure/state_notifiers/auth/auth_state.dart';
import 'package:audiobookly/new_project_structure/state_notifiers/library_select/library_select_view.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/screens/library_select.dart';
import 'package:audiobookly/screens/server_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plex_api/plex_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authNotifierProvider = StateNotifierProvider<AuthNotifier>((ref) {
  return AuthNotifier(ref);
});

class AuthNotifier extends StateNotifier<AuthState> {
  final ProviderReference _ref;

  AuthNotifier(this._ref) : super(AuthStateInitial()) {
    checkToken();
  }

  Future<bool> logout() async {
    try {
      state = AuthStateLoading();
      final _prefs = _ref.read(sharedPreferencesServiceProvider);
      await _prefs.setUserToken('');
      await _prefs.setBaseUrl('');
      await _prefs.setServerId('');
      await _prefs.setServerType(null);
      await _prefs.setUserId('');
      await _prefs.setLibraryId('');
      state = AuthStateInitial();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> embyLogin(
    String baseUrl,
    String username,
    String password,
  ) async {
    print(baseUrl);
    print(username);
    print(password);
    User u = await _ref
        .read(embyAuthRepoProvider)
        .login(baseUrl, username, password);
    return u.token != null;
  }

  Future<bool> plexLogin() async {
    final _prefs = _ref.read(sharedPreferencesServiceProvider);
    _prefs.setServerType(SERVER_TYPE.PLEX);
    final _plexApi = _ref.read(plexApiProvider);
    PlexPin pin = await _plexApi.getPin();
    String oAuthUrl = _plexApi.getOauthUrl(pin.code);
    Browser browser = await openUrl(oAuthUrl);
    int count = 0;
    Completer waitForIt = Completer();
    Timer.periodic(Duration(seconds: 5), (timer) async {
      count++;
      PlexPin authToken = await _plexApi.getAuthToken(pin.id);
      if (authToken.authToken != null) {
        _plexApi.headers.token = authToken.authToken;
        _prefs.setUserToken(authToken.authToken);
        // urlLauncher.closeWebView();
        await browser.close();
        timer.cancel();
        waitForIt.complete();
      }
      print('In Timer: ${authToken.error}');
      if (count > 20) {
        timer.cancel();
        waitForIt.completeError('No code');
      }
    });
    await waitForIt.future;
    PlexServerV2 server = await NavigationService().push(
      MaterialPageRoute(
        builder: (context) => ServerSelect(
          model: ServerListViewModel(api: _plexApi),
        ),
      ),
    );

    PlexLibrary library = await NavigationService().push(
      MaterialPageRoute(
        builder: (context) => LibrarySelect(
          model: LibraryListViewModel(server: server),
        ),
      ),
    );

    return server != null && library != null;
  }

  Future checkToken() async {
    try {
      state = AuthStateLoading();
      final _prefs = _ref.read(sharedPreferencesServiceProvider);
      print('Checking token: ${_prefs.getCurrentToken()}');

      User user;
      if (_prefs.getServerType() == SERVER_TYPE.EMBY) {
        final _userRepo = _ref.read(embyAuthRepoProvider);
        user = await _userRepo.getUser(_prefs.getCurrentToken());
        print('LibraryId: ${_prefs.getLibraryId()}');
        if (_prefs.getLibraryId().isEmpty) {
          await NavigationService().push(
            MaterialPageRoute(builder: (context) {
              return LibrarySelectView();
            }),
          );
        }
      } else {}

      if (user != null)
        state = AuthStateLoaded(user: user);
      else {
        _prefs.setUserToken('');
        state = AuthStateInitial();
      }
    } catch (e) {
      state = AuthStateErrorDetails(e.toString());
    }
  }
}
