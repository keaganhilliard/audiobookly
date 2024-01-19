// ignore_for_file: invalid_use_of_protected_member

import 'package:audiobookly/models/preferences.dart';
import 'package:audiobookly/models/user.dart';
import 'package:audiobookly/repositories/authentication/authentication_repository.dart';
import 'package:audiobookly/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final embyAuthRepoProvider = Provider<EmbyAuthRepository>((ref) {
  return EmbyAuthRepository(ref);
});

class EmbyAuthRepository extends AuthenticationRepository {
  final Ref _ref;
  EmbyAuthRepository(this._ref);

  @override
  Future<User?> getUser(String token) async {
    final embyApi = _ref.read(embyApiProvider);
    final prefs = _ref.read(preferencesProvider);
    embyApi.token = token;
    embyApi.userId = prefs.userId;
    final user = await embyApi.getUser();

    return User(
      name: user.name,
      userName: user.name,
      token: token,
    );
  }

  @override
  Future<bool> logout() async {
    final prefsNotifier = _ref.read(preferencesProvider.notifier);
    final prefs = _ref.read(preferencesProvider);
    prefsNotifier.savePreferences(
      prefs.copyWith(
        baseUrl: '',
        userToken: '',
        userId: '',
        serverId: '',
        libraryId: '',
        serverType: ServerType.unknown,
      ),
    );

    return true;
  }

  Future<User> login(String baseUrl, String username, String password) async {
    final prefsNotifier = _ref.read(preferencesProvider.notifier);
    final prefs = _ref.read(preferencesProvider);
    final embyApi = _ref.read(embyApiProvider);
    embyApi.baseUrl = baseUrl;
    final res = await embyApi.login(username, password);
    prefsNotifier.savePreferences(prefs.copyWith(
      userId: res.user!.id!,
      baseUrl: baseUrl,
      userToken: res.accessToken!,
      serverId: res.serverId!,
      serverType: ServerType.emby,
    ));
    return User(
      name: res.user!.name,
      userName: res.user!.name,
      token: res.accessToken,
    );
  }
}
