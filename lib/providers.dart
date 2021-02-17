import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/services/audio_handler_with_repository.dart';
import 'package:audiobookly/core/services/device_info_service.dart';
import 'package:audiobookly/core/services/playback_controller.dart';
import 'package:audiobookly/core/services/shared_preferences_service.dart';
import 'package:audiobookly/new_project_structure/repositories/media/media_repository.dart';
// import 'package:audiobookly/repository/base_repository.dart';
import 'package:audiobookly/new_project_structure/repositories/media/emby_repository.dart';
import 'package:audiobookly/new_project_structure/repositories/media/plex_repository.dart';
import 'package:emby_api/emby_api.dart';
import 'package:plex_api/plex_api.dart';
import 'package:riverpod/riverpod.dart';

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

// final baseRepositoryProdiver = Provider<BaseRepository>((ref) {
//   final sharedPreferencesService = ref.watch(sharedPreferencesServiceProvider);
//   if (sharedPreferencesService.getServerType() == SERVER_TYPE.EMBY) {
//     final embyApi = ref.watch(embyApiProvider);
//     return EmbyRepository(embyApi);
//   } else if (sharedPreferencesService.getServerType() == SERVER_TYPE.PLEX) {
//     return PlexRepository()..getServerAndLibrary();
//   } else
//     return null;
// });

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

final audioHandlerProvider = FutureProvider<AudioHandler>((ref) async {
  final repo = ref.watch(mediaRepositoryProdiver);
  if (repo != null) {
    return await AudioService.init(
      builder: () => AudiobooklyAudioHandler(),
      config: AudioServiceConfig(
        androidNotificationChannelName: 'Audiobookly',
        androidNotificationOngoing: true,
        androidEnableQueue: true,
        androidNotificationClickStartsActivity: true,
        androidStopForegroundOnPause: true,
        rewindInterval: Duration(seconds: 30),
        fastForwardInterval: Duration(seconds: 30),
        androidNotificationIcon: 'mipmap/audiobookly_launcher',
      ),
    );
  } else
    return null;
});

final playbackStateProvider = AutoDisposeStreamProvider<PlaybackState>((ref) {
  return PlaybackController().playbackStateStream;
});

final currentItemProvider = AutoDisposeStreamProvider<MediaItem>((ref) {
  return PlaybackController().currentMediaItemStream;
});
