import 'dart:convert';
import 'dart:developer';
import 'package:audiobookshelf/audiobookshelf.dart';
import 'package:audiobookshelf/src/models/abs_media_progress.dart';
import 'package:audiobookshelf/src/models/abs_series.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AudiobookshelfApi {
  String? baseUrl;
  String? token;
  Map<String, String> headers;
  String? userId;
  AbsUser? user;
  final client = http.Client();

  AudiobookshelfApi({
    this.baseUrl,
    this.token,
    this.headers = const {},
  });

  Map<String, Uri> cachedParsedUri = {};

  Uri createUri(
    String url, [
    String? path,
    Map<String, dynamic>? queryParameters,
  ]) {
    return cachedParsedUri
        .putIfAbsent(
          url,
          () => Uri.parse(!url.startsWith('http') ? 'http://$url' : url),
        )
        .replace(
          queryParameters: queryParameters,
          path: path ?? '',
        );
  }

  Future<AbsLoginResponse> login(String username, String password) async {
    http.Response response = await client.post(
      createUri(baseUrl!, '/login'),
      headers: {
        'content-type': 'application/json',
      },
      body: utf8.encode(
        jsonEncode({
          'username': username,
          'password': password,
        }),
      ),
    );
    log(response.body);
    var alr = AbsLoginResponse.fromJson(
      jsonDecode(
        utf8.decode(response.bodyBytes),
      ),
    );
    token = alr.user.token;
    userId = alr.user.id;
    user = alr.user;
    return alr;
  }

  Future<AbsUser> getUser() async {
    http.Response response = await client.post(
      createUri(baseUrl!, '/api/authorize'),
      headers: {
        'content-type': 'application/json',
        'authorization': 'Bearer $token',
      },
    );
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes));
    user = AbsUser.fromJson(decodedResponse['user']);
    return user!;
  }

  Future<AbsAudiobookProgress?> getItemProgress(String itemId) async {
    http.Response response = await client.get(
      createUri(baseUrl!, '/api/me/progress/$itemId'),
      headers: {
        'content-type': 'application/json',
        'authorization': 'Bearer $token',
      },
    );
    if (response.statusCode != 200) {
      return null;
    }
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes));
    return AbsAudiobookProgress.fromJson(decodedResponse);
  }

  Future<List<AbsAudiobookMinified>> getAll(
    String library, [
    int? page,
    String sort = 'media.metadata.authorName',
  ]) async {
    var queryParams = {'sort': sort, 'minified': '1'};
    if (page != null) {
      queryParams.putIfAbsent('page', () => '$page');
      queryParams.putIfAbsent('limit', () => '100');
    }

    return await compute(
      _getAll,
      (
        createUri(baseUrl!, '/api/libraries/$library/items', queryParams),
        {
          'content-type': 'application/json',
          'authorization': 'Bearer $token',
        },
      ),
    );
  }

  Future<List<AbsLibrary>> getLibraries() async {
    http.Response response = await client.get(
      createUri(baseUrl!, '/api/libraries'),
      headers: {
        'content-type': 'application/json',
        'authorization': 'Bearer $token',
      },
    );

    return jsonDecode(utf8.decode(response.bodyBytes))['libraries']
        .map<AbsLibrary>((el) => AbsLibrary.fromJson(el))
        .toList();
  }

  Future<Map<String, AbsAudiobookProgress>> getRecentlyPlayed() async {
    await getUser();
    return user?.mediaProgress ?? {};
  }

  int sortByAddedDate(AbsAudiobook a, AbsAudiobook b) {
    if (a.addedAt == null || b.addedAt == null) return 0;
    if (a.addedAt! < b.addedAt!) {
      return 1;
    } else if (a.addedAt! > b.addedAt!) {
      return -1;
    }
    return 0;
  }

  Future<List<AbsAudiobook>> getRecentlyAdded(String libraryId) async {
    http.Response response = await client.get(
      createUri(baseUrl!, '/api/libraries/$libraryId/items', {
        'sort': 'addedAt',
        'desc': '1',
        'limit': '10',
        //'minified': '1',
      }),
      headers: {
        'content-type': 'application/json',
        'authorization': 'Bearer $token',
      },
    );

    return jsonDecode(utf8.decode(response.bodyBytes))['results']
        .map<AbsAudiobook>((el) => AbsAudiobook.fromJson(el))
        .toList();
  }

  Future<List<Author>> getAuthors(String libraryId) async {
    http.Response response = await client.get(
      createUri(baseUrl!, '/api/libraries/$libraryId/authors'),
      headers: {
        'content-type': 'application/json',
        'authorization': 'Bearer $token',
      },
    );
    return jsonDecode(utf8.decode(response.bodyBytes))['authors']
        .map<Author>((el) => Author.fromJson(el))
        .toList();
  }

  Future<List<AbsPlaylist>> getPlaylists(String libraryId) async {
    http.Response response = await client.get(
      createUri(baseUrl!, '/api/libraries/$libraryId/playlists'),
      headers: {
        'content-type': 'application/json',
        'authorization': 'Bearer $token',
      },
    );
    return jsonDecode(utf8.decode(response.bodyBytes))['results']
        .map<AbsPlaylist>((el) => AbsPlaylist.fromJson(el))
        .toList();
  }

  Future<List<AbsAudiobook>> getBooksForPlaylist(String playlistId) async {
    http.Response response = await client.get(
      createUri(
        baseUrl!,
        '/api/playlists/$playlistId',
      ),
      headers: {
        'content-type': 'application/json',
        'authorization': 'Bearer $token',
      },
    );

    return [
      for (final item in AbsPlaylist.fromJson(
        jsonDecode(
          utf8.decode(response.bodyBytes),
        ),
      ).items)
        item.libraryItem
    ];
  }

  Future<List<AbsAudiobook>> getBooksForAuthor(
      String libraryId, String author) async {
    final encodedAuthor = base64Encode(utf8.encode(author));
    http.Response response = await client.get(
      createUri(
        baseUrl!,
        '/api/libraries/$libraryId/items',
        {
          'expanded': '1',
          'filter': 'authors.$encodedAuthor',
        },
      ),
      headers: {
        'content-type': 'application/json',
        'authorization': 'Bearer $token',
      },
    );

    return jsonDecode(utf8.decode(response.bodyBytes))['results']
        .map<AbsAudiobook>((el) => AbsAudiobook.fromJson(el))
        .toList();
  }

  Future<AbsSearchResponse> search(String libraryId, String searchTerm) async {
    http.Response response = await client.get(
      createUri(baseUrl!, '/api/libraries/$libraryId/search',
          {'q': searchTerm, 'max': '10'}),
      headers: {
        'content-type': 'application/json',
        'authorization': 'Bearer $token',
      },
    );
    return AbsSearchResponse.fromMap(
      jsonDecode(
        utf8.decode(response.bodyBytes),
      ),
    );
  }

  Future<AbsAudiobook> getBookInfo(String bookId) async {
    http.Response response = await client.get(
      createUri(baseUrl!, '/api/items/$bookId', {'expanded': '1'}),
      headers: {
        'content-type': 'application/json',
        'authorization': 'Bearer $token',
      },
    );

    return AbsAudiobook.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  }

  Future<List<AbsCollection>> getCollections() async {
    http.Response response = await client.get(
      createUri(baseUrl!, '/api/collections'),
      headers: {
        'content-type': 'application/json',
        'authorization': 'Bearer $token',
      },
    );

    return jsonDecode(
      utf8.decode(response.bodyBytes),
    )['collections']
        .map<AbsCollection>((x) => AbsCollection.fromMap(x))
        .toList();
  }

  Future<List<AbsAudiobook>> getBooksForCollection(String collectionId) async {
    http.Response response = await client.get(
      createUri(
        baseUrl!,
        '/api/collections/$collectionId',
      ),
      headers: {
        'content-type': 'application/json',
        'authorization': 'Bearer $token',
      },
    );

    return AbsCollection.fromMap(jsonDecode(
      utf8.decode(response.bodyBytes),
    )).books;
  }

  Future<List<AbsSeries>> getSeries(String libraryId) async {
    http.Response response = await client.get(
      createUri(
          baseUrl!, '/api/libraries/$libraryId/series', {'minified': '1'}),
      headers: {
        'content-type': 'application/json',
        'authorization': 'Bearer $token',
      },
    );

    return jsonDecode(
      utf8.decode(response.bodyBytes),
    )['results']
        .map<AbsSeries>((x) => AbsSeries.fromJson(x))
        .toList();
  }

  Future<List<AbsPersonalizedResponse>> getPersonalized(
      String libraryId) async {
    http.Response response = await client.get(
      createUri(baseUrl!, '/api/libraries/$libraryId/personalized'),
      headers: {
        'content-type': 'application/json',
        'authorization': 'Bearer $token',
      },
    );

    return jsonDecode(utf8.decode(response.bodyBytes))
        .map<AbsPersonalizedResponse>(
            (el) => AbsPersonalizedResponse.fromJson(el))
        .toList();
  }

  Future<List<AbsAudiobook>> getBooksForSeries(
      String libraryId, String seriesId) async {
    final encodedSeriesId = base64Encode(utf8.encode(seriesId));
    http.Response response = await client.get(
      createUri(
        baseUrl!,
        '/api/libraries/$libraryId/items',
        {
          'expanded': '1',
          'filter': 'series.$encodedSeriesId',
        },
      ),
      headers: {
        'content-type': 'application/json',
        'authorization': 'Bearer $token',
      },
    );

    return jsonDecode(utf8.decode(response.bodyBytes))['results']
        .map<AbsAudiobook>((el) => AbsAudiobook.fromJson(el))
        .toList();
  }

  Future<String> startPlaybackSession(
      String id, AbsPlayItemRequest playRequest) async {
    http.Response response = await client.post(
      createUri(baseUrl!, '/api/items/$id/play'),
      headers: {
        'content-type': 'application/json',
        'authorization': 'Bearer $token',
      },
      body: jsonEncode(playRequest.toJson()),
    );
    return jsonDecode(response.body)['id'];
  }

  Future markPlayed(String itemId) async {
    (await patchAudiobook(itemId, true));
  }

  Future markUnplayed(String itemId) async {
    await patchAudiobook(itemId, false);
  }

  Future<http.Response> patchAudiobook(String itemId, bool isRead) async {
    return await client.patch(createUri(baseUrl!, '/api/me/progress/$itemId'),
        headers: {
          'content-type': 'application/json',
          'authorization': 'Bearer $token',
        },
        body: utf8.encode(jsonEncode({'isFinished': isRead})));
  }

  Future updateProgress(AbsAudiobookProgress progress) async {
    await client.patch(createUri(baseUrl!, '/api/me/progress/${progress.id}'),
        headers: {
          'content-type': 'application/json',
          'authorization': 'Bearer $token',
        },
        body: utf8.encode(jsonEncode(progress.toJson())));
  }

  Future playbackSessionCheckin(String sessionId, Duration duration,
      Duration currentTime, Duration timeListened) async {
    await client.post(createUri(baseUrl!, '/api/session/$sessionId/sync'),
        headers: {
          'content-type': 'application/json',
          'authorization': 'Bearer $token',
        },
        body: utf8.encode(jsonEncode({
          'currentTime': durationToSeconds(currentTime),
          'timeListened': durationToSeconds(timeListened),
          'duration': durationToSeconds(duration),
        })));
  }

  Future sendProgressSync(String sessionId, AbsMediaProgress progress) async {
    await client.post(
      createUri(baseUrl!, '/api/session/$sessionId/sync'),
      headers: {
        'content-type': 'application/json',
        'authorization': 'Bearer $token',
      },
      body: utf8.encode(jsonEncode(progress.toJson())),
    );
  }
}

const microToSeconds = 1000000;

double durationToSeconds(Duration dur) {
  return dur.inMicroseconds / microToSeconds;
}

List<AbsAudiobookMinified> _convertBody(List<int> bodyBytes) {
  late List<AbsAudiobookMinified> results;
  try {
    results = [
      for (final json in jsonDecode(utf8.decode(bodyBytes))['results'])
        AbsAudiobookMinified.fromJson(json)
    ];
  } catch (e, stack) {
    log('$e');
    log('$stack');
    results = [];
  }
  return results;
}

Future<List<AbsAudiobookMinified>> _getAll(
  (Uri, Map<String, String>) params,
) async {
  final (uri, headers) = params;
  final response = await http.get(uri, headers: headers);
  return _convertBody(response.bodyBytes);
}
