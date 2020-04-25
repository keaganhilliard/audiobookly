import 'dart:async';

import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/core/models/plex_media_item.dart';
import 'package:audiobookly/core/services/server_communicator.dart';
import 'package:plex_api/plex_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info/device_info.dart';
import 'dart:io';

class PlexServerCommunicator extends ServerCommunicator {
  PlexServerV2 _server;
  String _libraryKey;
  Timer _refreshServer;
  bool needsRefresh = false;
  SharedPreferences prefs;

  PlexServerCommunicator({PlexServerV2 server, String libraryKey})
      : _server = server,
        _libraryKey = libraryKey {
    setRefreshTimer();
  }

  void setRefreshTimer() {
    _refreshServer = Timer.periodic(Duration(minutes: 1), (timer) {
      needsRefresh = true;
    });
  }

  Future getServerAndLibrary() async {
    if (_server == null || _libraryKey == null) {
      prefs = await SharedPreferences.getInstance();
      String authToken = prefs.getString(SharedPrefStrings.PLEX_TOKEN);
      String serverId = prefs.getString(SharedPrefStrings.PLEX_SERVER);
      _libraryKey = prefs.getString(SharedPrefStrings.PLEX_LIBRARY);
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      PlexHeaders headers;

      if (Platform.isAndroid) {
        AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
        headers = PlexHeaders(
          clientIdentifier: androidDeviceInfo.androidId,
          device: androidDeviceInfo.model,
          product: 'Audiobookly',
          platform: 'Android',
          platformVersion: androidDeviceInfo.version.release,
          token: authToken,
        );
      } else {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        headers = PlexHeaders(
          clientIdentifier: iosInfo.identifierForVendor,
          device: iosInfo.model,
          product: 'Audiobookly',
          platform: 'iOS',
          platformVersion: iosInfo.systemVersion,
          token: authToken,
        );
      }

      PlexApi api = PlexApi(headers: headers);
      _server = (await api.getServersV2())
          .firstWhere((server) => server.clientIdentifier == serverId);
      setRefreshTimer();
    }
  }

  Future refreshServer() async {
    if (needsRefresh) {
      if (prefs == null) prefs = await SharedPreferences.getInstance();
      String serverId = prefs.getString(SharedPrefStrings.PLEX_SERVER);
      _server = (await _server.api.getServersV2()).firstWhere(
          (server) => server.clientIdentifier == serverId,
          orElse: () => null);
      if (_server != null) needsRefresh = false;
    }
  }

  Future<List<PlexMediaItem>> getRecentlyAdded() async {
    await refreshServer();
    return (await _server.getRecentlyAdded(_libraryKey))
        .map((album) => PlexMediaItem.fromPlexAlbum(album, _server))
        .toList();
  }

  Future<List<PlexMediaItem>> getRecentPlayed() async {
    await refreshServer();
    List<PlexMediaItem> items = (await _server.getRecentlyViewed(_libraryKey))
        .map((album) => PlexMediaItem.fromPlexAlbum(album, _server))
        .toList();
    return (await Future.wait<PlexAlbum>(
            items.map((item) => _server.getAlbumFromKey(item.key))))
        .map((album) => PlexMediaItem.fromPlexAlbum(album, _server))
        .toList();
  }

  Future<List<PlexMediaItem>> getAllBooks() async {
    await refreshServer();
    return (await _server.getAllAlbums(_libraryKey))
        .map((album) => PlexMediaItem.fromPlexAlbum(album, _server))
        .toList();
  }

  Future<List<PlexMediaItem>> getAuthors() async {
    await refreshServer();
    return (await _server.getArtists(_libraryKey))
        .map((artist) => PlexMediaItem.fromPlexArtist(artist, _server))
        .toList();
  }

  Future<List<PlexMediaItem>> getBooksFromAuthor(String authorId) async {
    await refreshServer();
    return (await _server.getAlbumsFromArtist(authorId))
        .map((album) => PlexMediaItem.fromPlexAlbum(album, _server))
        .toList();
  }

  Future<List<PlexMediaItem>> getCollections() async {
    await refreshServer();
    return (await _server.getCollections(_libraryKey))
        .map((collection) =>
            PlexMediaItem.fromPlexCollection(collection, _server))
        .toList();
  }

  Future<List<PlexMediaItem>> getBooksFromCollection(
      String collectionId) async {
    await refreshServer();
    return (await _server.getAlbumsFromCollection(_libraryKey, collectionId))
        .map((album) => PlexMediaItem.fromPlexAlbum(album, _server))
        .toList();
  }

  Future<List<PlexMediaItem>> search(String search) async {
    await refreshServer();
    return (await _server.searchAlbums(_libraryKey, search))
        ?.map((album) => PlexMediaItem.fromPlexAlbum(album, _server))
        ?.toList();
  }

  Future<PlexMediaItem> getAlbumFromId(String mediaId) async {
    await refreshServer();
    return PlexMediaItem.fromPlexAlbum(
        await _server.getAlbumFromKey(mediaId), _server);
  }

  Future savePosition(
      String mediaId, int position, int duration, dynamic state) async {
    await refreshServer();
    return await _server.savePosition(
        mediaId, position, duration, state as PlexPlaybackState);
  }

  Future<List<PlexMediaItem>> getTracksForBook(String bookId) async {
    await refreshServer();
    return (await _server.getTracks(bookId))
        .map((track) => PlexMediaItem.fromPlexTrack(track, _server))
        .toList();
  }

  void stopRefresh() {
    if (_refreshServer != null) _refreshServer.cancel();
  }
}
