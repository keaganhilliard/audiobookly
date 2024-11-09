import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Progress {
  Duration? duration;
  Duration? currentTime;
  bool isFinished;

  Progress({
    required this.duration,
    required this.currentTime,
    this.isFinished = false,
  });

  double get percentage => ((currentTime?.inMilliseconds.toDouble() ?? 0.0) /
      (duration?.inMilliseconds.toDouble() ?? 1.0));

  @override
  String toString() {
    return 'Progress(duration: $duration, currentTime: $currentTime, percentage: $percentage, isFinished: $isFinished)';
  }
}

class MediaProgressState {
  final Map<String, Progress> _progresses;

  MediaProgressState({Map<String, Progress>? progresses})
      : _progresses = progresses ?? {};

  Progress? getProgress(String id) {
    return _progresses[id];
  }

  MediaProgressState copyWith({
    Map<String, Progress>? progresses,
  }) {
    return MediaProgressState(
      progresses: progresses ?? _progresses,
    );
  }

  @override
  String toString() {
    return 'MediaProgressState(progresses: $_progresses)';
  }
}

class MediaProgress extends StateNotifier<MediaProgressState> {
  MediaProgress() : super(MediaProgressState());

  Progress? getProgress(String id) {
    return state.getProgress(id);
  }

  void printProgresses() {
    for (final MapEntry(:key, :value) in state._progresses.entries) {
      print('$key: $value');
    }
  }

  void updateProgress(String id, Progress progress) {
    state = state.copyWith(progresses: {...state._progresses, id: progress});
  }
}

final StateNotifierProvider<MediaProgress, MediaProgressState>
    mediaProgressProvider =
    StateNotifierProvider<MediaProgress, MediaProgressState>(
  (ref) {
    return GetIt.I();
  },
);
