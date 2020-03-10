import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/core/models/audiobookly_media_item.dart';
import 'package:audiobookly/core/models/library.dart';

abstract class ServerCommunicator {
  Future<List<AudiobooklyMediaItem>> getChildren(String parentMediaId) async {
    var pieces = parentMediaId.split('/');
    switch (pieces[0]) {
      case AudioService.MEDIA_ROOT_ID:
        var items = <AudiobooklyMediaItem>[
          AudiobooklyMediaItem(
            serverKey: MediaIds.RECENTLY_PLAYED,
            id: MediaIds.RECENTLY_PLAYED,
            album: '',
            title: 'In Progress',
            playable: false,
          ),
          AudiobooklyMediaItem(
            serverKey: MediaIds.RECENTLY_ADDED,
            id: MediaIds.RECENTLY_ADDED,
            album: '',
            title: 'Recently Added',
            playable: false,
          ),
          AudiobooklyMediaItem(
            serverKey: MediaIds.AUTHORS_ID,
            id: MediaIds.AUTHORS_ID,
            album: '',
            title: 'Authors',
            playable: false,
          ),
          AudiobooklyMediaItem(
            serverKey: MediaIds.BOOKS_ID,
            id: MediaIds.BOOKS_ID,
            album: '',
            title: 'All Books',
            playable: false,
          ),
          AudiobooklyMediaItem(
            serverKey: MediaIds.COLLECTIONS_ID,
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
        return Future.value(<AudiobooklyMediaItem>[]);
    }
  }

  Future<List<AudiobooklyMediaItem>> getRecentlyAdded();
  Future<List<AudiobooklyMediaItem>> getRecentPlayed();
  Future<List<AudiobooklyMediaItem>> getAllBooks();
  Future<List<AudiobooklyMediaItem>> getAuthors();
  Future<List<AudiobooklyMediaItem>> getBooksFromAuthor(String authorId);
  Future<List<AudiobooklyMediaItem>> getCollections();
  Future<List<AudiobooklyMediaItem>> getBooksFromCollection(
      String collectionId);
  Future<List<AudiobooklyMediaItem>> search(String search);
  // Future<List<Library>> getLibraries();
  Future<List<AudiobooklyMediaItem>> getTracksForBook(String bookId);
  Future<AudiobooklyMediaItem> getAlbumFromId(String mediaId);
  Future savePosition(String key, int position, int duration, dynamic state);
  Future getServerAndLibrary();
}
