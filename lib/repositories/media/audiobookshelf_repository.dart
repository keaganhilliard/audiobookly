import 'dart:developer';

import 'package:audiobookly/constants/app_constants.dart';
import 'package:audiobookly/models/author.dart';
import 'package:audiobookly/models/book.dart';
import 'package:audiobookly/models/collection.dart';
import 'package:audiobookly/models/download_status.dart';
import 'package:audiobookly/models/model_union.dart';
import 'package:audiobookly/models/playlist.dart';
import 'package:audiobookly/models/series.dart';
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
// import 'package:audiobookshelf/audiobookshelf.dart' hide Chapter, Author;
import 'package:audiobookshelf_api/audiobookshelf_api.dart' as abs;
import 'package:hooks_riverpod/hooks_riverpod.dart';

final audiobookshelfApiProvider = Provider<abs.AudiobookshelfApi>((ref) {
  String baseUrl =
      ref.watch(preferencesProvider.select((prefs) => prefs.baseUrl));
  String userToken =
      ref.watch(preferencesProvider.select((prefs) => prefs.userToken));

  return abs.AudiobookshelfApi(
    baseUrl: baseUrl.uri!,
    token: userToken,
  );
});

class AudiobookshelfRepository extends MediaRepository {
  final abs.AudiobookshelfApi _api;

  String get _libraryId => _db.getPreferencesSync().libraryId;
  String get _userId => _db.getPreferencesSync().userId;
  final DatabaseService _db = getIt();

  AudiobookshelfRepository(this._api) : super(true);

  @override
  Future<Book> getAlbumFromId(String? mediaId) async {
    final book = await _api.items.get(
      libraryItemId: mediaId!,
      parameters: const abs.GetItemReqParams(expanded: true),
      responseErrorHandler: (response, [error]) {
        print(response);
        print(error);
      },
    );
    // final book = await _api.getBookInfo(mediaId!);
    await getUser();
    return _absItemToBook(book!)!;
  }

  Uri? _scaledCoverUrl(String? baseUrl, String? id, int? timestamp,
      [int width = 400]) {
    if (baseUrl != null && id != null) {
      return '$baseUrl/api/items/$id/cover?token=${_api.token}&ts=$timestamp&width=$width&format=webp'
          .uri;
    }
    return null;
  }

  MediaItem _bookToItem(abs.LibraryItem item) {
    final progress = userProgress[item.id];
    int viewOffset = progress?.currentTime.inMilliseconds ?? 0;
    bool played = progress?.isFinished ?? false;
    return item.map(
      (item) => MediaItem(
        id: item.id,
        title: item.media.metadata.title ?? '',
        displayDescription: item.media.metadata.description,
        album: item.media.metadata.title ?? '',
        artUri: _scaledCoverUrl(
          _api.baseUrl.toString(),
          item.id,
          item.updatedAt.millisecondsSinceEpoch,
        ),
        playable: true,
        extras: <String, dynamic>{
          'played': played,
          'viewOffset': viewOffset,
          'largeThumbnail': _scaledCoverUrl(
            _api.baseUrl.toString(),
            item.id,
            item.updatedAt.millisecondsSinceEpoch,
            600,
          ).toString(),
        },
      ),
      minified: (book) {
        return book.media.maybeMap(
          orElse: () => MediaItem(
            id: book.id,
            title: book.media.metadata.title ?? '',
            displayDescription: book.media.metadata.description,
            album: book.media.metadata.title ?? '',
            artUri: _scaledCoverUrl(
              _api.baseUrl.toString(),
              book.id,
              book.updatedAt.millisecondsSinceEpoch,
            ),
            playable: true,
            extras: <String, dynamic>{
              'played': played,
              'viewOffset': viewOffset,
              'largeThumbnail': _scaledCoverUrl(
                _api.baseUrl.toString(),
                book.id,
                book.updatedAt.millisecondsSinceEpoch,
                600,
              ).toString(),
            },
          ),
          bookMinified: (media) {
            return media.metadata.maybeMap(
              orElse: () => MediaItem(
                id: book.id,
                title: media.metadata.title ?? '',
                displayDescription: media.metadata.description,
                album: book.media.metadata.title ?? '',
                artUri: _scaledCoverUrl(
                  _api.baseUrl.toString(),
                  book.id,
                  book.updatedAt.millisecondsSinceEpoch,
                ),
                playable: true,
                extras: <String, dynamic>{
                  'played': played,
                  'viewOffset': viewOffset,
                  'largeThumbnail': _scaledCoverUrl(
                    _api.baseUrl.toString(),
                    book.id,
                    book.updatedAt.millisecondsSinceEpoch,
                    600,
                  ).toString(),
                },
              ),
              bookMinified: (metadata) {
                return MediaItem(
                  id: book.id,
                  title: metadata.title ?? 'Unknown',
                  displayDescription: metadata.description,
                  artist: metadata.authorName,
                  album: metadata.title,
                  duration: media.duration,
                  artUri: _scaledCoverUrl(
                    _api.baseUrl.toString(),
                    book.id,
                    book.updatedAt.millisecondsSinceEpoch,
                  ),
                  playable: true,
                  extras: <String, dynamic>{
                    'played': played,
                    'narrator': metadata.narratorName,
                    'viewOffset': viewOffset,
                    'largeThumbnail': _scaledCoverUrl(
                      _api.baseUrl.toString(),
                      book.id,
                      book.updatedAt.millisecondsSinceEpoch,
                      600,
                    ).toString(),
                  },
                );
              },
            );
          },
        );
      },
      expanded: (book) {
        return book.media.maybeMap(
          orElse: () => MediaItem(
            id: book.id,
            title: book.media.metadata.title ?? '',
            displayDescription: book.media.metadata.description,
            album: book.media.metadata.title ?? '',
            artUri: _scaledCoverUrl(_api.baseUrl.toString(), book.id,
                book.updatedAt.millisecondsSinceEpoch),
            playable: true,
            extras: <String, dynamic>{
              'played': played,
              'viewOffset': viewOffset,
              'largeThumbnail': _scaledCoverUrl(
                _api.baseUrl.toString(),
                book.id,
                book.updatedAt.millisecondsSinceEpoch,
                600,
              ).toString(),
            },
          ),
          bookExpanded: (media) {
            return media.metadata.maybeMap(
              orElse: () => MediaItem(
                id: book.id,
                title: media.metadata.title ?? '',
                displayDescription: media.metadata.description,
                album: book.media.metadata.title ?? '',
                artUri: _scaledCoverUrl(_api.baseUrl.toString(), book.id,
                    book.updatedAt.millisecondsSinceEpoch),
                playable: true,
                extras: <String, dynamic>{
                  'played': played,
                  'viewOffset': viewOffset,
                  'largeThumbnail': _scaledCoverUrl(
                    _api.baseUrl.toString(),
                    book.id,
                    book.updatedAt.millisecondsSinceEpoch,
                    600,
                  ).toString(),
                  'chapters': [
                    for (final chapter in media.chapters) chapter.toJson()
                  ]
                },
              ),
              bookExpanded: (metadata) {
                return MediaItem(
                  id: book.id,
                  title: metadata.title ?? 'Unknown',
                  displayDescription: metadata.description,
                  artist: metadata.authorName,
                  album: metadata.title,
                  duration: media.duration,
                  artUri:
                      // _coverUrl(_api.baseUrl.toString(), book.book?.cover,
                      //     book.lastUpdate?.millisecondsSinceEpoch),
                      _scaledCoverUrl(_api.baseUrl.toString(), book.id,
                          book.updatedAt.millisecondsSinceEpoch),
                  playable: true,
                  extras: <String, dynamic>{
                    'played': played,
                    'narrator': metadata.narratorName,
                    'viewOffset': viewOffset,
                    'largeThumbnail': _scaledCoverUrl(_api.baseUrl.toString(),
                            book.id, book.updatedAt.millisecondsSinceEpoch, 600)
                        .toString(),
                    'chapters': [
                      for (final chapter in media.chapters) chapter.toJson()
                    ]
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  Book? _absItemToBook(abs.LibraryItem item) {
    final progress = userProgress[item.id];
    bool played = progress?.isFinished ?? false;
    return item.mapOrNull(
      (item) => null,
      minified: (book) {
        return book.media.mapOrNull(
          bookMinified: (media) {
            return media.metadata.mapOrNull(
              bookMinified: (metadata) {
                return Book(
                  id: book.id,
                  title: metadata.title ?? 'Unknown',
                  description: metadata.description ?? '',
                  author: metadata.authorName ?? '',
                  duration: media.duration,
                  artPath: _scaledCoverUrl(
                        _api.baseUrl.toString(),
                        book.id,
                        book.updatedAt.millisecondsSinceEpoch,
                      )?.toString() ??
                      '',
                  largeArtPath: _scaledCoverUrl(
                        _api.baseUrl.toString(),
                        book.id,
                        book.updatedAt.millisecondsSinceEpoch,
                        600,
                      )?.toString() ??
                      '',
                  read: played,
                  narrator: metadata.narratorName ?? '',
                  lastPlayedPosition: progress?.currentTime ?? Duration.zero,
                );
              },
            );
          },
        );
      },
      expanded: (book) {
        return book.media.mapOrNull(
          bookExpanded: (media) {
            return media.metadata.mapOrNull(
              bookExpanded: (metadata) {
                return Book(
                  id: book.id,
                  title: metadata.title ?? 'Unknown',
                  description: metadata.description ?? '',
                  author: metadata.authorName ?? '',
                  duration: media.duration,
                  artPath: _scaledCoverUrl(
                        _api.baseUrl.toString(),
                        book.id,
                        book.updatedAt.millisecondsSinceEpoch,
                      )?.toString() ??
                      '',
                  largeArtPath: _scaledCoverUrl(
                        _api.baseUrl.toString(),
                        book.id,
                        book.updatedAt.millisecondsSinceEpoch,
                        600,
                      )?.toString() ??
                      '',
                  read: played,
                  narrator: metadata.narratorName ?? '',
                  lastPlayedPosition: progress?.currentTime ?? Duration.zero,
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Future<List<Book>> getAllBooks([int? page]) async {
    return [
      for (final book
          in (await _api.libraries.getItems(libraryId: _libraryId))!.results)
        _absItemToBook(book)!
    ];
  }

  @override
  Future<List<Author>> getAuthors() async {
    return [
      for (final author
          in (await _api.libraries.getAuthors(libraryId: _libraryId))!)
        author.map(
          (author) => Author(
            id: '@authors/${author.id}',
            name: author.name,
            artPath: author.imagePath == null
                ? null
                : '${_api.baseUrl}/api/authors/${author.id}/image?token=${_api.token}&format=webp&width=400&ts=${author.updatedAt}',
            description: author.description ?? '',
          ),
          expanded: (author) => Author(
            id: '@authors/${author.id}',
            name: author.name,
            artPath: author.imagePath == null
                ? null
                : '${_api.baseUrl}/api/authors/${author.id}/image?token=${_api.token}&format=webp&width=400&ts=${author.updatedAt}',
            description: author.description ?? '',
            numBooks: author.numBooks,
          ),
          minified: (author) => Author(
            id: '@authors/${author.id}',
            name: author.name,
            description: '',
          ),
        ),
    ];
  }

  @override
  Future<List<Book>> getBooksFromAuthor(String authorId) async {
    return [
      for (final book in (await _api.libraries.getItems(
              libraryId: _libraryId,
              parameters: abs.GetLibrarysItemsReqParams(
                  minified: true,
                  filter: abs.AuthorFilter(authorId),
                  sort: 'media.metadata.title')))!
          .results)
        _absItemToBook(book)!
    ];
  }

  @override
  Future<List<Book>> getBooksFromCollection(String collectionId) async {
    return [
      for (final book
          in (await _api.collections.get(collectionId: collectionId))!.books)
        _absItemToBook(book)!
    ];
  }

  String _removeArticles(String input) =>
      input.replaceFirst(RegExp(r'^The |the |a |A |an |An '), '');

  @override
  Future<List<Collection>> getCollections() async {
    final collections = await _api.collections.getAll();

    return [
      for (final collection in collections!)
        if (collection.libraryId == _libraryId)
          Collection(
            id: '@collections/${collection.id}',
            name: collection.name,
            description: collection.description,
            artPath: _scaledCoverUrl(
                    _api.baseUrl.toString(),
                    collection.books[0].id,
                    collection.books[0].updatedAt.millisecondsSinceEpoch)
                .toString(),
          ),
    ];
  }

  @override
  Future<List<Book>> getBooksFromSeries(String seriesId) async {
    return [
      for (final book in (await _api.libraries.getItems(
              libraryId: _libraryId,
              parameters: abs.GetLibrarysItemsReqParams(
                filter: abs.SeriesFilter(seriesId),
              )))!
          .results)
        _absItemToBook(book)!
    ];
  }

  @override
  Future<List<Series>> getSeries() async {
    return [
      for (final serie
          in (await _api.libraries.getSeries(libraryId: _libraryId))!
              .results
              .where((result) => result.variant == abs.SeriesVariant.books)
              .map((serie) => serie as abs.SeriesBooks))
        Series(
          id: '@series/${serie.id}',
          name: serie.name,
          artPath: _scaledCoverUrl(
            _api.baseUrl.toString(),
            serie.books[0].id,
            serie.books[0].updatedAt.millisecondsSinceEpoch,
          ).toString(),
          numBooks: serie.books.length,
        )
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
    final libraries = await _api.libraries.getAll();
    return libraries!.map((lib) => Library(lib.id, lib.name)).toList();
  }

  @override
  Future<String> getLoginUrl() async => '';

  @override
  Future<List<Book>> getRecentlyAdded() async {
    final books = await _api.libraries.getItems(
      libraryId: _libraryId,
      parameters: const abs.GetLibrarysItemsReqParams(
          sort: 'addedAt', desc: true, limit: 10),
    );
    return [for (final book in books!.results) _absItemToBook(book)!];
  }

  // TODO: this is bad... DON'T DO THIS
  @override
  Future<List<Book>> getRecentlyPlayed() async {
    final books = (await _api.me.getItemsInProgress());
    await getUser();
    return [for (final book in books!) _absItemToBook(book)!];
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
    final media =
        (await _api.items.get(libraryItemId: bookId))?.media.mapOrNull(
              bookExpanded: (value) => value,
            );
    final tracks = await _db.getTracksForBookId(bookId).first;
    final trackMap = {for (final track in tracks) track.id: track};

    if (media?.audioFiles == null) {
      return [];
    }
    return [
      for (final file in media!.audioFiles)
        Track(
          id: '$bookId/${file.metadata.filename}',
          title: file.metadata.filename,
          duration: file.duration,
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

  Map<String, abs.MediaProgress> userProgress = {};

  @override
  Future<User> getUser() async {
    final responseUser = (await _api.misc.authorize(
      responseErrorHandler: (response, [error]) {
        log(response.body);
        log("$error");
      },
    ));
    log("$responseUser");
    final apiUser =
        (await _api.misc.authorize())?.user.mapOrNull((value) => value);
    userProgress = {for (final prog in apiUser!.mediaProgress) prog.id: prog};

    for (final progress in userProgress.values) {
      final book = await _db.getBookById(progress.id);
      if (book != null) {
        if (progress.isFinished && !book.read) {
          await _db.insertBook(
            book.copyWith(
              read: progress.isFinished,
              lastPlayedPosition: Duration.zero,
            ),
          );
        } else if (progress.currentTime > book.lastPlayedPosition) {
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
    await _api.me.createUpdateMediaProgress(
        libraryItemId: itemId,
        parameters: const abs.CreateUpdateProgressReqParams(isFinished: true));
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
    await _api.me.createUpdateMediaProgress(
        libraryItemId: itemId,
        parameters: const abs.CreateUpdateProgressReqParams(isFinished: false));
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
    final book = await _db.getBookById(key);
    if (book != null) {
      await _db.insertBook(book.copyWith(lastPlayedPosition: position));
    }

    if (_sessionId == null) {
      await playbackStarted(key, position, duration, playbackRate);
    }

    if (_sessionId != null && _lastCheckinTime != null) {
      await _api.sessions.syncOpen(
        sessionId: _sessionId!,
        parameters: abs.SyncSessionReqParams(
          currentTime: position,
          timeListened: DateTime.now().difference(_lastCheckinTime!),
          duration: duration,
        ),
      );
      _lastCheckinTime = DateTime.now();
    } else {
      await _api.me.createUpdateMediaProgress(
        libraryItemId: key,
        parameters: abs.CreateUpdateProgressReqParams(
          currentTime: position,
          duration: duration,
          progress: position.inMilliseconds / duration.inMilliseconds,
        ),
      );
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
    final session = await _api.items.play(
      libraryItemId: key,
      parameters: abs.PlayItemReqParams(
        mediaPlayer: 'AVPlayer',
        forceDirectPlay: true,
        forceTranscode: false,
        deviceInfo: abs.DeviceInfoReqParams(
          manufacturer: di.info.manufacturer ?? '',
          clientVersion: '0.0.1',
          model: di.info.model ?? '',
          sdkVersion: '',
        ),
      ),
    );
    _sessionId = session?.id;
  }

  @override
  Future playbackStopped(String key, Duration position, Duration duration,
      double playbackRate) async {
    // TODO: implement playbackStopped
  }

  @override
  Future savePosition(String key, int position, int duration,
      AudiobooklyPlaybackState state) async {
    // final progress = userProgress.putIfAbsent(
    //     key,
    //     () => AbsAudiobookProgress(
    //           id: key,
    //           isFinished: false,
    //         ));
    // progress.progress = position / duration;
    // progress.currentTime = Duration(milliseconds: position);

    // if (_sessionId != null && _lastCheckinTime != null) {
    //   await _api.playbackSessionCheckin(
    //       _sessionId!,
    //       Duration(milliseconds: duration),
    //       Duration(days: DateTime.now().microsecondsSinceEpoch),
    //       Duration(
    //           microseconds: DateTime.now().microsecondsSinceEpoch -
    //               _lastCheckinTime!.microsecondsSinceEpoch));
    // } else {
    //   _api.updateProgress(progress);
    // }
  }

  @override
  Future<List<ModelUnion>> search(String search) async {
    final response =
        (await _api.libraries.search(libraryId: _libraryId, query: search))
            ?.mapOrNull(
      book: (value) => value,
    );
    if (response == null) return [];
    return [
      // for (final book in response!.book.) _bookToItem(book.libraryItem),
      for (final author in response.authors
          .map((e) => e.mapOrNull((value) => null, expanded: (val) => val))
          .where((element) => element != null))
        ModelUnion.author(Author(
          id: '${MediaIds.authorsId}/${author!.id}',
          name: author.name,
          description: author.description ?? '',
          artPath: author.imagePath == null
              ? null
              : '${_api.baseUrl}/api/authors/${author.id}/image?token=${_api.token}&format=webp&width=400&ts=${author.updatedAt}',
        )),
      for (final series in response.series
          .map((e) => e.mapOrNull((value) => null, books: (val) => val))
          .where((element) => element != null))
        ModelUnion.series(
          Series(
            id: '${MediaIds.seriesId}/${series!.id}',
            name: series.name,
            numBooks: series.books.length,
            artPath: _scaledCoverUrl(
                    _api.baseUrl.toString(),
                    series.books.first.id,
                    series.books.first.updatedAt.microsecondsSinceEpoch)
                .toString(),
          ),
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
    await getUser();
    final personalized =
        await _api.libraries.getPersonalized(libraryId: _libraryId);
    Map<String, List<ModelUnion>> outMap = {};
    if (personalized == null) {
      return outMap;
    }
    for (final p in personalized) {
      p.maybeMap(
        orElse: () {},
        libraryItem: (value) {
          outMap.putIfAbsent(
            p.label,
            () => [
              for (final book in value.entities)
                ModelUnion.book(_absItemToBook(book)!)
            ],
          );
        },
        author: (value) {
          final authors = value.entities
              .map((e) => e.mapOrNull(
                    (value) => null,
                    expanded: (value) => value,
                  ))
              .where((element) => element != null);
          outMap.putIfAbsent(
            p.label,
            () => [
              for (final author in authors)
                ModelUnion.author(
                  Author(
                    id: '${MediaIds.authorsId}/${author!.id}',
                    name: author.name,
                    description: author.description ?? '',
                    artPath: author.imagePath == null
                        ? null
                        : '${_api.baseUrl}/api/authors/${author.id}/image?token=${_api.token}&format=webp&width=400&ts=${author.updatedAt}',
                    numBooks: author.numBooks,
                  ),
                )
            ],
          );
        },
      );
    }
    return outMap;
  }

  @override
  Future<List<Book>> getBooksFromPlaylist(String playlistId) async {
    return [
      for (final book in (await _api.playlists.get(playlistId: playlistId))!
          .items
          .map((e) => e
              .mapOrNull(
                (value) => null,
                expanded: (value) => value,
              )
              ?.libraryItem)
          .where((element) => element != null))
        _absItemToBook(book!)!
    ];
  }

  @override
  Future<List<Playlist>> getPlaylists() async {
    final playlists =
        await _api.libraries.getUserPlaylists(libraryId: _libraryId);

    return [
      for (final playlist in playlists!.results)
        Playlist(
          id: '@playlists/${playlist.id}',
          name: playlist.name,
          description: playlist.description,
          artPath: _scaledCoverUrl(
            _api.baseUrl.toString(),
            playlist.items[0]
                .mapOrNull(
                  (value) => null,
                  expanded: (value) => value,
                )
                ?.libraryItem
                .id,
            playlist.items[0]
                .mapOrNull(
                  (value) => null,
                  expanded: (value) => value,
                )
                ?.libraryItem
                .updatedAt
                .millisecondsSinceEpoch,
          ).toString(),
        ),
    ];
  }
}
