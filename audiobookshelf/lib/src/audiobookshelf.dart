import 'dart:convert';
import 'package:audiobookshelf/audiobookshelf.dart';
import 'package:audiobookshelf/src/abs_search_response.dart';
import 'package:http/http.dart' as http;
import 'abs_audiobook.dart';
import 'abs_library.dart';
import 'abs_login_response.dart';
import 'abs_user.dart';

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

  Uri createUri(
    String url, [
    String? path,
    Map<String, dynamic>? queryParameters,
  ]) {
    var isHttp = false;
    if (url.startsWith('https://') || (isHttp = url.startsWith('http://'))) {
      var authority = url.substring((isHttp ? 'http://' : 'https://').length);

      if (isHttp) {
        return Uri.http(authority, path ?? '', queryParameters);
      } else {
        return Uri.https(authority, path ?? '', queryParameters);
      }
    } else if (url.startsWith('localhost')) {
      return createUri('http://' + url, '', queryParameters);
    }

    throw Exception('Unsupported scheme');
  }

  Future<AbsLoginResponse> login(String username, String password) async {
    http.Response response = await client.post(
      createUri(baseUrl!, '/login'),
      headers: {
        'content-type': 'application/json',
      },
      body: utf8.encode(
        jsonEncode({'username': username, 'password': password}),
      ),
    );
    var alr = AbsLoginResponse.fromJson(
      jsonDecode(utf8.decode(response.bodyBytes)),
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

  Future<List<AbsAudiobook>> getAll(String library) async {
    http.Response response = await client.get(
      createUri(baseUrl!, '/api/libraries/$library/books'),
      headers: {
        'content-type': 'application/json',
        'authorization': 'Bearer $token',
      },
    );

    return jsonDecode(utf8.decode(response.bodyBytes))
        .map<AbsAudiobook>((el) => AbsAudiobook.fromJson(el))
        .toList();
  }

  Future<List<AbsLibrary>> getLibraries() async {
    http.Response response = await client.get(
      createUri(baseUrl!, '/api/libraries'),
      headers: {
        'content-type': 'application/json',
        'authorization': 'Bearer $token',
      },
    );

    return jsonDecode(utf8.decode(response.bodyBytes))
        .map<AbsLibrary>((el) => AbsLibrary.fromJson(el))
        .toList();
  }

  Future<Map<String, AbsAudiobookProgress>> getRecentlyPlayed() async {
    await getUser();
    return user?.audiobooks ?? {};
  }

  int sortByAddedDate(AbsAudiobook a, AbsAudiobook b) {
    if (a.addedAt == null || b.addedAt == null) return 0;
    if (a.addedAt!.millisecondsSinceEpoch < b.addedAt!.millisecondsSinceEpoch) {
      return 1;
    } else if (a.addedAt!.millisecondsSinceEpoch >
        b.addedAt!.millisecondsSinceEpoch) {
      return -1;
    }
    return 0;
  }

  Future<List<AbsAudiobook>> getRecentlyAdded(String libraryId) async {
    var books = await getAll(libraryId);
    return (books..sort(sortByAddedDate)).take(10).toList();
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
      createUri(baseUrl!, '/api/books/$bookId'),
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
    ).map<AbsCollection>((x) => AbsCollection.fromMap(x)).toList();
  }

  Future<List<AbsAudiobook>> getBooksForCollection(String collectionId) async {
    http.Response response = await client.get(
      createUri(baseUrl!, '/api/collections/$collectionId'),
      headers: {
        'content-type': 'application/json',
        'authorization': 'Bearer $token',
      },
    );

    return AbsCollection.fromMap(jsonDecode(
      utf8.decode(response.bodyBytes),
    )).books;
  }

  Future markPlayed(String itemId) async {
    await patchAudiobook(itemId, true);
  }

  Future markUnplayed(String itemId) async {
    await patchAudiobook(itemId, false);
  }

  Future patchAudiobook(String itemId, bool isRead) async {
    await client.patch(createUri(baseUrl!, '/api/me/audiobook/$itemId'),
        headers: {
          'content-type': 'application/json',
          'authorization': 'Bearer $token',
        },
        body: utf8.encode(jsonEncode({'isRead': isRead})));
  }

  Future updateProgress(AbsAudiobookProgress progress) async {
    await client.patch(
        createUri(baseUrl!, '/api/me/audiobook/${progress.audiobookId}'),
        headers: {
          'content-type': 'application/json',
          'authorization': 'Bearer $token',
        },
        body: utf8.encode(jsonEncode(progress.toJson())));
  }
}
