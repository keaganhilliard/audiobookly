import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/repositories/media/abs_repository.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:audiobookly/services/device_info/device_info_service.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/services/shared_preferences/shared_preferences_service.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/repositories/media/emby_repository.dart';
import 'package:audiobookly/repositories/media/plex_repository.dart';
import 'package:audiobookly/services/download/download_service.dart';
import 'package:emby_api/emby_api.dart';
import 'package:plex_api/plex_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final embyApiProvider = Provider<EmbyApi>((ref) {
  DeviceInfoService infoService = ref.watch(deviceInfoServiceProvider);
  SharedPreferencesService sharedPreferencesService =
      ref.watch(sharedPreferencesServiceProvider);

  final _info = infoService.info;
  return EmbyApi(
    userId: sharedPreferencesService.userId,
    baseUrl: sharedPreferencesService.baseUrl,
    client: 'Audiobookly',
    clientVersion: _info.version,
    deviceId: _info.uniqueId,
    deviceName: _info.model,
    token: sharedPreferencesService.currentToken,
  );
});

final plexApiProvider = Provider<PlexApi>((ref) {
  DeviceInfoService infoService = ref.watch(deviceInfoServiceProvider);
  SharedPreferencesService sharedPreferencesService =
      ref.watch(sharedPreferencesServiceProvider);
  final info = infoService.info;
  return PlexApi(
    headers: PlexHeaders(
      clientIdentifier: info.uniqueId!,
      device: info.model!,
      product: 'Audiobookly',
      platform: info.platform!,
      platformVersion: info.version!,
      token: sharedPreferencesService.currentToken,
    ),
  );
});

final mediaRepositoryProvider = Provider<MediaRepository?>((ref) {
  final sharedPreferencesService = ref.watch(sharedPreferencesServiceProvider);
  if (sharedPreferencesService.serverType == ServerType.emby) {
    final embyApi = ref.watch(embyApiProvider);
    return EmbyRepository(embyApi, sharedPreferencesService.libraryId);
  } else if (sharedPreferencesService.serverType == ServerType.plex) {
    final plexApi = ref.watch(plexApiProvider);
    return PlexRepository(api: plexApi, prefs: sharedPreferencesService)
      ..getServerAndLibrary();
  } else if (sharedPreferencesService.serverType == ServerType.audiobookshelf) {
    final absApi = ref.watch(absApiProvider);
    return AbsRepository(absApi, sharedPreferencesService.libraryId);
  } else {
    return null;
  }
});

final Provider<DownloadService?> downloadServiceProvider =
    Provider<DownloadService?>((ref) {
  final mediaRepo = ref.watch(mediaRepositoryProvider);
  final db = ref.watch(databaseServiceProvider);
  if (mediaRepo != null) {
    return DownloadService(mediaRepo, db);
  } else {
    return null;
  }
});
