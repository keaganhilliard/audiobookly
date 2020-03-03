import 'package:audio_service/audio_service.dart';

class Controls {
  static const MediaControl playControl = MediaControl(
    androidIcon: 'drawable/ic_action_play_arrow',
    label: 'Play',
    action: MediaAction.play,
  );
  static const MediaControl pauseControl = MediaControl(
    androidIcon: 'drawable/ic_action_pause',
    label: 'Pause',
    action: MediaAction.pause,
  );
  static const MediaControl skipToNextControl = MediaControl(
    androidIcon: 'drawable/ic_action_skip_next',
    label: 'Next',
    action: MediaAction.skipToNext,
  );
  static const MediaControl skipToPreviousControl = MediaControl(
    androidIcon: 'drawable/ic_action_skip_previous',
    label: 'Previous',
    action: MediaAction.skipToPrevious,
  );
  static const MediaControl stopControl = MediaControl(
    androidIcon: 'drawable/ic_action_stop',
    label: 'Stop',
    action: MediaAction.stop,
  );
  static const MediaControl fastForwardControl = MediaControl(
    androidIcon: 'drawable/ic_forward_30',
    label: 'Skip 30 seconds',
    action: MediaAction.fastForward,
  );

  static const MediaControl rewindControl = MediaControl(
    androidIcon: 'drawable/ic_replay_30',
    label: 'Rewind 30 seconds',
    action: MediaAction.rewind,
  );
}
