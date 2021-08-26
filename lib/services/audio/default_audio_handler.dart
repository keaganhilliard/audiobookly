import 'dart:async';
import 'package:audio_session/audio_session.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:audiobookly/services/device_info/device_info_service.dart';
import 'package:audiobookly/services/shared_preferences/shared_preferences_service.dart';
import 'package:audiobookly/singletons.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AudiobooklyAudioHandler extends BaseAudioHandler {
  final _player = AudioPlayer();

  MediaRepository? _repository;
  AudiobooklyAudioHandler() {
    _init();
  }

  int? get index => _player.currentIndex;
  String? _currentMedia;
  MediaItem? _currentMediaItem;

  late SharedPreferencesService _prefs;
  MediaItem get currentQueueItem => queue.value[index!];
  Duration get totalDuration => queue.value.fold(
        Duration.zero,
        (total, item) => total + item.duration!,
      );
  Duration get currentTrackStartingPosition =>
      queue.value.getRange(0, index ?? 0).fold<Duration>(
            Duration.zero,
            (total, item) => (total) + (item.duration ?? Duration.zero),
          );
  Duration get currentPosition =>
      currentTrackStartingPosition + (_player.position);
  Duration get currentBufferedPosition =>
      queue.value.getRange(0, index ?? 0).fold<Duration>(
            Duration.zero,
            (total, item) => (total) + (item.duration ?? Duration.zero),
          ) +
      (_player.bufferedPosition);
  Timer? _timer;

  void initTimer() {
    int pauseCount = 0;
    _timer ??= Timer.periodic(Duration(seconds: 10), (timer) async {
      if (!_player.playing) pauseCount++;
      await _repository?.playbackCheckin(
          _currentMedia!,
          currentPosition,
          totalDuration,
          _player.speed,
          AudiobooklyEvent.TimeUpdate,
          _player.playing);
      if (_player.playerState.processingState == ProcessingState.idle ||
          pauseCount > 5) {
        timer.cancel();
        _timer = null;
        pauseCount = 0;
      }
    });
  }

  Future updateProgress(AudiobooklyPlaybackState state,
      [bool finished = false]) async {
    initTimer();
    if (state == AudiobooklyPlaybackState.STOPPED) {
      _timer?.cancel();
      _timer = null;
      if (_currentMedia != null)
        _repository!.playbackCheckin(
          _currentMedia!,
          currentPosition,
          totalDuration,
          _player.speed,
          AudiobooklyEvent.Pause,
          _player.playing,
        );
    } else {
      _repository!.playbackCheckin(
        _currentMedia!,
        currentPosition,
        totalDuration,
        _player.speed,
        _player.playing ? AudiobooklyEvent.Unpause : AudiobooklyEvent.Pause,
        _player.playing,
      );
    }
  }

  bool pauseOnNext = false;

  Future<void> _init() async {
    // We configure the audio session for speech since we're playing a podcast.
    // You can also put this in your app's initialisation if your app doesn't
    // switch between two types of audio as this example does.
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.speech());

    // await _player
    //     .setSpeed(_prefs.getDouble(SharedPrefStrings.PLAYBACK_SPEED) ?? 1.0);
    // Broadcast media item changes.
    _player.currentIndexStream.listen((currentIndex) async {
      if (index != null) {
        await updateProgress(AudiobooklyPlaybackState.STOPPED, true);

        if (_player.playing) {
          await updateProgress(AudiobooklyPlaybackState.PLAYING);
        }
        setCurrentMediaItem();
      }
      if (pauseOnNext) {
        pauseOnNext = false;
        pause();
      }
    });

    _player.playbackEventStream.listen(_broadcastState);

    // Special processing for state transitions.
    _player.processingStateStream.listen((state) {
      if (state == ProcessingState.completed) {
        _repository!.playbackFinished(_currentMedia!);
        stop();
      }
    });

    _prefs = SharedPreferencesService(await SharedPreferences.getInstance());
    final _info = await getDeviceInfo();
    _repository = ProviderContainer(
      overrides: [
        sharedPreferencesServiceProvider.overrideWithValue(
          _prefs,
        ),
        deviceInfoServiceProvider.overrideWithValue(
          DeviceInfoService(_info),
        )
      ],
    ).read(mediaRepositoryProvider);
    await _repository?.getServerAndLibrary();
    // _childrenSubjects = Map<String, BehaviorSubject<List<MediaItem>>>();
    if (_currentMedia != null) {
      playFromMediaId(_currentMedia);
    }
  }

  Future<void> setPlaybackRate(double speed) async {
    await _prefs.setSpeed(speed);
    await _player.setSpeed(speed);
  }

  void setCurrentMediaItem() {
    mediaItem.add(
      currentQueueItem.copyWith(
        id: currentQueueItem.id,
        duration: totalDuration,
        artUri: _currentMediaItem?.artUri,
        displayDescription: _currentMediaItem?.displayDescription,
        extras: <String, dynamic>{
          'currentTrack': currentQueueItem.id,
          'currentTrackLength': currentQueueItem.duration!.inMilliseconds,
          'currentTrackStartingPosition':
              currentTrackStartingPosition.inMilliseconds,
        },
      ),
    );
  }

  Timer? _pauseTimer;

  @override
  Future customAction(String name, [Map<String, dynamic>? arguments]) async {
    if (await queue.isEmpty) return;
    if (name == 'skip')
      await _player.seekToNext();
    else if (name == 'previous')
      await _player.seekToPrevious();
    else if (name == 'setTimer') {
      if (arguments?['type'] == 'endOfTrack') {
        pauseOnNext = true;
      } else if (arguments?['type'] == 'cancel') {
        _pauseTimer?.cancel();
        _pauseTimer = null;
      } else {
        final minutes = arguments?['minutes'];
        if (minutes != null) {
          _pauseTimer = Timer(Duration(minutes: minutes), () {
            if (_player.playing) pause();
          });
        }
      }
    }
  }

  @override
  Future<void> setSpeed(double speed) async {
    await setPlaybackRate(speed);
  }

  /// Broadcasts the current state to all clients.
  Future<void> _broadcastState(PlaybackEvent event) async {
    playbackState.add(playbackState.value.copyWith(
      controls: [
        MediaControl.rewind,
        // Controls.rewindControl,
        if (_player.playing) MediaControl.pause else MediaControl.play,
        MediaControl.fastForward,
        // Controls.fastForwardControl,
        MediaControl.stop,
      ],
      systemActions: {
        MediaAction.seek,
        MediaAction.playPause,
        MediaAction.fastForward,
        MediaAction.skipToNext,
        MediaAction.skipToPrevious,
        MediaAction.rewind,
      },
      androidCompactActionIndices: [0, 1, 2],
      processingState: {
        ProcessingState.idle: AudioProcessingState.idle,
        ProcessingState.loading: AudioProcessingState.loading,
        ProcessingState.buffering: AudioProcessingState.buffering,
        ProcessingState.ready: AudioProcessingState.ready,
        ProcessingState.completed: AudioProcessingState.completed,
      }[_player.processingState]!,
      playing: _player.playing,
      updatePosition: currentPosition,
      bufferedPosition: currentBufferedPosition,
      speed: _player.speed,
    ));
  }

  @override
  Future<void> play() async {
    _player.play();
    // await setSpeed(_prefs.getDouble(SharedPrefStrings.PLAYBACK_SPEED));
    print('Playing progress should fire bitch');
    await updateProgress(AudiobooklyPlaybackState.PLAYING);
    // await super.play();
  }

  @override
  Future<void> pause() async {
    await _player.pause();
    await seek(currentPosition - Duration(seconds: 2));
    await super.pause();
    await updateProgress(AudiobooklyPlaybackState.PAUSED);
  }

  @override
  Future<void> skipToNext() => fastForward(AudioService.config.rewindInterval);

  @override
  Future<void> skipToPrevious() => rewind(AudioService.config.rewindInterval);

  @override
  Future<void> stop() async {
    await updateProgress(AudiobooklyPlaybackState.STOPPED);
    await _player.stop();
    await super.stop();
  }

  @override
  Future fastForward([Duration interval = const Duration(seconds: 30)]) async {
    await seek(currentPosition + interval);
    await super.fastForward();
  }

  @override
  Future rewind([Duration interval = const Duration(seconds: 15)]) async {
    await seek(currentPosition - interval);
    await super.rewind();
  }

  @override
  Future seek(Duration position, [bool startPlaying = false]) async {
    final queuePosition = findPostion(position);
    await _player.seek(
      queuePosition.trackPosition,
      index: queuePosition.trackIndex,
    );
    if (startPlaying) await _player.play();
    await super.seek(position);
  }

  @override
  Future<void> click([MediaButton button = MediaButton.media]) async {
    switch (button) {
      case MediaButton.media:
        if (playbackState.value.playing == true) {
          await pause();
        } else {
          await play();
        }
        break;
      case MediaButton.next:
        await skipToNext();
        break;
      case MediaButton.previous:
        await skipToPrevious();
        break;
    }
  }

  @override
  Future<void> skipToQueueItem(int index) async {
    await _player.seek(Duration.zero, index: index);
  }

  Map<String, ValueStream<Map<String, dynamic>>> streams = Map();

  @override
  ValueStream<Map<String, dynamic>> subscribeToChildren(String parentMediaId) {
    return Stream.value(doMe).map((_) => <String, dynamic>{}).shareValue();
  }

  List<MediaItem>? doMe;

  @override
  Future<List<MediaItem>> getChildren(String parentMediaId,
      [Map<String, dynamic>? extras]) async {
    print('Get children: $parentMediaId');
    final items = await _repository!.getChildren(parentMediaId);
    doMe = items;
    print('We returned $items');
    return items;
  }

  @override
  Future<MediaItem> getMediaItem(String mediaId) {
    return _repository!.getAlbumFromId(mediaId);
  }

  @override
  Future<void> prepare() async {
    prepareFromMediaId(
        (await _repository!.getRecentlyPlayed()).take(1).toList()[0].id);
  }

  @override
  Future<void> prepareFromMediaId(String? mediaId,
      [Map<String, dynamic>? extras]) async {
    // if (mediaItem?.value?.id == mediaId && _player != null) {
    //   return;
    // }
    if (mediaId == null) return;

    final db = getIt<DatabaseService>();
    final dbBook = await db.getBookById(mediaId);
    final dbTracks = await db.getTracksForBookId(mediaId).first;
    _currentMedia = mediaId;
    if (_player.playing) {
      updateProgress(AudiobooklyPlaybackState.STOPPED);
      await _player.stop();
    }

    if (dbBook != null && dbTracks.isNotEmpty) {
      final cachedQueue = dbTracks.entries.map((entry) {
        final track = entry.value;
        return MediaHelpers.fromTrack(track, dbBook);
      }).toList();
      queue.add(cachedQueue);
      _currentMediaItem = MediaHelpers.fromBook(dbBook);
    } else {
      await _repository!.getServerAndLibrary();
      queue.add(
          (await _repository!.getTracksForBook(mediaId)).cast<MediaItem>());
      _currentMediaItem = (await _repository!.getAlbumFromId(mediaId))
          .copyWith(duration: totalDuration);
    }

    final queuePosition = findPositionForAlbum(_currentMediaItem!);
    try {
      await _player.setAudioSource(
        ConcatenatingAudioSource(
          children: queue.value.map((item) {
            print('We doing cache? ${'file:///' + item.cachePath}');
            return AudioSource.uri(item.cached
                ? Uri.parse('file://' + item.cachePath)
                : Uri.parse(
                    _repository!.getServerUrl(item.partKey ?? item.id)));
          }).toList(),
        ),
        initialIndex: queuePosition.trackIndex,
        initialPosition: queuePosition.trackPosition,
      );
      await setSpeed(_prefs.speed);
      setCurrentMediaItem();
    } catch (e, stack) {
      print("Error code $e");
      print("Error stack $stack");
    }
  }

  @override
  Future<void> playFromSearch(String query,
      [Map<String, dynamic>? extras]) async {
    List<MediaItem> items = await _repository!.search(query);
    if (items.isNotEmpty) await playFromMediaId(items[0].id);
    return super.playFromSearch(query, extras);
  }

  @override
  Future<List<MediaItem>> search(String query,
      [Map<String, dynamic>? extras]) async {
    return await _repository!.search(query);
  }

  @override
  Future<void> prepareFromSearch(String query, [Map<String, dynamic>? extras]) {
    // TODO: implement prepareFromSearch
    return super.prepareFromSearch(query, extras);
  }

  @override
  Future playFromMediaId(String? mediaId,
      [Map<String, dynamic>? extras]) async {
    await prepareFromMediaId(mediaId, extras);
    await _player.play();
    await _repository!.playbackStarted(
      mediaId!,
      currentPosition,
      totalDuration,
      _player.speed,
    );
    await updateProgress(AudiobooklyPlaybackState.PLAYING);
    // await seek(latestTrackPosition ?? Duration.zero, true);
  }

  MediaItem findLatestTrack() {
    return queue.value.lastWhere((element) {
      return element.viewOffset != Duration.zero;
    }, orElse: () => queue.value[0]);
  }

  _QueuePosition findPostion(Duration positionToFind) {
    Duration trackStart = Duration.zero;
    final track = queue.value.firstWhere((element) {
      trackStart += element.duration!;
      return trackStart > positionToFind;
    }, orElse: () => queue.value[0]);
    trackStart -= track.duration!;
    Duration trackPosition = positionToFind - trackStart;
    return _QueuePosition(queue.value.indexOf(track), trackPosition);
  }

  _QueuePosition findPositionForAlbum(MediaItem album) {
    if (album.viewOffset != Duration.zero) {
      return findPostion(album.viewOffset);
    } else {
      MediaItem item = findLatestTrack();
      return _QueuePosition(queue.value.indexOf(item), item.viewOffset);
    }
  }
}

class _QueuePosition {
  Duration trackPosition;
  int trackIndex;
  _QueuePosition(this.trackIndex, this.trackPosition);
}
