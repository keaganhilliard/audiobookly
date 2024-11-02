// ignore_for_file: invalid_use_of_protected_member

import 'package:audiobookly/models/preferences.dart';
import 'package:audiobookly/models/user.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/repositories/authentication/authentication_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final plexAuthRepoProvider = Provider<PlexAuthRepository>((ref) {
  return PlexAuthRepository(ref);
});

class PlexAuthRepository extends AuthenticationRepository {
  final Ref _ref;
  PlexAuthRepository(this._ref);
  @override
  Future<User?> getUser(String token) async {
    final plexApi = _ref.read(plexApiProvider);
    plexApi.headers.token = token;
    plexApi.authToken = token;
    final user = await (plexApi.getUser());

    if (user == null) return null;

    return User(
      name: user.title,
      userName: user.username,
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
}
