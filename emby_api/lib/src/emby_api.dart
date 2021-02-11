import 'dart:convert';

import 'package:emby_api/src/emby_item.dart';

import 'emby_user.dart';
import 'emby_login_response.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class EmbyApi {
  String baseUrl;
  String client;
  String deviceName;
  String clientVersion;
  String token;
  String deviceId;
  String userId;
  EmbyUser user;

  final uuid = Uuid();

  Map<String, String> headers;
  EmbyApi({
    this.baseUrl,
    this.headers = const {},
    this.client,
    this.deviceName,
    this.clientVersion,
    this.token,
    this.deviceId,
    this.userId,
  });

  Future<List<EmbyUser>> getUsers() async {
    http.Response response =
        await http.get(Uri.https(baseUrl, '/Users/Public'));
    return List<EmbyUser>.from(jsonDecode(
      utf8.decode(response.bodyBytes),
    ).map((x) => EmbyUser.fromJson(x)));
  }

  Map<String, dynamic> _appendParameters(Map<String, dynamic> inputMap) {
    return {
      ...inputMap,
      'X-Emby-Client': client,
      'X-Emby-Device-Name': deviceName,
      'X-Emby-Client-Version': clientVersion,
      'X-Emby-Token': token,
      'X-Emby-Device-Id': deviceId
    };
  }

  String _genAuthHeader() {
    return 'Emby Client="$client", Device="$deviceName", DeviceId="$deviceId", Version="$clientVersion"';
  }

  Future<EmbyLoginResponse> login(String username, String password) async {
    http.Response response = await http.post(
      Uri.https(baseUrl, '/Users/AuthenticateByName'),
      headers: {
        'content-type': 'application/json',
        'x-emby-authorization': _genAuthHeader(),
        ...headers,
      },
      body: utf8.encode(
        jsonEncode({'Username': username, 'Pw': password}),
      ),
    );
    var elr =
        EmbyLoginResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    token = elr.accessToken;
    userId = elr.user.id;
    user = elr.user;
    return elr;
  }

  Future<List<EmbyItem>> getRecentlyAdded(String libraryId,
      [int limit = 20]) async {
    return await _getItems('/Users/$userId/Items', {
      'ParentId': libraryId,
      'Fields': 'Overview',
      'IncludeItemTypes': 'MusicAlbum',
      'Limit': '$limit',
      'SortBy': 'DateCreated',
      'SortOrder': 'Descending',
      'EnableImageTypes': 'Primary',
      'Recursive': 'true'
    });
  }

  Future<List<EmbyItem>> getRecentlyPlayed(String libraryId,
      [int limit = 10]) async {
    return await _getItems('/Users/$userId/Items/Resume', {
      'ParentId': libraryId,
      'Fields': 'Overview',
      // 'Limit': '$limit',
      'IncludeItemTypes': 'MusicAlbum',
      'EnableImageTypes': 'Primary',
      'Recursive': 'true'
    });
  }

  Future<List<EmbyItem>> getAll(String libraryId, [int limit = 10000]) async {
    return await _getItems('/Users/$userId/Items', {
      'ParentId': libraryId,
      'Fields': 'Overview',
      'IncludeItemTypes': 'MusicAlbum',
      // 'Limit': '$limit',
      'SortBy': 'AlbumArtist,ProductionYear',
      'SortOrder': 'Ascending,Ascending',
      'EnableImageTypes': 'Primary',
      'Recursive': 'true'
    });
  }

  Future<List<EmbyItem>> search(String libraryId, String searchTerm,
      [int limit = 10000]) async {
    return await _getItems('/Users/$userId/Items', {
      'ParentId': libraryId,
      'Fields': 'Overview',
      'IncludeItemTypes': 'MusicAlbum,BoxSet,MusicArtist',
      // 'Limit': '$limit',
      'SearchTerm': searchTerm,
      // 'SortBy': 'AlbumArtist,ProductionYear',
      // 'SortOrder': 'Ascending,Ascending',
      'EnableImageTypes': 'Primary',
      'Recursive': 'true'
    });
  }

  Future<List<EmbyItem>> getItemsForCollection(String collectionId) async {
    return await getAll(collectionId);
  }

  Future<List<EmbyItem>> getItemsForAlbum(String albumId) async {
    return await _getItems('/Users/$userId/Items', {
      'ParentId': albumId,
      'Fields': 'Overview,Chapters',
      'IncludeItemTypes': 'Audio',
      // 'SortBy': 'AlbumArtist,ProductionYear',
      // 'SortOrder': 'Ascending,Ascending',
      'EnableImageTypes': 'Primary',
      'Recursive': 'true'
    });
  }

  Future<List<EmbyItem>> getAuthors(String libraryId, [int limit]) async {
    return await _getItems(
      '/emby/Artists/AlbumArtists',
      {
        'SortBy': 'SortName',
        'SortOrder': 'Ascending',
        'Recursive': 'true',
        'Fields':
            'BasicSyncInfo,CanDelete,PrimaryImageAspectRatio,Overview,RunTimeTicks',
        'ImageTypeLimit': '1',
        'EnableImageTypes': 'Primary',
        'ParentId': '48af3bb0f5988d3cd867a245b7ef32d1',
        'ArtistType': 'AlbumArtist',
        'userId': userId,
      },
    );
  }

  Future<List<EmbyItem>> getItemsForAuthor(String authorId) async {
    return await _getItems('/Users/$userId/Items', {
      'ArtistIds': authorId,
      'Fields': 'Overview',
      'IncludeItemTypes': 'MusicAlbum',
      // 'Limit': '$limit',
      'SortBy': 'AlbumArtist,ProductionYear',
      'SortOrder': 'Ascending,Ascending',
      'EnableImageTypes': 'Primary',
      'Recursive': 'true'
    });
  }

  Future<List<EmbyItem>> getCollections(String libraryId) async {
    return await _getItems('/Users/$userId/Items', {
      'ParentId': libraryId,
      'Fields': 'Overview',
      'IncludeItemTypes': 'BoxSet',
      // 'Limit': '$limit',
      // 'SortBy': 'AlbumArtist,ProductionYear',
      // 'SortOrder': 'Ascending,Ascending',
      'EnableImageTypes': 'Primary',
      'Recursive': 'true'
    });
  }

  Future<EmbyItem> getItem(String itemId) async {
    http.Response response =
        await getResponse('/Users/$userId/Items/$itemId', {});
    print(response.body);
    return EmbyItem.fromJson(jsonDecode(
      utf8.decode(response.bodyBytes),
    ));
  }

  Future<EmbyUser> getUser() async {
    http.Response response = await getResponse('/Users/$userId', {});
    print(response.body);
    return EmbyUser.fromJson(jsonDecode(
      utf8.decode(response.bodyBytes),
    ));
  }

  String getThumbnailUrl(String itemId,
      [int maxHeight = 500, int maxWidth = 500]) {
    return Uri.https(baseUrl, '/Items/$itemId/Images/Primary', {
      'maxHeight': '$maxHeight',
      'maxWidth': '$maxWidth',
    }).toString();
  }

  Future<List<EmbyItem>> _getItems(
      String path, Map<String, dynamic> parameters) async {
    http.Response response = await getResponse(path, parameters);
    return List<EmbyItem>.from(
      _getItemsFromBody(
        jsonDecode(
          utf8.decode(response.bodyBytes),
        ),
      ),
    );
  }

  Future<http.Response> getResponse(
      String path, Map<String, dynamic> parameters) async {
    return await http.get(
      Uri.https(
        baseUrl,
        path,
        _appendParameters(parameters),
      ),
      headers: {
        'content-type': 'application/json',
        ...headers,
      },
    );
  }

  List<EmbyItem> _getItemsFromBody(Map<String, dynamic> json) {
    return json['Items'].map<EmbyItem>((x) => EmbyItem.fromJson(x)).toList();
  }

  String _playSession;
  String get playSession {
    if (_playSession == null) _playSession = uuid.v4();
    return _playSession;
  }

  String getServerUrl(String itemId) {
    return Uri.https(baseUrl, '/Audio/$itemId/stream', {
      'static': 'true',
      'UserId': userId,
      'DevceId': deviceId,
      'PlaySessionId': playSession,
      'MaxStremingBitrate': '140000000',
    }).toString();
  }
}
