// import 'dart:async';
// import 'dart:developer';
// import 'dart:io';
// import 'package:audiobookly/services/database/database_service.dart';
// import 'package:audiobookly/services/device_info/device_info_service.dart';
// import 'package:audiobookly/services/shared_preferences/shared_preferences_service.dart';
// import 'package:audiobookly/singletons.dart';
// import 'package:audiobookly/utils/utils.dart';
// import 'package:audio_service/audio_service.dart';
// import 'package:audiobookly/repositories/media/media_repository.dart';
// import 'package:audiobookly/providers.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:libwinmedia/libwinmedia.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:audiobookly/utils/utils.dart';

// enum DURATION_STATE { between, before, after }

// class DesktopAudioHandler extends BaseAudioHandler {
//   final _player = Player(id: 0);
//   final completer = Completer();

//   MediaRepository? _repository;
//   DesktopAudioHandler() {
//     _init();
//   }

//   int? chapterIndex;

//   int? get index => _player.state.index;
//   String? _currentMedia;
//   MediaItem? _currentMediaItem;
//   List<MediaItem> tracks = [];

//   late SharedPreferencesService _prefs;
//   MediaItem? get currentQueueItem {
//     if (chapterIndex != null &&
//         chapterIndex! >= 0 &&
//         chapterIndex! < queue.value.length) {
//       return queue.value[chapterIndex!];
//     } else if (index != null && index! >= 0 && index! < tracks.length) {
//       return tracks[index!];
//     }
//     return null;
//   }

//   Duration get totalDuration => tracks.fold(
//         Duration.zero,
//         (total, item) => total + item.duration!,
//       );
//   Duration get currentTrackStartingPosition =>
//       tracks.getRange(0, index ?? 0).fold<Duration>(
//             Duration.zero,
//             (total, item) => (total) + (item.duration ?? Duration.zero),
//           );
//   Duration get currentPosition =>
//       currentTrackStartingPosition + (_player.position);
//   // Duration get currentBufferedPosition =>
//   //     tracks.getRange(0, index ?? 0).fold<Duration>(
//   //           Duration.zero,
//   //           (total, item) => (total) + (item.duration ?? Duration.zero),
//   //         ) +
//   //     (_player.bufferedPosition);
//   Timer? _timer;
//   StreamSubscription? _positionSub;

//   void initTimer() {
//     int pauseCount = 0;
//     if (_currentMedia != null) {
//       _timer ??= Timer.periodic(const Duration(seconds: 10), (timer) async {
//         if (!_player.state.isPlaying) pauseCount++;
//         try {
//           await _repository?.playbackCheckin(
//               _currentMedia!,
//               currentPosition,
//               totalDuration,
//               _player.rate,
//               AudiobooklyEvent.TimeUpdate,
//               _player.state.isPlaying);
//         } catch (e) {
//           log('$e');
//         }
//         if (_player.state.isCompleted || pauseCount > 5) {
//           timer.cancel();
//           _timer = null;
//           pauseCount = 0;
//         }
//       });
//     }
//     _positionSub ??= _player.streams.position.listen((position) {
//       if (currentQueueItem?.extras?.containsKey('end') ?? false) {
//         var currentState = durationBetween(
//           currentPosition,
//           currentQueueItem!.start,
//           currentQueueItem!.end,
//         );
//         bool shouldChange = currentState != DURATION_STATE.between;
//         while (currentState != DURATION_STATE.between) {
//           if (currentState == DURATION_STATE.before) {
//             chapterIndex ??= 0;
//             chapterIndex = chapterIndex! - 1;
//           }
//           if (currentState == DURATION_STATE.after) {
//             chapterIndex ??= 0;

//             chapterIndex = chapterIndex! + 1;
//           }
//           currentState = durationBetween(
//               currentPosition, currentQueueItem!.start, currentQueueItem!.end);
//         }
//         if (shouldChange) {
//           setCurrentMediaItem();
//         }
//       }
//     });
//   }

//   DURATION_STATE durationBetween(
//       Duration position, Duration start, Duration end) {
//     if (position >= start && position <= end) {
//       return DURATION_STATE.between;
//     } else if (position > end) {
//       return DURATION_STATE.after;
//     } else {
//       return DURATION_STATE.before;
//     }
//   }

//   Future updateProgress(AudiobooklyPlaybackState state,
//       [bool finished = false]) async {
//     initTimer();
//     try {
//       if (state == AudiobooklyPlaybackState.STOPPED) {
//         _timer?.cancel();
//         _timer = null;
//         if (_currentMedia != null) {
//           _repository!.playbackCheckin(
//             _currentMedia!,
//             currentPosition,
//             totalDuration,
//             _player.rate,
//             AudiobooklyEvent.Pause,
//             _player.state.isPlaying,
//           );
//         }
//       } else {
//         _repository!.playbackCheckin(
//           _currentMedia!,
//           currentPosition,
//           totalDuration,
//           _player.rate,
//           _player.state.isPlaying
//               ? AudiobooklyEvent.Unpause
//               : AudiobooklyEvent.Pause,
//           _player.state.isPlaying,
//         );
//       }
//     } catch (e) {
//       log('Checkin error: $e');
//     }
//   }

//   bool pauseOnNext = false;

//   Future<void> _init() async {
//     // We configure the audio session for speech since we're playing a podcast.
//     // You can also put this in your app's initialisation if your app doesn't
//     // switch between two types of audio as this example does.
//     // final session = await AudioSession.instance;
//     // await session.configure(const AudioSessionConfiguration.speech());

//     // await _player
//     //     .setSpeed(_prefs.getDouble(SharedPrefStrings.PLAYBACK_SPEED) ?? 1.0);
//     // Broadcast media item changes.
//     _player.streams.index.listen((currentIndex) async {
//       if (index != null) {
//         await updateProgress(AudiobooklyPlaybackState.STOPPED, true);

//         if (_player.state.isPlaying) {
//           await updateProgress(AudiobooklyPlaybackState.PLAYING);
//         }
//         setCurrentMediaItem();
//         _player.streams.isBuffering
//             .where((event) => !event)
//             .first
//             .then((_) => setSpeed(_prefs.speed));
//         // setSpeed(_prefs.speed);
//       }
//       if (pauseOnNext) {
//         pauseOnNext = false;
//         pause();
//       }
//     });

//     _player.streams.isPlaying.listen((event) {
//       print('Playing $event');
//       _broadcastState();
//     });
//     _player.streams.isBuffering.listen((event) {
//       print('Buffering $event');
//       _broadcastState();
//     });
//     _player.streams.position.listen((event) {
//       _broadcastState();
//     });

//     // Special processing for state transitions.
//     _player.streams.isCompleted.listen((isCompleted) {
//       if (isCompleted) {
//         _repository!.playbackFinished(_currentMedia!);
//         stop();
//       }
//     });

//     _prefs = SharedPreferencesService(await SharedPreferences.getInstance());
//     final _info = await getDeviceInfo();
//     _repository = ProviderContainer(
//       overrides: [
//         sharedPreferencesServiceProvider.overrideWithValue(
//           _prefs,
//         ),
//         deviceInfoServiceProvider.overrideWithValue(
//           DeviceInfoService(_info),
//         )
//       ],
//     ).read(mediaRepositoryProvider);
//     await _repository?.getServerAndLibrary();
//     // _childrenSubjects = Map<String, BehaviorSubject<List<MediaItem>>>();
//     if (_currentMedia != null) {
//       playFromMediaId(_currentMedia);
//     }
//     completer.complete();
//   }

//   Future<void> setPlaybackRate(double speed) async {
//     await _prefs.setSpeed(speed);
//     _player.rate = speed;
//   }

//   void setCurrentMediaItem() {
//     if (currentQueueItem != null) {
//       if (Platform.isWindows) {
//         _player.nativeControls.update(
//           thumbnail: _currentMediaItem?.artUri,
//           album: _currentMediaItem?.album,
//           title: _currentMediaItem?.title,
//           albumArtist: _currentMediaItem?.artist,
//           artist: _currentMediaItem?.artist,
//         );
//       }
//       mediaItem.add(
//         currentQueueItem!.copyWith(
//           id: currentQueueItem!.id,
//           duration: totalDuration,
//           artUri: _currentMediaItem?.artUri,
//           displayDescription: _currentMediaItem?.displayDescription,
//           extras: <String, dynamic>{
//             ...currentQueueItem!.extras ?? {},
//             'currentTrack': currentQueueItem!.id,
//             'currentTrackLength': currentQueueItem!.duration!.inMilliseconds,
//             'currentTrackStartingPosition':
//                 currentTrackStartingPosition.inMilliseconds,
//           },
//         ),
//       );
//     }
//   }

//   Timer? _pauseTimer;

//   @override
//   Future customAction(String name, [Map<String, dynamic>? arguments]) async {
//     await completer.future;
//     if (await queue.isEmpty) return;
//     if (name == 'skip') {
//       if (chapterIndex != null && chapterIndex! < queue.value.length) {
//         await skipToQueueItem(chapterIndex! + 1);
//       } else {
//         _player.next();
//       }
//     } else if (name == 'previous') {
//       if (chapterIndex != null && chapterIndex! > 0) {
//         await skipToQueueItem(chapterIndex! - 1);
//       } else {
//         _player.back();
//       }
//     } else if (name == 'setTimer') {
//       if (arguments?['type'] == 'endOfTrack') {
//         pauseOnNext = true;
//       } else if (arguments?['type'] == 'cancel') {
//         _pauseTimer?.cancel();
//         _pauseTimer = null;
//       } else {
//         final minutes = arguments?['minutes'];
//         if (minutes != null) {
//           _pauseTimer = Timer(Duration(minutes: minutes), () {
//             if (_player.state.isPlaying) pause();
//           });
//         }
//       }
//     }
//   }

//   @override
//   Future<void> setSpeed(double speed) async {
//     await completer.future;
//     await setPlaybackRate(speed);
//   }

//   /// Broadcasts the current state to all clients.
//   Future<void> _broadcastState() async {
//     playbackState.add(playbackState.value.copyWith(
//       controls: [
//         MediaControl.rewind,
//         // Controls.rewindControl,
//         if (_player.state.isPlaying) MediaControl.pause else MediaControl.play,
//         MediaControl.fastForward,
//         // Controls.fastForwardControl,
//         MediaControl.stop,
//       ],
//       systemActions: {
//         MediaAction.seek,
//         MediaAction.playPause,
//         MediaAction.fastForward,
//         MediaAction.skipToNext,
//         MediaAction.skipToPrevious,
//         MediaAction.rewind,
//       },
//       androidCompactActionIndices: [0, 1, 2],
//       processingState: getProcessingState(),
//       playing: _player.state.isPlaying,
//       updatePosition: currentPosition,
//       bufferedPosition: Duration.zero,
//       speed: _player.rate < 1 ? 1 : _player.rate,
//     ));
//   }

//   AudioProcessingState getProcessingState() {
//     if (_player.state.isBuffering) return AudioProcessingState.buffering;
//     if (_player.state.isCompleted) return AudioProcessingState.completed;
//     return AudioProcessingState.ready;
//   }

//   @override
//   Future<void> play() async {
//     await completer.future;
//     _player.play();
//     // await setSpeed(_prefs.getDouble(SharedPrefStrings.PLAYBACK_SPEED));
//     print('Playing progress should fire bitch');
//     await updateProgress(AudiobooklyPlaybackState.PLAYING);
//     // await super.play();
//   }

//   @override
//   Future<void> pause() async {
//     await completer.future;
//     _player.pause();
//     //await seek(currentPosition - const Duration(seconds: 2));
//     await super.pause();
//     await updateProgress(AudiobooklyPlaybackState.PAUSED);
//   }

//   @override
//   Future<void> skipToNext() => fastForward(AudioService.config.rewindInterval);

//   @override
//   Future<void> skipToPrevious() => rewind(AudioService.config.rewindInterval);

//   @override
//   Future<void> stop() async {
//     await completer.future;
//     await updateProgress(AudiobooklyPlaybackState.STOPPED);
//     _player.pause();
//     // _player.dispose();
//     _currentMedia = null;
//     _currentMediaItem = null;
//     tracks = [];
//     chapterIndex = null;
//     mediaItem.add(null);
//     _timer?.cancel();
//     _timer = null;
//     await super.stop();
//   }

//   @override
//   Future fastForward([Duration interval = const Duration(seconds: 30)]) async {
//     await completer.future;
//     await seek(currentPosition + interval);
//     await super.fastForward();
//   }

//   @override
//   Future rewind([Duration interval = const Duration(seconds: 15)]) async {
//     await completer.future;
//     await seek(currentPosition - interval);
//     await super.rewind();
//   }

//   @override
//   Future seek(Duration position, [bool startPlaying = false]) async {
//     final queuePosition = findPostion(position);
//     Duration diff = position - currentPosition;
//     print(
//         'Fixed? ${_player.state.index}:${queuePosition.trackIndex} and ${queuePosition.trackPosition}');
//     // if (position > currentPosition) diff = position - currentPosition;
//     // if (position < currentPosition) diff = currentPosition - position;
//     if (_player.state.index != queuePosition.trackIndex) {
//       _player.jump(queuePosition.trackIndex);
//       _player.streams.index.first
//           .then((value) =>
//               _player.streams.isBuffering.where((event) => !event).first)
//           .then((value) => _player.seek(queuePosition.trackPosition));
//     } else {
//       _player.seek(queuePosition.trackPosition);
//     }
//     // else {
//     //   _player.seek(diff);
//     // }
//     if (startPlaying) _player.play();
//     await super.seek(position);
//   }

//   handleSeek(Duration position) {}

//   @override
//   Future<void> click([MediaButton button = MediaButton.media]) async {
//     await completer.future;
//     switch (button) {
//       case MediaButton.media:
//         if (playbackState.value.playing == true) {
//           await pause();
//         } else {
//           await play();
//         }
//         break;
//       case MediaButton.next:
//         await skipToNext();
//         break;
//       case MediaButton.previous:
//         await skipToPrevious();
//         break;
//     }
//   }

//   @override
//   Future<void> skipToQueueItem(int index) async {
//     await completer.future;
//     final item = queue.value[index];
//     if (item.extras?.containsKey('start') ?? false) {
//       await seek(
//         Duration(
//             milliseconds: (item.extras?['start'].toDouble() * 1000).round()),
//       );
//     } else {
//       _player.jump(index);
//     }
//   }

//   Map<String, ValueStream<Map<String, dynamic>>> streams = {};

//   @override
//   ValueStream<Map<String, dynamic>> subscribeToChildren(String parentMediaId) {
//     return Stream.value(doMe).map((_) => <String, dynamic>{}).shareValue();
//   }

//   List<MediaItem>? doMe;

//   @override
//   Future<List<MediaItem>> getChildren(String parentMediaId,
//       [Map<String, dynamic>? extras]) async {
//     await completer.future;
//     final items = await _repository!.getChildren(parentMediaId);
//     doMe = items;
//     return items;
//   }

//   @override
//   Future<MediaItem> getMediaItem(String mediaId) async {
//     await completer.future;
//     return await _repository!.getAlbumFromId(mediaId);
//   }

//   @override
//   Future<void> prepare() async {
//     await completer.future;
//     prepareFromMediaId(
//         (await _repository!.getRecentlyPlayed()).take(1).toList()[0].id);
//   }

//   @override
//   Future<void> prepareFromMediaId(String? mediaId,
//       [Map<String, dynamic>? extras]) async {
//     await completer.future;
//     if (mediaId == null) return;

//     final db = getIt<DatabaseService>();
//     final dbBook = await db.getBookById(mediaId);
//     final dbTracks = await db.getTracksForBookId(mediaId).first;
//     _currentMedia = mediaId;
//     if (_player.state.isPlaying) {
//       updateProgress(AudiobooklyPlaybackState.STOPPED);
//       _player.dispose();
//     }

//     if (dbBook != null && dbTracks.isNotEmpty) {
//       tracks = dbTracks.entries.map((entry) {
//         final track = entry.value;
//         return MediaHelpers.fromTrack(track, dbBook);
//       }).toList();
//       queue.add(tracks);
//       _currentMediaItem = MediaHelpers.fromBook(dbBook);
//       final chapters = await db.getChaptersForBook(dbBook.id);
//       if (chapters.isNotEmpty) {
//         chapterIndex = 0;
//         queue.add([
//           for (final chapter in chapters)
//             Utils.chapterToItem(chapter).copyWith(
//               album: _currentMediaItem!.album,
//               artist: _currentMediaItem!.artist,
//             )
//         ]..sort((a, b) => int.parse(a.id).compareTo(int.parse(b.id))));
//       }
//     } else {
//       await _repository!.getServerAndLibrary();
//       _currentMediaItem = (await _repository!.getAlbumFromId(mediaId));
//       tracks = (await _repository!.getTracksForBook(_currentMediaItem!))
//           .cast<MediaItem>();
//       if (_currentMediaItem?.chapters != null &&
//           _currentMediaItem!.chapters.isNotEmpty) {
//         List<MediaItem> chapters = [
//           for (final chapter in _currentMediaItem!.chapters)
//             Utils.chapterToItem(chapter).copyWith(
//               album: _currentMediaItem!.album,
//               artist: _currentMediaItem!.artist,
//               artUri: _currentMediaItem!.artUri,
//             )
//         ];
//         chapters.sort((a, b) => int.parse(a.id).compareTo(int.parse(b.id)));
//         chapterIndex = 0;
//         queue.add(chapters);
//       } else {
//         print('No chapters');
//         queue.add(tracks);
//       }
//       _currentMediaItem = _currentMediaItem!.copyWith(duration: totalDuration);
//     }

//     final queuePosition = findPositionForAlbum(_currentMediaItem!);
//     try {
//       _player.open(tracks.map((item) {
//         if (item.cached && File(item.cachePath).existsSync()) {
//           log('Tis cached ${item.cachePath}');
//           return Media(uri: 'file://${item.cachePath}');
//         }
//         return Media(uri: _repository!.getServerUrl(item.partKey ?? item.id));
//       }).toList());
//       await _player.streams.medias.first;
//       _player.jump(queuePosition.trackIndex);
//       _player.streams.index.first
//           .then((value) =>
//               _player.streams.isBuffering.where((event) => !event).first)
//           .then((value) => _player.seek(queuePosition.trackPosition));

//       _player.streams.isPlaying.first.then((_) {
//         setSpeed(_prefs.speed);
//       });

//       setCurrentMediaItem();
//     } catch (e, stack) {
//       print("Error code $e");
//       print("Error stack $stack");
//     }
//   }

//   @override
//   Future<void> playFromSearch(String query,
//       [Map<String, dynamic>? extras]) async {
//     await completer.future;
//     List<MediaItem> items = await _repository!.search(query);
//     if (items.isNotEmpty) await playFromMediaId(items[0].id);
//     return super.playFromSearch(query, extras);
//   }

//   @override
//   Future<List<MediaItem>> search(String query,
//       [Map<String, dynamic>? extras]) async {
//     await completer.future;
//     return await _repository!.search(query);
//   }

//   @override
//   Future playFromMediaId(String? mediaId,
//       [Map<String, dynamic>? extras]) async {
//     await completer.future;
//     await prepareFromMediaId(mediaId, extras);
//     _player.play();
//     _player.rate = 1.0;
//     initTimer();
//     await _repository!.playbackStarted(
//       mediaId!,
//       currentPosition,
//       totalDuration,
//       _player.rate,
//     );
//     await updateProgress(AudiobooklyPlaybackState.PLAYING);
//     // await seek(latestTrackPosition ?? Duration.zero, true);
//   }

//   MediaItem findLatestTrack() {
//     return tracks.lastWhere((element) {
//       return element.viewOffset != Duration.zero;
//     }, orElse: () => tracks[0]);
//   }

//   _QueuePosition findPostion(Duration positionToFind) {
//     Duration trackStart = Duration.zero;
//     final track = tracks.firstWhere((element) {
//       trackStart += element.duration!;
//       return trackStart > positionToFind;
//     }, orElse: () => tracks[0]);
//     trackStart -= track.duration!;
//     Duration trackPosition = positionToFind - trackStart;
//     return _QueuePosition(tracks.indexOf(track), trackPosition);
//   }

//   _QueuePosition findPositionForAlbum(MediaItem album) {
//     if (album.viewOffset != Duration.zero) {
//       return findPostion(album.viewOffset);
//     } else {
//       MediaItem item = findLatestTrack();
//       return _QueuePosition(tracks.indexOf(item), item.viewOffset);
//     }
//   }
// }

// class _QueuePosition {
//   Duration trackPosition;
//   int trackIndex;
//   _QueuePosition(this.trackIndex, this.trackPosition);
// }
