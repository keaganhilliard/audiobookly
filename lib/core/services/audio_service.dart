import 'dart:async';
import 'package:audiobookly/core/models/audiobookly_media_item.dart';
import 'package:audiobookly/core/models/plex_media_item.dart';
import 'package:audiobookly/core/services/download_service.dart';
import 'package:audiobookly/core/services/plex_server_communicator.dart';
import 'package:audiobookly/core/services/server_communicator.dart';
import 'package:flutter/foundation.dart';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audiobookly/core/constants/media_controls.dart';
import 'package:plex_api/plex_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info/device_info.dart';
import 'package:audiobookly/core/constants/app_constants.dart';
import 'dart:io';
import 'package:audiobookly/core/database/database.dart';

class AudioPlayerTask extends BackgroundAudioTask {
  var _completer = Completer();
  var _audioPlayer = AudioPlayer();
  PlexServerV2 _server;
  String _libraryKey;
  PlexApi _api;
  BasicPlaybackState _skipState;
  SharedPreferences _prefs;
  bool _playing;
  var _queue = List<PlexMediaItem>();
  Timer _updater;
  String _currentMedia;
  BookDatabase _db = BookDatabase();
  Timer _refreshServer;
  DownloadService downloadService = DownloadService();

  BasicPlaybackState _stateToBasicState(AudioPlaybackState state) {
    switch (state) {
      case AudioPlaybackState.none:
        return BasicPlaybackState.none;
      case AudioPlaybackState.stopped:
        return BasicPlaybackState.stopped;
      case AudioPlaybackState.paused:
        return BasicPlaybackState.paused;
      case AudioPlaybackState.playing:
        return BasicPlaybackState.playing;
      case AudioPlaybackState.buffering:
        return BasicPlaybackState.buffering;
      case AudioPlaybackState.connecting:
        return _skipState ?? BasicPlaybackState.connecting;
      case AudioPlaybackState.completed:
        return BasicPlaybackState.stopped;
      default:
        throw Exception("Illegal state");
    }
  }

  Future getSharedPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<PlexHeaders> getHeaders() async {
    if (_prefs == null) await getSharedPrefs();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      return PlexHeaders(
        clientIdentifier: androidDeviceInfo.androidId,
        device: androidDeviceInfo.model,
        product: 'Audiobookly',
        platform: 'Android',
        platformVersion: androidDeviceInfo.version.release,
      );
    } else
      return PlexHeaders(
        clientIdentifier: 'TODO',
        device: 'Probably iPhone',
        product: 'Audiobookly',
        platform: 'iPhone',
        platformVersion: '',
      );
  }

  Future initPlexApi() async {
    await getSharedPrefs();
    String authToken = _prefs.getString(SharedPrefStrings.PLEX_TOKEN);
    String serverId = _prefs.getString(SharedPrefStrings.PLEX_SERVER);
    _libraryKey = _prefs.getString(SharedPrefStrings.PLEX_LIBRARY);
    PlexHeaders headers = await getHeaders();

    if (authToken == null || serverId == null || _libraryKey == null) return;

    headers.token = authToken;
    _api = PlexApi(headers: headers);
    List<PlexServerV2> servers = await _api.getServersV2();
    PlexServerV2 server = servers.firstWhere(
        (server) => server.clientIdentifier == serverId,
        orElse: () => null);
    _server = server;
    _refreshServer = Timer.periodic(Duration(minutes: 1), (timer) async {
      PlexServerV2 server = (await _api.getServersV2()).firstWhere(
          (server) => _server.clientIdentifier == serverId,
          orElse: () => null);
      if (server != null) _server = server;
    });
  }

  void initPlaybackSpeed() {
    setPlaybackRate(_prefs.getDouble(SharedPrefStrings.PLAYBACK_SPEED) ?? 1.0);
  }

  bool _shouldStartPlayingAgain = false;

  @override
  void onAudioFocusLostTransient() {
    if (_playing) {
      _audioPlayer.pause();
      _shouldStartPlayingAgain = true;
      _playing = false;
    }
  }

  @override
  void onAudioFocusLost() {
    if (_playing) {
      _audioPlayer.pause();
      _playing = false;
    }
  }

  @override
  void onAudioFocusGained() {
    if (mediaItem != null && _shouldStartPlayingAgain) {
      _audioPlayer.play();
      _playing = true;
      _shouldStartPlayingAgain = false;
    }
  }

  @override
  void onAudioFocusLostTransientCanDuck() {
    if (_playing) {
      _audioPlayer.pause();
      _playing = false;
      _shouldStartPlayingAgain = true;
    }
  }

  @override
  void onPrepare() {
    print('Preparing!!');
  }

  @override
  Future onStart() async {
    var playerStateSubscription = _audioPlayer.playbackStateStream
        .where((state) => state == AudioPlaybackState.completed)
        .listen((state) {
      _handlePlaybackCompleted();
    });
    var eventSubscription = _audioPlayer.playbackEventStream.listen((event) {
      final state = _stateToBasicState(event.state);
      if (state != BasicPlaybackState.stopped) {
        _setState(
            state: state,
            position: event.position.inMilliseconds,
            speed: event.speed ?? 1.0);
      }
      switch (state) {
        // case BasicPlaybackState.playing:
        //   updateProgress(
        //       event.position.inMilliseconds, PlexPlaybackState.PLAYING);
        //   break;
        case BasicPlaybackState.paused:
          updateProgress(
              event.position.inMilliseconds, PlexPlaybackState.PAUSED);
          break;
        case BasicPlaybackState.stopped:
          updateProgress(
              event.position.inMilliseconds, PlexPlaybackState.STOPPED);
          break;
        // case BasicPlaybackState.buffering:
        //   updateProgress(
        //       event.position.inMilliseconds, PlexPlaybackState.BUFFERING);
        //   break;
        default:
          break;
      }
    });

    await initPlexApi();
    initPlaybackSpeed();

    await _completer.future;
    playerStateSubscription.cancel();
    eventSubscription.cancel();
    _updater.toString();
  }

  int _queueIndex = -1;
  bool get hasNext => _queueIndex + 1 < _queue.length;
  bool get hasPrevious => _queueIndex > 0;
  AudiobooklyMediaItem _mediaItem;
  AudiobooklyMediaItem get mediaItem => _mediaItem;
  AudiobooklyMediaItem get currentQueueItem => _queue[_queueIndex];
  int get totalDuration =>
      _queue.fold(0, (total, item) => total + item.duration);
  int get currentPosition =>
      _queue
              .getRange(0, _queueIndex > 0 ? _queueIndex : 0)
              .fold(0, (total, item) => (total as int) + item.duration) +
          _audioPlayer.playbackEvent?.position?.inMilliseconds ??
      0;

  void _handlePlaybackCompleted() async {
    updateProgress(mediaItem.duration, PlexPlaybackState.STOPPED, true);
    if (hasNext) {
      _skip(1);
    } else {
      onStop();
    }
  }

  void updateProgress(int position, PlexPlaybackState state,
      [bool finished = false]) async {
    ServerCommunicator communicator =
        PlexServerCommunicator(server: _server, libraryKey: _libraryKey);
    communicator.savePosition(_currentMedia, currentPosition, totalDuration * 2,
        PlexPlaybackState.STOPPED);
    // communicator.savePosition(
    //     mediaItem.key, position, mediaItem.duration, state);
  }

  @override
  Future<void> onSkipToNext() => onFastForward();

  @override
  Future<void> onSkipToPrevious() => onRewind();

  Future<void> playFromQueueIndex(
      [int trackPosition, bool startPlaying]) async {
    if (_playing == null) {
      // First time, we want to start playing
      _playing = true;
    } else if (_playing) {
      // Stop current item
      await _audioPlayer.stop();
    }
    AudioServiceBackground.setMediaItem(mediaItem);
    if (trackPosition != null) {
      await _audioPlayer.seek(Duration(milliseconds: trackPosition));
    }
  }

  Future<void> _skip(
      [int offset = 0, int trackPosition, bool startPlaying = false]) async {
    final newPos = _queueIndex + offset;
    if (!(newPos >= 0 && newPos < _queue.length)) return;
    if (_playing == null) {
      // First time, we want to start playing
      _playing = true;
    } else if (_playing) {
      // Stop current item
      await _audioPlayer.stop();
    }
    // Load next item
    _queueIndex = newPos;
    AudioServiceBackground.setMediaItem(mediaItem);
    var currentQueueItem = _queue[_queueIndex];
    _skipState = offset > 0
        ? BasicPlaybackState.skippingToNext
        : BasicPlaybackState.skippingToPrevious;
    print(currentQueueItem.id);
    await _audioPlayer.setUrl(currentQueueItem.id);
    if (trackPosition != null)
      await _audioPlayer.seek(Duration(milliseconds: trackPosition));
    _skipState = null;
    // Resume playback if we were playing or if we want to start playing
    if (_playing || startPlaying) {
      await onPlay();
    } else {
      _setState(state: BasicPlaybackState.paused);
    }
  }

  @override
  Future onFastForward() async {
    await onSeekTo(currentPosition + (30 * 1000));
  }

  @override
  Future onRewind() async {
    await onSeekTo(currentPosition - (30 * 1000));
  }

  @override
  Future onSeekTo(int position, [bool startPlaying]) async {
    int index = _queueIndex;
    int newPosition = setQueueIndexFromPosition(position);
    if (index != _queueIndex ||
        _audioPlayer.playbackState == AudioPlaybackState.none ||
        _audioPlayer.playbackState == AudioPlaybackState.connecting)
      await _skip(0, newPosition, startPlaying ?? false);
    else
      await _audioPlayer.seek(Duration(milliseconds: newPosition));
  }

  int setQueueIndexFromPosition(int position) {
    int trackPosition = 0;
    int currentPosition = position ?? 0;
    PlexMediaItem item = _queue.firstWhere((track) {
      if (currentPosition - track.duration <= 0) {
        trackPosition = currentPosition;
        return true;
      } else if (currentPosition != 0) {
        currentPosition -= track.duration;
      }
      return false;
    });
    _queueIndex = _queue.indexOf(item);
    return trackPosition;
  }

  @override
  void onSkipToQueueItem(String mediaId) {
    _queueIndex = _queue.indexWhere((element) => element.id == mediaId);
    _playing = true;
    _skip(0, null, true);
  }

  @override
  void onAddQueueItem(MediaItem mediaItem) {
    _queue.add(mediaItem);
  }

  @override
  void onCustomAction(String name, arguments) {
    switch (name) {
      case 'downloaded':
        handleTrackDownloaded(arguments);
        break;
      case 'setPlaybackRate':
        setPlaybackRate(arguments);
        break;
    }
  }

  Future handleTrackDownloaded(String mediaId) async {}

  void setPlaybackRate(double rate) {
    _prefs.setDouble(SharedPrefStrings.PLAYBACK_SPEED, rate);
    _audioPlayer.setSpeed(rate);
  }

  @override
  void onAudioBecomingNoisy() {}

  @override
  void onClick(button) {
    playPause();
  }

  void playPause() {
    if (_playing)
      onPause();
    else
      onPlay();
  }

  @override
  void onPause() {
    if (_skipState == null) {
      _playing = false;
      _audioPlayer.pause();
    }
  }

  @override
  Future onStop() async {
    _audioPlayer.stop();
    _setState(state: BasicPlaybackState.stopped);
    _refreshServer.cancel();
    _completer.complete();
  }

  @override
  Future<void> onPlay() async {
    if (_skipState == null && mediaItem != null) {
      _playing = true;
      _audioPlayer.play();
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
    ServerCommunicator communicator =
        PlexServerCommunicator(server: _server, libraryKey: _libraryKey);
    return await communicator.getChildren(parentMediaId);
  }

  @override
  void onPrepareFromMediaId(String mediaId) {
    print('Preparing $mediaId...');
  }

  @override
  Future onPlayFromMediaId(String mediaId) async {
    if (_currentMedia == mediaId) {
      return;
    }
    if (_playing ?? false) {
      updateProgress(_audioPlayer.playbackEvent.position.inMilliseconds,
          PlexPlaybackState.STOPPED);
      _audioPlayer.stop();
    }
    _currentMedia = mediaId;
    PlexAlbum album = await _server.getAlbumFromKey(mediaId);
    _queue = (await _server.getTracks(mediaId))
        .map((track) => PlexMediaItem.fromPlexTrack(track, _server))
        .toList();
    _mediaItem = PlexMediaItem.fromPlexAlbum(album, _server, totalDuration);
    await AudioServiceBackground.setQueue(_queue);
    await AudioServiceBackground.setMediaItem(mediaItem);
    await onSeekTo(album.viewOffset ?? 0, true);
  }

  void _setState(
      {@required BasicPlaybackState state, int position, double speed}) {
    print('Current position: $currentPosition');
    print('Current media item duration: $totalDuration');
    if (position == null) {
      position =
          currentPosition ?? _audioPlayer.playbackEvent.position.inMilliseconds;
    }
    AudioServiceBackground.setState(
      controls: getControls(state),
      systemActions: [
        MediaAction.seekTo,
        MediaAction.playPause,
        MediaAction.fastForward,
        MediaAction.skipToNext,
        MediaAction.skipToPrevious,
        MediaAction.rewind
      ],
      basicState: state,
      position: currentPosition,
      speed: speed ?? 1.0,
    );
  }

  List<MediaControl> getControls(BasicPlaybackState state) {
    if (_playing ?? false) {
      return [
        Controls.rewindControl,
        Controls.pauseControl,
        Controls.fastForwardControl
      ];
    } else {
      return [
        Controls.rewindControl,
        Controls.playControl,
        Controls.fastForwardControl
      ];
    }
  }
}

Future startAudioService() async {
  return await AudioService.start(
    backgroundTaskEntrypoint: _audioPlayerTaskEntrypoint,
    androidNotificationChannelName: 'Audiobookly',
    notificationColor: Colors.deepPurple.value,
    androidNotificationIcon: 'mipmap/audiobookly_launcher',
    enableQueue: true,
  );
}

Future _audioPlayerTaskEntrypoint() async {
  return await AudioServiceBackground.run(() => AudioPlayerTask());
}
