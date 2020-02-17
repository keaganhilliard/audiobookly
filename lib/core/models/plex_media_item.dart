import 'package:audio_service/audio_service.dart';
import 'package:plex_api/plex_api.dart';

class PlexMediaItem extends MediaItem {
  PlexMediaItem.fromPlexTrack(PlexTrack track)
      : super(
          id: track.key,
          title: track.title,
          album: track.parentTitle,
          artist: track.grandparentTitle,
          artUri: track.parentThumb,
          duration: track.duration,
        );
}
