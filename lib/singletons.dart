import 'dart:io';

// import 'package:audiobookly/database/database.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/services/audio/sleep_service.dart';
import 'package:audiobookly/services/database/database_service.dart';
// import 'package:audiobookly/services/database/hive_database_service.dart';
import 'package:audiobookly/services/database/isar_database_service.dart';
import 'package:audiobookly/services/device_info/device_info_service.dart';
// import 'package:audiobookly/services/database/sql_database_service.dart';
import 'package:audiobookly/services/download/desktop_downloader.dart';
import 'package:audiobookly/services/download/downloader.dart';
import 'package:audiobookly/services/download/mobile_downloader.dart';
import 'package:audiobookly/services/shared_preferences/shared_preferences_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:hive_flutter/hive_flutter.dart';

final getIt = GetIt.I;

bool registered = false;
Future<void> registerSingletons() async {
  if (registered) return;
  registered = true;

  // final database = await $FloorAppDatabase
  //     .databaseBuilder('app_database.db')
  //     .addMigrations([migrate1To2, migrate2To3, migrate3To4]).build();
  // getIt.registerSingleton<DatabaseService>(SqlDatabaseService(database));

  final isar = await initIsar();
  getIt.registerLazySingleton<DatabaseService>(
    () => IsarDatabaseService(
      db: isar,
    ),
  );
  // clear db
  // await isar.writeTxn((isar) => isar.clear());

  // await initHive();
  // getIt.registerSingleton<DatabaseService>(
  //   HiveDatabaseService(
  //     bookBox: Hive.box('books'),
  //     trackBox: Hive.box('tracks'),
  //     chapterBox: Hive.box('chapters'),
  //   ),
  // );

  PlaybackController controller;
  Downloader downloader;
  if (kIsWeb) {
    downloader = DesktopDownloader(getIt());
    final handler = await initAudioHandler();
    controller = AudioHandlerPlaybackController(handler);
  } else if ((!Platform.isWindows && !Platform.isLinux && !Platform.isMacOS)) {
    await FlutterDownloader.initialize();
    downloader = MobileDownloader(getIt());
    final handler = await initAudioHandler();
    controller = AudioHandlerPlaybackController(handler);
  } else if (Platform.isMacOS) {
    downloader = DesktopDownloader(getIt());
    final handler = await initAudioHandler();
    controller = AudioHandlerPlaybackController(handler);
  } else {
    // DartVLC.initialize();
    downloader = DesktopDownloader(getIt());
    final handler = await initAudioHandler();
    controller = AudioHandlerPlaybackController(handler);
  }

  // final handler = await initAudioHandler();
  // controller = AudioHandlerPlaybackController(handler);

  getIt.registerSingleton(downloader);
  getIt.registerSingleton(controller);
  getIt.registerSingleton(SleepService(controller));

  final info = await getDeviceInfo();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton(SharedPreferencesService(prefs));
  getIt.registerSingleton(DeviceInfoService(info));
}
