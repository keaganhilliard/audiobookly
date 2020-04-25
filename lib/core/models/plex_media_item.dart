import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/core/models/audiobookly_media_item.dart';
import 'package:plex_api/plex_api.dart';

class PlexMediaItem extends AudiobooklyMediaItem {
  final String key;

  PlexMediaItem.fromPlexTrack(PlexTrack track, PlexServerV2 server,
      [int duration])
      : key = track.ratingKey,
        super(
          serverKey: track.ratingKey,
          id: server.getUrlWithToken(track.media[0].part[0].key),
          title: track.title,
          album: track.parentTitle,
          artist: track.grandparentTitle,
          artUri: server.getUrlWithToken(track.parentThumb),
          duration: duration ?? track.duration,
          extras: <String, dynamic>{
            'fileName': track.media[0].part[0].file
                .substring(track.media[0].part[0].file.lastIndexOf('/') + 1),
            'uri': server.getUrlWithToken(track.media[0].part[0].key),
            'serverKey': track.ratingKey,
          },
        );
  PlexMediaItem.fromPlexArtist(PlexArtist artist, PlexServerV2 server)
      : key = artist.ratingKey,
        super(
          serverKey: artist.ratingKey,
          id: '${MediaIds.AUTHORS_ID}/${artist.ratingKey}',
          title: artist.title,
          album: '',
          artUri: server.getUrlWithToken(artist.thumb),
          playable: false,
        );
  PlexMediaItem.fromPlexAlbum(PlexAlbum album, PlexServerV2 server,
      [int duration])
      : key = album.ratingKey,
        super(
          serverKey: album.ratingKey,
          id: album.ratingKey,
          title: album.title,
          album: '',
          artist: album.parentTitle,
          artUri: server.getUrlWithToken(album.thumb),
          displayDescription: album.summary,
          duration: duration,
          extras: <String, dynamic>{
            'viewOffset': album.viewOffset,
          },
        );
  PlexMediaItem.fromPlexCollection(
      PlexCollection collection, PlexServerV2 server)
      : key = collection.key,
        super(
          serverKey: collection.key,
          id: '${MediaIds.COLLECTIONS_ID}/${collection.key}',
          title: collection.title,
          album: '',
          artist: '',
          playable: false,
        );
}
