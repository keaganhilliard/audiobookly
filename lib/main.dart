import 'dart:async';
import 'dart:io';
import 'package:audiobookly/carplay.dart';
import 'package:audiobookly/ios_ui/ios_app.dart';
import 'package:audiobookly/mac_ui/mac_app.dart';
import 'package:audiobookly/material_ui/material_app.dart';
import 'package:audiobookly/singletons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb && Platform.isIOS) {
    await initCarplay();
  }
  await registerSingletons();

  runApp(
    const ProviderScope(
      child: AudiobooklyApp(),
    ),
  );
}

class AudiobooklyApp extends HookConsumerWidget {
  const AudiobooklyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!kIsWeb && Platform.isIOS) {
      return const IosApp();
    }
    if (!kIsWeb && Platform.isMacOS) {
      return const MacApp();
    }
    return AbMaterialApp();
  }
}
