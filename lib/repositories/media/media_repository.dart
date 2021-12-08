import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/constants/app_constants.dart';
import 'package:audiobookly/models/library.dart';
import 'package:audiobookly/models/user.dart';

enum AudiobooklyPlaybackState {
  PLAYING,
  PAUSED,
  STOPPED,
  COMPLETED,
  BUFFERING,
}

enum AudiobooklyEvent { TimeUpdate, Pause, Unpause, PlaybackRateChange, Stop }

abstract class MediaRepository {
  MediaRepository([this.enableSeries = false]);
  final bool enableSeries;

  Future<List<MediaItem>> getChildren(String parentMediaId) async {
    var pieces = parentMediaId.split('/');
    print('Parent media id! $parentMediaId');
    switch (pieces[0]) {
      case AudioService.browsableRootId:
        var items = <MediaItem>[
          const MediaItem(
            id: MediaIds.DOWNLOADS,
            title: 'Downloads',
            playable: false,
          ),
          const MediaItem(
            id: MediaIds.RECENTLY_PLAYED,
            title: 'In Progress',
            playable: false,
          ),
          const MediaItem(
            id: MediaIds.RECENTLY_ADDED,
            title: 'Recently Added',
            playable: false,
          ),
          const MediaItem(
            id: MediaIds.AUTHORS_ID,
            title: 'Authors',
            playable: false,
          ),
          const MediaItem(
            id: MediaIds.BOOKS_ID,
            title: 'All Books',
            playable: false,
          ),
          if (enableSeries)
            const MediaItem(
              id: MediaIds.SERIES_ID,
              title: 'Series',
              playable: false,
            ),
          const MediaItem(
            id: MediaIds.COLLECTIONS_ID,
            title: 'Collections',
            playable: false,
          ),
        ];
        return await Future.value(items);
      case AudioService.recentRootId:
        return (await getRecentlyPlayed()).take(1).toList();
      case MediaIds.AUTHORS_ID:
        if (pieces.length > 1) {
          return await getBooksFromAuthor(pieces[1]);
        } else {
          return getAuthors();
        }
      case MediaIds.BOOKS_ID:
        return getAllBooks();
      case MediaIds.DOWNLOADS:
        return getDownloads();
      case MediaIds.COLLECTIONS_ID:
        if (pieces.length > 1) {
          return await getBooksFromCollection(pieces[1]);
        } else {
          return await getCollections();
        }
      case MediaIds.SERIES_ID:
        if (pieces.length > 1) {
          return await getBooksFromSeries(pieces[1]);
        } else {
          return await getSeries();
        }
      case MediaIds.RECENTLY_PLAYED:
        return await getRecentlyPlayed();
      case MediaIds.RECENTLY_ADDED:
        return await getRecentlyAdded();
      default:
        return Future.value(<MediaItem>[]);
    }
  }

  Future<List<MediaItem>> getRecentlyAdded();
  Future<List<MediaItem>> getDownloads();
  Future<List<MediaItem>> getRecentlyPlayed();
  Future<List<MediaItem>> getAllBooks();
  Future<List<MediaItem>> getAuthors();
  Future<List<MediaItem>> getBooksFromAuthor(String authorId);
  Future<List<MediaItem>> getCollections();
  Future<List<MediaItem>> getBooksFromCollection(String collectionId);
  Future<List<MediaItem>> getSeries();
  Future<List<MediaItem>> getBooksFromSeries(String seriesId);
  Future<List<MediaItem>> search(String search);
  Future<List<Library>> getLibraries();
  Future<List<MediaItem>> getTracksForBook(MediaItem book);
  Future<MediaItem> getAlbumFromId(String? mediaId);
  Future<User> getUser();
  Future<String> getLoginUrl();
  Future savePosition(
      String key, int position, int duration, AudiobooklyPlaybackState state);
  Future playbackStarted(
      String key, Duration position, Duration duration, double playbackRate);
  Future playbackCheckin(String key, Duration position, Duration duration,
      double playbackRate, AudiobooklyEvent event, bool playing);
  Future playbackStopped(
      String key, Duration position, Duration duration, double playbackRate);
  Future getServerAndLibrary();
  Future markPlayed(String itemId);
  Future markUnplayed(String itemId);
  Future addToCollection(String collectionId, String mediaId);
  String getServerUrl(String path);
  String getThumbnailUrl(
    String? path, {
    int? height,
    int? width,
  });
  Future playbackFinished(String key);
  String getDownloadUrl(String path);
  void setLibraryId(String libraryId) {}
}
