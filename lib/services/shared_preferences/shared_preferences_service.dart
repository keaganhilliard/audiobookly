import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesServiceProvider =
    Provider<SharedPreferencesService>(((ref) => throw UnimplementedError()));

enum SERVER_TYPE { PLEX, EMBY, AUDIOBOOKSHELF, UNKNOWN }

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

  String getBaseUrl() => sharedPreferences.getString(baseUrlKey) ?? '';

  Future<void> setUserToken(String token) async {
    await sharedPreferences.setString(userTokenKey, token);
  }

  String getCurrentToken() => sharedPreferences.getString(userTokenKey) ?? '';

  Future<void> setServerType(SERVER_TYPE? type) async {
    await sharedPreferences.setString(serverTypeKey, (type?.toString() ?? ''));
  }

  SERVER_TYPE getServerType() => ((key) => SERVER_TYPE.values.firstWhere(
        (element) => element.toString() == key,
        orElse: () => SERVER_TYPE.UNKNOWN,
      ))(sharedPreferences.getString(serverTypeKey));

  Future setServerId(String serverId) async {
    await sharedPreferences.setString(serverIdKey, serverId);
  }

  String getServerId() => sharedPreferences.getString(serverIdKey) ?? '';

  Future setUserId(String userId) async {
    await sharedPreferences.setString(userIdKey, userId);
  }

  String? getUserId() => sharedPreferences.getString(userIdKey);

  Future setLibraryId(String libraryId) async {
    await sharedPreferences.setString(libraryKey, libraryId);
  }

  String getLibraryId() => sharedPreferences.getString(libraryKey) ?? '';
}
