import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:audio_session/audio_session.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:audiobookly/singletons.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/providers.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:path/path.dart' as p;

enum DurationState { between, before, after }

class AudiobooklyAudioHandler extends BaseAudioHandler {
  final _player = AudioPlayer(
    audioLoadConfiguration: AudioLoadConfiguration(
      darwinLoadControl: DarwinLoadControl(
        preferredForwardBufferDuration: const Duration(seconds: 30),
      ),
    ),
  );
  final completer = Completer();

  AudiobooklyAudioHandler() {
    _init();
  }

  int? chapterIndex;

  int? get index => _player.currentIndex;
  String? _currentMedia;
  MediaItem? _currentMediaItem;
  List<MediaItem> tracks = [];
  late ProviderContainer container;

  MediaRepository? get _repository => container.read(mediaRepositoryProvider);

  MediaItem? get currentQueueItem {
    if (chapterIndex != null &&
        chapterIndex! >= 0 &&
        chapterIndex! < queue.value.length) {
      return queue.value[chapterIndex!];
    } else if (index != null && index! >= 0 && index! < tracks.length) {
      return tracks[index!];
    }
    return null;
  }

  Duration get totalDuration => tracks.fold(
        Duration.zero,
        (total, item) => total + item.duration!,
      );
  Duration get currentTrackStartingPosition =>
      tracks.getRange(0, index ?? 0).fold(
            Duration.zero,
            (total, item) => (total) + (item.duration ?? Duration.zero),
          );
  Duration get currentPosition =>
      currentTrackStartingPosition + _player.position;
  Duration get currentBufferedPosition =>
      currentTrackStartingPosition + _player.bufferedPosition;

  Duration get currentQueueStartingPosition =>
      queue.value.getRange(0, chapterIndex ?? 0).fold(
            Duration.zero,
            (total, item) => (total) + (item.duration ?? Duration.zero),
          );

  Timer? _timer;
  StreamSubscription? _positionSub;

  final maxCheckinsForPause = 5;
  void initTimer() {
    int pauseCount = 0;
    if (_currentMedia != null) {
      _timer ??= Timer.periodic(const Duration(seconds: 10), (timer) async {
        if (!_player.playing) pauseCount++;
        try {
          await _repository?.playbackCheckin(
            _currentMedia!,
            currentPosition,
            totalDuration,
            _player.speed,
            AudiobooklyEvent.TimeUpdate,
            _player.playing,
          );
        } catch (e) {
          log('$e');
        }
        if (_player.playerState.processingState == ProcessingState.idle ||
            pauseCount > maxCheckinsForPause) {
          timer.cancel();
          _timer = null;
          pauseCount = 0;
          await updateProgress(AudiobooklyPlaybackState.STOPPED);
        }
      });
    }
    _positionSub ??= _player.positionStream.listen((position) {
      if ((currentQueueItem?.extras?.containsKey('start') ?? false) &&
          (currentQueueItem?.extras?.containsKey('end') ?? false)) {
        var currentState = durationBetween(
          currentPosition,
          currentQueueItem!.start,
          currentQueueItem!.end,
        );
        bool shouldChange = currentState != DurationState.between;
        while (currentState != DurationState.between) {
          if (currentState == DurationState.before) {
            chapterIndex = chapterIndex == null ? 0 : chapterIndex! - 1;
          }
          if (currentState == DurationState.after) {
            chapterIndex ??= 0;

            chapterIndex = chapterIndex! + 1;
          }
          currentState = durationBetween(
              currentPosition, currentQueueItem!.start, currentQueueItem!.end);
        }
        if (shouldChange) {
          setCurrentMediaItem();
        }
      }
    });
  }

  DurationState durationBetween(
      Duration position, Duration start, Duration end) {
    if (position >= start && position <= end) {
      return DurationState.between;
    } else if (position > end) {
      return DurationState.after;
    } else {
      return DurationState.before;
    }
  }

  Future updateProgress(AudiobooklyPlaybackState state,
      [bool finished = false]) async {
    initTimer();
    try {
      if (state == AudiobooklyPlaybackState.STOPPED) {
        _timer?.cancel();
        _timer = null;
        if (_currentMedia != null) {
          await _repository!.playbackCheckin(
            _currentMedia!,
            currentPosition,
            totalDuration,
            _player.speed,
            AudiobooklyEvent.Pause,
            _player.playing,
          );
          await _repository!.playbackFinished(_currentMedia!);
        }
      } else {
        await _repository!.playbackCheckin(
          _currentMedia!,
          currentPosition,
          totalDuration,
          _player.speed,
          _player.playing ? AudiobooklyEvent.Unpause : AudiobooklyEvent.Pause,
          _player.playing,
        );
      }
    } catch (e) {
      log('Checkin error: $e');
    }
  }

  Future<void> _init() async {
    // We configure the audio session for speech since we're playing a podcast.
    // You can also put this in your app's initialisation if your app doesn't
    // switch between two types of audio as this example does.
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());

    // await _player
    //     .setSpeed(_prefs.getDouble(SharedPrefStrings.PLAYBACK_SPEED) ?? 1.0);
    // Broadcast media item changes.
    _player.currentIndexStream.listen((currentIndex) async {
      if (index != null) {
        // await updateProgress(AudiobooklyPlaybackState.STOPPED, true);

        if (_player.playing) {
          await updateProgress(AudiobooklyPlaybackState.PLAYING);
        }
        setCurrentMediaItem();
      }
    });

    _player.playbackEventStream.listen(_broadcastState);

    // Special processing for state transitions.
    _player.processingStateStream.listen((state) {
      if (state == ProcessingState.completed) {
        stop();
      }
    });

    container = ProviderContainer();
    await _repository?.getServerAndLibrary();
    if (_currentMedia != null) {
      playFromMediaId(_currentMedia);
    }
    completer.complete();
  }

  Future<void> setPlaybackRate(double speed) async {
    DatabaseService db = GetIt.I();
    await db.insertPreferences(db.getPreferencesSync()..playbackSpeed = speed);
    await _player.setSpeed(speed);
  }

  void setCurrentMediaItem() {
    if (currentQueueItem != null) {
      mediaItem.add(
        currentQueueItem!.copyWith(
          id: _currentMediaItem!.id,
          duration: totalDuration,
          artUri: _currentMediaItem?.artUri,
          displayDescription: _currentMediaItem?.displayDescription,
          extras: <String, dynamic>{
            ...currentQueueItem!.extras ?? {},
            'currentTrack': currentQueueItem!.id,
            'currentTrackLength': currentQueueItem!.duration!.inMilliseconds,
            'currentTrackStartingPosition':
                currentQueueStartingPosition.inMilliseconds,
          },
        ),
      );
      _broadcastState();
    }
  }

  Timer? _pauseTimer;

  @override
  Future customAction(String name, [Map<String, dynamic>? extras]) async {
    await completer.future;
    if (await queue.isEmpty) return;
    if (name == 'skip') {
      if (chapterIndex != null && chapterIndex! < queue.value.length) {
        await skipToQueueItem(chapterIndex! + 1);
      } else {
        await _player.seekToNext();
      }
    } else if (name == 'previous') {
      if (chapterIndex != null && chapterIndex! > 0) {
        await skipToQueueItem(chapterIndex! - 1);
      } else {
        await _player.seekToPrevious();
      }
    }
  }

  @override
  Future<void> setSpeed(double speed) async {
    await completer.future;
    await setPlaybackRate(speed);
  }

  /// Broadcasts the current state to all clients.
  Future<void> _broadcastState([PlaybackEvent? event]) async {
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
      queueIndex: chapterIndex ?? index,
    ));
  }

  @override
  Future<void> play() async {
    await completer.future;
    if (_currentMedia == null) {
      final items = await _repository!.getChildren(AudioService.recentRootId);
      if (items.isNotEmpty) await prepareFromMediaId(items[0].id);
    }
    try {
      final item = await _repository!.getAlbumFromId(_currentMedia);
      final position = _findPostionDurationForAlbum(item.toMediaItem());
      if (position > currentPosition && !item.read) {
        await seek(position);
      }
    } catch (e) {
      log(e.toString());
    }

    _player.play();
    // await setSpeed(_prefs.getDouble(SharedPrefStrings.PLAYBACK_SPEED));
    await updateProgress(AudiobooklyPlaybackState.PLAYING);
    // await super.play();
  }

  @override
  Future<void> pause() async {
    await completer.future;
    await _player.pause();
    await seek(currentPosition - const Duration(seconds: 2));
    await super.pause();
    await updateProgress(AudiobooklyPlaybackState.PAUSED);
  }

  @override
  Future<void> skipToNext() => fastForward(AudioService.config.rewindInterval);

  @override
  Future<void> skipToPrevious() => rewind(AudioService.config.rewindInterval);

  @override
  Future<void> stop() async {
    await completer.future;
    if (_player.playing) {
      await updateProgress(AudiobooklyPlaybackState.STOPPED);
    }
    await _player.stop();
    // await _player.dispose();
    // _player = ;
    _currentMedia = null;
    _currentMediaItem = null;
    tracks = [];
    chapterIndex = null;
    mediaItem.add(null);
    _timer?.cancel();
    _timer = null;
    await super.stop();
  }

  @override
  Future fastForward([Duration interval = const Duration(seconds: 30)]) async {
    await completer.future;
    await seek(currentPosition + interval);
    await super.fastForward();
  }

  @override
  Future rewind([Duration interval = const Duration(seconds: 15)]) async {
    await completer.future;
    await seek(currentPosition - interval);
    await super.rewind();
  }

  @override
  Future seek(Duration position, [bool startPlaying = false]) async {
    final queuePosition = _findPostion(position);
    await _player.seek(
      queuePosition.trackPosition,
      index: queuePosition.trackIndex,
    );
    if (startPlaying) _player.play();
    await super.seek(position);
  }

  @override
  Future<void> click([MediaButton button = MediaButton.media]) async {
    await completer.future;
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
    await completer.future;
    final item = queue.value[index];
    if (item.extras?.containsKey('start') ?? false) {
      await seek(
        Duration(
            milliseconds: (item.extras?['start'].toDouble() * 1000).round()),
      );
    } else {
      await _player.seek(Duration.zero, index: index);
    }
  }

  Map<String, ValueStream<Map<String, dynamic>>> streams = {};

  @override
  ValueStream<Map<String, dynamic>> subscribeToChildren(String parentMediaId) {
    return Stream.value(doMe).map((_) => <String, dynamic>{}).shareValue();
  }

  List<MediaItem>? doMe;

  @override
  Future<List<MediaItem>> getChildren(String parentMediaId,
      [Map<String, dynamic>? extras]) async {
    await completer.future;
    final items = await _repository!.getChildren(parentMediaId);
    doMe = items;
    return items;
  }

  @override
  Future<MediaItem> getMediaItem(String mediaId) async {
    await completer.future;
    return (await _repository!.getAlbumFromId(mediaId)).toMediaItem();
  }

  @override
  Future<void> prepare() async {
    await completer.future;
    prepareFromMediaId(
        (await _repository!.getRecentlyPlayed()).take(1).toList()[0].id);
  }

  @override
  Future<void> prepareFromMediaId(String? mediaId,
      [Map<String, dynamic>? extras]) async {
    await completer.future;
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
      tracks = dbTracks.map((track) {
        return MediaHelpers.fromTrack(track, dbBook);
      }).toList();
      queue.add(tracks);
      _currentMediaItem = MediaHelpers.fromBook(dbBook);
      final chapters = await db.getChaptersForBook(dbBook.id);
      if (chapters.isNotEmpty) {
        chapterIndex = 0;
        queue.add([
          for (final chapter in chapters)
            Utils.chapterToItem(chapter).copyWith(
              album: _currentMediaItem!.album,
              artist: _currentMediaItem!.artist,
            )
        ]); //..sort((a, b) => a.start.compareTo(b.start)));
      }
    } else {
      await _repository!.getServerAndLibrary();
      final currentBook = (await _repository!.getAlbumFromId(mediaId));
      _currentMediaItem = currentBook.toMediaItem();
      tracks = [
        for (final track in (await _repository!.getTracksForBook(mediaId)))
          MediaHelpers.fromTrack(track, currentBook)
      ];
      if (_currentMediaItem?.chapters != null &&
          _currentMediaItem!.chapters.isNotEmpty) {
        chapterIndex = 0;
        queue.add([
          for (final chapter in _currentMediaItem!.chapters)
            Utils.chapterToItem(chapter).copyWith(
              album: _currentMediaItem!.album,
              artist: _currentMediaItem!.artist,
              artUri: _currentMediaItem!.artUri,
            )
        ]..sort((a, b) => a.start.compareTo(b.start)));
      } else {
        log('No chapters');
        queue.add(tracks);
      }
      _currentMediaItem = _currentMediaItem!.copyWith(duration: totalDuration);
    }

    final queuePosition = _findPositionForAlbum(_currentMediaItem!);
    final basePath = await Utils.getBasePath();
    try {
      await _player
          .setAudioSource(
        ConcatenatingAudioSource(
          children: tracks.map((item) {
            log(item.cachePath);
            if (item.cached &&
                basePath != null &&
                File(p.join(basePath.path, item.cachePath)).existsSync()) {
              log('Tis cached ${p.join(basePath.path, item.cachePath)}');
              // LockCachingAudioSource( uri)
              return AudioSource.uri(
                  Uri.parse('file://${p.join(basePath.path, item.cachePath)}'));
            }
            return AudioSource.uri(
                Uri.parse(_repository!.getServerUrl(item.partKey ?? item.id)));
          }).toList(),
        ),
        initialIndex: queuePosition.trackIndex,
        initialPosition: queuePosition.trackPosition,
      )
          .catchError((err) {
        log(err);
      });
      await setSpeed(db.getPreferencesSync().playbackSpeed);

      setCurrentMediaItem();
    } catch (e, stack) {
      log("Error code $e");
      log("Error stack $stack");
    }
  }

  bool preparedFromSearch = false;

  @override
  Future<void> prepareFromSearch(String query,
      [Map<String, dynamic>? extras]) async {
    playbackState.add(playbackState.value
        .copyWith(processingState: AudioProcessingState.loading));
    await completer.future;
    List<MediaItem> items = await _repository!.search(query);
    if (items.isNotEmpty) {
      await prepareFromMediaId(items[0].id);
    }
    preparedFromSearch = true;
    _broadcastState();
    return super.prepareFromSearch(query, extras);
  }

  @override
  Future<void> playFromSearch(String query,
      [Map<String, dynamic>? extras]) async {
    playbackState.add(playbackState.value
        .copyWith(processingState: AudioProcessingState.loading));
    await completer.future;
    if (preparedFromSearch) {
      preparedFromSearch = false;
      await play();
    } else {
      List<MediaItem> items = await _repository!.search(query);
      if (items.isNotEmpty) await playFromMediaId(items[0].id);
    }
    _broadcastState();
    return super.playFromSearch(query, extras);
  }

  @override
  Future<List<MediaItem>> search(String query,
      [Map<String, dynamic>? extras]) async {
    await completer.future;
    return await _repository!.search(query);
  }

  @override
  Future playFromMediaId(String? mediaId,
      [Map<String, dynamic>? extras]) async {
    print('Playing $mediaId');
    await completer.future;
    await prepareFromMediaId(mediaId, extras);
    _player.play();
    initTimer();
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
    return tracks.lastWhere((element) {
      return element.viewOffset != Duration.zero;
    }, orElse: () => tracks[0]);
  }

  _QueuePosition _findPostion(Duration positionToFind) {
    Duration trackStart = Duration.zero;
    final track = tracks.firstWhere((element) {
      trackStart += element.duration!;
      return trackStart > positionToFind;
    }, orElse: () => tracks[0]);
    trackStart -= track.duration!;
    Duration trackPosition = positionToFind - trackStart;
    return _QueuePosition(tracks.indexOf(track), trackPosition);
  }

  _QueuePosition _findPositionForAlbum(MediaItem album) {
    if (album.played) {
      return _QueuePosition(0, Duration.zero);
    }
    if (album.viewOffset != Duration.zero) {
      return _findPostion(album.viewOffset);
    } else {
      MediaItem item = findLatestTrack();
      return _QueuePosition(tracks.indexOf(item), item.viewOffset);
    }
  }

  Duration _findPostionDurationForAlbum(MediaItem album) {
    if (album.viewOffset != Duration.zero) {
      return album.viewOffset;
    } else {
      MediaItem item = findLatestTrack();
      final trackIndex = tracks.indexOf(item);
      Duration positionDuration = Duration.zero;
      for (final track in tracks.sublist(0, trackIndex + 1)) {
        positionDuration += track.duration ?? Duration.zero;
      }
      return positionDuration + item.viewOffset;
    }
  }
}

class _QueuePosition {
  Duration trackPosition;
  int trackIndex;
  _QueuePosition(this.trackIndex, this.trackPosition);
}
