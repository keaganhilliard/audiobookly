import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/services/audio/audio_handler_with_repository.dart';
import 'package:audiobookly/services/audio/desktop_audio_handler.dart';
import 'package:audiobookly/services/shared_preferences/shared_preferences_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dart_vlc/dart_vlc.dart' show Player, Playlist, Media;
import 'package:rxdart/rxdart.dart';
import 'package:audiobookly/utils/utils.dart';

final playbackControllerProvider =
    Provider<PlaybackController>((ref) => VlcPlaybackController(ref));

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

Future<AudioHandler> initDesktopAudioHandler() async {
  return await AudioService.init(
    builder: () => DesktopAudioHandler(),
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
  ProviderReference _ref;
  MediaRepository _repo;
  SharedPreferencesService _prefs;
  VlcPlaybackController(this._ref);

  BehaviorSubject<Duration> _positionStream = BehaviorSubject<Duration>();
  Stream<Duration> get positionStream => _positionStream.stream;

  BehaviorSubject<PlaybackState> _playbackStateStream =
      BehaviorSubject<PlaybackState>.seeded(PlaybackState());
  Stream<PlaybackState> get playbackStateStream => _playbackStateStream.stream;

  BehaviorSubject<MediaItem> _currentMediaItemStream =
      BehaviorSubject.seeded(MediaItem(album: '', title: '', id: ''));
  Stream<MediaItem> get currentMediaItemStream =>
      _currentMediaItemStream.stream;
  MediaItem get currentMediaItem => _currentMediaItemStream.value;

  BehaviorSubject<List<MediaItem>> _currentQueue = BehaviorSubject();
  List<MediaItem> get currentQueue => _currentQueue.value;
  Stream<List<MediaItem>> get queueStream => _currentQueue.stream;
  MediaItem get currentQueueItem =>
      index != -1 && currentQueue != null ? currentQueue[index] : null;

  int get index => _player?.current?.index;

  Duration get totalDuration => _currentQueue.value
      .fold(Duration.zero, (total, item) => total + item.duration);
  Duration get currentTrackStartingPosition =>
      _currentQueue.value.getRange(0, index ?? 0).fold<Duration>(
          Duration.zero,
          (total, item) =>
              (total ?? Duration.zero) + (item?.duration ?? Duration.zero));
  Duration get currentPosition =>
      currentTrackStartingPosition +
      (_player?.position?.position ?? Duration.zero);

  Future<void> _ensurePlayer() async {
    if (_repo == null) _repo = _ref.read(mediaRepositoryProdiver);
    if (_prefs == null) _prefs = _ref.read(sharedPreferencesServiceProvider);
    if (_player == null) {
      _player = Player(id: 0);
      _player.positionStream.listen((position) {
        _positionStream.add(currentTrackStartingPosition + position.position);
      });
      _player.playbackStream.listen((state) {
        _playbackStateStream.add(PlaybackState(
          processingState: AudioProcessingState.ready,
          playing: state.isPlaying,
          updatePosition: currentPosition,
          updateTime: DateTime.now(),
          speed: _player.general.rate,
        ));
        // if (state.isPlaying)
        //   _currentMediaItemStream.add(currentMediaItem.copyWith(
        //     extras: <String, dynamic>{
        //       'currentTrack': currentQueueItem?.id,
        //       'currentTrackLength': currentQueueItem?.duration?.inMilliseconds,
        //       'currentTrackStartingPosition':
        //           currentTrackStartingPosition?.inMilliseconds,
        //     },
        //   ));
      });

      _player.currentStream.listen((state) {
        print('State changed $index');
        _currentMediaItemStream.add(currentMediaItem.copyWith(
          extras: <String, dynamic>{
            'currentTrack': currentQueueItem.id,
            'currentTrackLength': currentQueueItem.duration.inMilliseconds,
            'currentTrackStartingPosition':
                currentTrackStartingPosition.inMilliseconds,
          },
        ));
      });
    }
  }

  Future release() async {
    _playbackStateStream.close();
    _currentMediaItemStream.close();
  }

  Future playItem(MediaItem item) async {
    await _ensurePlayer();
  }

  Future playFromId(String id, [bool play = true]) async {
    await _ensurePlayer();
    if (_player.playback.isPlaying ?? false) await _player.stop();

    await _repo.getServerAndLibrary();
    _currentQueue.add(await _repo.getTracksForBook(id));
    _currentMediaItemStream.add(
        (await _repo.getAlbumFromId(id)).copyWith(duration: totalDuration));
    final queuePosition = findPositionForAlbum(currentMediaItem);
    List<Media> medias = [];
    for (final item in _currentQueue.value) {
      Media m = await Media.network(
        _repo.getServerUrl(item.partKey ?? item.id),
      );
      medias.add(m);
    }
    await _player.open(Playlist(medias: medias)).then((value) async {
      await _player.setRate(_prefs.speed ?? 1.5);
      while (queuePosition.trackIndex > index) await _player.next();
      StreamSubscription listener;
      listener = _player.playbackStream.listen((state) async {
        if (state.isSeekable) {
          await _player.seek(queuePosition.trackPosition);
          listener.cancel();
        }
      });
    });
  }

  Future handleResume() async {
    await _ensurePlayer();
  }

  Future stop() async {
    await _ensurePlayer();
    await _player.stop();
  }

  Future fastForward() async {
    await _ensurePlayer();
    await seek((currentPosition + Duration(seconds: 30)).inMilliseconds);
  }

  Future rewind() async {
    await _ensurePlayer();
    await seek((currentPosition - Duration(seconds: 30)).inMilliseconds);
  }

  Future play() async {
    await _ensurePlayer();
    await _player.play();
  }

  Future pause() async {
    await _ensurePlayer();
    await _player.pause();
  }

  Future seek(int position) async {
    await _ensurePlayer();
    final _position = findPostion(Duration(milliseconds: position));
    if (index != _position.trackIndex) {
      while (_position.trackIndex > index) await _player.next();
    }
    await _player.seek(_position.trackPosition);
  }

  Future setSpeed(double speed) async {
    await _ensurePlayer();
    await _player.setRate(speed);
    await _prefs.setSpeed(speed);
  }

  Future skipToQueueItem(int index) async {
    await _ensurePlayer();
  }

  Future skipToNext() async {
    await _ensurePlayer();
    await _player.next();
  }

  Future skipToPrevious() async {
    await _ensurePlayer();
    await _player.back();
  }

  _QueuePosition findPostion(Duration positionToFind) {
    Duration trackStart = Duration.zero;
    final track = _currentQueue.value.firstWhere((element) {
      trackStart += element.duration;
      return trackStart > positionToFind;
    }, orElse: () => _currentQueue.value[0]);
    trackStart -= track.duration;
    Duration trackPosition = positionToFind - trackStart;
    return _QueuePosition(_currentQueue.value.indexOf(track), trackPosition);
  }

  _QueuePosition findPositionForAlbum(MediaItem album) {
    if (album.viewOffset != Duration.zero) {
      return findPostion(album.viewOffset);
    } else {
      MediaItem item = findLatestTrack();
      return _QueuePosition(_currentQueue.value.indexOf(item), item.viewOffset);
    }
  }

  MediaItem findLatestTrack() {
    return _currentQueue.value.lastWhere((element) {
      return element.viewOffset != Duration.zero;
    }, orElse: () => _currentQueue.value[0]);
  }
}

class _QueuePosition {
  Duration trackPosition;
  int trackIndex;
  _QueuePosition(this.trackIndex, this.trackPosition);
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
  MediaItem get currentMediaItem => _audioHandler?.mediaItem?.value;
  List<MediaItem> get currentQueue => _audioHandler?.queue?.value;
  Stream<List<MediaItem>> get queueStream => _audioHandler?.queue;

  Future playItem(MediaItem item) async {
    return playFromId(item.id);
  }

  Future playFromId(String id, [bool shouldPlay = true]) async {
    if (id == currentItemId) {
      if (shouldPlay && !_audioHandler.playbackState.value.playing) play();
      return;
    }

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
