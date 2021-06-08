import 'dart:convert';

import 'package:emby_api/src/emby_item.dart';
import 'package:flutter/foundation.dart';

import 'emby_user.dart';
import 'emby_login_response.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class EmbyApi {
  String? baseUrl;
  String? client;
  String? deviceName;
  String? clientVersion;
  String? token;
  String? deviceId;
  String? userId;
  EmbyUser? user;

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

  Uri createUri(String url,
      [String? path, Map<String, dynamic>? queryParameters]) {
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

  Future<List<EmbyUser>> getUsers() async {
    http.Response response =
        await http.get(createUri(baseUrl!, '/Users/Public'));
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
      createUri(baseUrl!, '/Users/AuthenticateByName'),
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
    userId = elr.user!.id;
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
    return await _getItems('/Users/$userId/Items', {
      'ParentId': collectionId,
      'Fields': 'Overview',
      'IncludeItemTypes': 'MusicAlbum',
      // 'Limit': '$limit',
      // 'SortBy': 'AlbumArtist,ProductionYear',
      // 'SortOrder': 'Ascending,Ascending',
      'EnableImageTypes': 'Primary',
      // 'Recursive': 'true'
    });
  }

  Future<List<EmbyItem>> getItemsForAlbum(String albumId) async {
    return await _getItems('/Users/$userId/Items', {
      'ParentId': albumId,
      'Fields': 'Overview,Chapters',
      'IncludeItemTypes': 'Audio',
      'EnableImageTypes': 'Primary',
      'Recursive': 'true'
    });
  }

  Future<List<EmbyItem>> getAuthors(String libraryId, [int? limit]) async {
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
        'ParentId': libraryId,
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
    http.Response response = await makeGet('/Users/$userId/Items/$itemId', {});
    print(response.body);
    return EmbyItem.fromJson(jsonDecode(
      utf8.decode(response.bodyBytes),
    ));
  }

  Future<EmbyUser> getUser() async {
    http.Response response = await makeGet('/Users/$userId', {});
    print(response.body);
    return EmbyUser.fromJson(jsonDecode(
      utf8.decode(response.bodyBytes),
    ));
  }

  String getThumbnailUrl(String itemId,
      [int maxHeight = 500, int maxWidth = 500]) {
    return createUri(baseUrl!, '/Items/$itemId/Images/Primary', {
      'maxHeight': '$maxHeight',
      'maxWidth': '$maxWidth',
    }).toString();
  }

  Future<List<EmbyItem>> _getItems(
      String path, Map<String, dynamic> parameters) async {
    http.Response response = await makeGet(path, parameters);
    return List<EmbyItem>.from(
      _getItemsFromBody(
        jsonDecode(
          utf8.decode(response.bodyBytes),
        ),
      )!,
    );
  }

  Future<http.Response> makeGet(
      String path, Map<String, dynamic> parameters) async {
    return await http.get(
      createUri(
        baseUrl!,
        path,
        _appendParameters(parameters),
      ),
      headers: {
        'content-type': 'application/json',
        ...headers,
      },
    );
  }

  Future<http.Response> makeDelete(
      String path, Map<String, dynamic> parameters) async {
    return await http.delete(
      createUri(
        baseUrl!,
        path,
        _appendParameters(parameters),
      ),
      headers: {
        'content-type': 'application/json',
        ...headers,
      },
    );
  }

  Future<http.Response> makePost(
      String path, Map<String, dynamic> parameters, dynamic body) async {
    return await http.post(
      createUri(
        baseUrl!,
        path,
        _appendParameters(parameters),
      ),
      headers: {
        'content-type': 'application/json',
        ...headers,
      },
      body: utf8.encode(jsonEncode(body)),
    );
  }

  List<EmbyItem>? _getItemsFromBody(Map<String, dynamic> json) {
    return json['Items'].map<EmbyItem>((x) => EmbyItem.fromJson(x)).toList();
  }

  Map<String, String> playSessions = {};

  // String getServerUrl(String itemId) {
  //   String sessionId = playSessions.putIfAbsent(itemId, () => uuid.v4());
  //   final uri = Uri.https(baseUrl, '/Audio/$itemId/stream.m4a', {
  //     'static': 'true',
  //     'UserId': userId,
  //     'DevceId': deviceId,
  //     'PlaySessionId': sessionId,
  //     'MaxStreamingBitrate': '140000000',
  //   }).toString();
  //   print('The URI!: $uri');
  //   return uri;
  // }

  String getServerUrl(String itemId) {
    String sessionId = playSessions.putIfAbsent(itemId, () => uuid.v4());
    final uri = createUri(baseUrl!, '/Audio/$itemId/universal', {
      'UserId': userId,
      'DevceId': deviceId,
      'PlaySessionId': sessionId,
      'MaxStreamingBitrate': '140000000',
      'Container': [
        'opus',
        'mp3',
        'aac',
        'm4a',
        'flac',
        'webma',
        'webm',
        'wav',
        'ogg',
        'oga',
        'm4b',
        'mp4',
      ].join(',')
    }).toString();
    print('The URI!: $uri');
    return uri;
  }

  String getDownloadUrl(String itemId) {
    return createUri(baseUrl!, '/Items/$itemId/Download', {
      'X-Emby-Token': token,
    }).toString();
  }

  Future<void> playbackStarted(
      String itemId, Duration position, Duration duration,
      [double playbackRate = 1.0]) async {
    await makePost('/Sessions/Playing', {}, {
      'ItemId': itemId,
      'CanSeek': true,
      'PlaySessionId': playSessions[itemId],
      'PositionTicks': position.inMicroseconds * 10,
      'PlaybackRate': playbackRate,
      'IsPaused': false
    });
  }

  Future<void> playbackCheckin(
      String itemId, Duration position, Duration duration, EmbyEvent event,
      [double playbackRate = 1.0, bool paused = false]) async {
    print(
        'Checking in bitches ${position.inMinutes}: Event ${describeEnum(event)}');
    final res = await makePost('/Sessions/Playing/Progress', {}, {
      'ItemId': itemId,
      'CanSeek': true,
      'PlaySessionId': playSessions[itemId],
      'EventName': describeEnum(event).toLowerCase(),
      'IsPaused': paused,
      'PositionTicks': position.inMicroseconds * 10,
      'PlaybackRate': playbackRate,
    });
    print(res.body);
  }

  Future<void> playbackStopped(
      String itemId, Duration position, Duration duration,
      [double playbackRate = 1.0]) async {
    await makePost('/Sessions/Playing/Stopped', {}, {
      'ItemId': itemId,
      'CanSeek': true,
      'PlaySessionId': playSessions[itemId],
      'PositionTicks': position.inMicroseconds * 10,
      'PlaybackRate': playbackRate,
    });
  }

  ///Users/{UserId}/PlayedItems/{Id}
  Future<void> markPlayed(String itemId) async {
    final response =
        await makePost('/Users/$userId/PlayedItems/$itemId', {}, {});
    print(response.statusCode);
  }

  Future<void> markUnplayed(String itemId) async {
    final response = await makeDelete('/Users/$userId/PlayedItems/$itemId', {});
    print(response.statusCode);
  }

  Future<List<EmbyItem>> getLibraries() async {
    return await _getItems(
      '/Users/$userId/Items',
      {
        'EnableImageTypes': 'Primary',
      },
    );
  }
}

enum EmbyEvent { TimeUpdate, Pause, Unpause, PlaybackRateChange }
