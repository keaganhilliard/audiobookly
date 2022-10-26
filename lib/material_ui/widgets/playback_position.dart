import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlaybackPosition extends HookConsumerWidget {
  final Widget Function(BuildContext context, Duration? position) builder;
  const PlaybackPosition({super.key, required this.builder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playbackController = GetIt.I<PlaybackController>();
    final position = useStream(playbackController.positionStream);
    return builder(context, position.data);
  }
}
