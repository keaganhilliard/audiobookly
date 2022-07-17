import 'package:audiobookly/models/user.dart';
import 'package:audiobookly/services/shared_preferences/shared_preferences_service.dart';
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
    final prefs = _ref.read(sharedPreferencesServiceProvider);
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
    final prefs = _ref.read(sharedPreferencesServiceProvider);
    await prefs.setBaseUrl('');
    await prefs.setUserToken('');
    await prefs.setServerId('');
    await prefs.setLibraryId('');
    await prefs.setServerType(null);
    return true;
  }

  Future<User> login(String baseUrl, String username, String password) async {
    final prefs = _ref.read(sharedPreferencesServiceProvider);
    final embyApi = _ref.read(embyApiProvider);
    embyApi.baseUrl = baseUrl;
    final res = await embyApi.login(username, password);
    await prefs.setUserId(res.user!.id!);
    await prefs.setBaseUrl(baseUrl);
    await prefs.setUserToken(res.accessToken!);
    await prefs.setServerId(res.serverId!);
    await prefs.setServerType(ServerType.emby);
    print(res.toJson());
    return User(
      name: res.user!.name,
      userName: res.user!.name,
      token: res.accessToken,
    );
  }
}
