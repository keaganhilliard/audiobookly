import 'package:audiobookly/providers.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ForwardButton extends HookConsumerWidget {
  final Color? color;
  final EdgeInsetsGeometry padding;
  final double iconSize;

  ForwardButton({
    super.key,
    required this.iconSize,
    this.color,
    this.padding = const EdgeInsets.all(8.0),
  });

  final Map<String, IconData> iconMap = {
    '10.0': CupertinoIcons.goforward_10,
    '15.0': CupertinoIcons.goforward_15,
    '30.0': CupertinoIcons.goforward_30,
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playbackController = GetIt.I<PlaybackController>();
    final prefs = ref.watch(preferencesProvider);

    return CupertinoButton(
      padding: padding,
      onPressed: () async {
        playbackController.fastForward();
        HapticFeedback.mediumImpact();
      },
      child: Icon(
        iconMap[prefs.fastForwardInterval.toString()],
        size: iconSize,
        color: color,
      ),
    );
  }
}
