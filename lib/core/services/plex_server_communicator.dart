import 'dart:async';

import 'package:audiobookly/core/models/plex_media_item.dart';
import 'package:audiobookly/core/services/server_communicator.dart';
import 'package:flutter/foundation.dart';
import 'package:plex_api/plex_api.dart';

class PlexServerCommunicator extends ServerCommunicator {
  PlexServerV2 _server;
  final String _libraryKey;
  Timer _refreshServer;

  PlexServerCommunicator(
      {@required PlexServerV2 server, @required String libraryKey})
      : _server = server,
        _libraryKey = libraryKey {
    _refreshServer = Timer.periodic(Duration(minutes: 1), (timer) async {
      _server = (await _server.api.getServersV2()).firstWhere(
          (server) => server.clientIdentifier == _server.clientIdentifier,
          orElse: () => null);
    });
  }

  Future<List<PlexMediaItem>> getRecentlyAdded() async {
    return (await _server.getRecentlyAdded(_libraryKey))
        .map((album) => PlexMediaItem.fromPlexAlbum(album, _server))
        .toList();
  }

  Future<List<PlexMediaItem>> getRecentPlayed() async {
    List<PlexMediaItem> items = (await _server.getRecentlyViewed(_libraryKey))
        .map((album) => PlexMediaItem.fromPlexAlbum(album, _server))
        .toList();
    return (await Future.wait<PlexAlbum>(
            items.map((item) => _server.getAlbumFromKey(item.key))))
        .map((album) => PlexMediaItem.fromPlexAlbum(album, _server))
        .toList();
  }

  Future<List<PlexMediaItem>> getAllBooks() async {
    return (await _server.getAllAlbums(_libraryKey))
        .map((album) => PlexMediaItem.fromPlexAlbum(album, _server))
        .toList();
  }

  Future<List<PlexMediaItem>> getAuthors() async {
    return (await _server.getArtists(_libraryKey))
        .map((artist) => PlexMediaItem.fromPlexArtist(artist, _server))
        .toList();
  }

  Future<List<PlexMediaItem>> getBooksFromAuthor(String authorId) async {
    return (await _server.getAlbumsFromArtist(authorId))
        .map((album) => PlexMediaItem.fromPlexAlbum(album, _server))
        .toList();
  }

  Future<List<PlexMediaItem>> getCollections() async {
    return (await _server.getCollections(_libraryKey))
        .map((collection) =>
            PlexMediaItem.fromPlexCollection(collection, _server))
        .toList();
  }

  Future<List<PlexMediaItem>> getBooksFromCollection(
      String collectionId) async {
    return (await _server.getAlbumsFromCollection(_libraryKey, collectionId))
        .map((album) => PlexMediaItem.fromPlexAlbum(album, _server))
        .toList();
  }

  Future<PlexMediaItem> getAlbumFromId(String mediaId) async {
    return PlexMediaItem.fromPlexAlbum(
        await _server.getAlbumFromKey(mediaId), _server);
  }

  Future savePosition(
      String mediaId, int position, int duration, dynamic state) async {
    return await _server.savePosition(
        mediaId, position, duration, state as PlexPlaybackState);
  }
}
