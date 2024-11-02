import 'package:audiobookly/constants/app_constants.dart';
import 'package:audiobookly/models/audiobookly_media_item.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:plex_api/plex_api.dart';

class PlexMediaItem extends AudiobooklyMediaItem {
  final String? key;

  PlexMediaItem.fromPlexTrack(PlexTrack track, PlexServer server,
      [int? duration])
      : key = track.ratingKey,
        super(
          serverKey: track.ratingKey,
          id: "${track.ratingKey}",
          title: "${track.title}",
          album: track.parentTitle,
          artist: track.grandparentTitle,
          artUri: server.getThumbnailUrl(track.parentThumb!),
          duration: Duration(milliseconds: duration ?? track.duration!),
          extras: <String, dynamic>{
            'fileName': Utils.cleanFileName(track.media![0].part![0].file!
                .substring(
                    track.media![0].part![0].file!.lastIndexOf('/') + 1)),
            'partKey': track.media![0].part![0].key,
            'serverKey': track.ratingKey,
            'viewOffset': track.viewOffset,
            'narrator': track.originalTitle,
          },
        );
  PlexMediaItem.fromPlexArtist(PlexArtist artist, PlexServer server)
      : key = artist.ratingKey,
        super(
          serverKey: artist.ratingKey,
          id: '${MediaIds.authorsId}/${artist.ratingKey}',
          title: "${artist.title}",
          album: '',
          artUri: server.getThumbnailUrl(artist.thumb ?? ''),
          playable: false,
        );
  PlexMediaItem.fromPlexAlbum(
    PlexAlbum album,
    PlexServer server, [
    int? duration,
  ])  : key = album.ratingKey,
        super(
          serverKey: album.ratingKey,
          id: "${album.ratingKey}",
          title: "${album.title}",
          album: album.title,
          artist: album.parentTitle,
          artUri: server.getThumbnailUrl(album.thumb ?? ''),
          displayDescription: album.summary,
          duration: duration != null ? Duration(milliseconds: duration) : null,
          extras: <String, dynamic>{
            'viewOffset': album.viewOffset,
            'largeThumbnail':
                server.getThumbnailUrl(album.thumb ?? '', 600).toString()
          },
        );
  PlexMediaItem.fromPlexCollection(
      PlexCollection collection, PlexServer? server)
      : key = collection.key,
        super(
          serverKey: collection.key,
          id: '${MediaIds.collectionsId}/${collection.key}',
          title: "${collection.title}",
          album: '',
          artist: '',
          playable: false,
        );
}
