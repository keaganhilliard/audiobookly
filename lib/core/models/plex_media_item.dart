import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:plex_api/plex_api.dart';

class PlexMediaItem extends MediaItem {
  final String key;

  PlexMediaItem.fromPlexTrack(PlexTrack track, PlexServerV2 server)
      : key = track.ratingKey,
        super(
          id: server.getUrlWithToken(track.media[0].part[0].key),
          title: track.title,
          album: track.parentTitle,
          artist: track.grandparentTitle,
          artUri: server.getUrlWithToken(track.parentThumb),
          duration: track.duration,
        );
  PlexMediaItem.fromPlexArtist(PlexArtist artist, PlexServerV2 server)
      : key = artist.ratingKey,
        super(
          id: '${MediaIds.AUTHORS_ID}/${artist.ratingKey}',
          title: artist.title,
          album: '',
          artUri: server.getUrlWithToken(artist.thumb),
          playable: false,
        );
  PlexMediaItem.fromPlexAlbum(PlexAlbum album, PlexServerV2 server)
      : key = album.ratingKey,
        super(
          id: album.ratingKey,
          title: album.title,
          album: '',
          artist: album.parentTitle,
          artUri: server.getUrlWithToken(album.thumb),
        );
  PlexMediaItem.fromPlexCollection(
      PlexCollection collection, PlexServerV2 server)
      : key = collection.key,
        super(
          id: '${MediaIds.COLLECTIONS_ID}/${collection.key}',
          title: collection.title,
          album: '',
          artist: '',
          playable: false,
        );
}
