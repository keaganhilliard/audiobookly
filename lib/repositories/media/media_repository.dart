import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/constants/app_constants.dart';
import 'package:audiobookly/models/author.dart';
import 'package:audiobookly/models/book.dart';
import 'package:audiobookly/models/collection.dart';
import 'package:audiobookly/models/library.dart';
import 'package:audiobookly/models/model_union.dart';
import 'package:audiobookly/models/playlist.dart';
import 'package:audiobookly/models/series.dart';
import 'package:audiobookly/models/track.dart';
import 'package:audiobookly/models/user.dart';

enum AudiobooklyPlaybackState {
  playing,
  paused,
  stopped,
  completed,
  buffering,
}

enum AudiobooklyEvent { timeUpdate, pause, unpause, playbackRateChange, stop }

abstract class MediaRepository {
  MediaRepository([this.enableSeries = false]);
  final bool enableSeries;

  Future<List<MediaItem>> getChildren(String parentMediaId, [int? page]) async {
    var pieces = parentMediaId.split('/');
    switch (pieces[0]) {
      case AudioService.browsableRootId:
        var items = <MediaItem>[
          const MediaItem(
            id: MediaIds.downloads,
            title: 'Downloads',
            playable: false,
          ),
          const MediaItem(
            id: MediaIds.recentlyPlayed,
            title: 'In Progress',
            playable: false,
          ),
          const MediaItem(
            id: MediaIds.recentlyAdded,
            title: 'Recently Added',
            playable: false,
          ),
          const MediaItem(
            id: MediaIds.authorsId,
            title: 'Authors',
            playable: false,
          ),
          const MediaItem(
            id: MediaIds.booksId,
            title: 'All Books',
            playable: false,
          ),
          if (enableSeries)
            const MediaItem(
              id: MediaIds.seriesId,
              title: 'Series',
              playable: false,
            ),
          const MediaItem(
            id: MediaIds.collectionsId,
            title: 'Collections',
            playable: false,
          ),
        ];
        return await Future.value(items);
      case AudioService.recentRootId:
        var recents = (await getRecentlyPlayed()).take(1).toList();
        if (recents.isEmpty) {
          recents = (await getRecentlyAdded()).take(1).toList();
        }
        return [for (final recent in recents) recent.toMediaItem()];
      case MediaIds.authorsId:
        if (pieces.length > 1) {
          return [
            for (final book in await getBooksFromAuthor(pieces[1]))
              book.toMediaItem()
          ];
        } else {
          return [
            for (final author in await getAuthors()) author.toMediaItem()
          ];
        }
      case MediaIds.narratorsId:
        if (pieces.length > 1) {
          return [
            for (final book in await getBooksFromNarrator(pieces[1]))
              book.toMediaItem()
          ];
        } else {
          return [];
        }
      case MediaIds.booksId:
        return [for (final book in await getAllBooks(page)) book.toMediaItem()];
      case MediaIds.downloads:
        return [for (final book in await getDownloads()) book.toMediaItem()];
      case MediaIds.collectionsId:
        if (pieces.length > 1) {
          return [
            for (final book in await getBooksFromCollection(pieces[1]))
              book.toMediaItem()
          ];
        } else {
          return [
            for (final collection in await getCollections())
              collection.toMediaItem()
          ];
        }
      case MediaIds.playlistsId:
        if (pieces.length > 1) {
          return [
            for (final book in await getBooksFromPlaylist(pieces[1]))
              book.toMediaItem()
          ];
        } else {
          return [
            for (final playlist in await getPlaylists()) playlist.toMediaItem()
          ];
        }
      case MediaIds.seriesId:
        if (pieces.length > 1) {
          return [
            for (final book in await getBooksFromSeries(pieces[1]))
              book.toMediaItem()
          ];
        } else {
          return [for (final series in await getSeries()) series.toMediaItem()];
        }
      case MediaIds.recentlyPlayed:
        return [
          for (final book in await getRecentlyPlayed()) book.toMediaItem()
        ];
      case MediaIds.recentlyAdded:
        return [
          for (final book in await getRecentlyAdded()) book.toMediaItem()
        ];
      default:
        return Future.value(<MediaItem>[]);
    }
  }

  Future<List<Book>> getRecentlyAdded();
  Future<List<Book>> getDownloads();
  Future<List<Book>> getRecentlyPlayed();
  Future<List<Book>> getAllBooks([int? page]);
  Future<List<Author>> getAuthors();
  Future<List<Author>> getNarrators();
  Future<Author> getAuthorDetails(String authorId);
  Future<List<Book>> getBooksFromAuthor(String authorId);
  Future<List<Book>> getBooksFromNarrator(String narratorName);
  Future<List<Collection>> getCollections();
  Future<List<Book>> getBooksFromCollection(String collectionId);
  Future<List<Playlist>> getPlaylists();
  Future<List<Book>> getBooksFromPlaylist(String playlistId);
  Future<List<Series>> getSeries();
  Future<List<Book>> getBooksFromSeries(String seriesId);
  Future<List<ModelUnion>> search(String search);
  Future<List<Library>> getLibraries();
  Future<List<Track>> getTracksForBook(String bookId);
  Future<Book> getAlbumFromId(String? mediaId);
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
  Future<Map<String, List<ModelUnion>>> getHomeData();
  Future playbackFinished(String key);
  String getDownloadUrl(String path);
  void setLibraryId(String libraryId) {}
}
