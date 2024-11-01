import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/services/audio/default_audio_handler.dart';
// import 'package:audiobookly/services/audio/media_kit_audio_handler.dart';
import 'package:rxdart/rxdart.dart';

Future<AudioHandler> initAudioHandler() async {
  return await AudioService.init(
    builder: () => AudiobooklyAudioHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.azothforgotten.audibookly.audio',
      androidNotificationChannelName: 'Audiobookly',
      androidNotificationChannelDescription: 'Audio playback notification',
      androidNotificationOngoing: true,
      androidNotificationClickStartsActivity: true,
      androidStopForegroundOnPause: true,
      rewindInterval: Duration(seconds: 15),
      fastForwardInterval: Duration(seconds: 30),
      androidNotificationIcon: 'mipmap/audiobookly_launcher',
    ),
  );
}

// Future<AudioHandler> initDesktopAudioHandler() async {
//   return await AudioService.init(
//     builder: () => DesktopAudioHandler(),
//     config: const AudioServiceConfig(
//       rewindInterval: Duration(seconds: 30),
//       fastForwardInterval: Duration(seconds: 30),
//     ),
//   );
// }

abstract class PlaybackController {
  Future playItem(MediaItem item) async {}
  Future playFromId(String id, [bool shouldPlay = true]) async {}
  Future handleResume() async {}
  Future stop() async {}
  Future fastForward() async {}
  Future rewind() async {}
  Future play() async {}
  Future pause() async {}
  Future seek(int position) async {}
  Future setSpeed(double speed) async {}
  Future increaseSpeed();
  Future decreaseSpeed();
  Future skipToQueueItem(int index) async {}
  Future skipToNext() async {}
  Future skipToPrevious() async {}
  ValueStream<PlaybackState> get playbackStateStream;
  Stream<MediaItem?> get currentMediaItemStream;
  MediaItem? get currentMediaItem;
  List<MediaItem>? get currentQueue;
  Stream<List<MediaItem>?> get queueStream;
  Stream<Duration> get positionStream;
}

class AudioHandlerPlaybackController extends PlaybackController {
  final AudioHandler _audioHandler;
  AudioHandlerPlaybackController(this._audioHandler);

  MediaItem? currentItem;
  String? currentItemId;

  bool ensured = false;

  Stream<Duration>? _positionStream;

  @override
  Stream<Duration> get positionStream {
    _positionStream ??= AudioService.createPositionStream();
    return _positionStream!;
  }

  @override
  ValueStream<PlaybackState> get playbackStateStream =>
      _audioHandler.playbackState;
  @override
  Stream<MediaItem?> get currentMediaItemStream => _audioHandler.mediaItem;
  @override
  MediaItem? get currentMediaItem => _audioHandler.mediaItem.value;
  @override
  List<MediaItem>? get currentQueue => _audioHandler.queue.value;
  @override
  Stream<List<MediaItem>?> get queueStream => _audioHandler.queue;

  @override
  Future playItem(MediaItem item) async {
    return playFromId(item.id);
  }

  @override
  Future playFromId(String id, [bool shouldPlay = true]) async {
    if (id == currentItemId) {
      if (shouldPlay && !_audioHandler.playbackState.value.playing) play();
      return;
    }

    currentItemId = id;
    return await _audioHandler.playFromMediaId(id);
  }

  @override
  Future handleResume() async {
    if (currentItemId != null) return playFromId(currentItemId!, false);
  }

  @override
  Future stop() async {
    await _audioHandler.stop();
    currentItem = null;
    currentItemId = null;
  }

  @override
  Future fastForward() async {
    await _audioHandler.fastForward();
  }

  @override
  Future rewind() async {
    await _audioHandler.rewind();
  }

  @override
  Future play() async {
    await _audioHandler.play();
  }

  @override
  Future pause() async {
    await _audioHandler.pause();
  }

  @override
  Future seek(int position) async {
    await _audioHandler.seek(
      Duration(milliseconds: position),
    );
  }

  @override
  Future setSpeed(double speed) async {
    await _audioHandler.setSpeed(speed);
  }

  @override
  Future skipToQueueItem(int index) async {
    await _audioHandler.skipToQueueItem(index);
  }

  @override
  Future skipToNext() async {
    await _audioHandler.customAction('skip', {});
  }

  @override
  Future skipToPrevious() async {
    await _audioHandler.customAction('previous', {});
  }

  Future setTimer([int? minutes]) async {
    if (minutes == null) {
      await _audioHandler.customAction(
        'setTimer',
        {'type': 'endOfTrack'},
      );
    } else {
      await _audioHandler.customAction(
        'setTimer',
        {'minutes': minutes},
      );
    }
  }

  Future cancelTimer() async {
    await _audioHandler.customAction(
      'setTimer',
      {'type': 'cancel'},
    );
  }

  @override
  Future decreaseSpeed() async {
    await setSpeed(playbackStateStream.value.speed - 0.05);
  }

  @override
  Future increaseSpeed() async {
    await setSpeed(playbackStateStream.value.speed + 0.05);
  }
}
