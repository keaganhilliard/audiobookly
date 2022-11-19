import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';

class BottomPadding extends HookWidget {
  const BottomPadding({super.key});

  @override
  Widget build(BuildContext context) {
    final playbackController = GetIt.I<PlaybackController>();
    final playbackState = useStream(playbackController.playbackStateStream);
    if (playbackState.hasData &&
        playbackState.data!.processingState != AudioProcessingState.idle) {
      return const SizedBox(
        height: 160,
      );
    }
    return const SizedBox(
      height: 90,
    );
  }
}
