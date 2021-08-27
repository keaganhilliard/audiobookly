import 'dart:io';

import 'package:audiobookly/database/database.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:audiobookly/services/download/desktop_downloader.dart';
import 'package:audiobookly/services/download/downloader.dart';
import 'package:audiobookly/services/download/mobile_downloader.dart';
import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

bool registered = false;
Future<void> registerSingletons() async {
  if (registered) return;
  registered = true;

  final database = await $FloorAppDatabase
      .databaseBuilder('app_database.db')
      .addMigrations([migrate1To2, migrate2To3]).build();

  getIt.registerSingleton<DatabaseService>(DatabaseService(database));

  PlaybackController controller;
  Downloader downloader;
  if (kIsWeb || (!Platform.isWindows && !Platform.isLinux)) {
    await FlutterDownloader.initialize();
    downloader = MobileDownloader(getIt.get());
    final handler = await initAudioHandler();
    controller = AudioHandlerPlaybackController(handler);
  } else {
    DartVLC.initialize();
    downloader = DesktopDownloader(getIt.get());
    final handler = await initDesktopAudioHandler();
    controller = AudioHandlerPlaybackController(handler);
  }
  getIt.registerSingleton(downloader);
  getIt.registerSingleton<PlaybackController>(controller);
}
