import 'package:audio_service/audio_service.dart';
import 'package:flutter/foundation.dart';

class AudiobooklyMediaItem extends MediaItem {
  final String serverKey;
  final String uri;
  final String fileName;

  const AudiobooklyMediaItem({
    @required id,
    @required album,
    @required title,
    @required this.serverKey,
    this.uri = '',
    this.fileName = '',
    artist,
    genre,
    duration,
    artUri,
    playable = true,
    displayTitle,
    displaySubtitle,
    displayDescription,
    rating,
  }) : super(
            id: id,
            album: album,
            title: title,
            artist: artist,
            genre: genre,
            duration: duration,
            artUri: artUri,
            playable: playable,
            displayTitle: displayTitle,
            displaySubtitle: displaySubtitle,
            displayDescription: displayDescription,
            rating: rating);
}
