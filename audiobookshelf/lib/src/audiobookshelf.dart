import 'dart:convert';
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
    http.Response response = await http.post(
      createUri(baseUrl!, '/login'),
      headers: {
        'content-type': 'application/json',
      },
      body: utf8.encode(
        jsonEncode({'username': username, 'password': password}),
      ),
    );
    var elr = AbsLoginResponse.fromJson(
      jsonDecode(utf8.decode(response.bodyBytes)),
    );
    token = elr.user.token;
    userId = elr.user.id;
    user = elr.user;
    return elr;
  }

  Future<AbsUser> getUser() async {
    http.Response response = await http.post(
      createUri(baseUrl!, '/api/authorize'),
      headers: {
        'content-type': 'application/json',
        'authorization': 'Bearer $token',
      },
    );
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes));
    return AbsUser.fromJson(decodedResponse['user']);
  }

  Future<List<AbsAudiobook>> getAll() async {
    http.Response response = await http.get(
      createUri(baseUrl!, '/api/audiobooks'),
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
    http.Response response = await http.get(
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
}
