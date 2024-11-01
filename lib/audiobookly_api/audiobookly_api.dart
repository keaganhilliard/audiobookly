import 'dart:convert';
import 'dart:io';

import 'package:audiobookly/models/book.dart';
import 'package:http/http.dart' as http;

class AudiobooklyApi {
  AudiobooklyApi({required this.baseUrl, this.token});

  final String baseUrl;
  String? token;
  Map<String, Uri> cachedParsedUri = {};
  final client = http.Client();

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

  Uri createPath(String path, [Map<String, dynamic>? queryParameters]) {
    return createUri(baseUrl, path, queryParameters);
  }

  Future<String?> login(String username, String password) async {
    http.Response res = await client.post(
      createPath('auth/login'),
      body: {
        'username': username,
        'password': password,
      },
    );

    if (res.statusCode != HttpStatus.ok) {
      return null;
    }
    return jsonDecode(res.body)['token'];
  }

  Future<List<Book>?> getBooks() async {
    http.Response res = await client.get(
      createPath('books'),
    );

    if (res.statusCode != HttpStatus.ok) {
      return null;
    } else {
      final Map<String, dynamic> data = jsonDecode(res.body);
    }
  }
}
