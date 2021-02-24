import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/services/audio/audio_handler_with_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final playbackControllerProvider =
    Provider<PlaybackController>((ref) => throw UnimplementedError());

Future<AudioHandler> initAudioHandler() async {
  return await AudioService.init(
    builder: () => AudiobooklyAudioHandler(),
    config: AudioServiceConfig(
      androidNotificationChannelName: 'Audiobookly',
      androidNotificationOngoing: true,
      androidEnableQueue: true,
      androidNotificationClickStartsActivity: true,
      androidStopForegroundOnPause: true,
      rewindInterval: Duration(seconds: 30),
      fastForwardInterval: Duration(seconds: 30),
      androidNotificationIcon: 'mipmap/audiobookly_launcher',
    ),
  );
}

class PlaybackController {
  AudioHandler _audioHandler;
  PlaybackController(this._audioHandler);

  MediaItem currentItem;
  String currentItemId;

  bool ensured = false;

  Stream<PlaybackState> get playbackStateStream => _audioHandler.playbackState;
  Stream<MediaItem> get currentMediaItemStream => _audioHandler.mediaItem;
  MediaItem get currentMediaItem => _audioHandler?.mediaItem?.value;
  List<MediaItem> get currentQueue => _audioHandler?.queue?.value;
  Stream<List<MediaItem>> get queueStream => _audioHandler?.queue?.stream;

  Future playItem(MediaItem item) async {
    return playFromId(item.id);
  }

  Future playFromId(String id, [bool play = true]) async {
    if (id == currentItemId) return;

    currentItemId = id;
    return await _audioHandler.playFromMediaId(id);
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

  Future skipToQueueItem(String mediaId) async {
    await _audioHandler.skipToQueueItem(mediaId);
  }

  Future skipToNext() async {
    await _audioHandler.customAction('skip', {});
  }

  Future skipToPrevious() async {
    await _audioHandler.customAction('previous', {});
  }
}
