import 'dart:async';

import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:rxdart/subjects.dart';

class SleepService {
  final PlaybackController _pb;
  SleepService(this._pb);
  Timer? _timer;
  bool get hasTimer => _requestedDuration != null;
  final Stopwatch _timeRunning = Stopwatch();
  Timer? watcher;
  final BehaviorSubject<Duration?> _timeLeft = BehaviorSubject.seeded(null);
  Duration? _requestedDuration;
  StreamSubscription<Duration>? positionStream;
  StreamSubscription? playbackState;

  watchPlaybackState() {
    playbackState = _pb.playbackStateStream.listen((state) {
      if (!state.playing) {
        cancelTimer();
      }
    });
  }

  beginTimer(Duration time) {
    _timer = Timer(time, () {
      _pb.pause();
      cancelTimer();
    });
    resetTimeRunning();
    _timeRunning.start();
    _requestedDuration = time;
    _timeLeft.add(time);
    watcher = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_requestedDuration != null) {
        _timeLeft.add(_requestedDuration! - _timeRunning.elapsed);
      } else {
        watcher?.cancel();
      }
    });
    watchPlaybackState();
  }

  resetTimeRunning() {
    _timeRunning.stop();
    _timeRunning.reset();
  }

  endOfChapter() async {
    if (_pb.currentMediaItem != null) {
      resetTimeRunning();
      final theCurrentTrack = _pb.currentMediaItem!.copyWith();
      positionStream = _pb.positionStream.listen((currentPosition) async {
        final playbackRate = _pb.playbackStateStream.value.speed;
        final currentPositionInTrack =
            currentPosition - theCurrentTrack.currentTrackStartingPosition;
        final timeLeftInTrack =
            theCurrentTrack.currentTrackLength - currentPositionInTrack;
        final scaledTimeLeftInTrack = Duration(
            milliseconds:
                (timeLeftInTrack.inMilliseconds / playbackRate).ceil());
        _timeLeft.add(scaledTimeLeftInTrack);
        if (timeLeftInTrack <= Duration.zero) {
          _pb.pause();
          cancelTimer();
        }
      });
      watchPlaybackState();
    }
  }

  cancelTimer() {
    _timer?.cancel();
    _timer = null;
    watcher = null;
    positionStream?.cancel();
    positionStream = null;
    playbackState?.cancel();
    playbackState = null;
    resetTimeRunning();
    _timeLeft.add(null);
    _requestedDuration = null;
  }

  Stream<Duration?> getTimeLeftStream() {
    return _timeLeft;
  }
}
