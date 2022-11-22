import 'dart:async';
import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/models/book.dart';
import 'package:audiobookly/models/library.dart';
import 'package:audiobookly/models/model_union.dart';
import 'package:audiobookly/models/plex_media_item.dart';
import 'package:audiobookly/models/preferences.dart';
import 'package:audiobookly/models/track.dart';
import 'package:audiobookly/models/user.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:collection/collection.dart' show IterableExtension;
import 'package:plex_api/plex_api.dart';

class ServerAndLibrary {
  PlexServer? server;
  String? library;

  ServerAndLibrary(this.server, this.library);
}

class PlexRepository extends MediaRepository {
  final PlexApi _api;
  PlexServer? _server;
  String? _serverKey;
  String? _libraryKey;
  Timer? _refreshServer;
  bool needsRefresh = false;
  final Preferences _prefs;

  PlexRepository({
    required PlexApi api,
    required Preferences prefs,
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
    _refreshServer = Timer.periodic(const Duration(minutes: 1), (timer) {
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

  @override
  String getServerUrl(String path) {
    return _server!.getUrlWithToken(path);
  }

  @override
  String getThumbnailUrl(
    String? path, {
    int? height,
    int? width,
  }) {
    return _server!.getThumbnailUrl(path!).toString();
  }

  Completer? raceCondition;

  @override
  Future getServerAndLibrary() async {
    if (raceCondition != null) await raceCondition!.future;
    _serverKey ??= _prefs.serverId;
    _libraryKey ??= _prefs.libraryId;
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
      _serverKey = _prefs.serverId;
      _server = (await _api.getServers())
          .firstWhereOrNull((server) => server.clientIdentifier == _serverKey);
      if (_server != null) needsRefresh = false;
      setRefreshTimer();
    }
  }

  Book bookFromPlexAlbum(PlexAlbum album, PlexServer server) => Book(
        id: album.ratingKey!,
        title: album.title!,
        author: album.parentTitle ?? '',
        narrator: '',
        artPath: server.getThumbnailUrl(album.thumb ?? '').toString(),
        description: album.summary ?? '',
        duration: Duration.zero,
        read: false,
        lastPlayedPosition: album.viewOffset == null
            ? Duration.zero
            : Duration(milliseconds: album.viewOffset!),
        largeArtPath: server.getThumbnailUrl(album.thumb ?? '', 600).toString(),
      );

  Track trackFromPlexTrack(PlexTrack track, PlexServer server) => Track(
        id: track.key!,
        title: track.title ?? '',
        duration: track.duration == null
            ? Duration.zero
            : Duration(milliseconds: track.duration!),
        downloadProgress: 0,
        isDownloaded: false,
        downloadPath: '',
        bookId: track.parentRatingKey ?? '',
        downloadTaskId: '',
        downloadTaskStatus: 0,
      );

  @override
  Future<List<Book>> getRecentlyAdded() async {
    await refreshServer();
    return (await _server!.getRecentlyAdded(_libraryKey!))!
        .map((album) => bookFromPlexAlbum(album, _server!))
        .toList();
  }

  @override
  Future<List<Book>> getRecentlyPlayed() async {
    await refreshServer();
    List<Book> items = (await _server!.getRecentlyViewed(_libraryKey!))
        .map((album) => bookFromPlexAlbum(album, _server!))
        .toList();
    return (await Future.wait<PlexAlbum>(
            items.map((item) => _server!.getAlbumFromKey(item.id))))
        .map((album) => bookFromPlexAlbum(album, _server!))
        .toList();
  }

  @override
  Future<List<Book>> getDownloads() async {
    return [];
  }

  @override
  Future<List<Book>> getAllBooks([int? page]) async {
    await refreshServer();
    return (await _server!.getAllAlbums(_libraryKey!))!
        .map((album) => bookFromPlexAlbum(album, _server!))
        .toList();
  }

  @override
  Future<List<PlexMediaItem>> getAuthors() async {
    await refreshServer();
    return (await _server!.getArtists(_libraryKey!))!
        .map((artist) => PlexMediaItem.fromPlexArtist(artist, _server!))
        .toList();
  }

  @override
  Future<List<Book>> getBooksFromAuthor(String authorId) async {
    await refreshServer();
    return (await _server!.getAlbumsFromArtist(authorId))!
        .map((album) => bookFromPlexAlbum(album, _server!))
        .toList();
  }

  @override
  Future<List<PlexMediaItem>> getCollections() async {
    await refreshServer();
    return (await _server!.getCollections(_libraryKey!))!
        .map((collection) =>
            PlexMediaItem.fromPlexCollection(collection, _server))
        .toList();
  }

  @override
  Future<List<Book>> getBooksFromCollection(String collectionId) async {
    await refreshServer();
    return (await _server!.getAlbumsFromCollection(_libraryKey!, collectionId))!
        .map((album) => bookFromPlexAlbum(album, _server!))
        .toList();
  }

  @override
  Future<List<PlexMediaItem>> search(String search) async {
    await refreshServer();
    return (await _server!.searchAlbums(_libraryKey!, search))
        .map((album) => PlexMediaItem.fromPlexAlbum(album, _server!))
        .toList();
  }

  @override
  Future<Book> getAlbumFromId(String? mediaId) async {
    await refreshServer();
    final item =
        bookFromPlexAlbum(await _server!.getAlbumFromKey(mediaId!), _server!);

    return item;
  }

  @override
  Future savePosition(
    String key,
    int position,
    int duration,
    AudiobooklyPlaybackState state,
  ) async {
    await refreshServer();
    return await _server!.savePosition(
        key,
        position,
        duration,
        {
          AudiobooklyPlaybackState.buffering: PlexPlaybackState.BUFFERING,
          AudiobooklyPlaybackState.completed: PlexPlaybackState.STOPPED,
          AudiobooklyPlaybackState.paused: PlexPlaybackState.PAUSED,
          AudiobooklyPlaybackState.stopped: PlexPlaybackState.STOPPED,
          AudiobooklyPlaybackState.playing: PlexPlaybackState.PLAYING
        }[state]!);
  }

  @override
  Future playbackStarted(
    String? key,
    Duration position,
    Duration duration,
    double playbackRate,
  ) async {}

  @override
  Future playbackCheckin(
    String? key,
    Duration position,
    Duration duration,
    double playbackRate,
    AudiobooklyEvent event,
    bool playing,
  ) async {}

  @override
  Future playbackFinished(String key) async {}

  @override
  Future playbackStopped(
    String key,
    Duration position,
    Duration duration,
    double playbackRate,
  ) async {}

  @override
  Future<List<Track>> getTracksForBook(String bookId) async {
    await refreshServer();
    return (await _server!.getTracks(bookId))!
        .map((track) => trackFromPlexTrack(track, _server!))
        .toList();
  }

  @override
  Future<User> getUser() async {
    await refreshServer();
    PlexUser? u = await (_server!.getUser());
    return User(name: u?.title, userName: u?.username, thumb: u?.thumb);
  }

  @override
  Future<String> getLoginUrl() async {
    PlexPin pin = await _server!.api!.getPin();
    return _server!.api!.getOauthUrl(pin.code!);
  }

  @override
  Future<List<Library>> getLibraries() async {
    await refreshServer();
    final libraries = await (_server!.getLibraries());
    return libraries?.map((lib) => Library(lib.key, lib.title)).toList() ?? [];
  }

  Future logout() async {}

  void stopRefresh() {
    if (_refreshServer != null) _refreshServer!.cancel();
  }

  @override
  Future markPlayed(String itemId) async {}

  @override
  Future markUnplayed(String itemId) async {}

  @override
  String getDownloadUrl(String path) {
    return '${getServerUrl(path)}&download=1';
  }

  @override
  Future<List<Book>> getBooksFromSeries(String seriesId) {
    // TODO: implement getBooksFromSeries
    throw UnimplementedError();
  }

  @override
  Future<List<MediaItem>> getSeries() {
    // TODO: implement getSeries
    throw UnimplementedError();
  }

  @override
  Future addToCollection(String collectionId, String mediaId) {
    // TODO: implement addToCollection
    throw UnimplementedError();
  }

  @override
  Future<Map<String, List<ModelUnion>>> getHomeData() async {
    return {
      'Continue Listening': [
        for (final book in (await getRecentlyPlayed())) ModelUnion.book(book),
      ],
      'Recently Added': [
        for (final book in (await getRecentlyAdded())) ModelUnion.book(book),
      ]
    };
  }
}
