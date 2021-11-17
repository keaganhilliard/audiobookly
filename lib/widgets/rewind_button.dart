import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/services/shared_preferences/shared_preferences_service.dart';
import 'package:audiobookly/utils/jump_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RewindButton extends HookConsumerWidget {
  final Color? color;
  final EdgeInsetsGeometry padding;
  final double iconSize;

  RewindButton({
    required this.iconSize,
    this.color,
    this.padding = const EdgeInsets.all(8.0),
  });

  final Map<String, IconData> iconMap = {
    '10.0': Jump.replay_10,
    '15.0': Jump.replay_15,
    '30.0': Jump.replay_30,
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playbackController = ref.watch(playbackControllerProvider);
    final sharedPreferencesService =
        ref.watch(sharedPreferencesServiceProvider);

    return IconButton(
      color: color,
      icon: Icon(iconMap[sharedPreferencesService.rewindInterval.toString()]),
      iconSize: iconSize,
      padding: padding,
      autofocus: false,
      onPressed: playbackController.rewind,
    );
  }
}
