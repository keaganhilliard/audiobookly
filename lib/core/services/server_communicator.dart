import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/core/models/user.dart';

abstract class ServerCommunicator {
  Future<List<MediaItem>> getChildren(String parentMediaId) async {
    var pieces = parentMediaId.split('/');
    print('Parent media id!');
    switch (pieces[0]) {
      case AudioService.browsableRootId:
        var items = <MediaItem>[
          MediaItem(
            id: MediaIds.RECENTLY_PLAYED,
            album: '',
            title: 'In Progress',
            playable: false,
          ),
          MediaItem(
            id: MediaIds.RECENTLY_ADDED,
            album: '',
            title: 'Recently Added',
            playable: false,
          ),
          MediaItem(
            id: MediaIds.AUTHORS_ID,
            album: '',
            title: 'Authors',
            playable: false,
          ),
          MediaItem(
            id: MediaIds.BOOKS_ID,
            album: '',
            title: 'All Books',
            playable: false,
          ),
          MediaItem(
            id: MediaIds.COLLECTIONS_ID,
            album: '',
            title: 'Collections',
            playable: false,
          ),
        ];
        return await Future.value(items);
      case AudioService.recentRootId:
        return (await getRecentPlayed()).take(1).toList();
      case MediaIds.AUTHORS_ID:
        if (pieces.length > 1) {
          return await getBooksFromAuthor(pieces[1]);
        } else {
          return getAuthors();
        }
        break;
      case MediaIds.BOOKS_ID:
        return getAllBooks();
      case MediaIds.COLLECTIONS_ID:
        if (pieces.length > 1) {
          return await getBooksFromCollection(pieces[1]);
        } else {
          return await getCollections();
        }
        break;
      case MediaIds.RECENTLY_PLAYED:
        return await getRecentPlayed();
      case MediaIds.RECENTLY_ADDED:
        return await getRecentlyAdded();
      default:
        return Future.value(<MediaItem>[]);
    }
  }

  Future<List<MediaItem>> getRecentlyAdded();
  Future<List<MediaItem>> getRecentPlayed();
  Future<List<MediaItem>> getAllBooks();
  Future<List<MediaItem>> getAuthors();
  Future<List<MediaItem>> getBooksFromAuthor(String authorId);
  Future<List<MediaItem>> getCollections();
  Future<List<MediaItem>> getBooksFromCollection(String collectionId);
  Future<List<MediaItem>> search(String search);
  // Future<List<Library>> getLibraries();
  Future<List<MediaItem>> getTracksForBook(String bookId);
  Future<MediaItem> getAlbumFromId(String mediaId);
  Future<User> getUser();
  Future<String> getLoginUrl();
  Future savePosition(String key, int position, int duration, dynamic state);
  Future getServerAndLibrary();
  String getServerUrl(String path);
  String getThumbnailUrl(String path);
}
