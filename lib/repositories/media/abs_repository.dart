import 'package:audiobookly/models/user.dart';
import 'package:audiobookly/models/library.dart';
import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:audiobookly/services/device_info/device_info_service.dart';
import 'package:audiobookly/services/shared_preferences/shared_preferences_service.dart';
import 'package:audiobookly/singletons.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:audiobookshelf/audiobookshelf.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

final absApiProvider = Provider<AudiobookshelfApi>((ref) {
  SharedPreferencesService sharedPreferencesService =
      ref.watch(sharedPreferencesServiceProvider);

  return AudiobookshelfApi(
    baseUrl: sharedPreferencesService.getBaseUrl(),
    token: sharedPreferencesService.getCurrentToken(),
  );
});

class AbsRepository extends MediaRepository {
  Map<String, AbsAudiobook> audiobooks = {};
  final AudiobookshelfApi _api;

  String _libraryId;
  final DatabaseService _db = getIt();

  AbsRepository(this._api, this._libraryId) : super(true);

  @override
  Future<MediaItem> getAlbumFromId(String? mediaId) async {
    final book = await _api.getBookInfo(mediaId!);
    await getUser();
    return _bookToItem(book);
  }

  Uri? _coverUrl(String? baseUrl, String? path, int? timestamp) {
    if (baseUrl != null && path != null) {
      return Uri.parse('$baseUrl$path?token=${_api.token}&ts=$timestamp');
    }
    return null;
  }

  Uri? _scaledCoverUrl(String? baseUrl, String? id, int? timestamp,
      [int width = 400]) {
    if (baseUrl != null && id != null) {
      print(
          '$baseUrl/api/books/$id/cover?token=${_api.token}&ts=$timestamp&width=$width');
      return Uri.parse(
          '$baseUrl/api/books/$id/cover?token=${_api.token}&ts=$timestamp&width=$width&format=webp');
    }
    return null;
  }

  MediaItem _bookToItem(AbsAudiobook book) {
    final progress = userProgress[book.id];

    int viewOffset = progress?.currentTime?.inMilliseconds ?? 0;
    bool played = progress?.isRead ?? false;
    Duration? totalDuration = progress?.totalDuration;
    return MediaItem(
      id: book.id!,
      title: book.book!.title!,
      displayDescription: book.book?.description,
      artist: book.book?.author,
      album: book.book!.title,
      duration: book.duration ?? totalDuration,
      artUri:
          // _coverUrl(_api.baseUrl, book.book?.cover,
          //     book.lastUpdate?.millisecondsSinceEpoch),
          _scaledCoverUrl(
              _api.baseUrl, book.id, book.lastUpdate?.millisecondsSinceEpoch),
      playable: true,
      extras: <String, dynamic>{
        'played': played,
        'narrator': book.book?.narrator,
        'viewOffset': viewOffset,
        'largeThumbnail': _coverUrl(_api.baseUrl, book.book?.cover,
                book.lastUpdate?.millisecondsSinceEpoch)
            .toString(),
        if (book.chapters != null)
          'chapters': [for (final chapter in book.chapters!) chapter.toJson()]
      },
    );
  }

  @override
  Future<List<MediaItem>> getAllBooks() async {
    final books = await _api.getAll(_libraryId);
    audiobooks = {for (final book in books) book.id!: book};
    return [for (final book in books..sort(_sortBooks)) _bookToItem(book)];
  }

  @override
  Future<List<MediaItem>> getAuthors() async {
    return (await _api.getAuthors(_libraryId))
        .map(
          (author) => MediaItem(
            id: '@authors/$author',
            title: author,
            playable: false,
          ),
        )
        .toList()
      ..sort((a, b) => a.id.compareTo(b.id));
  }

  @override
  Future<List<MediaItem>> getBooksFromAuthor(String authorId) async {
    return [
      for (final book
          in (await _api.getBooksForAuthor(_libraryId, authorId)).toList()
            ..sort(_sortBooks))
        _bookToItem(book)
    ];
  }

  int _sortBooks(AbsAudiobook a, AbsAudiobook b) {
    int retValue = 0;
    if (a.book?.author != null && b.book?.author != null) {
      retValue = a.book!.author!.compareTo(b.book!.author!);
    }
    if (a.book?.series != null && b.book?.series != null && retValue == 0) {
      if (a.book!.series == b.book!.series) {
        retValue = double.parse(a.book?.volumeNumber ?? '0')
            .compareTo(double.parse(b.book?.volumeNumber ?? '0'));
      } else {
        retValue =
            compareStringsWithoutArticles(a.book!.series!, b.book!.series!);
      }
    } else if (a.book?.series != null && retValue == 0) {
      retValue = compareStringsWithoutArticles(a.book!.series!, b.book!.title!);
    } else if (b.book?.series != null && retValue == 0) {
      retValue = compareStringsWithoutArticles(a.book!.title!, b.book!.series!);
    }
    if (retValue == 0) {
      retValue = compareStringsWithoutArticles(
          a.book?.title ?? '', b.book?.title ?? '');
    }
    return retValue;
  }

  int compareStringsWithoutArticles(String a, String b) {
    return _removeArticles(a).compareTo(_removeArticles(b));
  }

  @override
  Future<List<MediaItem>> getBooksFromCollection(String collectionId) async {
    return (await _api.getBooksForCollection(collectionId))
        .map(_bookToItem)
        .toList();
  }

  String _removeArticles(String input) =>
      input.replaceFirst(RegExp(r'^The |the |a |A |an |An '), '');

  @override
  Future<List<MediaItem>> getCollections() async {
    final collections = await _api.getCollections();

    return [
      for (final collection in collections)
        MediaItem(
            id: '@collections/${collection.id}',
            title: collection.name,
            playable: false,
            artUri: _scaledCoverUrl(_api.baseUrl, collection.books[0].id,
                collection.books[0].book?.lastUpdate))
    ];
  }

  @override
  Future<List<MediaItem>> getBooksFromSeries(String seriesId) async {
    if (audiobooks.isEmpty) {
      await getAllBooks();
    }
    return [
      for (final book in audiobooks.values
          .where((book) => book.book?.series == seriesId)
          .toList()
        ..sort((a, b) => double.parse(a.book?.volumeNumber ?? '0')
            .compareTo(double.parse(b.book?.volumeNumber ?? '0'))))
        _bookToItem(book)
    ];
  }

  @override
  Future<List<MediaItem>> getSeries() async {
    if (audiobooks.isEmpty) {
      await getAllBooks();
    }
    return {
      for (final book in audiobooks.values
          .where((book) => book.book?.series != null)
          .toList())
        MediaItem(
          id: '@series/${book.book!.series!}',
          title: book.book!.series!,
          playable: false,
          artUri: _scaledCoverUrl(_api.baseUrl, book.id, book.book?.lastUpdate),
        )
    }.toList()
      ..sort((a, b) =>
          _removeArticles(a.title).compareTo(_removeArticles(b.title)));
  }

  @override
  String getDownloadUrl(String path) {
    return getServerUrl(path);
  }

  @override
  Future<List<MediaItem>> getDownloads() async {
    return (await _db.getBooks().first)
        .map((book) => MediaHelpers.fromBook(book))
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
  Future<List<MediaItem>> getRecentlyAdded() async {
    final books = await _api.getRecentlyAdded(_libraryId);
    return books.map(_bookToItem).toList();
  }

  @override
  Future<List<MediaItem>> getRecentlyPlayed() async {
    final books = await _api.getRecentlyPlayed();
    userProgress = books;
    return [
      for (final book
          in books.values
              .where((book) =>
                  !book.isRead &&
                  (book.progress ?? 0) > 0 &&
                  book.lastUpdate != null)
              .toList()
            ..sort((a, b) => b.lastUpdate!.compareTo(a.lastUpdate!)))
        _bookToItem(await _api.getBookInfo(book.audiobookId))
    ];
  }

  @override
  Future getServerAndLibrary() async {}

  @override
  String getServerUrl(String path) {
    return '${_api.baseUrl}/s/book/$path?token=${_api.token}';
  }

  @override
  String getThumbnailUrl(String? path, {int? height, int? width}) {
    // TODO: implement getThumbnailUrl
    throw UnimplementedError();
  }

  @override
  Future<List<MediaItem>> getTracksForBook(MediaItem book) async {
    final apiBook = await _api.getBookInfo(book.id);
    if (apiBook.tracks == null) {
      return [];
    }
    return [
      for (final track in apiBook.tracks!)
        MediaItem(
          id: '${book.id}/${track.filename}',
          album: book.title,
          artist: book.artist,
          title: track.filename,
          duration: track.duration,
        )
    ];
  }

  Map<String, AbsAudiobookProgress> userProgress = {};

  @override
  Future<User> getUser() async {
    final apiUser = await _api.getUser();
    userProgress = apiUser.audiobooks;

    for (final progress in userProgress.values) {
      final book = await _db.getBookById(progress.audiobookId);
      if (book != null && progress.currentTime != null) {
        if (progress.isRead && !book.read) {
          await _db.insertBook(
            book.copyWith(
              read: progress.isRead,
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
    await getUser();
  }

  @override
  Future markUnplayed(String itemId) async {
    await _api.markUnplayed(itemId);
    await getUser();
  }

  @override
  Future playbackCheckin(String key, Duration position, Duration duration,
      double playbackRate, AudiobooklyEvent event, bool playing) async {
    final progress = userProgress.putIfAbsent(
        key,
        () => AbsAudiobookProgress(
              audiobookId: key,
              isRead: false,
            ));
    progress.progress = position.inMilliseconds / duration.inMilliseconds;
    progress.currentTime = position;
    progress.totalDuration = duration;

    final book = await _db.getBookById(key);
    if (book != null) {
      await _db.insertBook(book.copyWith(lastPlayedPosition: position));
    }

    await _api.updateProgress(progress);
  }

  @override
  Future playbackFinished(String key) async {
    // TODO: implement playbackFinished
  }

  @override
  Future playbackStarted(String key, Duration position, Duration duration,
      double playbackRate) async {}

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
              audiobookId: key,
              isRead: false,
            ));
    progress.progress = position / duration;
    progress.currentTime = Duration(milliseconds: position);

    _api.updateProgress(progress);
  }

  @override
  Future<List<MediaItem>> search(String search) async {
    final response = await _api.search(_libraryId, search);
    return [
      for (final book in response.audiobooks) _bookToItem(book.audiobook),
      for (final author in response.authors)
        MediaItem(
          id: '@authors/${author.author}',
          title: author.author,
          playable: false,
        ),
      for (final series in response.series)
        MediaItem(
          id: '@series/${series.series}',
          title: series.series,
          playable: false,
        )
    ];
  }

  @override
  Future addToCollection(String collectionId, String mediaId) {
    // TODO: implement addToCollection
    throw UnimplementedError();
  }
}
