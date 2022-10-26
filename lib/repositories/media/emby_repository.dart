import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/models/download_status.dart';
import 'package:audiobookly/models/library.dart';
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

class EmbyRepository extends MediaRepository {
  final EmbyApi _api;
  String _libraryId;
  final DatabaseService _db = getIt();

  EmbyRepository(this._api, this._libraryId);

  @override
  Future<List<MediaItem>> getRecentlyAdded() async {
    return getItemsFromEmbyItems(
      (await _api.getRecentlyAdded(_libraryId)),
      this,
    );
  }

  @override
  Future<List<MediaItem>> getRecentlyPlayed() async {
    print('Calling get recently played');
    return getItemsFromEmbyItems(
      (await _api.getRecentlyPlayed(_libraryId)),
      this,
    );
  }

  @override
  Future<List<MediaItem>> getAllBooks() async {
    return getItemsFromEmbyItems(
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
  Future<List<MediaItem>> getDownloads() async {
    return (await _db.getBooks().first)
        .map((book) => MediaHelpers.fromBook(book))
        .toList();
  }

  @override
  Future<List<MediaItem>> getBooksFromAuthor(String authorId) async {
    return getItemsFromEmbyItems(
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
  Future<List<MediaItem>> getBooksFromCollection(String collectionId) async {
    return getItemsFromEmbyItems(
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
  Future<List<MediaItem>> getTracksForBook(String bookId) async {
    return getItemsFromEmbyItems(
      (await _api.getItemsForAlbum(bookId)),
      this,
    );
  }

  @override
  Future<MediaItem> getAlbumFromId(String? mediaId) async {
    return Utils.mediaItemfromEmbyItem((await _api.getItem(mediaId!)), this);
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
      print('Saving place :)');
      await _db.insertBook(book.copyWith(lastPlayedPosition: position));
    }
    await _api.playbackCheckin(
      key,
      position,
      duration,
      {
        AudiobooklyEvent.TimeUpdate: EmbyEvent.TimeUpdate,
        AudiobooklyEvent.Pause: EmbyEvent.Pause,
        AudiobooklyEvent.Unpause: EmbyEvent.Unpause,
        AudiobooklyEvent.PlaybackRateChange: EmbyEvent.PlaybackRateChange,
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
      _db.insertBook(
          _db.getBookFromMediaItem(album, DownloadStatus.none).copyWith(
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
      _db.insertBook(_db
          .getBookFromMediaItem(album, DownloadStatus.none)
          .copyWith(read: false));
    }
    return _api.markUnplayed(itemId);
  }

  @override
  Future<List<MediaItem>> getBooksFromSeries(String seriesId) {
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
