import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlaybackPosition extends HookWidget {
  final Widget Function(BuildContext context, Duration? position) builder;
  PlaybackPosition({required this.builder});

  @override
  Widget build(BuildContext context) {
    final playbackController = useProvider(playbackControllerProvider);
    final position = useStream(playbackController.positionStream);
    return builder(context, position.data);
  }
}
