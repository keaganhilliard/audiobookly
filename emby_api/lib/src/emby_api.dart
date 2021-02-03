import 'dart:convert';

import 'package:emby_api/src/emby_item.dart';

import 'emby_user.dart';
import 'emby_login_response.dart';
import 'package:http/http.dart' as http;

class EmbyApi {
  String path;
  String client;
  String deviceName;
  String clientVersion;
  String token;

  Map<String, String> headers;
  EmbyApi(this.path, [this.headers = const {}]);

  Future<List<EmbyUser>> getUsers() async {}

  Future<EmbyLoginResponse> login(String username, String password) async {
    http.Response response = await http.post(
      Uri.https(
          path, //+ (path.hasPort ? path.port.toString() : ''),
          '/Users/AuthenticateByName'),
      headers: headers..putIfAbsent('content-type', () => 'application/json'),
      body: utf8.encode(
        jsonEncode({'Username': username, 'Pw': password}),
      ),
    );
    var elr =
        EmbyLoginResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    headers.putIfAbsent('x-emby-token', () => elr.accessToken);
    return elr;
  }

  Future<List<EmbyItem>> getRecentlyAdded(String libraryId,
      [int limit = 10]) async {
    http.Response response = await http.get(
      Uri.https(
        path, //+ (path.hasPort ? path.port.toString() : ''),
        '/emby/Users/31a845bac32341a3a379b67d326489bf/Items',
        {
          'ParentId': libraryId,
          'Fields': 'Overview',
          'IncludeItemTypes': 'MusicAlbum',
          'Limit': '$limit',
          'SortBy': 'DateCreated',
          'SortOrder': 'Descending',
          'EnableImageTypes': 'Primary',
          'Recursive': 'true',
          'X-Emby-Client': 'Audiobookly',
          'X-Emby-Device-Name': 'Android',
          'X-Emby-Client-Version': '0.0.1.0',
          'X-Emby-Token': '0c7b8823527d4bd19f97ceccc0174cce',
        },
      ),
      headers: headers..putIfAbsent('content-type', () => 'application/json'),
    );
    print(response.body);
    return List<EmbyItem>.from(
      _getItems(
        jsonDecode(
          utf8.decode(response.bodyBytes),
        ),
      ).map((x) => EmbyItem.fromJson(x)),
    );
  }

  dynamic _getItems(Map<String, dynamic> json) {
    return json['Items'];
  }
}
