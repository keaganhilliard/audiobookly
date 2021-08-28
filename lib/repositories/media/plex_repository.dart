import 'dart:async';
import 'package:audiobookly/models/library.dart';
import 'package:audiobookly/models/plex_media_item.dart';
import 'package:audiobookly/models/user.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/services/shared_preferences/shared_preferences_service.dart';
import 'package:collection/collection.dart' show IterableExtension;
import 'package:plex_api/plex_api.dart';

class ServerAndLibrary {
  PlexServer? server;
  String? library;

  ServerAndLibrary(this.server, this.library);
}

class PlexRepository extends MediaRepository {
  PlexApi _api;
  PlexServer? _server;
  String? _serverKey;
  String? _libraryKey;
  Timer? _refreshServer;
  bool needsRefresh = false;
  SharedPreferencesService _prefs;

  PlexRepository({
    required PlexApi api,
    required SharedPreferencesService prefs,
    PlexServer? server,
    String? serverKey,
    String? libraryKey,
  })  : _api = api,
        _serverKey = serverKey,
        _server = server,
        _prefs = prefs,
        _libraryKey = libraryKey {
    setRefreshTimer();
  }

  void setRefreshTimer() {
    _refreshServer = Timer.periodic(Duration(minutes: 1), (timer) {
      needsRefresh = true;
      _refreshServer!.cancel();
    });
  }

  Future<PlexServer?> get server async {
    await refreshServer();
    return _server;
  }

  Future<ServerAndLibrary> get serverAndLibrary async =>
      ServerAndLibrary(await server, _libraryKey);

  String? get libraryKey => _libraryKey;

  String getServerUrl(String path) {
    return _server!.getUrlWithToken(path);
  }

  String getThumbnailUrl(String? path) {
    return _server!.getThumbnailUrl(path!).toString();
  }

  Completer? raceCondition;

  Future getServerAndLibrary() async {
    if (raceCondition != null) await raceCondition!.future;
    if (_serverKey == null) _serverKey = _prefs.getServerId();
    if (_libraryKey == null) _libraryKey = _prefs.getLibraryId();
    if (_server == null) {
      raceCondition = Completer();
      _server = (await _api.getServers())
          .firstWhere((server) => server.clientIdentifier == _serverKey);
      raceCondition!.complete();
      setRefreshTimer();
    }
    raceCondition = null;
  }

  Future refreshServer() async {
    if (needsRefresh || _server == null) {
      _serverKey = _prefs.getServerId();
      _server = (await _api.getServers())
          .firstWhereOrNull((server) => server.clientIdentifier == _serverKey);
      if (_server != null) needsRefresh = false;
      setRefreshTimer();
    }
  }

  Future<List<PlexMediaItem>> getRecentlyAdded() async {
    await refreshServer();
    return (await _server!.getRecentlyAdded(_libraryKey!))!
        .map((album) => PlexMediaItem.fromPlexAlbum(album, _server!))
        .toList();
  }

  Future<List<PlexMediaItem>> getRecentlyPlayed() async {
    await refreshServer();
    List<PlexMediaItem> items = (await _server!.getRecentlyViewed(_libraryKey!))
        .map((album) => PlexMediaItem.fromPlexAlbum(album, _server!))
        .toList();
    return (await Future.wait<PlexAlbum>(
            items.map((item) => _server!.getAlbumFromKey(item.key!))))
        .map((album) => PlexMediaItem.fromPlexAlbum(album, _server!))
        .toList();
  }

  Future<List<PlexMediaItem>> getDownloads() async {
    return [];
  }

  Future<List<PlexMediaItem>> getAllBooks() async {
    await refreshServer();
    return (await _server!.getAllAlbums(_libraryKey!))!
        .map((album) => PlexMediaItem.fromPlexAlbum(album, _server!))
        .toList();
  }

  Future<List<PlexMediaItem>> getAuthors() async {
    await refreshServer();
    return (await _server!.getArtists(_libraryKey!))!
        .map((artist) => PlexMediaItem.fromPlexArtist(artist, _server!))
        .toList();
  }

  Future<List<PlexMediaItem>> getBooksFromAuthor(String authorId) async {
    await refreshServer();
    return (await _server!.getAlbumsFromArtist(authorId))!
        .map((album) => PlexMediaItem.fromPlexAlbum(album, _server!))
        .toList();
  }

  Future<List<PlexMediaItem>> getCollections() async {
    await refreshServer();
    return (await _server!.getCollections(_libraryKey!))!
        .map((collection) =>
            PlexMediaItem.fromPlexCollection(collection, _server))
        .toList();
  }

  Future<List<PlexMediaItem>> getBooksFromCollection(
      String collectionId) async {
    await refreshServer();
    return (await _server!.getAlbumsFromCollection(_libraryKey!, collectionId))!
        .map((album) => PlexMediaItem.fromPlexAlbum(album, _server!))
        .toList();
  }

  Future<List<PlexMediaItem>> search(String search) async {
    await refreshServer();
    return (await _server!.searchAlbums(_libraryKey!, search))
        .map((album) => PlexMediaItem.fromPlexAlbum(album, _server!))
        .toList();
  }

  Future<PlexMediaItem> getAlbumFromId(String? mediaId) async {
    await refreshServer();
    return PlexMediaItem.fromPlexAlbum(
        await _server!.getAlbumFromKey(mediaId!), _server!);
  }

  Future savePosition(
    String mediaId,
    int position,
    int duration,
    AudiobooklyPlaybackState state,
  ) async {
    await refreshServer();
    return await _server!.savePosition(
        mediaId,
        position,
        duration,
        {
          AudiobooklyPlaybackState.BUFFERING: PlexPlaybackState.BUFFERING,
          AudiobooklyPlaybackState.COMPLETED: PlexPlaybackState.STOPPED,
          AudiobooklyPlaybackState.PAUSED: PlexPlaybackState.PAUSED,
          AudiobooklyPlaybackState.STOPPED: PlexPlaybackState.STOPPED,
          AudiobooklyPlaybackState.PLAYING: PlexPlaybackState.PLAYING
        }[state]!);
  }

  Future playbackStarted(
    String? key,
    Duration position,
    Duration duration,
    double playbackRate,
  ) async {}

  Future playbackCheckin(
    String? key,
    Duration position,
    Duration duration,
    double playbackRate,
    AudiobooklyEvent event,
    bool playing,
  ) async {}

  Future playbackFinished(String key) async {}

  Future playbackStopped(
    String key,
    Duration position,
    Duration duration,
    double playbackRate,
  ) async {}

  Future<List<PlexMediaItem>> getTracksForBook(String? bookId) async {
    await refreshServer();
    return (await _server!.getTracks(bookId!))!
        .map((track) => PlexMediaItem.fromPlexTrack(track, _server!))
        .toList();
  }

  Future<User> getUser() async {
    await refreshServer();
    PlexUser? u = await (_server!.getUser());
    print(u?.toJson());
    return User(name: u?.title, userName: u?.username, thumb: u?.thumb);
  }

  Future<String> getLoginUrl() async {
    PlexPin pin = await _server!.api!.getPin();
    return _server!.api!.getOauthUrl(pin.code!);
  }

  Future<List<Library>> getLibraries() async {
    await refreshServer();
    final libraries = await (_server!.getLibraries());
    return libraries?.map((lib) => Library(lib.key, lib.title)).toList() ?? [];
  }

  Future logout() async {}

  void stopRefresh() {
    if (_refreshServer != null) _refreshServer!.cancel();
  }

  Future markPlayed(String itemId) async {}

  Future markUnplayed(String itemId) async {}

  String getDownloadUrl(String path) {
    return getServerUrl(path) + '&download=1';
  }
}
