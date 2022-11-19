// ignore_for_file: invalid_use_of_protected_member

import 'package:audiobookly/models/preferences.dart';
import 'package:audiobookly/models/user.dart';
import 'package:audiobookly/repositories/media/abs_repository.dart';
import 'package:audiobookly/repositories/authentication/authentication_repository.dart';
import 'package:audiobookly/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final absAuthRepoProvider = Provider<AbsAuthRepository>((ref) {
  return AbsAuthRepository(ref);
});

class AbsAuthRepository extends AuthenticationRepository {
  final Ref _ref;
  AbsAuthRepository(this._ref);

  @override
  Future<User?> getUser(String token) async {
    final absApi = _ref.read(absApiProvider);
    final prefs = _ref.read(preferencesProvider);
    absApi.token = token;
    absApi.userId = prefs.userId;
    final user = await absApi.getUser();

    return User(
      name: user.username,
      userName: user.username,
      token: token,
    );
  }

  @override
  Future<bool> logout() async {
    final prefs = _ref.read(preferencesProvider.notifier);

    prefs.savePreferences(
      prefs.state
        ..baseUrl = ''
        ..userToken = ''
        ..userId = ''
        ..serverId = ''
        ..libraryId = ''
        ..serverType = ServerType.unknown,
    );

    return true;
  }

  Future<User> login(String baseUrl, String username, String password) async {
    final prefs = _ref.read(preferencesProvider.notifier);
    final absApi = _ref.read(absApiProvider);
    absApi.baseUrl = baseUrl;
    final res = await absApi.login(username, password);

    prefs.savePreferences(
      prefs.state
        ..username = res.user.username
        ..userId = res.user.id
        ..baseUrl = baseUrl
        ..userToken = res.user.token
        ..serverType = ServerType.audiobookshelf,
    );

    // print(res.toJson());
    return User(
      name: res.user.username,
      userName: res.user.username,
      token: res.user.token,
    );
  }
}
