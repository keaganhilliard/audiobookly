import 'dart:async';

import 'package:audiobookly/features/server_select/server_select.dart';
import 'package:audiobookly/models/library.dart';
import 'package:audiobookly/models/user.dart';
import 'package:audiobookly/repositories/authentication/abs_auth_repository.dart';
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
  final Ref _ref;

  AuthNotifier(this._ref) : super(const AuthStateInitial()) {
    checkToken();
  }

  Future<bool> logout() async {
    try {
      state = const AuthStateLoading();
      final prefs = _ref.read(sharedPreferencesServiceProvider);
      await prefs.setUserToken('');
      await prefs.setBaseUrl('');
      await prefs.setServerId('');
      await prefs.setServerType(null);
      await prefs.setUserId('');
      await prefs.setLibraryId('');
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

  Future<bool> absLogin(
    String baseUrl,
    String username,
    String password,
  ) async {
    User u =
        await _ref.read(absAuthRepoProvider).login(baseUrl, username, password);
    return u.token != null;
  }

  Future<bool> plexLogin() async {
    final prefs = _ref.read(sharedPreferencesServiceProvider);
    final plexApi = _ref.read(plexApiProvider);
    PlexPin pin = await plexApi.getPin();
    String oAuthUrl = plexApi.getOauthUrl(pin.code!);
    // Browser browser = await openUrl(oAuthUrl);
    await launchUrl(Uri.parse(oAuthUrl));
    int count = 0;
    Completer waitForIt = Completer();
    Timer.periodic(const Duration(seconds: 5), (timer) async {
      print('Timering');
      count++;
      PlexPin authToken = await plexApi.getAuthToken(pin.id!);
      if (authToken.authToken != null) {
        plexApi.headers.token = authToken.authToken;
        plexApi.authToken = authToken.authToken;
        prefs.setUserToken(authToken.authToken!);
        prefs.setServerType(ServerType.plex);
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
    final servers = (await plexApi.getServers())
        .map((server) => Library(server.clientIdentifier, server.name))
        .toList();
    final navigationService = _ref.read(navigationServiceProvider);
    final server = await navigationService.push(
      MaterialPageRoute(
        builder: (context) => ServerSelect(servers),
      ),
    );
    print(server.id);
    prefs.setServerId(server.id);

    final library = await (navigationService.push(
      MaterialPageRoute(
        builder: (context) => const LibrarySelectView(),
      ),
    ));

    return false; //server != null && library != null;
  }

  Future checkToken() async {
    try {
      state = const AuthStateLoading();
      final prefs = _ref.read(sharedPreferencesServiceProvider);
      final navigationService = _ref.read(navigationServiceProvider);
      print('Checking token: ${prefs.currentToken}');

      User? user;
      if (prefs.serverType == ServerType.emby) {
        final userRepo = _ref.read(embyAuthRepoProvider);
        user = await userRepo.getUser(prefs.currentToken);
        if (prefs.libraryId.isEmpty) {
          await navigationService.push(
            MaterialPageRoute(builder: (context) {
              return const LibrarySelectView();
            }),
          );
        }
      } else if (prefs.serverType == ServerType.plex) {
        final userRepo = _ref.read(plexAuthRepoProvider);
        // final plexRepo = _ref.read(plexApiProvider);
        user = await userRepo.getUser(prefs.currentToken);

        if (user == null) {
        } else if (prefs.serverId.isEmpty) {
          // final thing = await navigationService.push(
          //   MaterialPageRoute(builder: (context) {
          //     return ServerSelect(await plexRepo.getSer);
          //   }),
          // );
        }
        // if (prefs.libraryId.isEmpty) {
        //   await navigationService.push(
        //     MaterialPageRoute(builder: (context) {
        //       return LibrarySelectView();
        //     }),
        //   );
        // }
      } else if (prefs.serverType == ServerType.audiobookshelf) {
        final userRepo = _ref.read(absAuthRepoProvider);
        user = await userRepo.getUser(prefs.currentToken);
        print(user);
        if (prefs.libraryId.isEmpty) {
          await navigationService.push(
            MaterialPageRoute(builder: (context) {
              return const LibrarySelectView();
            }),
          );
        }
      } else {}

      if (user != null) {
        state = AuthStateLoaded(user: user);
      } else {
        prefs.setUserToken('');
        state = const AuthStateInitial();
      }
    } catch (e, stack) {
      print(e);
      print(stack);
      state = AuthStateErrorDetails(e.toString());
    }
  }
}
