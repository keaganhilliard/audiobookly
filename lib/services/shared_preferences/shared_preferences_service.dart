import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesServiceProvider =
    Provider<SharedPreferencesService>(((ref) => throw UnimplementedError()));

enum ServerType { plex, emby, audiobookshelf, unknown }

class SharedPreferencesService {
  SharedPreferencesService(this.sharedPreferences);
  final SharedPreferences sharedPreferences;

  static const userTokenKey = 'USER_TOKEN';
  static const userIdKey = 'USER_ID';
  static const serverTypeKey = 'SERVER_TYPE_KEY';
  static const serverIdKey = 'SERVER_ID_KEY';
  static const libraryKey = 'LIBRARY_KEY';
  static const baseUrlKey = 'BASE_URL_KEY';
  static const speedKey = 'playbackSpeed';
  static const rewindIntervalKey = 'REWIND_INTERVAL_KEY';
  static const fastForwardIntervalKey = 'FF_INTERVAL_KEY';

  // init() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  // }

  Future<void> setSpeed(double speed) async {
    await sharedPreferences.setDouble(speedKey, speed);
  }

  double get speed => sharedPreferences.getDouble(speedKey) ?? 1.0;

  Future<void> setRewindInterval(double interval) async {
    await sharedPreferences.setDouble(rewindIntervalKey, interval);
  }

  Future<void> setFastForwardInterval(double interval) async {
    await sharedPreferences.setDouble(fastForwardIntervalKey, interval);
  }

  double get rewindInterval =>
      sharedPreferences.getDouble(rewindIntervalKey) ?? 15;
  double get fastForwardInterval =>
      sharedPreferences.getDouble(fastForwardIntervalKey) ?? 30;

  Future<void> setBaseUrl(String baseUrl) async {
    await sharedPreferences.setString(baseUrlKey, baseUrl);
  }

  String get baseUrl => sharedPreferences.getString(baseUrlKey) ?? '';

  Future<void> setUserToken(String token) async {
    await sharedPreferences.setString(userTokenKey, token);
  }

  String get currentToken => sharedPreferences.getString(userTokenKey) ?? '';

  Future<void> setServerType(ServerType? type) async {
    await sharedPreferences.setString(serverTypeKey, (type?.toString() ?? ''));
  }

  ServerType get serverType => ((key) => ServerType.values.firstWhere(
        (element) => element.toString() == key,
        orElse: () => ServerType.unknown,
      ))(sharedPreferences.getString(serverTypeKey));

  Future setServerId(String serverId) async {
    await sharedPreferences.setString(serverIdKey, serverId);
  }

  String get serverId => sharedPreferences.getString(serverIdKey) ?? '';

  Future setUserId(String userId) async {
    await sharedPreferences.setString(userIdKey, userId);
  }

  String? get userId => sharedPreferences.getString(userIdKey);

  Future setLibraryId(String libraryId) async {
    await sharedPreferences.setString(libraryKey, libraryId);
  }

  String get libraryId => sharedPreferences.getString(libraryKey) ?? '';
}
