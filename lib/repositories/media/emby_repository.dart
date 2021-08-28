import 'package:audio_service/audio_service.dart';
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
  EmbyApi _api;
  String _libraryId;
  DatabaseService _db = getIt();

  EmbyRepository(this._api, this._libraryId);

  Future<List<MediaItem>> getRecentlyAdded() async {
    return getItemsFromEmbyItems(
      (await _api.getRecentlyAdded(_libraryId)),
      this,
    );
  }

  Future<List<MediaItem>> getRecentlyPlayed() async {
    print('Calling get recently played');
    return getItemsFromEmbyItems(
      (await _api.getRecentlyPlayed(_libraryId)),
      this,
    );
  }

  Future<List<MediaItem>> getAllBooks() async {
    return getItemsFromEmbyItems(
      (await _api.getAll(_libraryId)),
      this,
    );
  }

  Future<List<MediaItem>> getAuthors() async {
    return getItemsFromEmbyItems(
      (await _api.getAuthors(_libraryId)),
      this,
    );
  }

  Future<List<MediaItem>> getDownloads() async {
    return (await _db.getBooks().first)
        .map((book) => MediaHelpers.fromBook(book))
        .toList();
  }

  Future<List<MediaItem>> getBooksFromAuthor(String authorId) async {
    return getItemsFromEmbyItems(
      (await _api.getItemsForAuthor(authorId)),
      this,
    );
  }

  Future<List<MediaItem>> getCollections() async {
    return getItemsFromEmbyItems(
      (await _api.getCollections(_libraryId)),
      this,
    );
  }

  Future<List<MediaItem>> getBooksFromCollection(String collectionId) async {
    return getItemsFromEmbyItems(
      (await _api.getItemsForCollection(collectionId)),
      this,
    );
  }

  Future<List<MediaItem>> search(String search) async {
    return getItemsFromEmbyItems(
      (await _api.search(_libraryId, search)),
      this,
    );
  }

  Future<List<Library>> getLibraries() async {
    final libraries = await _api.getLibraries();
    return libraries
        .where((library) => library.collectionType == 'audiobooks')
        .map((library) => Library(library.id, library.name))
        .toList();
  }

  Future<List<MediaItem>> getTracksForBook(String? bookId) async {
    return getItemsFromEmbyItems(
      (await _api.getItemsForAlbum(bookId!)),
      this,
    );
  }

  Future<MediaItem> getAlbumFromId(String? mediaId) async {
    return Utils.mediaItemfromEmbyItem((await _api.getItem(mediaId!)), this);
  }

  Future<User> getUser() async {
    EmbyUser u = await _api.getUser();
    return User(userName: u.connectUserName, name: u.name);
  }

  Future<String> getLoginUrl() async {
    return '';
  }

  Future savePosition(
      String key, int position, int duration, dynamic state) async {
//    throw UnimplementedError();
  }

  Future playbackStarted(String key, Duration position, Duration duration,
      double playbackRate) async {
    await _api.playbackStarted(key, position, duration, playbackRate);
  }

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

  Future playbackFinished(String key) async {
    final book = await _db.getBookById(key);
    if (book != null) {
      await _db.insertBook(book.copyWith(
        lastPlayedPosition: Duration.zero,
        read: true,
      ));
    }
  }

  Future playbackStopped(String key, Duration position, Duration duration,
      double playbackRate) async {}

  Future getServerAndLibrary() async {
    // this._libraryId =
  }

  void setLibraryId(String libraryId) {
    this._libraryId = libraryId;
  }

  String getServerUrl(String path) {
    return _api.getServerUrl(path);
  }

  String getDownloadUrl(String path) {
    return _api.getDownloadUrl(path);
  }

  String getThumbnailUrl(String? path) {
    return _api.getThumbnailUrl(path!);
  }

  Future logout() async {}

  Future markPlayed(String itemId) async {
    final book = await _db.getBookById(itemId);
    if (book != null) {
      _db.insertBook(
          book.copyWith(read: true, lastPlayedPosition: Duration.zero));
    } else {
      final album = await getAlbumFromId(itemId);
      _db.insertBook(getBook(album, false, false, false).copyWith(
        read: true,
        lastPlayedPosition: Duration.zero,
      ));
    }
    return _api.markPlayed(itemId);
  }

  Future markUnplayed(String itemId) async {
    final book = await _db.getBookById(itemId);
    if (book != null) {
      _db.insertBook(book.copyWith(read: false));
    } else {
      final album = await getAlbumFromId(itemId);
      _db.insertBook(getBook(album, false, false, false).copyWith(read: false));
    }
    return _api.markUnplayed(itemId);
  }
}
