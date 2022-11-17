import 'package:audiobookly/providers.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:flutter/cupertino.dart';
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
    final prefs = ref.watch(preferencesProvider);

    return CupertinoButton(
      padding: padding,
      onPressed: playbackController.rewind,
      child: Icon(
        iconMap[prefs.rewindInterval.toString()],
        size: iconSize,
        color: color,
      ),
    );
  }
}
