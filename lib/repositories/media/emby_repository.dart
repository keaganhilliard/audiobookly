import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/models/book.dart';
import 'package:audiobookly/models/library.dart';
import 'package:audiobookly/models/track.dart';
import 'package:audiobookly/models/user.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:audiobookly/singletons.dart';
import 'package:emby_api/emby_api.dart';
import 'package:audiobookly/utils/utils.dart';

List<MediaItem> getItemsFromEmbyItems(
    List<EmbyItem> embyItems, EmbyRepository repo) {
  return List<MediaItem>.from(
    embyItems.map<MediaItem>(
      (item) => Utils.mediaItemfromEmbyItem(
        item,
        repo,
      ),
    ),
  );
}

Book embyItemToBook(EmbyItem item, EmbyRepository repo) {
  return Book(
    id: item.id!,
    title: item.name!,
    author: item.albumArtist!,
    narrator: Utils.getNarrator(item) ?? '',
    description: item.overview ?? '',
    artPath: repo.getThumbnailUrl(item.id),
    duration: item.runTimeTicks != null
        ? Duration(
            microseconds: (item.runTimeTicks! / 10).roundToDouble().toInt())
        : Duration.zero,
    lastPlayedPosition: item.userData!.playbackPositionTicks != null
        ? Duration(
            microseconds: (item.userData!.playbackPositionTicks! / 10)
                .roundToDouble()
                .toInt())
        : Duration.zero,
    read: (item.userData?.played ?? false),
  );
}

List<Book> getBooksFromEmbyItems(
    List<EmbyItem> embyItems, EmbyRepository repo) {
  return List<Book>.from(
    embyItems.map<Book>(
      (item) => embyItemToBook(
        item,
        repo,
      ),
    ),
  );
}

List<Track> getTracksFromEmbyItems(
    List<EmbyItem> embyItems, EmbyRepository repo) {
  return List<Track>.from(
    embyItems.map<Track>(
      (item) => embyItemToTrack(
        item,
        repo,
      ),
    ),
  );
}

Track embyItemToTrack(EmbyItem item, EmbyRepository repo) {
  return Track(
    id: item.id!,
    title: item.name!,
    duration: item.runTimeTicks != null
        ? Duration(
            microseconds: (item.runTimeTicks! / 10).roundToDouble().toInt())
        : Duration.zero,
    downloadProgress: 0,
    isDownloaded: false,
    downloadPath: '',
    bookId: item.albumId!,
    downloadTaskId: '',
    downloadTaskStatus: 0,
  );
}

class EmbyRepository extends MediaRepository {
  final EmbyApi _api;
  String _libraryId;
  final DatabaseService _db = getIt();

  EmbyRepository(this._api, this._libraryId);

  @override
  Future<List<Book>> getRecentlyAdded() async {
    return getBooksFromEmbyItems(
      (await _api.getRecentlyAdded(_libraryId)),
      this,
    );
  }

  @override
  Future<List<Book>> getRecentlyPlayed() async {
    return getBooksFromEmbyItems(
      (await _api.getRecentlyPlayed(_libraryId)),
      this,
    );
  }

  @override
  Future<List<Book>> getAllBooks([int? page]) async {
    return getBooksFromEmbyItems(
      (await _api.getAll(_libraryId)),
      this,
    );
  }

  @override
  Future<List<MediaItem>> getAuthors() async {
    return getItemsFromEmbyItems(
      (await _api.getAuthors(_libraryId)),
      this,
    );
  }

  @override
  Future<List<Book>> getDownloads() async {
    return (await _db.getBooks().first).toList();
  }

  @override
  Future<List<Book>> getBooksFromAuthor(String authorId) async {
    return getBooksFromEmbyItems(
      (await _api.getItemsForAuthor(authorId)),
      this,
    );
  }

  @override
  Future<List<MediaItem>> getCollections() async {
    return getItemsFromEmbyItems(
      (await _api.getCollections(_libraryId)),
      this,
    );
  }

  @override
  Future<List<Book>> getBooksFromCollection(String collectionId) async {
    return getBooksFromEmbyItems(
      (await _api.getItemsForCollection(collectionId)),
      this,
    );
  }

  @override
  Future<List<MediaItem>> search(String search) async {
    return getItemsFromEmbyItems(
      (await _api.search(_libraryId, search)),
      this,
    );
  }

  @override
  Future<List<Library>> getLibraries() async {
    final libraries = await _api.getLibraries();
    return libraries
        .where((library) => library.collectionType == 'audiobooks')
        .map((library) => Library(library.id, library.name))
        .toList();
  }

  @override
  Future<List<Track>> getTracksForBook(String bookId) async {
    return getTracksFromEmbyItems(
      (await _api.getItemsForAlbum(bookId)),
      this,
    );
  }

  @override
  Future<Book> getAlbumFromId(String? mediaId) async {
    return embyItemToBook((await _api.getItem(mediaId!)), this);
  }

  @override
  Future<User> getUser() async {
    EmbyUser u = await _api.getUser();
    return User(userName: u.connectUserName, name: u.name);
  }

  @override
  Future<String> getLoginUrl() async {
    return '';
  }

  @override
  Future savePosition(
      String key, int position, int duration, dynamic state) async {
//    throw UnimplementedError();
  }

  @override
  Future playbackStarted(String key, Duration position, Duration duration,
      double playbackRate) async {
    await _api.playbackStarted(key, position, duration, playbackRate);
  }

  @override
  Future playbackCheckin(String key, Duration position, Duration duration,
      double playbackRate, AudiobooklyEvent event, bool playing) async {
    final book = await _db.getBookById(key);
    if (book != null) {
      await _db.insertBook(book.copyWith(lastPlayedPosition: position));
    }
    await _api.playbackCheckin(
      key,
      position,
      duration,
      {
        AudiobooklyEvent.timeUpdate: EmbyEvent.TimeUpdate,
        AudiobooklyEvent.pause: EmbyEvent.Pause,
        AudiobooklyEvent.unpause: EmbyEvent.Unpause,
        AudiobooklyEvent.playbackRateChange: EmbyEvent.PlaybackRateChange,
      }[event]!,
      playbackRate,
      !playing,
    );
  }

  @override
  Future playbackFinished(String key) async {
    final book = await _db.getBookById(key);
    if (book != null) {
      await _db.insertBook(book.copyWith(
        lastPlayedPosition: Duration.zero,
        read: true,
      ));
    }
  }

  @override
  Future playbackStopped(String key, Duration position, Duration duration,
      double playbackRate) async {}

  @override
  Future getServerAndLibrary() async {
    // this._libraryId =
  }

  @override
  void setLibraryId(String libraryId) {
    _libraryId = libraryId;
  }

  @override
  String getServerUrl(String path) {
    return _api.getServerUrl(path);
  }

  @override
  String getDownloadUrl(String path) {
    return _api.getDownloadUrl(path);
  }

  @override
  String getThumbnailUrl(String? path, {int? height, int? width}) {
    return _api.getThumbnailUrl(path!, height: height, width: width);
  }

  Future logout() async {}

  @override
  Future markPlayed(String itemId) async {
    final book = await _db.getBookById(itemId);
    if (book != null) {
      _db.insertBook(
          book.copyWith(read: true, lastPlayedPosition: Duration.zero));
    } else {
      final album = await getAlbumFromId(itemId);
      _db.insertBook(album.copyWith(
        read: true,
        lastPlayedPosition: Duration.zero,
      ));
    }
    return _api.markPlayed(itemId);
  }

  @override
  Future markUnplayed(String itemId) async {
    final book = await _db.getBookById(itemId);
    if (book != null) {
      _db.insertBook(book.copyWith(read: false));
    } else {
      final album = await getAlbumFromId(itemId);
      _db.insertBook(album.copyWith(read: false));
    }
    return _api.markUnplayed(itemId);
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
}
