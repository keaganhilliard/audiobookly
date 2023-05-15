import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/services/audio/sleep_service.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:audiobookly/services/database/isar_database_service.dart';
import 'package:audiobookly/services/device_info/device_info_service.dart';
import 'package:audiobookly/services/download/desktop_downloader.dart';
import 'package:audiobookly/services/download/downloader.dart';
import 'package:audiobookly/services/download/mobile_background_downloader.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

bool registered = false;
Future<void> registerSingletons() async {
  if (registered) return;
  registered = true;

  final isar = await initIsar();
  getIt.registerLazySingleton<DatabaseService>(
    () => IsarDatabaseService(
      db: isar,
    ),
  );
  // clear db
  // await isar.writeTxn(() => isar.clear());

  PlaybackController controller;
  Downloader downloader;
  if (kIsWeb) {
    downloader = DesktopDownloader(getIt());
    final handler = await initAudioHandler();
    controller = AudioHandlerPlaybackController(handler);
  } else {
    downloader = MobileBackgroundDownloader(getIt());
    final handler = await initAudioHandler();
    controller = AudioHandlerPlaybackController(handler);
  }

  getIt.registerSingleton(downloader);
  getIt.registerSingleton(controller);
  getIt.registerSingleton(SleepService(controller));

  final info = await getDeviceInfo();
  getIt.registerSingleton(DeviceInfoService(info));
}
