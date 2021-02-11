import 'dart:async';
import 'package:audio_session/audio_session.dart';
import 'package:audiobookly/core/utils/utils.dart';
import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/new_project_structure/repositories/media/media_repository.dart';
// import 'package:audiobookly/repository/base_repository.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audiobookly/core/constants/app_constants.dart';

class AudiobooklyAudioHandler extends BaseAudioHandler {
  final _player = AudioPlayer();

  final MediaRepository _repository;
  AudiobooklyAudioHandler(this._repository) {
    _init();
  }

  int get index => _player?.currentIndex;
  String _currentMedia;
  MediaItem _currentMediaItem;

  SharedPreferences _prefs;

  MediaItem get currentQueueItem => queue.value[index];
  int get totalDuration => queue.value
      .fold(0, (total, item) => total + item.duration.inMilliseconds);
  int get currentTrackStartingPosition =>
      queue.value.getRange(0, index ?? 0).fold<int>(
          0,
          (total, item) =>
              (total ?? 0) + (item?.duration?.inMilliseconds ?? 0));
  int get currentPosition =>
      currentTrackStartingPosition + (_player?.position?.inMilliseconds ?? 0);
  int get currentBufferedPosition =>
      queue.value.getRange(0, index ?? 0).fold<int>(
          0,
          (total, item) =>
              (total ?? 0) + (item?.duration?.inMilliseconds ?? 0)) +
      (_player?.bufferedPosition?.inMilliseconds ?? 0);
  Duration get currentPositionDuration => Duration(
        milliseconds: currentPosition ?? 0,
      );
  Duration get currentBufferedPositionDuration => Duration(
        milliseconds: currentBufferedPosition ?? 0,
      );

  void updateProgress(int position, AudiobooklyPlaybackState state,
      [bool finished = false]) async {
    _repository.savePosition(currentQueueItem.id, position,
        currentQueueItem.duration.inMilliseconds * (finished ? 1 : 2), state);
  }

  Future<void> _init() async {
    // We configure the audio session for speech since we're playing a podcast.
    // You can also put this in your app's initialisation if your app doesn't
    // switch between two types of audio as this example does.
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.speech());

    // await _player
    //     .setSpeed(_prefs.getDouble(SharedPrefStrings.PLAYBACK_SPEED) ?? 1.0);
    // Broadcast media item changes.
    _player.currentIndexStream.listen((currentIndex) {
      if (index != null) {
        updateProgress(
          currentQueueItem.duration.inMilliseconds,
          AudiobooklyPlaybackState.STOPPED,
          true,
        );

        if (_player.playing) {
          updateProgress(
            currentPositionDuration.inMilliseconds,
            AudiobooklyPlaybackState.PLAYING,
          );
        }
        mediaItem.add(
          currentQueueItem.copyWith(
            duration: Duration(
              milliseconds:
                  totalDuration ?? currentQueueItem.duration.inMilliseconds,
            ),
            displayDescription: _currentMediaItem?.displayDescription,
            extras: <String, dynamic>{
              'currentTrack': currentQueueItem.id,
              'currentTrackLength': currentQueueItem.duration.inMilliseconds,
              'currentTrackStartingPosition': currentTrackStartingPosition,
            },
          ),
        );
      }
    });

    _player.playbackEventStream.listen(_broadcastState);

    // Special processing for state transitions.
    _player.processingStateStream.listen((state) {
      if (state == ProcessingState.completed) stop();
    });

    _prefs = await SharedPreferences.getInstance();
    await _repository.getServerAndLibrary();
    _childrenSubjects = Map<String, BehaviorSubject<List<MediaItem>>>();
    if (_currentMedia != null) {
      playFromMediaId(_currentMedia);
    }
  }

  Future<void> setPlaybackRate(double speed) async {
    await _prefs.setDouble(SharedPrefStrings.PLAYBACK_SPEED, speed);
    await _player.setSpeed(speed);
  }

  @override
  Future<void> setSpeed(double speed) async {
    await setPlaybackRate(speed);
  }

  /// Broadcasts the current state to all clients.
  Future<void> _broadcastState(PlaybackEvent event) async {
    final playing = _player?.playing ?? false;
    playbackState.add(playbackState.value.copyWith(
      controls: [
        MediaControl.rewind,
        // Controls.rewindControl,
        if (_player?.playing ?? false)
          MediaControl.pause
        else
          MediaControl.play,
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
      }[_player?.processingState ?? ProcessingState.idle],
      playing: playing,
      updatePosition: currentPositionDuration ?? Duration.zero,
      bufferedPosition: currentBufferedPositionDuration ?? Duration.zero,
      speed: _player?.speed ?? 1.0,
    ));
  }

  @override
  Future<void> play() async {
    await _player.play();
    await super.play();
    setSpeed(_prefs.getDouble(SharedPrefStrings.PLAYBACK_SPEED));
    updateProgress(
        _player.position.inMilliseconds, AudiobooklyPlaybackState.PLAYING);
  }

  @override
  Future<void> pause() async {
    await _player.pause();
    await super.pause();
    updateProgress(_player.position.inMilliseconds - 2000,
        AudiobooklyPlaybackState.PAUSED);
    seek(Duration(milliseconds: currentPosition - 2000));
  }

  @override
  Future<void> skipToNext() => fastForward();

  @override
  Future<void> skipToPrevious() => rewind();

  @override
  Future<void> stop() async {
    updateProgress(
      _player.position.inMilliseconds,
      AudiobooklyPlaybackState.STOPPED,
    );
    await _player?.stop();
    await super.stop();
  }

  @override
  Future fastForward([Duration interval]) async {
    await seek(Duration(
        milliseconds:
            currentPosition + interval?.inMilliseconds ?? (30 * 1000)));
    await super.fastForward(interval);
  }

  @override
  Future rewind([Duration interval]) async {
    await seek(Duration(
        milliseconds:
            (currentPosition - (interval?.inMilliseconds ?? (30 * 1000)))));
    await super.rewind(interval);
  }

  @override
  Future seek(Duration position, [bool startPlaying = false]) async {
    int trackPosition = 0;
    int currentPosition = position?.inMilliseconds ?? 0;
    MediaItem item = queue.value.firstWhere((track) {
      if (currentPosition - track.duration.inMilliseconds <= 0) {
        trackPosition = currentPosition;
        return true;
      } else if (currentPosition != 0) {
        currentPosition -= track.duration.inMilliseconds;
      }
      return false;
    });
    int _index = queue.value.indexOf(item);
    await _player.seek(Duration(milliseconds: trackPosition), index: _index);
    setSpeed(_prefs.getDouble(SharedPrefStrings.PLAYBACK_SPEED));
    if (startPlaying) _player.play();
    await super.seek(position);
  }

  @override
  Future<void> click([MediaButton button]) async {
    switch (button) {
      case MediaButton.media:
        if (playbackState?.value?.playing == true) {
          await pause();
        } else {
          await play();
        }
        break;
      case MediaButton.next:
        await fastForward();
        break;
      case MediaButton.previous:
        await rewind();
        break;
    }
    await super.click(button);
  }

  @override
  Future<void> skipToQueueItem(String mediaId) async {
    var _index = queue.value.indexWhere((element) => element.id == mediaId);
    await _player.seek(Duration.zero, index: _index);
    await super.skipToQueueItem(mediaId);
  }

  Map<String, BehaviorSubject<List<MediaItem>>> _childrenSubjects;

  @override
  ValueStream<List<MediaItem>> getChildrenStream(String parentMediaId,
      [Map<String, dynamic> extras]) {
    print(extras);
    ValueStream stream = _childrenSubjects
        .putIfAbsent(parentMediaId, () => BehaviorSubject<List<MediaItem>>())
        .stream;
    getChildren(parentMediaId);
    return stream;
  }

  @override
  Future<List<MediaItem>> getChildren(String parentMediaId,
      [Map<String, dynamic> extras]) async {
    print('Get children: $parentMediaId');
    List<MediaItem> children = await _repository.getChildren(parentMediaId);
    _childrenSubjects.putIfAbsent(
        parentMediaId, () => BehaviorSubject<List<MediaItem>>.seeded(children));
    return children;
  }

  @override
  Future<MediaItem> getMediaItem(String mediaId) {
    return _repository.getAlbumFromId(mediaId);
  }

  @override
  Future<void> prepare() async {
    prepareFromMediaId(
        (await _repository.getRecentlyPlayed()).take(1).toList()[0].id);
  }

  @override
  Future<void> prepareFromMediaId(String mediaId,
      [Map<String, dynamic> extras]) async {
    // if (mediaItem?.value?.id == mediaId && _player != null) {
    //   return;
    // }
    _currentMedia = mediaId;
    if (_player?.playing ?? false) {
      updateProgress(
          _player.position.inMilliseconds, AudiobooklyPlaybackState.STOPPED);
      _player.stop();
    }
    await _repository.getServerAndLibrary();
    queue.add(await _repository.getTracksForBook(mediaId));
    _currentMediaItem = (await _repository.getAlbumFromId(mediaId))
        .copyWith(duration: Duration(milliseconds: totalDuration));
    print('Prepare from mediaId:' + '${_currentMediaItem.id}');
    queue.value.forEach((element) {
      print('QUEUE: ${element.title}');
    });
    final latestItem = findLatestTrack();
    final latestTrackPosition = findLatestTrackPosition(latestItem);
    try {
      await _player.setAudioSource(
        ConcatenatingAudioSource(
          children: queue.value
              .map(
                (item) => AudioSource.uri(
                  Uri.parse(_repository.getServerUrl(item.partKey ?? item.id)),
                ),
              )
              .toList(),
        ),
        initialIndex: queue.value.indexOf(latestItem),
        initialPosition: latestTrackPosition,
      );
      await setSpeed(_prefs.getDouble(SharedPrefStrings.PLAYBACK_SPEED));
    } catch (e) {
      print("Error code ${e.code}");
      print('Error message ${e.message}');
    }
  }

  @override
  Future<void> playFromSearch(String query,
      [Map<String, dynamic> extras]) async {
    List<MediaItem> items = await _repository.search(query);
    if (items.isNotEmpty) await playFromMediaId(items[0].id);
    return super.playFromSearch(query, extras);
  }

  @override
  Future<List<MediaItem>> search(String query,
      [Map<String, dynamic> extras]) async {
    return await _repository.search(query);
  }

  @override
  Future<void> prepareFromSearch(String query, [Map<String, dynamic> extras]) {
    // TODO: implement prepareFromSearch
    return super.prepareFromSearch(query, extras);
  }

  @override
  Future playFromMediaId(String mediaId, [Map<String, dynamic> extras]) async {
    await prepareFromMediaId(mediaId, extras);
    await play();
    // await seek(latestTrackPosition ?? Duration.zero, true);
  }

  MediaItem findLatestTrack() {
    return queue.value.lastWhere((element) {
      return element.viewOffset != Duration.zero;
    });
  }

  Duration findLatestTrackPosition(MediaItem item) {
    if (item != null) {
      int positionInMilliseconds = 0;

      queue.value.firstWhere((element) {
        positionInMilliseconds += element.duration.inMilliseconds;
        return element.id == item.id;
      });

      positionInMilliseconds -= item.duration.inMilliseconds;
      positionInMilliseconds += item.viewOffset.inMilliseconds;
      return Duration(milliseconds: positionInMilliseconds);
    }
    return Duration.zero;
  }
}
