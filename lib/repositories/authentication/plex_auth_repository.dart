import 'package:audiobookly/models/user.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/repositories/authentication/authentication_repository.dart';
import 'package:audiobookly/services/shared_preferences/shared_preferences_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final plexAuthRepoProvider = Provider<PlexAuthRepository>((ref) {
  return PlexAuthRepository(ref);
});

class PlexAuthRepository extends AuthenticationRepository {
  final ProviderReference _ref;
  PlexAuthRepository(this._ref);
  @override
  Future<User?> getUser(String token) async {
    final _plexApi = _ref.read(plexApiProvider);
    _plexApi.headers.token = token;
    _plexApi.authToken = token;
    final user = await (_plexApi.getUser());
    final _prefs = _ref.read(sharedPreferencesServiceProvider);
    final _repo = _ref.read(mediaRepositoryProvider);

    if (user == null) return null;

    return User(
      name: user.title,
      userName: user.username,
      token: token,
    );
  }

  @override
  Future<bool> logout() async {
    final _prefs = _ref.read(sharedPreferencesServiceProvider);
    await _prefs.setBaseUrl('');
    await _prefs.setUserToken('');
    await _prefs.setServerId('');
    await _prefs.setLibraryId('');
    await _prefs.setServerType(null);
    return true;
  }
}
