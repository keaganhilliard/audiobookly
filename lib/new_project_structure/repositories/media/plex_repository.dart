import 'dart:async';
import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/core/models/library.dart';
import 'package:audiobookly/core/models/plex_media_item.dart';
import 'package:audiobookly/core/models/user.dart';
import 'package:audiobookly/new_project_structure/repositories/media/media_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:plex_api/plex_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info/device_info.dart';
import 'dart:io';

class ServerAndLibrary {
  PlexServerV2 server;
  String library;

  ServerAndLibrary(this.server, this.library);
}

class PlexRepository extends MediaRepository {
  PlexServerV2 _server;
  String _libraryKey;
  Timer _refreshServer;
  bool needsRefresh = false;
  SharedPreferences prefs;

  PlexRepository({PlexServerV2 server, String libraryKey})
      : _server = server,
        _libraryKey = libraryKey {
    setRefreshTimer();
  }

  void setRefreshTimer() {
    _refreshServer = Timer.periodic(Duration(minutes: 1), (timer) {
      needsRefresh = true;
      _refreshServer.cancel();
    });
  }

  Future<PlexServerV2> get server async {
    await refreshServer();
    return _server;
  }

  Future<ServerAndLibrary> get serverAndLibrary async =>
      ServerAndLibrary(await server, _libraryKey);

  String get libraryKey => _libraryKey;

  String getServerUrl(String path) {
    return _server.getUrlWithToken(path);
  }

  String getThumbnailUrl(String path) {
    return _server.getThumbnailUrl(path);
  }

  Future getServerAndLibrary() async {
    if (_server == null || _libraryKey == null) {
      prefs = await SharedPreferences.getInstance();
      String authToken = prefs.getString(SharedPrefStrings.PLEX_TOKEN);
      String serverId = prefs.getString(SharedPrefStrings.PLEX_SERVER);
      _libraryKey = prefs.getString(SharedPrefStrings.PLEX_LIBRARY);
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      PlexHeaders headers;

      if (kIsWeb || Platform.isWindows) {
        headers = PlexHeaders(
          clientIdentifier: 'AUDIOBOOKLY_WEB',
          device: 'WEB',
          product: 'Audiobookly',
          platform: 'Chrome',
          platformVersion: 'UNKOWN',
          token: authToken,
        );
      } else if (Platform.isAndroid) {
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
      setRefreshTimer();
    }
  }

  Future<List<PlexMediaItem>> getRecentlyAdded() async {
    await refreshServer();
    return (await _server.getRecentlyAdded(_libraryKey))
        .map((album) => PlexMediaItem.fromPlexAlbum(album, _server))
        .toList();
  }

  Future<List<PlexMediaItem>> getRecentlyPlayed() async {
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

  Future savePosition(String mediaId, int position, int duration,
      AudiobooklyPlaybackState state) async {
    await refreshServer();
    return await _server.savePosition(
        mediaId,
        position,
        duration,
        {
          AudiobooklyPlaybackState.BUFFERING: PlexPlaybackState.BUFFERING,
          AudiobooklyPlaybackState.COMPLETED: PlexPlaybackState.STOPPED,
          AudiobooklyPlaybackState.PAUSED: PlexPlaybackState.PAUSED,
          AudiobooklyPlaybackState.STOPPED: PlexPlaybackState.STOPPED,
          AudiobooklyPlaybackState.PLAYING: PlexPlaybackState.PLAYING
        }[state]);
  }

  Future playbackStarted(String key, Duration position, Duration duration,
      double playbackRate) async {}
  Future playbackCheckin(String key, Duration position, Duration duration,
      double playbackRate, AudiobooklyEvent event) async {}
  Future playbackStopped(String key, Duration position, Duration duration,
      double playbackRate) async {}

  Future<List<PlexMediaItem>> getTracksForBook(String bookId) async {
    await refreshServer();
    return (await _server.getTracks(bookId))
        .map((track) => PlexMediaItem.fromPlexTrack(track, _server))
        .toList();
  }

  Future<User> getUser() async {
    await refreshServer();
    PlexUser u = await _server.getUser();
    print(u.toJson());
    return User(name: u.title, userName: u.username, thumb: u.thumb);
  }

  Future<String> getLoginUrl() async {
    PlexPin pin = await _server.api.getPin();
    return _server.api.getOauthUrl(pin.code);
  }

  Future<List<Library>> getLibraries() async {
    await refreshServer();
    final libraries = await _server.getLibraries();
    return libraries.map((lib) => Library(lib.key, lib.title)).toList();
  }

  Future logout() {}

  void stopRefresh() {
    if (_refreshServer != null) _refreshServer.cancel();
  }
}
