import 'dart:async';

import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:rxdart/subjects.dart';

class SleepService {
  PlaybackController _pb;
  SleepService(this._pb);
  Timer? _timer;
  bool get hasTimer => _requestedDuration != null;
  StreamSubscription? endOfChapterSub;
  Stopwatch _timeRunning = Stopwatch();
  Timer? watcher;
  BehaviorSubject<Duration?> _timeLeft = BehaviorSubject.seeded(null);
  Duration? _requestedDuration;

  beginTimer(Duration time) {
    _timer = Timer(time, () {
      _pb.pause();
      cancelTimer();
    });
    resetTimeRunning();
    _timeRunning.start();
    _requestedDuration = time;
    _timeLeft.add(time);
    watcher = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_requestedDuration != null)
        _timeLeft.add(_requestedDuration! - _timeRunning.elapsed);
      else
        watcher?.cancel();
    });
  }

  resetTimeRunning() {
    _timeRunning.stop();
    _timeRunning.reset();
  }

  cancelTimer() {
    _timer?.cancel();
    _timer = null;
    watcher = null;
    resetTimeRunning();
    _timeLeft.add(null);
    _requestedDuration = null;
  }

  Stream<Duration?> getTimeLeftStream() {
    return _timeLeft;
  }
}
