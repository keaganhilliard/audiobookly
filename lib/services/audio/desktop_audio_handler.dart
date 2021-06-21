import 'dart:async';
import 'dart:io';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:audiobookly/services/device_info/device_info_service.dart';
import 'package:audiobookly/services/shared_preferences/shared_preferences_service.dart';
import 'package:audiobookly/singletons.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dart_vlc/dart_vlc.dart' as vlc;

class DesktopAudioHandler extends BaseAudioHandler {
  final _player = vlc.Player(id: 1);

  MediaRepository? _repository;
  DesktopAudioHandler() {
    _init();
  }

  int? get index => _player.current.index;
  String? _currentMedia;
  MediaItem? _currentMediaItem;

  late SharedPreferencesService _prefs;
  MediaItem get currentQueueItem => queue.value![index!];
  Duration get totalDuration =>
      queue.value!.fold(Duration.zero, (total, item) => total + item.duration!);
  Duration get currentTrackStartingPosition =>
      queue.value!.getRange(0, index ?? 0).fold<Duration>(
            Duration.zero,
            (total, item) => (total) + (item.duration ?? Duration.zero),
          );
  Duration get currentPosition =>
      currentTrackStartingPosition +
      (_player.position.position ?? Duration.zero);
  Timer? _timer;
  Future updateProgress(Duration? position, AudiobooklyPlaybackState state,
      [bool finished = false]) async {
    // _timer ??= Timer.periodic(Duration(seconds: 10), (timer) async {
    //   await _repository.playbackCheckin(
    //     _currentMedia,
    //     currentPositionDuration,
    //     Duration(milliseconds: totalDuration),
    //     _player.speed,
    //     AudiobooklyEvent.TimeUpdate,
    //   );
    //   if (_player.playerState.processingState == ProcessingState.idle)
    //     timer.cancel();
    // });
    // if (state == AudiobooklyPlaybackState.STOPPED) {
    //   _timer.cancel();
    //   _timer = null;
    // }
    print('Updating progress: ${_player.playback.isPlaying}');
    _repository!.playbackCheckin(
        _currentMedia!,
        currentPosition,
        totalDuration,
        _player.general.rate,
        _player.playback.isPlaying
            ? AudiobooklyEvent.Unpause
            : AudiobooklyEvent.Pause,
        _player.playback.isPlaying);
    // _repository.savePosition(currentQueueItem.id, position,
    //     currentQueueItem.duration.inMilliseconds * (finished ? 1 : 2), state);
  }

  Future<void> _init() async {
    // await _player
    //     .setSpeed(_prefs.getDouble(SharedPrefStrings.PLAYBACK_SPEED) ?? 1.0);
    // Broadcast media item changes.
    _player.currentStream.listen((current) async {
      final index = current.index;
      if (index != null) {
        await updateProgress(
          currentQueueItem.duration,
          AudiobooklyPlaybackState.STOPPED,
          true,
        );

        if (_player.playback.isPlaying) {
          await updateProgress(
            currentPosition,
            AudiobooklyPlaybackState.PLAYING,
          );
        }
        setCurrentMediaItem();
      }
    });

    // _player.playbackEventStream.listen(_broadcastState);

    // // Special processing for state transitions.
    _player.playbackStream.listen(_broadcastState);
    _player.positionStream.listen(_broadcastState);
    // _player.processingStateStream.listen((state) {
    //   if (state == ProcessingState.completed) stop();
    // });

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
    ).read(mediaRepositoryProdiver);
    await _repository!.getServerAndLibrary();
    // _childrenSubjects = Map<String, BehaviorSubject<List<MediaItem>>>();
    if (_currentMedia != null) {
      playFromMediaId(_currentMedia);
    }
  }

  Future<void> setPlaybackRate(double speed) async {
    await _prefs.setSpeed(speed);
    await _player.setRate(speed);
  }

  void setCurrentMediaItem() {
    mediaItem.add(
      currentQueueItem.copyWith(
        id: currentQueueItem.id,
        duration: totalDuration,
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

  @override
  Future customAction(String name, Map<String, dynamic>? arguments) async {
    if (await queue.isEmpty) return;
    if (name == 'skip')
      await _player.next();
    else if (name == 'previous') await _player.back();
  }

  @override
  Future<void> setSpeed(double speed) async {
    await setPlaybackRate(speed);
  }

  /// Broadcasts the current state to all clients.
  void _broadcastState(dynamic event) async {
    final playing = _player.playback.isPlaying;
    playbackState.add(playbackState.value!.copyWith(
      controls: [
        MediaControl.rewind,
        // Controls.rewindControl,
        if (_player.playback.isPlaying)
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
      queueIndex: index ?? 0,
      processingState: AudioProcessingState.ready,
      // processingState: {
      //   ProcessingState.idle: AudioProcessingState.idle,
      //   ProcessingState.loading: AudioProcessingState.loading,
      //   ProcessingState.buffering: AudioProcessingState.buffering,
      //   ProcessingState.ready: AudioProcessingState.ready,
      //   ProcessingState.completed: AudioProcessingState.completed,
      // }[_player?.processingState ?? ProcessingState.idle],
      playing: playing,
      updatePosition: currentPosition,
      // bufferedPosition: currentBufferedPosition ?? Duration.zero,
      speed: _player.general.rate,
    ));
  }

  @override
  Future<void> play() async {
    await _player.play();
    // await setSpeed(_prefs.getDouble(SharedPrefStrings.PLAYBACK_SPEED));
    await updateProgress(
        _player.position.position, AudiobooklyPlaybackState.PLAYING);
    await super.play();
  }

  @override
  Future<void> pause() async {
    await _player.pause();
    await seek(currentPosition - Duration(seconds: 2));
    await super.pause();
    await updateProgress(
        _player.position.position, AudiobooklyPlaybackState.PAUSED);
  }

  @override
  Future<void> skipToNext() => fastForward(AudioService.config.rewindInterval);

  @override
  Future<void> skipToPrevious() => rewind(AudioService.config.rewindInterval);

  @override
  Future<void> stop() async {
    await updateProgress(
      _player.position.position,
      AudiobooklyPlaybackState.STOPPED,
    );
    await _player.stop();
    await super.stop();
  }

  @override
  Future fastForward([Duration interval = const Duration(seconds: 30)]) async {
    await seek(currentPosition + interval);
    await super.fastForward();
  }

  @override
  Future rewind([Duration interval = const Duration(seconds: 30)]) async {
    await seek(currentPosition - interval);
    await super.rewind();
  }

  @override
  Future seek(Duration position, [bool startPlaying = false]) async {
    print('Seeking');
    final queuePosition = findPostion(position);
    if (queuePosition.trackIndex == index!) {
      if (!_player.playback.isSeekable) {
        late StreamSubscription listener;
        listener = _player.playbackStream.listen((state) async {
          if (state.isSeekable) {
            await _player.seek(queuePosition.trackPosition);
            listener.cancel();
          }
        });
      }
      await _player.seek(queuePosition.trackPosition);
    } else {
      if (queuePosition.trackIndex < index!)
        while (queuePosition.trackIndex < index!) await _player.back();
      else
        while (queuePosition.trackIndex > index!) await _player.next();
      late StreamSubscription listener;
      listener = _player.playbackStream.listen((state) async {
        if (state.isSeekable) {
          await _player.seek(queuePosition.trackPosition);
          listener.cancel();
        }
      });
    }
    if (startPlaying) await _player.play();
    await super.seek(position);
  }

  @override
  Future<void> click([MediaButton button = MediaButton.media]) async {
    switch (button) {
      case MediaButton.media:
        if (playbackState.value?.playing == true) {
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
  Future<void> skipToQueueItem(int skipToIndex) async {
    while (skipToIndex > index!) await _player.next();
  }

  @override
  ValueStream<Map<String, dynamic>> subscribeToChildren(String parentMediaId) {
    return BehaviorSubject.seeded({});
  }

  @override
  Future<List<MediaItem>> getChildren(String parentMediaId,
      [Map<String, dynamic>? extras]) async {
    print('Get children: $parentMediaId');
    return await _repository!.getChildren(parentMediaId);
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
    if (_player.playback.isPlaying) {
      updateProgress(
          _player.position.position, AudiobooklyPlaybackState.STOPPED);
      await _player.stop();
    }

    if (dbBook != null && dbTracks.isNotEmpty) {
      final cachedQueue = dbTracks.entries.map((entry) {
        final track = entry.value;
        return MediaItem(
          id: entry.key,
          title: track.title,
          album: dbBook.title,
          artist: dbBook.author,
          displayDescription: dbBook.description,
          artUri: Uri.parse(dbBook.artPath),
          playable: true,
          extras: <String, dynamic>{
            'narrator': dbBook.narrator,
            'largeThumbnail': Uri.parse(dbBook.artPath),
            'cached': true,
            'cachePath': track.downloadPath,
          },
          duration: track.duration,
        );
      }).toList();
      queue.add(cachedQueue);
      _currentMediaItem = MediaItem(
        id: dbBook.id,
        title: dbBook.title,
        artist: dbBook.author,
        album: dbBook.title,
        artUri: Uri.parse(dbBook.artPath),
        displayDescription: dbBook.description,
        playable: true,
        duration: dbBook.duration,
        extras: <String, dynamic>{
          'narrator': dbBook.narrator,
          'largeThumbnail': Uri.parse(dbBook.artPath),
          'cached': true,
          'viewOffset': dbBook.lastPlayedPosition.inMilliseconds
        },
      );
    } else {
      await _repository!.getServerAndLibrary();
      queue.add((await _repository!.getTracksForBook(mediaId)).cast());
      _currentMediaItem = (await _repository!.getAlbumFromId(mediaId))
          .copyWith(duration: totalDuration);
    }

    final queuePosition = findPositionForAlbum(_currentMediaItem!);
    try {
      List<vlc.Media> medias = [];
      for (final item in queue.value!) {
        if (item.cached) {
          print('We are using a cached file bitches');
          medias.add(await vlc.Media.file(File(item.cachePath)));
        } else {
          medias.add(await vlc.Media.network(
            _repository!.getServerUrl(item.partKey ?? item.id),
          ));
        }
      }
      await _player.open(vlc.Playlist(medias: medias)).then((value) async {
        await setSpeed(_prefs.speed);
        while (queuePosition.trackIndex > index!) await _player.next();
        late StreamSubscription listener;
        listener = _player.playbackStream.listen((state) async {
          if (state.isSeekable) {
            await _player.seek(queuePosition.trackPosition);
            listener.cancel();
          }
        });
      });
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
      _player.general.rate,
    );
    // await seek(latestTrackPosition ?? Duration.zero, true);
  }

  MediaItem findLatestTrack() {
    return queue.value!.lastWhere((element) {
      return element.viewOffset != Duration.zero;
    }, orElse: () => queue.value![0]);
  }

  Duration findLatestTrackPosition(MediaItem? item) {
    if (item != null) {
      Duration position = Duration.zero;

      queue.value!.firstWhere((element) {
        position += element.duration!;
        return element.id == item.id;
      });

      position -= item.duration!;
      position += item.viewOffset;
      return position;
    }
    return Duration.zero;
  }

  _QueuePosition findPostion(Duration positionToFind) {
    Duration trackStart = Duration.zero;
    final track = queue.value!.firstWhere((element) {
      trackStart += element.duration!;
      return trackStart > positionToFind;
    }, orElse: () => queue.value![0]);
    trackStart -= track.duration!;
    Duration trackPosition = positionToFind - trackStart;
    return _QueuePosition(queue.value!.indexOf(track), trackPosition);
  }

  _QueuePosition findPositionForAlbum(MediaItem album) {
    if (album.viewOffset != Duration.zero) {
      return findPostion(album.viewOffset);
    } else {
      MediaItem item = findLatestTrack();
      final index = queue.value!.indexOf(item);
      return _QueuePosition(index, item.viewOffset);
    }
  }
}

class _QueuePosition {
  Duration trackPosition;
  int trackIndex;
  _QueuePosition(this.trackIndex, this.trackPosition);
}
