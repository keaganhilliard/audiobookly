import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/database/database.dart';
import 'package:audiobookly/services/device_info/device_info_service.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/services/shared_preferences/shared_preferences_service.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/repositories/media/emby_repository.dart';
import 'package:audiobookly/repositories/media/plex_repository.dart';
import 'package:audiobookly/services/download/download_service.dart';
import 'package:audiobookly/services/download/emby_download_service.dart';
import 'package:emby_api/emby_api.dart';
import 'package:plex_api/plex_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final embyApiProvider = Provider<EmbyApi>((ref) {
  DeviceInfoService infoService = ref.watch(deviceInfoServiceProvider);
  SharedPreferencesService sharedPreferencesService =
      ref.watch(sharedPreferencesServiceProvider);

  final _info = infoService.info;
  return EmbyApi(
    userId: sharedPreferencesService.getUserId(),
    baseUrl: sharedPreferencesService.getBaseUrl(),
    client: 'Audiobookly',
    clientVersion: _info.version,
    deviceId: _info.uniqueId,
    deviceName: _info.model,
    token: sharedPreferencesService.getCurrentToken(),
  );
});

final plexApiProvider = Provider<PlexApi>((ref) {
  DeviceInfoService infoService = ref.watch(deviceInfoServiceProvider);
  SharedPreferencesService sharedPreferencesService =
      ref.watch(sharedPreferencesServiceProvider);
  final _info = infoService.info;
  return PlexApi(
    headers: PlexHeaders(
      clientIdentifier: _info.uniqueId,
      device: _info.model,
      product: 'Audiobookly',
      platform: _info.platform,
      platformVersion: _info.version,
      token: sharedPreferencesService.getCurrentToken(),
    ),
  );
});

final mediaRepositoryProdiver = Provider<MediaRepository>((ref) {
  final sharedPreferencesService = ref.watch(sharedPreferencesServiceProvider);
  if (sharedPreferencesService.getServerType() == SERVER_TYPE.EMBY) {
    final embyApi = ref.watch(embyApiProvider);
    return EmbyRepository(embyApi, sharedPreferencesService.getLibraryId());
  } else if (sharedPreferencesService.getServerType() == SERVER_TYPE.PLEX) {
    return PlexRepository()..getServerAndLibrary();
  } else
    return null;
});

final downloadServiceProvider = Provider.autoDispose<DownloadService>((ref) {
  final sharedPreferencesService = ref.watch(sharedPreferencesServiceProvider);
  if (sharedPreferencesService.getServerType() == SERVER_TYPE.EMBY) {
    final embyApi = ref.watch(embyApiProvider);
    // final db = ref.watch(databaseServiceProvider);
    return EmbyDownloadService(embyApi, null);
  }
  return null;
});

final playbackStateProvider = StreamProvider<PlaybackState>((ref) {
  final playbackController = ref.watch(playbackControllerProvider);
  return playbackController.playbackStateStream;
});

final currentItemProvider = StreamProvider<MediaItem>((ref) {
  final playbackController = ref.watch(playbackControllerProvider);
  return playbackController.currentMediaItemStream;
});

final queueProvider = StreamProvider<List<MediaItem>>((ref) {
  final playbackController = ref.watch(playbackControllerProvider);
  return playbackController.queueStream;
});
