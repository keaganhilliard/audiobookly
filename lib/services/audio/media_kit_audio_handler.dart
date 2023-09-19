import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:audio_session/audio_session.dart';
import 'package:audiobookly/models/model_union.dart';
import 'package:audiobookly/services/audio/ab_state_player.dart';
import 'package:audiobookly/services/audio/audio_player_impl.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:audiobookly/singletons.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/providers.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:path/path.dart' as p;
import 'package:media_kit/media_kit.dart';

class AudiobooklyAudioHandler extends BaseAudioHandler {
  final _player = AudioPlayer();
  final completer = Completer();

  AudiobooklyAudioHandler() {
    _init();
  }

  int? chapterIndex;

  int index = 0;
  String? _currentMedia;
  MediaItem? _currentMediaItem;
  List<MediaItem> tracks = [];
  final ProviderContainer container = ProviderContainer();

  MediaRepository? get _repository => container.read(mediaRepositoryProvider);

  MediaItem? get currentQueueItem {
    if (chapterIndex != null &&
        chapterIndex! >= 0 &&
        chapterIndex! < queue.value.length) {
      return queue.value[chapterIndex!];
    } else if (index >= 0 && index < tracks.length) {
      return tracks[index];
    }
    return null;
  }

  Duration currentPlayerPosition = Duration.zero;
  Duration currentPlayerBufferedPosition = Duration.zero;

  Duration get totalDuration => tracks.fold(
        Duration.zero,
        (total, item) => total + item.duration!,
      );
  Duration get currentTrackStartingPosition => tracks.getRange(0, index).fold(
        Duration.zero,
        (total, item) => (total) + (item.duration ?? Duration.zero),
      );
  Duration get currentPosition =>
      currentTrackStartingPosition + currentPlayerPosition;
  Duration get currentBufferedPosition =>
      currentTrackStartingPosition + currentPlayerBufferedPosition;

  Duration get currentQueueStartingPosition =>
      queue.value.getRange(0, chapterIndex ?? 0).fold(
            Duration.zero,
            (total, item) => (total) + (item.duration ?? Duration.zero),
          );

  StreamSubscription? _positionSub;

  _handleTimer() async {
    if (!timering) return;
    try {
      await _repository?.playbackCheckin(
        _currentMedia!,
        currentPosition,
        totalDuration,
        _player.state.rate,
        AudiobooklyEvent.timeUpdate,
        _player.state.playing,
      );
    } catch (e) {
      log('$e');
    }
    // if (_player.playerState.processingState == ProcessingState.idle ||
    //     !await _player.stream.playing.last) {
    //   await updateProgress(AudiobooklyPlaybackState.stopped);
    //   timering = false;
    // } else {
    //   await Future.delayed(const Duration(seconds: 10), _handleTimer);
    // }
  }

  final maxCheckinsForPause = 5;

  bool timering = false;
  _startTimer() {
    if (timering) return;
    timering = true;
    if (_currentMedia != null) {
      Future.delayed(const Duration(seconds: 10), _handleTimer);
    }
    _positionSub ??= _player.stream.position.listen((position) {
      if ((currentQueueItem?.extras?.containsKey('start') ?? false) &&
          (currentQueueItem?.extras?.containsKey('end') ?? false)) {
        try {
          int newIndex = queue.value.indexWhere((item) =>
              item.start <= currentPosition && item.end > currentPosition);
          if (newIndex != chapterIndex) {
            chapterIndex = newIndex;
            setCurrentMediaItem();
          }
        } catch (e) {
          log('$e');
        }
      }
    });
  }

  Future updateProgress(AudiobooklyPlaybackState state) async {
    _startTimer();
    try {
      if (state == AudiobooklyPlaybackState.stopped) {
        timering = false;
        if (_currentMedia != null) {
          await _repository!.playbackCheckin(
            _currentMedia!,
            currentPosition,
            totalDuration,
            _player.state.rate,
            AudiobooklyEvent.pause,
            _player.state.playing,
          );
          await _repository!.playbackFinished(_currentMedia!);
        }
      } else {
        final playing = _player.state.playing;
        await _repository!.playbackCheckin(
          _currentMedia!,
          currentPosition,
          totalDuration,
          _player.state.rate,
          playing ? AudiobooklyEvent.unpause : AudiobooklyEvent.pause,
          playing,
        );
      }
    } catch (e) {
      log('Checkin error: $e');
    }
  }

  Future<void> _init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    _player.playerStateStream.listen((state) async {
      _broadcastState();
      // playbackState.add(await _transformEvent());
    });

    _player.currentIndexChangedStream.listen((index) async {
      this.index = index;
      _broadcastState();
    });

    _player.positionStream.listen((pos) async {
      print('new position $pos');
      _broadcastState();
      // playbackState.add(await _transformEvent());
    });
    _player.bufferedPositionStream.listen((pos) async {
      _broadcastState();
      // playbackState.add(await _transformEvent());
    });

    //  .currentIndexStream.listen((currentIndex) async {
    //   if (index != null) {
    //     if (await _player.stream.playing.last) {
    //       await updateProgress(AudiobooklyPlaybackState.playing);
    //     }
    //     setCurrentMediaItem();
    //   }
    // });

    // _player.playbackEventStream.listen(_broadcastState);

    // // Special processing for state transitions.
    // _player.processingStateStream.listen((state) {
    //   if (state == ProcessingState.completed) {
    //     stop();
    //   }
    // });

    await _repository?.getServerAndLibrary();
    if (_currentMedia != null) {
      playFromMediaId(_currentMedia);
    }
    completer.complete();
  }

  Future<void> setPlaybackRate(double speed) async {
    DatabaseService db = GetIt.I();
    await db.insertPreferences(
      db.getPreferencesSync().copyWith(playbackSpeed: speed),
    );
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

  @override
  Future customAction(String name, [Map<String, dynamic>? extras]) async {
    await completer.future;
    if (await queue.isEmpty) return;
    switch (name) {
      case 'skip'
          when (chapterIndex ?? queue.value.length) < queue.value.length:
        await skipToQueueItem(chapterIndex! + 1);
      case 'skip':
        await _player.next();
      case 'previous' when (chapterIndex ?? 0) > 0:
        await skipToQueueItem(chapterIndex! - 1);
      case 'previous':
        await _player.previous();
      case String():
        log(name);
    }
  }

  @override
  Future<void> setSpeed(double speed) async {
    await completer.future;
    await setPlaybackRate(speed);
  }

  /// Broadcasts the current state to all clients.
  _broadcastState() async {
    currentPlayerPosition = await _player.position ?? Duration.zero;
    playbackState.add(playbackState.value.copyWith(
      controls: [
        MediaControl.rewind,
        if (_player.state.playing) MediaControl.pause else MediaControl.play,
        MediaControl.fastForward,
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
      processingState: AudioProcessingState.ready,
      playing: _player.state.playing,
      updatePosition: currentPosition,
      bufferedPosition: currentBufferedPosition,
      speed: _player.state.rate,
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
      final item = await _repository!.getAlbumFromId(_currentMedia).timeout(
            const Duration(milliseconds: 500),
          );
      final position = _findPostionDurationForAlbum(item.toMediaItem());
      if (position > currentPosition && !item.read) {
        await seek(position, true);
      }
    } catch (e) {
      log(e.toString());
    }

    // _player.play();
    await updateProgress(AudiobooklyPlaybackState.playing);
  }

  @override
  Future<void> pause() async {
    await completer.future;
    await _player.pause();
    await seek(currentPlayerPosition - const Duration(seconds: 2));
    await super.pause();
    await updateProgress(AudiobooklyPlaybackState.paused);
  }

  @override
  Future<void> skipToNext() => fastForward(AudioService.config.rewindInterval);

  @override
  Future<void> skipToPrevious() => rewind(AudioService.config.rewindInterval);

  @override
  Future<void> stop() async {
    await completer.future;
    if (_player.state.playing) {
      await updateProgress(AudiobooklyPlaybackState.stopped);
    }
    await _player.stop();
    _currentMedia = null;
    _currentMediaItem = null;
    tracks = [];
    chapterIndex = null;
    mediaItem.add(null);
    timering = false;
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
    print('Seeking to $queuePosition, currentIndex: $index');
    if (index != queuePosition.trackIndex) {
      await _player.jumpTo(queuePosition.trackIndex);
      await Future.delayed(const Duration(milliseconds: 250));
    }
    await _player.seek(queuePosition.trackPosition);
    print('new currentIndex: $index');
    if (startPlaying) _player.resume();
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
      await _player.jumpTo(index);
    }
  }

  Map<String, ValueStream<Map<String, dynamic>>> streams = {};

  @override
  ValueStream<Map<String, dynamic>> subscribeToChildren(String parentMediaId) {
    return Stream.value(doMe).map((_) => <String, dynamic>{}).shareValue();
  }

  List<MediaItem>? doMe;

  @override
  Future<List<MediaItem>> getChildren(
    String parentMediaId, [
    Map<String, dynamic>? options,
  ]) async {
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
    prepareFromMediaId((await _repository!.getRecentlyPlayed()).first.id);
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
    if (_player.state.playing) {
      updateProgress(AudiobooklyPlaybackState.stopped);
      await _player.stop();
    }

    if (dbBook != null && dbTracks.isNotEmpty) {
      tracks = dbTracks.map((track) {
        return MediaHelpers.fromTrack(track, dbBook);
      }).toList();
      _currentMediaItem = MediaHelpers.fromBook(dbBook);
      final chapters = await db.getChaptersForBook(dbBook.id);
      if (chapters.isNotEmpty) {
        chapterIndex = 0;
        queue.add([
          for (final chapter in chapters)
            Utils.chapterToItem(chapter).copyWith(
              album: _currentMediaItem!.album,
              artist: _currentMediaItem!.artist,
              artUri: _currentMediaItem!.artUri,
            )
        ]..sort((a, b) => a.start.compareTo(b.start))); //;
      } else {
        queue.add(tracks);
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
    print(
        'we are tryna play ${queuePosition.trackIndex}:${queuePosition.trackPosition}');
    try {
      await _player.openPlaylist(
        tracks.map((item) {
          if (item.cached &&
              File(p.join(basePath.path, item.cachePath)).existsSync()) {
            log('Tis cached ${p.join(basePath.path, item.cachePath)}');
            // LockCachingAudioSource( uri)
            return 'file://${p.join(basePath.path, item.cachePath)}';
          }
          return _repository!.getDownloadUrl(item.serverPath);
        }).toList(),
        initialIndex: queuePosition.trackIndex,
        autoPlay: true,
      );
      print("OPENED");
      await _player.seek(queuePosition.trackPosition);
      await setSpeed(db.getPreferencesSync().playbackSpeed);

      setCurrentMediaItem();
    } catch (e, stack) {
      print("ERROR");
      log("Error code $e");
      log("Error stack $stack");
    }
  }

  bool preparedFromSearch = false;

  @override
  Future<void> prepareFromSearch(
    String query, [
    Map<String, dynamic>? extras,
  ]) async {
    playbackState.add(playbackState.value
        .copyWith(processingState: AudioProcessingState.loading));
    await completer.future;
    List<MediaItem> items = [
      for (final union in await _repository!.search(query)) union.toMediaItem()
    ];
    if (items.isNotEmpty) {
      await prepareFromMediaId(items[0].id);
    }
    preparedFromSearch = true;
    _broadcastState();
    return super.prepareFromSearch(query, extras);
  }

  @override
  Future<void> playFromSearch(
    String query, [
    Map<String, dynamic>? extras,
  ]) async {
    playbackState.add(playbackState.value
        .copyWith(processingState: AudioProcessingState.loading));
    await completer.future;
    if (preparedFromSearch) {
      preparedFromSearch = false;
      await play();
    } else {
      List<MediaItem> items = [
        for (final union in await _repository!.search(query))
          union.toMediaItem()
      ];
      if (items.isNotEmpty) await playFromMediaId(items[0].id);
    }
    _broadcastState();
    return super.playFromSearch(query, extras);
  }

  @override
  Future<List<MediaItem>> search(
    String query, [
    Map<String, dynamic>? extras,
  ]) async {
    await completer.future;
    return [
      for (final union in await _repository!.search(query)) union.toMediaItem()
    ];
  }

  @override
  Future playFromMediaId(
    String? mediaId, [
    Map<String, dynamic>? extras,
  ]) async {
    await completer.future;
    await prepareFromMediaId(mediaId, extras);
    _player.resume();
    _startTimer();
    await _repository!.playbackStarted(
      mediaId!,
      currentPosition,
      totalDuration,
      _player.state.rate,
    );
    await updateProgress(AudiobooklyPlaybackState.playing);
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
  @override
  String toString() =>
      'QueuePosition(index: $trackIndex, position: $trackPosition)';
}
