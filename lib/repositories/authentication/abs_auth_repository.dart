import 'package:audiobookly/models/user.dart';
import 'package:audiobookly/repositories/media/abs_repository.dart';
import 'package:audiobookly/services/shared_preferences/shared_preferences_service.dart';
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
    final _absApi = _ref.read(absApiProvider);
    final _prefs = _ref.read(sharedPreferencesServiceProvider);
    _absApi.token = token;
    _absApi.userId = _prefs.userId;
    final user = await _absApi.getUser();

    return User(
      name: user.username,
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

  Future<User> login(String baseUrl, String username, String password) async {
    final _prefs = _ref.read(sharedPreferencesServiceProvider);
    final _absApi = _ref.read(absApiProvider);
    _absApi.baseUrl = baseUrl;
    final res = await _absApi.login(username, password);
    await _prefs.setUserId(res.user.id);
    await _prefs.setBaseUrl(baseUrl);
    await _prefs.setUserToken(res.user.token);
    // await _prefs.setServerId(res.serverId!);
    await _prefs.setServerType(ServerType.audiobookshelf);
    // print(res.toJson());
    return User(
      name: res.user.username,
      userName: res.user.username,
      token: res.user.token,
    );
  }
}
