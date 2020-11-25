//
// Generated file. Do not edit.
//

// ignore: unused_import
import 'dart:ui';

import 'package:audio_service/audio_service_web.dart';
import 'package:audio_session/audio_session_web.dart';
import 'package:just_audio_web/just_audio_web.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';
import 'package:url_launcher_web/url_launcher_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ignore: public_member_api_docs
void registerPlugins(PluginRegistry registry) {
  AudioServicePlugin.registerWith(registry.registrarFor(AudioServicePlugin));
  AudioSessionWeb.registerWith(registry.registrarFor(AudioSessionWeb));
  JustAudioPlugin.registerWith(registry.registrarFor(JustAudioPlugin));
  SharedPreferencesPlugin.registerWith(registry.registrarFor(SharedPreferencesPlugin));
  UrlLauncherPlugin.registerWith(registry.registrarFor(UrlLauncherPlugin));
  registry.registerMessageHandler();
}
