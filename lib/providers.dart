import 'dart:async';

import 'package:audiobookly/models/preferences.dart';
import 'package:audiobookly/repositories/media/abs_repository.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:audiobookly/services/device_info/device_info_service.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/repositories/media/emby_repository.dart';
import 'package:audiobookly/repositories/media/plex_repository.dart';
import 'package:audiobookly/services/download/download_service.dart';
import 'package:emby_api/emby_api.dart';
import 'package:get_it/get_it.dart';
import 'package:plex_api/plex_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final embyApiProvider = Provider<EmbyApi>((ref) {
  DeviceInfoService infoService = ref.watch(deviceInfoServiceProvider);
  Preferences prefs = ref.watch(preferencesProvider);

  final _info = infoService.info;
  return EmbyApi(
    userId: prefs.userId,
    baseUrl: prefs.baseUrl,
    client: 'Audiobookly',
    clientVersion: _info.version,
    deviceId: _info.uniqueId,
    deviceName: _info.model,
    token: prefs.userToken,
  );
});

final plexApiProvider = Provider<PlexApi>((ref) {
  DeviceInfoService infoService = ref.watch(deviceInfoServiceProvider);
  Preferences prefs = ref.watch(preferencesProvider);
  final info = infoService.info;
  return PlexApi(
    headers: PlexHeaders(
      clientIdentifier: info.uniqueId!,
      device: info.model!,
      product: 'Audiobookly',
      platform: info.platform!,
      platformVersion: info.version!,
      token: prefs.userToken,
    ),
  );
});

final mediaRepositoryProvider = Provider<MediaRepository?>((ref) {
  ServerType serverType = ref.watch(
    preferencesProvider.select((prefs) => prefs.serverType),
  );
  Preferences prefs = ref.read(preferencesProvider);
  if (serverType == ServerType.emby) {
    final embyApi = ref.watch(embyApiProvider);
    return EmbyRepository(embyApi, prefs.libraryId);
  } else if (serverType == ServerType.plex) {
    final plexApi = ref.watch(plexApiProvider);
    return PlexRepository(api: plexApi, prefs: prefs)..getServerAndLibrary();
  } else if (serverType == ServerType.audiobookshelf) {
    final absApi = ref.watch(absApiProvider);
    return AbsRepository(absApi);
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

class PreferencesNotifier extends StateNotifier<Preferences> {
  late StreamSubscription sub;
  late DatabaseService _db;

  PreferencesNotifier()
      : super(GetIt.I<DatabaseService>().getPreferencesSync()) {
    _db = GetIt.I<DatabaseService>();
    sub = _db.watchPreferences().listen((prefs) {
      print('Got preferences $prefs');
      if (prefs != null) state = prefs;
    });
  }

  Future savePreferences(Preferences prefs) async {
    await _db.insertPreferences(prefs);
  }

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }
}

final preferencesProvider =
    StateNotifierProvider<PreferencesNotifier, Preferences>(
        (ref) => PreferencesNotifier());
