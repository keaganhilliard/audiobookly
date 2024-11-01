import 'dart:async';

import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final playbackPositionStateProvider =
    StateNotifierProvider<PlaybackPostionState, Duration?>((ref) {
  final playbackController = GetIt.I<PlaybackController>();
  return PlaybackPostionState(playbackController.positionStream);
});

class PlaybackPosition extends HookConsumerWidget {
  final Widget Function(BuildContext context, Duration? position) builder;
  const PlaybackPosition({super.key, required this.builder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final position = ref.watch(playbackPositionStateProvider);
    return builder(context, position);
  }
}

class PlaybackPostionState extends StateNotifier<Duration?> {
  late StreamSubscription<Duration> positionStreamSub;

  PlaybackPostionState(Stream<Duration> positionStream) : super(null) {
    positionStreamSub = positionStream.listen((position) {
      state = position;
    });
  }

  @override
  void dispose() {
    positionStreamSub.cancel();
    super.dispose();
  }
}
