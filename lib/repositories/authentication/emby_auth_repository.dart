import 'package:audiobookly/models/user.dart';
import 'package:audiobookly/services/shared_preferences/shared_preferences_service.dart';
import 'package:audiobookly/repositories/authentication/authentication_repository.dart';
import 'package:audiobookly/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final embyAuthRepoProvider = Provider<EmbyAuthRepository>((ref) {
  return EmbyAuthRepository(ref);
});

class EmbyAuthRepository extends AuthenticationRepository {
  ProviderReference _ref;
  EmbyAuthRepository(this._ref);
  Future<User> getUser(String token) async {
    final _embyApi = _ref.read(embyApiProvider);
    final _prefs = _ref.read(sharedPreferencesServiceProvider);
    _embyApi.token = token;
    _embyApi.userId = _prefs.getUserId();
    final user = await _embyApi.getUser();

    return User(
      name: user.name,
      userName: user.name,
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

  Future<User> login(String baseUrl, String username, String password) async {
    final _prefs = _ref.read(sharedPreferencesServiceProvider);
    final _embyApi = _ref.read(embyApiProvider);
    _embyApi.baseUrl = baseUrl;
    final res = await _embyApi.login(username, password);
    await _prefs.setUserId(res.user.id);
    await _prefs.setBaseUrl(baseUrl);
    await _prefs.setUserToken(res.accessToken);
    await _prefs.setServerId(res.serverId);
    await _prefs.setServerType(SERVER_TYPE.EMBY);
    print(res.toJson());
    return User(
      name: res.user.name,
      userName: res.user.name,
      token: res.accessToken,
    );
  }
}
