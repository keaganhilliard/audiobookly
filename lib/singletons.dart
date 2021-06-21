import 'dart:io';

import 'package:audiobookly/database/database.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

bool registered = false;
Future<void> registerSingletons() async {
  if (registered) return;
  registered = true;

  final database = await $FloorAppDatabase
      .databaseBuilder('app_database.db')
      .addMigrations([migrate1To2]).build();

  getIt.registerSingleton<DatabaseService>(DatabaseService(database));

  PlaybackController controller;
  if (kIsWeb || (!Platform.isWindows && !Platform.isLinux)) {
    final handler = await initAudioHandler();
    controller = AudioHandlerPlaybackController(handler);
  } else {
    final handler = await initDesktopAudioHandler();
    controller = AudioHandlerPlaybackController(handler);
  }
  getIt.registerSingleton<PlaybackController>(controller);
}
