import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/core/models/library.dart';

abstract class ServerCommunicator {
  Future<List<MediaItem>> getChildren(String parentMediaId) async {
    var pieces = parentMediaId.split('/');
    switch (pieces[0]) {
      case AudioService.MEDIA_ROOT_ID:
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
  Future<MediaItem> getAlbumFromId(String mediaId);
  Future savePosition(String key, int position, int duration, dynamic state);
}
