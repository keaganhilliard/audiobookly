import 'dart:async';

import 'package:audiobookly/features/server_select/server_select.dart';
import 'package:audiobookly/models/library.dart';
import 'package:audiobookly/models/user.dart';
import 'package:audiobookly/repositories/authentication/plex_auth_repository.dart';
import 'package:audiobookly/services/navigation/navigation_service.dart';
import 'package:audiobookly/services/shared_preferences/shared_preferences_service.dart';
import 'package:audiobookly/repositories/authentication/emby_auth_repository.dart';
import 'package:audiobookly/features/auth/auth_state.dart';
import 'package:audiobookly/features/library_select/library_select_view.dart';
import 'package:audiobookly/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plex_api/plex_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref);
});

class AuthNotifier extends StateNotifier<AuthState> {
  final ProviderReference _ref;

  AuthNotifier(this._ref) : super(const AuthStateInitial()) {
    checkToken();
  }

  Future<bool> logout() async {
    try {
      state = const AuthStateLoading();
      final _prefs = _ref.read(sharedPreferencesServiceProvider);
      await _prefs.setUserToken('');
      await _prefs.setBaseUrl('');
      await _prefs.setServerId('');
      await _prefs.setServerType(null);
      await _prefs.setUserId('');
      await _prefs.setLibraryId('');
      state = const AuthStateInitial();
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
    User u = await _ref
        .read(embyAuthRepoProvider)
        .login(baseUrl, username, password);
    return u.token != null;
  }

  Future<bool> plexLogin() async {
    final _prefs = _ref.read(sharedPreferencesServiceProvider);
    final _plexApi = _ref.read(plexApiProvider);
    PlexPin pin = await _plexApi.getPin();
    String oAuthUrl = _plexApi.getOauthUrl(pin.code!);
    // Browser browser = await openUrl(oAuthUrl);
    await launch(oAuthUrl);
    int count = 0;
    Completer waitForIt = Completer();
    Timer.periodic(const Duration(seconds: 5), (timer) async {
      print('Timering');
      count++;
      PlexPin authToken = await _plexApi.getAuthToken(pin.id!);
      if (authToken.authToken != null) {
        _plexApi.headers.token = authToken.authToken;
        _plexApi.authToken = authToken.authToken;
        _prefs.setUserToken(authToken.authToken!);
        _prefs.setServerType(SERVER_TYPE.PLEX);
        // urlLauncher.closeWebView();
        // await browser.close();
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
    final servers = (await _plexApi.getServers())
        .map((server) => Library(server.clientIdentifier, server.name))
        .toList();
    final navigationService = _ref.read(navigationServiceProvider);
    final server = await navigationService.push(
      MaterialPageRoute(
        builder: (context) => ServerSelect(servers),
      ),
    );
    print(server.id);
    _prefs.setServerId(server.id);

    final library = await (navigationService.push(
      MaterialPageRoute(
        builder: (context) => LibrarySelectView(),
      ),
    ));

    return false; //server != null && library != null;
  }

  Future checkToken() async {
    try {
      state = const AuthStateLoading();
      final _prefs = _ref.read(sharedPreferencesServiceProvider);
      final navigationService = _ref.read(navigationServiceProvider);
      print('Checking token: ${_prefs.getCurrentToken()}');

      User? user;
      if (_prefs.getServerType() == SERVER_TYPE.EMBY) {
        final _userRepo = _ref.read(embyAuthRepoProvider);
        user = await _userRepo.getUser(_prefs.getCurrentToken());
        print('LibraryId: ${_prefs.getLibraryId()}');
        if (_prefs.getLibraryId().isEmpty) {
          await navigationService.push(
            MaterialPageRoute(builder: (context) {
              return LibrarySelectView();
            }),
          );
        }
      } else if (_prefs.getServerType() == SERVER_TYPE.PLEX) {
        final _userRepo = _ref.read(plexAuthRepoProvider);
        final _plexRepo = _ref.read(plexApiProvider);
        user = await _userRepo.getUser(_prefs.getCurrentToken());

        if (user == null) {
        } else if (_prefs.getServerId().isEmpty) {
          // final thing = await navigationService.push(
          //   MaterialPageRoute(builder: (context) {
          //     return ServerSelect(await _plexRepo.getSer);
          //   }),
          // );
        }
        // if (_prefs.getLibraryId().isEmpty) {
        //   await navigationService.push(
        //     MaterialPageRoute(builder: (context) {
        //       return LibrarySelectView();
        //     }),
        //   );
        // }
      } else {}

      if (user != null) {
        state = AuthStateLoaded(user: user);
      } else {
        _prefs.setUserToken('');
        state = const AuthStateInitial();
      }
    } catch (e) {
      state = AuthStateErrorDetails(e.toString());
    }
  }
}
