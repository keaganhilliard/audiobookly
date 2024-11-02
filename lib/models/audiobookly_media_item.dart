import 'package:audio_service/audio_service.dart';

class AudiobooklyMediaItem extends MediaItem {
  final String? serverKey;
  final String uri;
  final String fileName;

  const AudiobooklyMediaItem({
    required super.id,
    required super.album,
    required super.title,
    required this.serverKey,
    this.uri = '',
    this.fileName = '',
    super.artist,
    super.genre,
    super.duration,
    super.artUri,
    super.playable = true,
    super.displayTitle,
    super.displaySubtitle,
    super.displayDescription,
    super.rating,
    super.extras,
  });
}
