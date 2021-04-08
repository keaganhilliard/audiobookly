import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/services/audio/audio_handler_with_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dart_vlc/dart_vlc.dart' show Player, Playlist;
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

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
  Stream<MediaItem> get currentMediaItemStream;
  MediaItem get currentMediaItem;
  List<MediaItem> get currentQueue;
  Stream<List<MediaItem>> get queueStream;
  Stream<Duration> get positionStream;
}

class VlcPlaybackController extends PlaybackController {
  Player _player;

  Future<void> _ensurePlayer() async {
    if (_player == null) _player = await Player.create(id: 0);
    _player.positionStream.listen((position) {
      _positionStream.add(position.duration);
    });
    _player.currentStream.listen((current) {
      current.medias.map((media) {});
    _playbackStateStream.valu
    });
    _player.generateStream.listen((general) {
      general.
    });
  }

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
  BehaviorSubject<Duration> _positionStream = BehaviorSubject<Duration>();
  Stream<Duration> get positionStream => _positionStream.stream;
  BehaviorSubject<PlaybackState> _playbackStateStream = BehaviorSubject<PlaybackState>();
  Stream<PlaybackState> get playbackStateStream => _playbackStateStream;
  Stream<MediaItem> get currentMediaItemStream;
  MediaItem get currentMediaItem;
  List<MediaItem> _currentQueue = [];
  List<MediaItem> get currentQueue => _currentQueue;
  ValueStream<List<MediaItem>> 
  Stream<List<MediaItem>> get queueStream;
}

class AudioHandlerPlaybackController extends PlaybackController {
  AudioHandler _audioHandler;
  AudioHandlerPlaybackController(this._audioHandler);

  MediaItem currentItem;
  String currentItemId;

  bool ensured = false;

  Stream<Duration> get positionStream => AudioService.getPositionStream();
  Stream<PlaybackState> get playbackStateStream => _audioHandler.playbackState;
  Stream<MediaItem> get currentMediaItemStream => _audioHandler.mediaItem;
  MediaItem get currentMediaItem =>
      _audioHandler?.mediaItem?.valueWrapper?.value;
  List<MediaItem> get currentQueue => _audioHandler?.queue?.valueWrapper?.value;
  Stream<List<MediaItem>> get queueStream => _audioHandler?.queue;

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
