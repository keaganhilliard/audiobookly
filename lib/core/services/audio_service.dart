import 'dart:async';
// import 'package:audiobookly/core/database/database.dart';
import 'package:audio_session/audio_session.dart';
import 'package:audiobookly/core/models/plex_media_item.dart';
import 'package:audiobookly/core/services/download_service.dart';
import 'package:audiobookly/core/services/plex_server_communicator.dart';
import 'package:audiobookly/core/services/server_communicator.dart';
import 'package:audiobookly/core/utils/utils.dart';
// import 'package:flutter/foundation.dart';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audiobookly/core/constants/media_controls.dart';
// import 'package:moor/isolate.dart';
// import 'package:moor/moor.dart';
import 'package:plex_api/plex_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audiobookly/core/constants/app_constants.dart';
import 'dart:io';
// import 'package:audiobookly/core/database/database.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class AudioPlayerTask extends BackgroundAudioTask {
  var _audioPlayer = AudioPlayer();
  AudioProcessingState _skipState;
  SharedPreferences _prefs;
  var _queue = List<PlexMediaItem>();
  String _currentMedia;
  // BookDatabase _db = BookDatabase();
  ServerCommunicator _communicator;
  DownloadService downloadService = DownloadService();
  StreamSubscription _eventSubscription;
  StreamSubscription _interruptionSub;
  StreamSubscription _noisySub;
  Directory storage;

  Future getSharedPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future initPlexApi() async {
    await getSharedPrefs();
    _communicator = PlexServerCommunicator();
    await _communicator.getServerAndLibrary();
  }

  void initPlaybackSpeed() {
    setPlaybackRate(_prefs.getDouble(SharedPrefStrings.PLAYBACK_SPEED) ?? 1.0);
  }

  bool _shouldStartPlayingAgain = false;

  @override
  Future onPrepare() async {
    print('Preparing!!');
  }

  @override
  Future onStart(Map<String, dynamic> params) async {
    _audioPlayer.currentIndexStream.listen((index) {
      if (index != null) {
        if (_queueIndex != -1) {
          updateProgress(mediaItem.duration.inMilliseconds,
              PlexPlaybackState.STOPPED, true);
        }
        _queueIndex = index;
        AudioServiceBackground.setMediaItem(mediaItem.copyWith(
          title: currentQueueItem.title,
          album: mediaItem.title,
          extras: <String, dynamic>{'currentTrack': currentQueueItem.id},
        ));
        initPlaybackSpeed();
        if (_audioPlayer.playing) {
          updateProgress(
              mediaItem.duration.inMilliseconds, PlexPlaybackState.PLAYING);
        }
      }
    });

    _audioPlayer.processingStateStream.listen((state) {
      switch (state) {
        case ProcessingState.completed:
          // In this example, the service stops when reaching the end.
          onStop();
          break;
        case ProcessingState.ready:
          // If we just came from skipping between tracks, clear the skip
          // state now that we're ready to play.
          _skipState = null;
          break;
        default:
          break;
      }
    });

    if (!kIsWeb) {
      final session = await AudioSession.instance;
      await session.configure(AudioSessionConfiguration.speech());

      _interruptionSub = session.interruptionEventStream.listen((event) {
        if (event.begin) {
          switch (event.type) {
            case AudioInterruptionType.duck:
            case AudioInterruptionType.pause:
            case AudioInterruptionType.unknown:
              if (_audioPlayer.playing) {
                onPause();
                _shouldStartPlayingAgain = true;
              }
              break;
          }
        } else {
          switch (event.type) {
            case AudioInterruptionType.duck:
            case AudioInterruptionType.pause:
              if (_shouldStartPlayingAgain) {
                onPlay();
                _shouldStartPlayingAgain = false;
              }
              break;
            case AudioInterruptionType.unknown:
              // The interruption ended but we should not resume.
              break;
          }
        }
      });

      _noisySub = session.becomingNoisyEventStream.listen((event) {
        onPause();
      });
    }

    _eventSubscription = _audioPlayer.playbackEventStream.listen((event) {
      _broadcastState();
    });

    if (kIsWeb) {
    } else if (Platform.isIOS)
      storage = await getApplicationDocumentsDirectory();
    else
      storage = await getExternalStorageDirectory();
    await initPlexApi();

    print('HERE WE ARE');
    print(params);

    // initDB();

    if (params['item'] != null) {
      //handle queueing
      final play = params['play'] ?? false;
      final itemId = params['item'];
      print('Should${play ? '' : ' not'} play: $itemId');
      if (play)
        await onPlayFromMediaId(itemId);
      else
        await onPrepareFromMediaId(itemId);
    }
    initPlaybackSpeed();

    print('started!');
  }

  Future initDB() async {
    // MoorIsolate i = await getMoorIsolate();
    // DatabaseConnection dbConn = await i.connect();
    // BookDatabase books = BookDatabase.connect(dbConn);
    // print(books.allTables);
    // print(books.allAuthors);
  }

  int _queueIndex = -1;
  bool get hasNext => _queueIndex + 1 < _queue.length;
  bool get hasPrevious => _queueIndex > 0;
  MediaItem _mediaItem;
  MediaItem get mediaItem => _mediaItem;
  MediaItem get currentQueueItem => _queue[_queueIndex];
  int get totalDuration =>
      _queue.fold(0, (total, item) => total + item.duration.inMilliseconds);
  int get currentPosition =>
      _queue.getRange(0, _queueIndex > 0 ? _queueIndex : 0).fold<int>(
              0, (total, item) => total + item.duration.inMilliseconds) +
          _audioPlayer.position?.inMilliseconds ??
      0;
  Duration get currentPositionDuration =>
      Duration(milliseconds: currentPosition);

  void updateProgress(int position, PlexPlaybackState state,
      [bool finished = false]) async {
    // _communicator.savePosition(_currentMedia, currentPosition,
    //     totalDuration * (finished ? 1 : 2), state);
    _communicator.savePosition(currentQueueItem.id, position,
        currentQueueItem.duration.inMilliseconds * (finished ? 1 : 2), state);
  }

  @override
  Future<void> onSkipToNext() => onFastForward();

  @override
  Future<void> onSkipToPrevious() => onRewind();

  Future<void> playFromQueueIndex(
      [int trackPosition, bool startPlaying]) async {
    if (trackPosition != null) {
      await _audioPlayer.seek(Duration(milliseconds: trackPosition),
          index: _queueIndex);
    } else
      await _audioPlayer.seek(Duration.zero, index: _queueIndex);
  }

  String getMediaItemFilePath(MediaItem item) {
    return Utils.cleanPath(p.join(storage.absolute.path, 'cache', item.artist,
        item.album, item.extras['fileName']));
  }

  String getMediaItemPath(MediaItem item) {
    return Utils.cleanPath(
        p.join(storage.absolute.path, 'cache', item.artist, item.album));
  }

  @override
  Future onFastForward() async {
    await onSeekTo(Duration(milliseconds: currentPosition + (30 * 1000)));
  }

  @override
  Future onRewind() async {
    await onSeekTo(Duration(milliseconds: currentPosition - (30 * 1000)));
  }

  @override
  Future onSeekTo(Duration position, [bool startPlaying = false]) async {
    // int index = _queueIndex;
    int newPosition = setQueueIndexFromPosition(position.inMilliseconds);
    await _audioPlayer.seek(Duration(milliseconds: newPosition),
        index: _queueIndex);
    if (startPlaying) _audioPlayer.play();
  }

  int setQueueIndexFromPosition(int position) {
    int trackPosition = 0;
    int currentPosition = position ?? 0;
    PlexMediaItem item = _queue.firstWhere((track) {
      if (currentPosition - track.duration.inMilliseconds <= 0) {
        trackPosition = currentPosition;
        return true;
      } else if (currentPosition != 0) {
        currentPosition -= track.duration.inMilliseconds;
      }
      return false;
    });
    _queueIndex = _queue.indexOf(item);
    return trackPosition;
  }

  @override
  Future onSkipToQueueItem(String mediaId) async {
    _queueIndex = _queue.indexWhere((element) => element.id == mediaId);
    // _audioPlayer.playing = true;
    _audioPlayer.seek(Duration.zero, index: _queueIndex);
  }

  @override
  Future onAddQueueItem(MediaItem mediaItem) async {
    _queue.add(mediaItem);
    AudioServiceBackground.setQueue(_queue);
  }

  @override
  Future onSetSpeed(double speed) async {
    setPlaybackRate(speed);
  }

  @override
  Future onCustomAction(String name, arguments) {
    switch (name) {
      case 'downloaded':
        handleTrackDownloaded(arguments);
        break;
      case 'setPlaybackRate':
        setPlaybackRate(arguments);
        break;
    }
    return null;
  }

  Future handleTrackDownloaded(String mediaId) async {}

  void setPlaybackRate(double rate) {
    _prefs.setDouble(SharedPrefStrings.PLAYBACK_SPEED, rate);
    _audioPlayer.setSpeed(rate);
  }

  // @override
  // Future onAudioBecomingNoisy() async {
  //   if (_audioPlayer.playing) {
  //     await onPause();
  //   }
  // }

  @override
  Future onClick(button) async {
    return playPause();
  }

  Future playPause() async {
    if (_audioPlayer.playing)
      return onPause();
    else
      return onPlay();
  }

  @override
  Future onPause() async {
    if (_skipState == null) {
      await _audioPlayer.pause();
      updateProgress(_audioPlayer.position.inMilliseconds - 2000,
          PlexPlaybackState.PAUSED);
      onSeekTo(Duration(milliseconds: currentPosition - 2000));
    }
  }

  @override
  Future<void> onStop() async {
    print('Something bad happened');
    await _audioPlayer.pause();
    await _audioPlayer.dispose();
    print('disposed');
    // _currentMedia = null;
    // await _playerStateSubscription.cancel();
    await _eventSubscription.cancel();
    await _noisySub?.cancel();
    await _interruptionSub?.cancel();
    await _broadcastState();
    // await _setState(processingState: AudioProcessingState.stopped);
    // _refreshServer.cancel();
    // _completer.complete();
    print('Awaiting super!');
    await super.onStop();
    print('Done');
  }

  @override
  Future<void> onPlay() async {
    if (_skipState == null && mediaItem != null) {
      _audioPlayer.play();
      updateProgress(
          _audioPlayer.position.inMilliseconds, PlexPlaybackState.PLAYING);
    }
  }

  static const String AUTHORS_ID = '@authors';
  static const String BOOKS_ID = '@books';
  static const String COLLECTIONS_ID = '@collections';
  static const String RECENTLY_PLAYED = '@recentlyPlayed';
  static const String RECENTLY_ADDED = '@recentlyAdded';

  @override
  Future<List<MediaItem>> onLoadChildren(String parentMediaId) async {
    print(parentMediaId);
    return await _communicator.getChildren(parentMediaId);
  }

  @override
  Future onPrepareFromMediaId(String mediaId) async {
    await onPlayFromMediaId(mediaId);
    await onPause();
  }

  @override
  Future onPlayFromMediaId(String mediaId) async {
    print('ONPLAY');
    if (_currentMedia == mediaId) {
      return;
    }
    if (_audioPlayer.playing ?? false) {
      updateProgress(
          _audioPlayer.position.inMilliseconds, PlexPlaybackState.STOPPED);
      _audioPlayer.stop();
    }
    _currentMedia = mediaId;
    if (_communicator == null)
      await initPlexApi();
    else
      await _communicator.getServerAndLibrary();
    _queue = await _communicator.getTracksForBook(mediaId);
    _mediaItem = (await _communicator.getAlbumFromId(mediaId))
        .copyWith(duration: Duration(milliseconds: totalDuration));
    await AudioServiceBackground.setQueue(_queue);
    await _audioPlayer.load(ConcatenatingAudioSource(
        children: _queue
            .map((item) => AudioSource.uri(
                Uri.parse(_communicator.getServerUrl(item.partKey))))
            .toList()));
    // await AudioServiceBackground.setMediaItem(mediaItem);
    final latestTrackPosition = findLatestTrackPosition();
    await onSeekTo(
        latestTrackPosition == Duration.zero
            ? _mediaItem.viewOffset
            : latestTrackPosition,
        true);
  }

  Duration findLatestTrackPosition() {
    final item = _queue.lastWhere((element) {
      return element.viewOffset != Duration.zero;
    });

    if (item != null) {
      int positionInMilliseconds = 0;

      _queue.firstWhere((element) {
        positionInMilliseconds += element.duration.inMilliseconds;
        return element.id == item.id;
      });

      positionInMilliseconds -= item.duration.inMilliseconds;
      positionInMilliseconds += item.viewOffset.inMilliseconds;
      return Duration(milliseconds: positionInMilliseconds);
    }
    return Duration.zero;
  }

  Future<void> _broadcastState() async {
    print('Brodcasting State: ${_audioPlayer.playing}');
    await AudioServiceBackground.setState(
      controls: [
        Controls.rewindControl,
        if (_audioPlayer.playing)
          Controls.pauseControl
        else
          Controls.playControl,
        Controls.fastForwardControl,
        Controls.stopControl,
      ],
      systemActions: [
        MediaAction.seekTo,
        MediaAction.playPause,
        MediaAction.fastForward,
        MediaAction.skipToNext,
        MediaAction.skipToPrevious,
        MediaAction.rewind,
      ],
      processingState: _getProcessingState(),
      playing: _audioPlayer.playing,
      position: currentPositionDuration,
      bufferedPosition: _audioPlayer.bufferedPosition,
      speed: _audioPlayer.speed,
    );
  }

  AudioProcessingState _getProcessingState() {
    if (_skipState != null) return _skipState;
    switch (_audioPlayer.processingState) {
      case ProcessingState.none:
        return AudioProcessingState.stopped;
      case ProcessingState.loading:
        return AudioProcessingState.connecting;
      case ProcessingState.buffering:
        return AudioProcessingState.buffering;
      case ProcessingState.ready:
        return AudioProcessingState.ready;
      case ProcessingState.completed:
        return AudioProcessingState.completed;
      default:
        throw Exception("Invalid state: ${_audioPlayer.processingState}");
    }
  }
}

Future startAudioService({String itemId, bool play}) async {
  return await AudioService.start(
    params: {'item': itemId, 'play': play},
    backgroundTaskEntrypoint: _audioPlayerTaskEntrypoint,
    androidNotificationChannelName: 'Audiobookly',
    // notificationColor: Colors.deepPurple.value,
    androidNotificationIcon: 'mipmap/audiobookly_launcher',
    // androidStopForegroundOnPause: true,
    androidEnableQueue: true,
    androidNotificationOngoing: false,
  );
}

Future _audioPlayerTaskEntrypoint() async {
  return await AudioServiceBackground.run(() => AudioPlayerTask());
}
