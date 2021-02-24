import 'package:audiobookly/models/user.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/services/device_info/device_info_service.dart';
import 'package:audiobookly/repositories/authentication/authentication_repository.dart';
import 'package:audiobookly/services/shared_preferences/shared_preferences_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plex_api/plex_api.dart';

final plexAuthRepoProvider = Provider<PlexAuthRepository>((ref) {
  return PlexAuthRepository(ref);
});

class PlexAuthRepository extends AuthenticationRepository {
  ProviderReference _ref;
  PlexAuthRepository(this._ref);
  Future<User> getUser(String token) async {
    final _plexApi = _ref.read(plexApiProvider);
    final user = await _plexApi.getUser();

    return User(
      name: user.title,
      userName: user.username,
      token: token,
    );
  }

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
