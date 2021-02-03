import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/services/audio_handler.dart';

class PlaybackController {
  static PlaybackController _instance;

  factory PlaybackController() {
    if (_instance == null) _instance = PlaybackController._internal();
    return _instance;
  }

  PlaybackController._internal();

  AudioHandler _audioHandler;

  Future init() async {
    await _ensureHandler();
  }

  MediaItem currentItem;
  String currentItemId;

  bool ensured = false;

  Future<void> _ensureHandler() async {
    if (_audioHandler == null && !ensured) {
      ensured = true;
      _audioHandler = await AudioService.init(
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
  }

  Stream<PlaybackState> get playbackStateStream =>
      _audioHandler.playbackState.stream;
  Stream<MediaItem> get currentMediaItemStream =>
      _audioHandler.mediaItem.stream;
  MediaItem get currentMediaItem => _audioHandler.mediaItem.value;
  List<MediaItem> get currentQueue => _audioHandler.queue.value;
  Stream<List<MediaItem>> get queueStream => _audioHandler.queue.stream;

  Future playItem(MediaItem item) async {
    await _ensureHandler();
    return playFromId(item.id);
  }

  Future playFromId(String id, [bool play = true]) async {
    await _ensureHandler();
    if (id == currentItemId) return;

    currentItemId = id;
    return await _audioHandler.playFromMediaId(id);
  }

  Future handleResume() async {
    await _ensureHandler();
    if (currentItemId != null) return playFromId(currentItemId, false);
  }

  Future stop() async {
    await _ensureHandler();
    await _audioHandler.stop();
    currentItem = null;
  }

  Future fastForward() async {
    await _ensureHandler();
    await _audioHandler.fastForward();
  }

  Future rewind() async {
    await _ensureHandler();
    await _audioHandler.rewind();
  }

  Future play() async {
    await _ensureHandler();
    await _audioHandler.play();
  }

  Future pause() async {
    await _ensureHandler();
    await _audioHandler.pause();
  }

  Future seek(int position) async {
    await _ensureHandler();
    await _audioHandler.seek(
      Duration(milliseconds: position),
    );
  }

  Future setSpeed(double speed) async {
    await _ensureHandler();
    await _audioHandler.setSpeed(speed);
  }

  Future skipToQueueItem(String mediaId) async {
    await _ensureHandler();
    await _audioHandler.skipToQueueItem(mediaId);
  }
}
