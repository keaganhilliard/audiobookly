import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/services/audio/default_audio_handler.dart';
import 'package:audiobookly/services/audio/desktop_audio_handler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final playbackControllerProvider =
    Provider<PlaybackController>((ref) => throw UnimplementedError());

Future<AudioHandler> initAudioHandler() async {
  return await AudioService.init(
    builder: () => AudiobooklyAudioHandler(),
    config: AudioServiceConfig(
      androidNotificationChannelId: 'com.azothforgotten.audibookly.audio',
      androidNotificationChannelName: 'Audiobookly',
      androidNotificationChannelDescription: 'Audio playback notification',
      androidNotificationOngoing: true,
      // androidEnableQueue: true,
      androidNotificationClickStartsActivity: true,
      androidStopForegroundOnPause: true,
      rewindInterval: Duration(seconds: 15),
      fastForwardInterval: Duration(seconds: 30),
      androidNotificationIcon: 'mipmap/audiobookly_launcher',
    ),
  );
}

Future<AudioHandler> initDesktopAudioHandler() async {
  return await AudioService.init(
    builder: () => DesktopAudioHandler(),
    config: AudioServiceConfig(
      rewindInterval: Duration(seconds: 30),
      fastForwardInterval: Duration(seconds: 30),
    ),
  );
}

abstract class PlaybackController {
  Future playItem(MediaItem item) async {}
  Future playFromId(String id, [bool play = true]) async {}
  Future handleResume() async {}
  Future stop() async {}
  Future fastForward() async {}
  Future rewind() async {}
  Future play() async {}
  Future pause() async {}
  Future seek(int position) async {}
  Future setSpeed(double speed) async {}
  Future skipToQueueItem(int index) async {}
  Future skipToNext() async {}
  Future skipToPrevious() async {}
  Stream<PlaybackState> get playbackStateStream;
  Stream<MediaItem?> get currentMediaItemStream;
  MediaItem? get currentMediaItem;
  List<MediaItem>? get currentQueue;
  Stream<List<MediaItem>?> get queueStream;
  Stream<Duration> get positionStream;
}

class AudioHandlerPlaybackController extends PlaybackController {
  AudioHandler _audioHandler;
  AudioHandlerPlaybackController(this._audioHandler);

  MediaItem? currentItem;
  String? currentItemId;

  bool ensured = false;

  Stream<Duration> get positionStream => AudioService.positionStream;
  Stream<PlaybackState> get playbackStateStream => _audioHandler.playbackState;
  Stream<MediaItem?> get currentMediaItemStream => _audioHandler.mediaItem;
  MediaItem? get currentMediaItem => _audioHandler.mediaItem.value;
  List<MediaItem>? get currentQueue => _audioHandler.queue.value;
  Stream<List<MediaItem>?> get queueStream => _audioHandler.queue;

  Future playItem(MediaItem item) async {
    return playFromId(item.id);
  }

  Future playFromId(String? id, [bool shouldPlay = true]) async {
    if (id == currentItemId) {
      if (shouldPlay && !_audioHandler.playbackState.value.playing) play();
      return;
    }

    currentItemId = id;
    return await _audioHandler.playFromMediaId(id!);
  }

  Future handleResume() async {
    if (currentItemId != null) return playFromId(currentItemId, false);
  }

  Future stop() async {
    await _audioHandler.stop();
    currentItem = null;
  }

  Future fastForward() async {
    await _audioHandler.fastForward();
  }

  Future rewind() async {
    await _audioHandler.rewind();
  }

  Future play() async {
    await _audioHandler.play();
  }

  Future pause() async {
    await _audioHandler.pause();
  }

  Future seek(int position) async {
    await _audioHandler.seek(
      Duration(milliseconds: position),
    );
  }

  Future setSpeed(double speed) async {
    await _audioHandler.setSpeed(speed);
  }

  Future skipToQueueItem(int index) async {
    await _audioHandler.skipToQueueItem(index);
  }

  Future skipToNext() async {
    await _audioHandler.customAction('skip', {});
  }

  Future skipToPrevious() async {
    await _audioHandler.customAction('previous', {});
  }
}
