import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RewindButton extends HookConsumerWidget {
  final Color? color;
  final EdgeInsetsGeometry padding;
  final double iconSize;

  RewindButton({
    super.key,
    required this.iconSize,
    this.color,
    this.padding = const EdgeInsets.all(8.0),
  });

  final Map<String, IconData> iconMap = {
    '10.0': CupertinoIcons.gobackward_10,
    '15.0': CupertinoIcons.gobackward_15,
    '30.0': CupertinoIcons.gobackward_30,
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playbackController = GetIt.I<PlaybackController>();
    final databaseService = ref.watch(databaseServiceProvider);

    return IconButton(
      color: color,
      icon: Icon(iconMap[
          databaseService.getPreferencesSync().rewindInterval.toString()]),
      iconSize: iconSize,
      padding: padding,
      autofocus: false,
      onPressed: playbackController.rewind,
    );
  }
}
