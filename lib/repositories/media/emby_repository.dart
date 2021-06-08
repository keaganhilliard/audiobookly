import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/models/library.dart';
import 'package:audiobookly/models/user.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
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

  EmbyRepository(this._api, this._libraryId);

  Future<List<MediaItem>> getRecentlyAdded() async {
    return getItemsFromEmbyItems(
      (await _api.getRecentlyAdded(_libraryId)),
      this,
    );
  }

  Future<List<MediaItem>> getRecentlyPlayed() async {
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

  Future playbackStarted(String? key, Duration position, Duration duration,
      double playbackRate) async {
    await _api.playbackStarted(key!, position, duration, playbackRate);
  }

  Future playbackCheckin(String? key, Duration position, Duration duration,
      double playbackRate, AudiobooklyEvent event) async {
    print('Checking in batches: $playbackRate');
    await _api.playbackCheckin(
      key!,
      position,
      duration,
      {
        AudiobooklyEvent.TimeUpdate: EmbyEvent.TimeUpdate,
        AudiobooklyEvent.Pause: EmbyEvent.Pause,
        AudiobooklyEvent.Unpause: EmbyEvent.Unpause,
        AudiobooklyEvent.PlaybackRateChange: EmbyEvent.PlaybackRateChange,
      }[event]!,
    );
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

  String getThumbnailUrl(String? path) {
    return _api.getThumbnailUrl(path!);
  }

  Future logout() async {}

  Future markPlayed(String itemId) async {
    return _api.markPlayed(itemId);
  }

  Future markUnplayed(String itemId) async {
    return _api.markUnplayed(itemId);
  }
}
