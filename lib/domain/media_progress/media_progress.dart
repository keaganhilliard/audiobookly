import 'package:hooks_riverpod/hooks_riverpod.dart';

class MediaProgressState {
  Map<String, double> _progresses;

  MediaProgressState({Map<String, double>? progresses})
      : _progresses = progresses ?? {};

  factory MediaProgressState.defaultState() =>
      MediaProgressState(progresses: {});

  double getProgress(String id) {
    return _progresses[id] ?? 0.0;
  }

  MediaProgressState copyWith({
    Map<String, double>? progresses,
  }) {
    return MediaProgressState(
      progresses: progresses ?? _progresses,
    );
  }
}

class MediaProgress extends StateNotifier<MediaProgressState> {
  MediaProgress() : super(MediaProgressState.defaultState());

  void updateProgress(String id, double progress) {
    state = state.copyWith(progresses: {...state._progresses, id: progress});
  }
}
