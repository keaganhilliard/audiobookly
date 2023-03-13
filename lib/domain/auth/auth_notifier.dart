import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:audiobookly/domain/server_select/server_select.dart';
import 'package:audiobookly/ios_ui/features/library_select/library_select_view.dart';
import 'package:audiobookly/mac_ui/features/library_select/library_select_view.dart';
import 'package:audiobookly/models/library.dart';
import 'package:audiobookly/models/preferences.dart';
import 'package:audiobookly/models/user.dart';
import 'package:audiobookly/repositories/authentication/abs_auth_repository.dart';
import 'package:audiobookly/repositories/authentication/plex_auth_repository.dart';
import 'package:audiobookly/services/navigation/navigation_service.dart';
import 'package:audiobookly/repositories/authentication/emby_auth_repository.dart';
import 'package:audiobookly/domain/auth/auth_state.dart';
import 'package:audiobookly/material_ui/features/library_select/library_select_view.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      final prefsNotifier = _ref.read(preferencesProvider.notifier);
      Preferences prefs = prefsNotifier.state;
      prefs.userToken = '';
      // prefs.baseUrl = '';
      prefs.serverId = '';
      prefs.serverType = ServerType.unknown;
      prefs.userId = '';
      prefs.libraryId = '';
      prefsNotifier.savePreferences(prefs);
      state = const AuthStateInitial();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> formLogin(
    String baseUrl,
    String username,
    String password,
    ServerType serverType,
  ) async {
    if (serverType == ServerType.audiobookshelf) {
      return await absLogin(baseUrl, username, password);
    } else if (serverType == ServerType.emby) {
      return await embyLogin(baseUrl, username, password);
    }
    return false;
  }

  Future<bool> embyLogin(
    String baseUrl,
    String username,
    String password,
  ) async {
    User? u;
    try {
      u = await _ref
          .read(embyAuthRepoProvider)
          .login(baseUrl, username, password);
    } catch (e) {
      log('$e');
    }
    return u?.token != null;
  }

  Future<bool> absLogin(
    String baseUrl,
    String username,
    String password,
  ) async {
    User? u;
    try {
      u = await _ref
          .read(absAuthRepoProvider)
          .login(baseUrl, username, password);
    } catch (e, stack) {
      log('$e');
      log('$stack');
    }
    return u?.token != null;
  }

  Future<bool> plexLogin() async {
    final prefsNotifier = _ref.read(preferencesProvider.notifier);
    final prefs = prefsNotifier.state;
    final plexApi = _ref.read(plexApiProvider);
    PlexPin pin = await plexApi.getPin();
    String oAuthUrl = plexApi.getOauthUrl(pin.code!);
    // Browser browser = await openUrl(oAuthUrl);
    await launchUrl(oAuthUrl.uri!);
    int count = 0;
    Completer waitForIt = Completer();
    Timer.periodic(const Duration(seconds: 5), (timer) async {
      count++;
      PlexPin authToken = await plexApi.getAuthToken(pin.id!);
      if (authToken.authToken != null) {
        plexApi.headers.token = authToken.authToken;
        plexApi.authToken = authToken.authToken;
        prefs.userToken = authToken.authToken!;
        prefs.serverType = ServerType.plex;
        prefsNotifier.savePreferences(prefs);
        // urlLauncher.closeWebView();
        // await browser.close();
        timer.cancel();
        waitForIt.complete();
      }
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
    prefs.serverId = server.id;
    prefsNotifier.savePreferences(prefs);

    await (navigationService.push(
      MaterialPageRoute(
        builder: (context) => const LibrarySelectView(),
      ),
    ));

    return false; //server != null && library != null;
  }

  Future checkToken() async {
    final prefsNotifier = _ref.read(preferencesProvider.notifier);
    Preferences prefs = prefsNotifier.state;
    if (prefs.userToken.isNotEmpty && prefs.libraryId.isNotEmpty) {
      state = AuthStateLoaded(
        user: User(
          name: prefs.username,
          userName: prefs.username,
          token: prefs.userToken,
        ),
      );
      return;
    }
    try {
      state = const AuthStateLoading();
      final navigationService = _ref.read(navigationServiceProvider);
      log('Checking token: ${prefs.userToken}');

      User? user;
      if (prefs.serverType == ServerType.emby) {
        final userRepo = _ref.read(embyAuthRepoProvider);
        user = await userRepo.getUser(prefs.userToken);
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
        user = await userRepo.getUser(prefs.userToken);

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
        user = await userRepo.getUser(prefs.userToken);
        if (prefs.libraryId.isEmpty) {
          if (Platform.isIOS) {
            await navigationService.push(
              CupertinoPageRoute(builder: (context) {
                return const IosLibrarySelectView();
              }),
            );
          } else if (Platform.isMacOS) {
            await navigationService.push(
              CupertinoPageRoute(builder: (context) {
                return const MacosLibrarySelectView();
              }),
            );
          } else {
            await navigationService.push(
              MaterialPageRoute(builder: (context) {
                return const LibrarySelectView();
              }),
            );
          }
        }
      }

      if (user != null) {
        state = AuthStateLoaded(user: user);
      } else {
        // prefs.userToken = '';
        // prefsNotifier.savePreferences(prefs);
        // state = const AuthStateInitial();
        state = AuthStateLoaded(
          user: User(
            name: prefs.username,
            userName: prefs.username,
            token: prefs.userToken,
          ),
        );
      }
    } catch (e, stack) {
      // if (e.toString().startsWith('Failed host lookup')) {
      //   state = const AuthStateOffline();
      // } else {
      state = AuthStateLoaded(
        user: User(
          name: prefs.username,
          userName: prefs.username,
          token: prefs.userToken,
        ),
      );
      log('$e');
      log('$stack');
      // state = AuthStateErrorDetails(e.toString());
      // }
    }
  }
}
