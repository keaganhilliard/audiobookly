import 'package:audiobookly/constants/app_constants.dart';
import 'package:audiobookly/models/author.dart';
import 'package:audiobookly/models/book.dart';
import 'package:audiobookly/models/chapter.dart';
import 'package:audiobookly/models/collection.dart';
import 'package:audiobookly/models/download_status.dart';
import 'package:audiobookly/models/model_union.dart';
import 'package:audiobookly/models/playlist.dart';
import 'package:audiobookly/models/track.dart';
import 'package:audiobookly/models/user.dart';
import 'package:audiobookly/models/library.dart';
import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:audiobookly/services/device_info/device_info_service.dart'
    hide DeviceInfo;
import 'package:audiobookly/singletons.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:audiobookshelf/audiobookshelf.dart' hide Chapter, Author;
import 'package:hooks_riverpod/hooks_riverpod.dart';

final absApiProvider = Provider<AudiobookshelfApi>((ref) {
  String baseUrl =
      ref.watch(preferencesProvider.select((prefs) => prefs.baseUrl));
  String userToken =
      ref.watch(preferencesProvider.select((prefs) => prefs.userToken));

  return AudiobookshelfApi(
    baseUrl: baseUrl,
    token: userToken,
  );
});

class AbsRepository extends MediaRepository {
  final AudiobookshelfApi _api;

  String get _libraryId => _db.getPreferencesSync().libraryId;
  final DatabaseService _db = getIt();

  AbsRepository(this._api) : super(true);

  @override
  Future<Book> getAlbumFromId(String? mediaId) async {
    final book = await _api.getBookInfo(mediaId!);
    await getUser();
    return _absBookToBook(book);
  }

  Uri? _scaledCoverUrl(String? baseUrl, String? id, int? timestamp,
      [int width = 400]) {
    if (baseUrl != null && id != null) {
      return Uri.parse(
          '$baseUrl/api/items/$id/cover?token=${_api.token}&ts=$timestamp&width=$width&format=webp');
    }
    return null;
  }

  MediaItem _bookToItem(AbsAudiobook book) {
    final progress = userProgress[book.id];

    int viewOffset = progress?.currentTime?.inMilliseconds ?? 0;
    bool played = progress?.isFinished ?? false;
    Duration? totalDuration = progress?.duration;
    return MediaItem(
      id: book.id,
      title: book.media.metadata.title ?? 'Unknown',
      displayDescription: book.media.metadata.description,
      artist: book.media.metadata.authors?.map((e) => e.name).join(', ') ??
          'Unknown',
      album: book.media.metadata.title,
      duration: book.media.duration == null
          ? totalDuration
          : AbsUtils.parseDurationFromSeconds(book.media.duration),
      artUri:
          // _coverUrl(_api.baseUrl, book.book?.cover,
          //     book.lastUpdate?.millisecondsSinceEpoch),
          _scaledCoverUrl(_api.baseUrl, book.id, book.updatedAt),
      playable: true,
      extras: <String, dynamic>{
        'played': played,
        'narrator': book.media.metadata.narrators?.join(', ') ?? 'Unknown',
        'viewOffset': viewOffset,
        'largeThumbnail':
            _scaledCoverUrl(_api.baseUrl, book.id, book.updatedAt, 600)
                .toString(),
        if (book.media.chapters != null)
          'chapters': [
            for (final chapter in book.media.chapters!) chapter.toJson()
          ]
      },
    );
  }

  Book _absBookToBook(AbsAudiobook book) {
    final progress = userProgress[book.id];
    Duration? totalDuration = progress?.duration;
    return Book(
      id: book.id,
      title: book.media.metadata.title ?? 'Unknown',
      author: book.media.metadata.authors?.map((e) => e.name).join(', ') ??
          'Unknown',
      narrator: book.media.metadata.narrators?.join(', ') ?? 'Unknown',
      description: book.media.metadata.description ?? '',
      artPath:
          _scaledCoverUrl(_api.baseUrl, book.id, book.updatedAt).toString(),
      duration: book.media.duration == null
          ? totalDuration ?? Duration.zero
          : AbsUtils.parseDurationFromSeconds(book.media.duration)!,
      lastPlayedPosition: progress?.currentTime ?? Duration.zero,
      read: progress?.isFinished ?? false,
      lastUpdate: DateTime.now(),
      largeArtPath: _scaledCoverUrl(_api.baseUrl, book.id, book.updatedAt, 600)
          .toString(),
      chapters: book.media.chapters
          ?.map((chapter) => Chapter.fromJson(chapter.toJson(), book.id))
          .toList(),
    );
  }

  Book _absBookMinifiedToBook(AbsAudiobookMinified book) {
    final progress = userProgress[book.id];

    return Book(
      id: book.id,
      title: book.media.metadata.title ?? 'Unknown',
      author: book.media.metadata.authorName ?? 'Unknown',
      narrator: book.media.metadata.narratorName ?? 'Unknown',
      description: book.media.metadata.description ?? '',
      artPath:
          _scaledCoverUrl(_api.baseUrl, book.id, book.updatedAt).toString(),
      duration: AbsUtils.parseDurationFromSeconds(book.media.duration)!,
      lastPlayedPosition: progress?.currentTime ?? Duration.zero,
      read: progress?.isFinished ?? false,
      lastUpdate: DateTime.now(),
      largeArtPath: _scaledCoverUrl(_api.baseUrl, book.id, book.updatedAt, 600)
          .toString(),
    );
  }

  @override
  Future<List<Book>> getAllBooks([int? page]) async {
    return [
      for (final book in await _api.getAll(_libraryId, page))
        _absBookMinifiedToBook(book)
    ];
  }

  @override
  Future<List<MediaItem>> getAuthors() async {
    return [
      for (final author in await _api.getAuthors(_libraryId))
        MediaItem(
          id: '@authors/${author.id}',
          title: author.name,
          artUri: author.imagePath == null
              ? null
              : Uri.parse(
                  '${_api.baseUrl}/api/authors/${author.id}/image?token=${_api.token}&format=webp&width=400&ts=${author.updatedAt}'),
          playable: false,
          displayDescription: author.description,
        ),
    ];
  }

  @override
  Future<List<Book>> getBooksFromAuthor(String authorId) async {
    return [
      for (final book
          in (await _api.getBooksForAuthor(_libraryId, authorId)).toList()
            ..sort(_sortBooks))
        _absBookToBook(book)
    ];
  }

  int _sortBooks(AbsAudiobook a, AbsAudiobook b) {
    int retValue = 0;

    final aAuthor = a.media.metadata.authors?.firstOrNull;
    final bAuthor = b.media.metadata.authors?.firstOrNull;

    final aSeries = a.media.metadata.series?.firstOrNull;
    final bSeries = b.media.metadata.series?.firstOrNull;

    if (aAuthor != null && bAuthor != null) {
      retValue = aAuthor.name.compareTo(bAuthor.name);
    }
    if (aSeries != null && bSeries != null && retValue == 0) {
      if (aSeries.id == bSeries.id) {
        retValue = double.parse(aSeries.sequence ?? '0')
            .compareTo(double.parse(bSeries.sequence ?? '0'));
      } else {
        retValue = compareStringsWithoutArticles(aSeries.name, bSeries.name);
      }
    } else if (aSeries != null && retValue == 0) {
      retValue =
          compareStringsWithoutArticles(aSeries.name, b.media.metadata.title!);
    } else if (bSeries != null && retValue == 0) {
      retValue =
          compareStringsWithoutArticles(a.media.metadata.title!, bSeries.name);
    }
    if (retValue == 0) {
      retValue = compareStringsWithoutArticles(
          a.media.metadata.title!, b.media.metadata.title!);
    }
    return retValue;
  }

  int compareStringsWithoutArticles(String a, String b) {
    return _removeArticles(a).compareTo(_removeArticles(b));
  }

  @override
  Future<List<Book>> getBooksFromCollection(String collectionId) async {
    return [
      for (final book in await _api.getBooksForCollection(collectionId))
        _absBookToBook(book)
    ];
  }

  String _removeArticles(String input) =>
      input.replaceFirst(RegExp(r'^The |the |a |A |an |An '), '');

  @override
  Future<List<Collection>> getCollections() async {
    final collections = await _api.getCollections();

    return [
      for (final collection in collections)
        if (collection.libraryId == _libraryId)
          Collection(
            id: '@collections/${collection.id}',
            name: collection.name,
            description: collection.description,
            artPath: _scaledCoverUrl(_api.baseUrl, collection.books[0].id,
                    collection.books[0].updatedAt)
                .toString(),
          ),
    ];
  }

  @override
  Future<List<Book>> getBooksFromSeries(String seriesId) async {
    return [
      for (final book in await _api.getBooksForSeries(_libraryId, seriesId))
        _absBookToBook(book)
    ];
  }

  @override
  Future<List<MediaItem>> getSeries() async {
    return [
      for (final serie in await _api.getSeries(_libraryId))
        MediaItem(
            id: '@series/${serie.id}',
            title: serie.name,
            playable: false,
            artUri: _scaledCoverUrl(
              _api.baseUrl,
              serie.books[0].id,
              serie.books[0].updatedAt,
            ))
    ];
  }

  @override
  String getDownloadUrl(String path) {
    return getServerUrl(path);
  }

  @override
  Future<List<Book>> getDownloads() async {
    return (await _db.getBooks().first)
        .where((book) => book.downloadStatus == DownloadStatus.succeeded)
        .toList();
  }

  @override
  Future<List<Library>> getLibraries() async {
    final libraries = await _api.getLibraries();
    return libraries.map((lib) => Library(lib.id, lib.name)).toList();
  }

  @override
  Future<String> getLoginUrl() async => '';

  @override
  Future<List<Book>> getRecentlyAdded() async {
    final books = await _api.getRecentlyAdded(_libraryId);
    return [for (final book in books) _absBookToBook(book)];
  }

  // TODO: this is bad... DON'T DO THIS
  @override
  Future<List<Book>> getRecentlyPlayed() async {
    final books = await _api.getRecentlyPlayed();
    userProgress = books;
    return [
      for (final book
          in books.values
              .where((book) =>
                  !book.id.startsWith('local_') &&
                  !book.isFinished &&
                  (book.progress ?? 0) > 0 &&
                  book.lastUpdate != null)
              .toList()
            ..sort((a, b) => b.lastUpdate!.compareTo(a.lastUpdate!)))
        _absBookToBook(await _api.getBookInfo(book.id))
    ];
  }

  @override
  Future getServerAndLibrary() async {}

  @override
  String getServerUrl(String path) {
    return '${_api.baseUrl}/s/item/$path?token=${_api.token}';
  }

  @override
  String getThumbnailUrl(String? path, {int? height, int? width}) {
    // TODO: implement getThumbnailUrl
    throw UnimplementedError();
  }

  @override
  Future<List<Track>> getTracksForBook(String bookId) async {
    final apiBook = await _api.getBookInfo(bookId);
    final tracks = await _db.getTracksForBookId(bookId).first;
    final trackMap = {for (final track in tracks) track.id: track};

    if (apiBook.media.audioFiles == null) {
      return [];
    }
    return [
      for (final file in apiBook.media.audioFiles!)
        Track(
          id: '$bookId/${file.metadata.filename}',
          title: file.metadata.filename,
          duration: file.duration != null
              ? AbsUtils.parseDurationFromSeconds(file.duration) ??
                  Duration.zero
              : Duration.zero,
          downloadProgress:
              trackMap['$bookId/${file.metadata.filename}']?.downloadProgress ??
                  0,
          isDownloaded:
              trackMap['$bookId/${file.metadata.filename}']?.isDownloaded ??
                  false,
          downloadPath: '',
          bookId: bookId,
          downloadTaskId: '',
          downloadTaskStatus: 0,
        )
    ];
  }

  Map<String, AbsAudiobookProgress> userProgress = {};

  @override
  Future<User> getUser() async {
    final apiUser = await _api.getUser();
    userProgress = apiUser.mediaProgress;

    for (final progress in userProgress.values) {
      final book = await _db.getBookById(progress.id);
      if (book != null && progress.currentTime != null) {
        if (progress.isFinished && !book.read) {
          await _db.insertBook(
            book.copyWith(
              read: progress.isFinished,
              lastPlayedPosition: Duration.zero,
            ),
          );
        } else if (progress.currentTime! > book.lastPlayedPosition) {
          await _db.insertBook(book.copyWith(
            lastPlayedPosition: progress.currentTime,
          ));
        }
      }
    }

    return User(
      name: apiUser.username,
      userName: apiUser.username,
      token: apiUser.token,
    );
  }

  @override
  Future markPlayed(String itemId) async {
    await _api.markPlayed(itemId);
    final book = await _db.getBookById(itemId);
    if (book != null) {
      await _db.insertBook(
        book.copyWith(lastPlayedPosition: Duration.zero, read: true),
      );
    }
    await getUser();
  }

  @override
  Future markUnplayed(String itemId) async {
    await _api.markUnplayed(itemId);
    final book = await _db.getBookById(itemId);
    if (book != null) {
      await _db.insertBook(
        book.copyWith(lastPlayedPosition: Duration.zero, read: false),
      );
    }
    await getUser();
  }

  @override
  Future playbackCheckin(String key, Duration position, Duration duration,
      double playbackRate, AudiobooklyEvent event, bool playing) async {
    final progress = userProgress.putIfAbsent(
        key,
        () => AbsAudiobookProgress(
              id: key,
              isFinished: false,
            ));
    progress.progress = position.inMilliseconds / duration.inMilliseconds;
    progress.currentTime = position;
    progress.duration = duration;

    final book = await _db.getBookById(key);
    if (book != null) {
      await _db.insertBook(book.copyWith(lastPlayedPosition: position));
    }

    if (_sessionId == null) {
      await playbackStarted(key, position, duration, playbackRate);
    }

    if (_sessionId != null && _lastCheckinTime != null) {
      await _api.playbackSessionCheckin(
        _sessionId!,
        duration,
        position,
        Duration(
          microseconds: DateTime.now().microsecondsSinceEpoch -
              _lastCheckinTime!.microsecondsSinceEpoch,
        ),
      );
      _lastCheckinTime = DateTime.now();
    } else {
      await _api.updateProgress(progress);
    }
  }

  @override
  Future playbackFinished(String key) async {
    _sessionId = null;
    _lastCheckinTime = null;
  }

  String? _sessionId;
  DateTime? _lastCheckinTime;

  @override
  Future playbackStarted(
    String key,
    Duration position,
    Duration duration,
    double playbackRate,
  ) async {
    // print('LOOKEE HERE: Starting session');
    _lastCheckinTime = DateTime.now();
    DeviceInfoService di = getIt();
    _sessionId = await _api.startPlaybackSession(
        key,
        AbsPlayItemRequest(
          mediaPlayer: 'AVPlayer',
          forceDirectPlay: true,
          forceTranscode: false,
          deviceInfo: DeviceInfo(
            manufacturer: di.info.manufacturer ?? '',
            brand: '',
            clientVersion: '0.0.1',
            model: di.info.model ?? '',
            sdkVersion: '',
          ),
        ));
  }

  @override
  Future playbackStopped(String key, Duration position, Duration duration,
      double playbackRate) async {
    // TODO: implement playbackStopped
  }

  @override
  Future savePosition(String key, int position, int duration,
      AudiobooklyPlaybackState state) async {
    final progress = userProgress.putIfAbsent(
        key,
        () => AbsAudiobookProgress(
              id: key,
              isFinished: false,
            ));
    progress.progress = position / duration;
    progress.currentTime = Duration(milliseconds: position);

    if (_sessionId != null && _lastCheckinTime != null) {
      await _api.playbackSessionCheckin(
          _sessionId!,
          Duration(milliseconds: duration),
          Duration(days: DateTime.now().microsecondsSinceEpoch),
          Duration(
              microseconds: DateTime.now().microsecondsSinceEpoch -
                  _lastCheckinTime!.microsecondsSinceEpoch));
    } else {
      _api.updateProgress(progress);
    }
  }

  @override
  Future<List<MediaItem>> search(String search) async {
    final response = await _api.search(_libraryId, search);
    return [
      for (final book in response.book) _bookToItem(book.libraryItem),
      for (final author in response.authors)
        MediaItem(
          id: '${MediaIds.authorsId}/${author.id}',
          title: author.name,
          playable: false,
          artUri: author.imagePath == null
              ? null
              : Uri.parse(
                  '${_api.baseUrl}/api/authors/${author.id}/image?token=${_api.token}&format=webp&width=400&ts=${author.updatedAt}'),
        ),
      for (final series in response.series)
        MediaItem(
          id: '${MediaIds.seriesId}/${series.series.id}',
          title: series.series.name,
          playable: false,
          artUri: _scaledCoverUrl(_api.baseUrl, series.books.first.id,
              series.books.first.updatedAt),
        )
    ];
  }

  @override
  Future addToCollection(String collectionId, String mediaId) {
    // TODO: implement addToCollection
    throw UnimplementedError();
  }

  @override
  Future<Map<String, List<ModelUnion>>> getHomeData() async {
    final books = await _api.getRecentlyPlayed();
    userProgress = books;
    final personalized = await _api.getPersonalized(_libraryId);
    Map<String, List<ModelUnion>> outMap = {};
    for (final p in personalized) {
      p.maybeMap(
        orElse: () {},
        book: (value) {
          outMap.putIfAbsent(
              p.label,
              () => value.entities
                  .map<ModelUnion>(
                      (book) => ModelUnion.book(_absBookMinifiedToBook(book)))
                  .toList());
        },
        authors: (value) {
          outMap.putIfAbsent(
              p.label,
              () => value.entities
                  .map<ModelUnion>(
                    (author) => ModelUnion.author(
                      Author(
                        id: '${MediaIds.authorsId}/${author.id}',
                        name: author.name,
                        description: author.description ?? '',
                        artPath: author.imagePath == null
                            ? null
                            : '${_api.baseUrl}/api/authors/${author.id}/image?token=${_api.token}&format=webp&width=400&ts=${author.updatedAt}',
                        numBooks: author.numBooks ?? 0,
                      ),
                    ),
                  )
                  .toList());
        },
      );
    }
    return outMap;
  }

  @override
  Future<List<Book>> getBooksFromPlaylist(String playlistId) async {
    return [
      for (final book in (await _api.getBooksForPlaylist(playlistId)).toList())
        _absBookToBook(book)
    ];
  }

  @override
  Future<List<Playlist>> getPlaylists() async {
    final playlists = await _api.getPlaylists(_libraryId);

    return [
      for (final playlist in playlists)
        Playlist(
          id: '@playlists/${playlist.id}',
          name: playlist.name,
          description: playlist.description,
          artPath: _scaledCoverUrl(
                  _api.baseUrl,
                  playlist.items[0].libraryItem.id,
                  playlist.items[0].libraryItem.updatedAt)
              .toString(),
        ),
    ];
  }
}
