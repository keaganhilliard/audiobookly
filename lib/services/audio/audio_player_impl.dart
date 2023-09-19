import 'package:audiobookly/services/audio/ab_state_player.dart';
import 'package:audiobookly/services/audio/playback_state.dart';
// import 'package:just_audio/just_audio.dart' as ja;
import 'dart:async';

import 'package:media_kit/media_kit.dart' as mk;

class AudioPlayer {
  final MkPlayerWithState _mkPlayer;
  // final ja.AudioPlayer? _justAudio;

  int get index => _mkPlayer.state.playlist.index;
  mk.PlayerState get state => _mkPlayer.state;
  mk.PlayerStream get stream => _mkPlayer.stream;

  AudioPlayer() : _mkPlayer = MkPlayerWithState();
  Object _resolveUrlType(String url) {
    // if (mkSupportedPlatform) {
    return mk.Media(url);
    // } else {
    //   if (url.startsWith("https")) {
    //     return ja.AudioSource.uri(Uri.parse(url));
    //   } else {
    //     return ja.AudioSource.file(url);
    //   }
    // }
  }

  Future<void> next() async {
    return _mkPlayer.next();
  }

  Future<void> previous() async {
    return _mkPlayer.previous();
  }

  Future<void> preload(String url) async {
    throw UnimplementedError();
    // final urlType = _resolveUrlType(url);
    // if (mkSupportedPlatform && urlType is ap.Source) {
    //   // audioplayers doesn't have the capability to preload
    //   return;
    // } else {
    //   return;
    // }
  }

  Future<void> open(mk.Playable item, {play = true}) async {
    await _mkPlayer.open(item, play: play);
  }

  Future<void> play(String url) async {
    final urlType = _resolveUrlType(url);
    // if (mkSupportedPlatform && urlType is mk.Media) {
    await _mkPlayer.open(urlType as mk.Media, play: true);
    // } else {
    //   if (_justAudio?.audioSource is ja.ProgressiveAudioSource &&
    //       (_justAudio?.audioSource as ja.ProgressiveAudioSource)
    //               .uri
    //               .toString() ==
    //           url) {
    //     await _justAudio?.play();
    //   } else {
    //     await _justAudio?.stop();
    //     await _justAudio?.setAudioSource(
    //       urlType as ja.AudioSource,
    //       preload: true,
    //     );
    //     await _justAudio?.play();
    //   }
    // }
  }

  Future<void> pause() async {
    await _mkPlayer.pause();
    // await _justAudio?.pause();
  }

  Future<void> resume() async {
    await _mkPlayer.play();
    // await _justAudio?.play();
  }

  Future<void> stop() async {
    await _mkPlayer.stop();
    // await _justAudio?.stop();
    // await _justAudio?.setShuffleModeEnabled(false);
    // await _justAudio?.setLoopMode(ja.LoopMode.off);
  }

  Future<void> seek(Duration position) async {
    await _mkPlayer.seek(position);
    // await _justAudio?.seek(position);
  }

  /// Volume is between 0 and 1
  Future<void> setVolume(double volume) async {
    assert(volume >= 0 && volume <= 1);
    await _mkPlayer.setVolume(volume * 100);
    // await _justAudio?.setVolume(volume);
  }

  Future<void> setSpeed(double speed) async {
    await _mkPlayer.setRate(speed);
    // await _justAudio?.setSpeed(speed);
  }

  Future<void> dispose() async {
    await _mkPlayer.dispose();
    // await _justAudio?.dispose();
  }

  // Playlist related

  Future<void> openPlaylist(
    List<String> tracks, {
    bool autoPlay = true,
    int initialIndex = 0,
  }) async {
    assert(tracks.isNotEmpty);
    assert(initialIndex <= tracks.length - 1);
    // if (mkSupportedPlatform) {
    await _mkPlayer.open(
      mk.Playlist(
        tracks.map((val) {
          final uri = Uri.parse(val);
          final token = uri.queryParameters['token'];
          print(token);
          print(uri.replace(queryParameters: {}));
          return mk.Media(uri.removeFragment().toString(),
              httpHeaders: {'Authorization': 'Bearer $token'});
        }).toList(),
        index: initialIndex,
      ),
      play: autoPlay,
    );
    // } else {
    // await _justAudio!.setAudioSource(
    //   ja.ConcatenatingAudioSource(
    //     useLazyPreparation: true,
    //     children:
    //         tracks.map((e) => ja.AudioSource.uri(Uri.parse(e))).toList(),
    //   ),
    //   preload: true,
    //   initialIndex: initialIndex,
    // );
    // if (autoPlay) {
    //   await _justAudio!.play();
    // }
    // }
  }

  List<String> get sources {
    // if (mkSupportedPlatform) {
    return _mkPlayer.playlist.medias.map((e) => e.uri).toList();
    // } else {
    //   return _justAudio!.sequenceState?.effectiveSequence
    //           .map((e) => (e as ja.UriAudioSource).uri.toString())
    //           .toList() ??
    //       <String>[];
    // }
  }

  String? get currentSource {
    // if (mkSupportedPlatform) {
    return _mkPlayer.playlist.medias
        .elementAtOrNull(_mkPlayer.playlist.index)
        ?.uri;
    // } else {
    //   return (_justAudio?.sequenceState?.effectiveSequence
    //               .elementAtOrNull(_justAudio!.sequenceState!.currentIndex)
    //           as ja.UriAudioSource?)
    //       ?.uri
    //       .toString();
    // }
  }

  String? get nextSource {
    // if (mkSupportedPlatform) {

    return _mkPlayer.playlist.medias
        .elementAtOrNull(_mkPlayer.playlist.index + 1)
        ?.uri;
    // } else {
    //   return (_justAudio?.sequenceState?.effectiveSequence
    //               .elementAtOrNull(_justAudio!.sequenceState!.currentIndex + 1)
    //           as ja.UriAudioSource?)
    //       ?.uri
    //       .toString();
    // }
  }

  String? get previousSource {
    // if (mkSupportedPlatform) {
    return _mkPlayer.playlist.medias
        .elementAtOrNull(_mkPlayer.playlist.index - 1)
        ?.uri;
    // } else {
    //   return (_justAudio?.sequenceState?.effectiveSequence
    //               .elementAtOrNull(_justAudio!.sequenceState!.currentIndex - 1)
    //           as ja.UriAudioSource?)
    //       ?.uri
    //       .toString();
    // }
  }

  Future<void> skipToNext() async {
    // if (mkSupportedPlatform) {
    await _mkPlayer.next();
    // } else {
    //   await _justAudio!.seekToNext();
    // }
  }

  Future<void> skipToPrevious() async {
    // if (mkSupportedPlatform) {
    await _mkPlayer.previous();
    // } else {
    //   await _justAudio!.seekToPrevious();
    // }
  }

  Future<void> jumpTo(int index) async {
    // if (mkSupportedPlatform) {
    await _mkPlayer.jump(index);
    // } else {
    //   await _justAudio!.seek(Duration.zero, index: index);
    // }
  }

  Future<void> addTrack(String url) async {
    final urlType = _resolveUrlType(url);
    // if (mkSupportedPlatform && urlType is mk.Media) {
    await _mkPlayer.add(urlType as mk.Media);
    // } else {
    //   await (_justAudio!.audioSource as ja.ConcatenatingAudioSource)
    //       .add(urlType as ja.AudioSource);
    // }
  }

  Future<void> addTrackAt(String url, int index) async {
    final urlType = _resolveUrlType(url);
    // if (mkSupportedPlatform && urlType is mk.Media) {
    await _mkPlayer.insert(index, urlType as mk.Media);
    // } else {
    //   await (_justAudio!.audioSource as ja.ConcatenatingAudioSource)
    //       .insert(index, urlType as ja.AudioSource);
    // }
  }

  Future<void> removeTrack(int index) async {
    // if (mkSupportedPlatform) {
    await _mkPlayer.remove(index);
    // } else {
    //   await (_justAudio!.audioSource as ja.ConcatenatingAudioSource)
    //       .removeAt(index);
    // }
  }

  Future<void> moveTrack(int from, int to) async {
    // if (mkSupportedPlatform) {
    await _mkPlayer.move(from, to);
    // } else {
    //   await (_justAudio!.audioSource as ja.ConcatenatingAudioSource)
    //       .move(from, to);
    // }
  }

  Future<void> replaceSource(
    String oldSource,
    String newSource, {
    bool exclusive = false,
  }) async {
    final oldSourceIndex = sources.indexOf(oldSource);
    if (oldSourceIndex == -1) return;

    // if (mkSupportedPlatform) {
    _mkPlayer.replace(oldSource, newSource);
    // } else {
    //   final playlist = _justAudio!.audioSource as ja.ConcatenatingAudioSource;

    //   print('oldSource: $oldSource');
    //   print('newSource: $newSource');
    //   final oldSourceIndexInPlaylist =
    //       _justAudio?.sequenceState?.effectiveSequence.indexWhere(
    //     (e) => (e as ja.UriAudioSource).uri.toString() == oldSource,
    //   );

    //   print('oldSourceIndexInPlaylist: $oldSourceIndexInPlaylist');

    //   // ignores non existing source
    //   if (oldSourceIndexInPlaylist == null || oldSourceIndexInPlaylist == -1) {
    //     return;
    //   }

    //   await playlist.removeAt(oldSourceIndexInPlaylist);
    //   await playlist.insert(
    //     oldSourceIndexInPlaylist,
    //     ja.AudioSource.uri(Uri.parse(newSource)),
    //   );
    // }
  }

  Future<void> clearPlaylist() async {
    // if (mkSupportedPlatform) {
    _mkPlayer.stop();
    // } else {
    //   await (_justAudio!.audioSource as ja.ConcatenatingAudioSource).clear();
    // }
  }

  Future<void> setShuffle(bool shuffle) async {
    // if (mkSupportedPlatform) {
    await _mkPlayer.setShuffle(shuffle);
    // } else {
    //   await _justAudio!.setShuffleModeEnabled(shuffle);
    // }
  }

  Stream<Duration> get durationStream {
    // if (mkSupportedPlatform) {
    return _mkPlayer.stream.duration;
    // } else {
    //   return _justAudio!.durationStream
    //       .where((event) => event != null)
    //       .map((event) => event!)
    //       ;
    // }
  }

  Stream<Duration> get positionStream {
    // if (mkSupportedPlatform) {
    return _mkPlayer.stream.position;
    // } else {
    //   return _justAudio!.positionStream;
    // }
  }

  Stream<Duration> get bufferedPositionStream {
    // if (mkSupportedPlatform) {
    // audioplayers doesn't have the capability to get buffered position
    return _mkPlayer.stream.buffer;
    // } else {
    //   return _justAudio!.bufferedPositionStream;
    // }
  }

  Stream<void> get completedStream {
    // if (mkSupportedPlatform) {
    return _mkPlayer.stream.completed;
    // } else {
    //   return _justAudio!.playerStateStream
    //       .where(
    //           (event) => event.processingState == ja.ProcessingState.completed)
    //       ;
    // }
  }

  /// Stream that emits when the player is almost (%) complete
  Stream<int> percentCompletedStream(double percent) {
    return positionStream
        .asyncMap(
          (position) async => (await duration)?.inSeconds == 0
              ? 0
              : (position.inSeconds /
                      ((await duration)?.inSeconds ?? 100) *
                      100)
                  .toInt(),
        )
        .where((event) => event >= percent);
  }

  Stream<bool> get playingStream {
    // if (mkSupportedPlatform) {
    return _mkPlayer.stream.playing;
    // } else {
    //   return _justAudio!.playingStream;
    // }
  }

  Stream<bool> get shuffledStream {
    // if (mkSupportedPlatform) {
    return _mkPlayer.shuffleStream;
    // } else {
    //   return _justAudio!.shuffleModeEnabledStream;
    // }
  }

  // Stream<PlaybackLoopMode> get loopModeStream {
  //   // if (mkSupportedPlatform) {
  //   return _mkPlayer.loopModeStream.map(PlaybackLoopMode.fromPlaylistMode);
  //   // } else {
  //   //   return _justAudio!.loopModeStream
  //   //       .map(PlaybackLoopMode.fromLoopMode)
  //   //       ;
  //   // }
  // }

  Future<Duration?> get duration async {
    return _mkPlayer.state.duration;
    // if (mkSupportedPlatform) {
    // } else {
    //   return _justAudio!.duration;
    // }
  }

  Future<Duration?> get position async {
    return _mkPlayer.state.position;
    // if (mkSupportedPlatform) {
    // } else {
    //   return _justAudio!.position;
    // }
  }

  // Future<Duration?> get bufferedPosition async {
  //   if (mkSupportedPlatform) {
  //     // audioplayers doesn't have the capability to get buffered position
  //     return null;
  //   } else {
  //     return null;
  //   }
  // }

  bool get hasSource {
    return _mkPlayer.playlist.medias.isNotEmpty;
    // if (mkSupportedPlatform) {
    //   return _mkPlayer.playlist.medias.isNotEmpty;
    // } else {
    //   return _justAudio!.audioSource != null;
    // }
  }

  // states
  bool get isPlaying {
    return _mkPlayer.state.playing;
    // if (mkSupportedPlatform) {
    //   return _mkPlayer.state.playing;
    // } else {
    //   return _justAudio!.playing;
    // }
  }

  bool get isPaused {
    return !_mkPlayer.state.playing;
    // if (mkSupportedPlatform) {
    //   return !_mkPlayer.state.playing;
    // } else {
    //   return !isPlaying;
    // }
  }

  bool get isStopped {
    return !hasSource;
    // if (mkSupportedPlatform) {
    // return !hasSource;
    // } else {
    //   return _justAudio!.processingState == ja.ProcessingState.idle;
    // }
  }

  Future<bool> get isCompleted async {
    return _mkPlayer.state.completed;
    // if (mkSupportedPlatform) {
    // return _mkPlayer.state.completed;
    // } else {
    //   return _justAudio!.processingState == ja.ProcessingState.completed;
    // }
  }

  Future<bool> get isShuffled async {
    return _mkPlayer.shuffled;
    // if (mkSupportedPlatform) {
    //   return _mkPlayer.shuffled;
    // } else {
    //   return _justAudio!.shuffleModeEnabled;
    // }
  }

  /// Returns the current volume of the player, between 0 and 1
  double get volume {
    return _mkPlayer.state.volume / 100;
    // if (mkSupportedPlatform) {
    //   return _mkPlayer.state.volume / 100;
    // } else {
    //   return _justAudio!.volume;
    // }
  }

  bool get isBuffering {
    return false;
    // if (mkSupportedPlatform) {
    //   // audioplayers doesn't have the capability to get buffering state
    //   return false;
    // } else {
    //   return _justAudio!.processingState == ja.ProcessingState.buffering ||
    //       _justAudio!.processingState == ja.ProcessingState.loading;
    // }
  }

  Stream<double> get volumeStream {
    // if (mkSupportedPlatform) {
    return _mkPlayer.stream.volume.map((event) => event / 100);
    // } else {
    //   return _justAudio!.volumeStream;
    // }
  }

  Stream<bool> get bufferingStream {
    // if (mkSupportedPlatform) {
    return Stream.value(false);
    // } else {
    //   return _justAudio!.playerStateStream
    //       .map(
    //         (event) =>
    //             event.processingState == ja.ProcessingState.buffering ||
    //             event.processingState == ja.ProcessingState.loading,
    //       )
    //       ;
    // }
  }

  Stream<AudioPlaybackState> get playerStateStream {
    // if (mkSupportedPlatform) {
    return _mkPlayer.playerStateStream;
    // } else {
    //   return _justAudio!.playerStateStream
    //       .map(AudioPlaybackState.fromJaPlayerState)
    //       ;
    // }
  }

  Stream<int> get currentIndexChangedStream {
    // if (mkSupportedPlatform) {
    return _mkPlayer.indexChangeStream;
    // } else {
    //   return _justAudio!.sequenceStateStream
    //       .map((event) => event?.currentIndex ?? -1)
    //       ;
    // }
  }

  Stream<String> get activeSourceChangedStream {
    // if (mkSupportedPlatform) {
    return _mkPlayer.indexChangeStream
        .map((event) {
          return _mkPlayer.playlist.medias.elementAtOrNull(event)?.uri;
        })
        .where((event) => event != null)
        .cast<String>();
    // } else {
    //   return _justAudio!.sequenceStateStream
    //       .map((event) {
    //         return (event?.currentSource as ja.UriAudioSource?)?.uri.toString();
    //       })
    //       .where((event) => event != null)
    //       .cast<String>();
    // }
  }
}
