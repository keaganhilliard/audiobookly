import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:plex_api/plex_api.dart';
import 'package:plex_api/src/plex_collections_response.dart';
import 'package:plex_api/src/plex_metadata_response.dart';
import 'package:plex_api/src/plex_pin.dart';
import 'package:plex_api/src/plex_sections_response.dart';
import 'package:plex_api/src/plex_server.dart';
import 'package:http/http.dart' as http;
import 'package:plex_api/src/plex_login_response.dart';

enum PlexPlaybackState { PLAYING, STOPPED, PAUSED, BUFFERING }

class PlexApi {
  String? authToken;
  Uri loginUrl = Uri.https('plex.tv', '/users/sign_in.json');
  PlexHeaders headers;
  PlexUser? user;
  PlexServer? server;

  PlexApi({required this.headers}) {
    this.authToken = headers.token;
  }

  bool isAuthorized() {
    return this.user != null;
  }

  Future<PlexUser?> authenticate(String authToken) async {
    headers.token = authToken;
    http.Response response = await http.get(
        Uri.https('plex.tv', '/users/account.json'),
        headers: headers.toMap());
    PlexLoginResponse plexLoginResponse =
        PlexLoginResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    user = plexLoginResponse.user;
    return user;
  }

  Future<PlexUser?> getUser([PlexServer? server]) async {
    headers.token = authToken;
    http.Response response = await http.get(
        Uri.https('plex.tv', '/users/account.json'),
        headers: headers.toMap(
            overrideToken: server?.accessToken ?? this.headers.token));
    PlexLoginResponse plexLoginResponse =
        PlexLoginResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    user = plexLoginResponse.user;
    return user;
  }

  Future<PlexUser?> login(String username, String password) async {
    user = null;
    http.Response response =
        await http.post(loginUrl, headers: headers.toMap(), body: '''
      {
        "user": {
          "login": "$username",
          "password": "$password"
        }
      }
      ''');
    if (response.statusCode != 201) throw Exception('Bull shit');
    if (response.statusCode == 201) {
      PlexLoginResponse plexLoginResponse = PlexLoginResponse.fromJson(
          jsonDecode(utf8.decode(response.bodyBytes)));
      user = plexLoginResponse.user;
      headers.token = user!.authToken;
    }
    return user;
  }

  Future<List<PlexServer>> getServers() async {
    http.Response response = await http.get(
        Uri.https('plex.tv', '/api/v2/resources', {'includeHttps': '1'}),
        headers: headers.toMap());
    List<PlexServer> servers = [];
    jsonDecode(utf8.decode(response.bodyBytes)).toList().forEach((v) {
      PlexServer server = PlexServer.fromJson(v);
      server.api = this;
      if (server.provides == 'server') {
        servers.add(server);
      }
    });
    return servers;
  }

  Future<List<PlexLibrary>?> getLibraries(PlexServer server) async {
    try {
      http.Response response = await http.get(
          Uri.parse('${server.mainConnection!.uri}/library/sections'),
          headers: headers.toMap(overrideToken: server.accessToken));
      print('SERVER URI: ${server.mainConnection!.uri}/library/sections}');
      print(
          'SERVER HEADERS: ${headers.toMap(overrideToken: server.accessToken)}');
      PlexSections sections =
          PlexSections.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      return sections.mediaContainer!.directory!
          .where((lib) => lib.type == 'artist')
          .toList();
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<List<PlexMetadata>?> getMetadata(
      PlexServer server, String path) async {
    http.Response response = await http.get(
        Uri.parse('${server.mainConnection!.uri}$path'),
        headers: headers.toMap(overrideToken: server.accessToken));
    PlexMetadataResponse sections = PlexMetadataResponse.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)));
    return sections.mediaContainer!.metadata;
  }

  Future<List<PlexArtist>?> getArtists(
      PlexServer server, String libraryKey) async {
    http.Response response = await http.get(
        Uri.parse(
            '${server.mainConnection!.uri}/library/sections/$libraryKey/all'),
        headers: headers.toMap(overrideToken: server.accessToken));
    PlexMetadataResponse sections = PlexMetadataResponse.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)));
    return sections.mediaContainer!.metadata?.cast();
  }

  Future<List<PlexAlbum>?> getAllAlbums(
      PlexServer server, String libraryKey) async {
    http.Response response = await http.get(
        Uri.parse(
            '${server.mainConnection!.uri}/library/sections/$libraryKey/all?type=9'),
        headers: headers.toMap(overrideToken: server.accessToken));
    PlexMetadataResponse sections = PlexMetadataResponse.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)));
    return sections.mediaContainer!.metadata?.cast();
  }

  // static List<PlexTrack> decodeTracks(Uint8List body) async {
  //   print('Trying to decode');
  //   PlexMetadataResponse sections =
  //       PlexMetadataResponse.fromJson(jsonDecode(utf8.decode(body)));
  //   return sections.mediaContainer!.metadata as List<PlexTrack>;
  // }

  // Future<List<PlexTrack>> getAllTracks(
  //     PlexServer server, String libraryKey) async {
  //   Uri u = Uri.parse(server.mainConnection!.uri!);

  //   http.Response response = await http.get(
  //       Uri.https(
  //           u.authority, 'library/sections/$libraryKey/all', <String, String>{
  //         'type': '10',
  //         // 'X-Plex-Container-Start': '0',
  //         // 'X-Plex-Container-Size': '2000'
  //       }),
  //       headers: headers.toMap(overrideToken: server.accessToken));
  //   print(response.request!.url);
  //   print(response.body);
  //   print('Got the response: ${DateTime.now()}');
  //   return await compute<List<PlexTrack>>(decodeTracks, response.bodyBytes);
  //   // PlexMetadataResponse sections = PlexMetadataResponse.fromJson(
  //   //     jsonDecode(utf8.decode(response.bodyBytes)));
  //   // return sections.mediaContainer.metadata;
  // }

  Future<PlexAlbum> getAlbumFromKey(PlexServer server, String albumKey) async {
    http.Response response = await http.get(
        Uri.parse('${server.mainConnection!.uri}/library/metadata/$albumKey/'),
        headers: headers.toMap(overrideToken: server.accessToken));
    PlexMetadataResponse sections = PlexMetadataResponse.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)));
    return sections.mediaContainer!.metadata?.cast()[0];
  }

  Future<List<PlexAlbum>?> getRecentlyAdded(
      PlexServer server, String libraryKey) async {
    http.Response response = await http.get(
        Uri.parse(
            '${server.mainConnection!.uri}/library/sections/$libraryKey/recentlyAdded'),
        headers: headers.toMap(overrideToken: server.accessToken));
    PlexMetadataResponse sections = PlexMetadataResponse.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)));
    return sections.mediaContainer!.metadata?.cast();
  }

  Future<List<PlexAlbum>> getRecentlyViewed(
      PlexServer server, String libraryKey) async {
    http.Response response = await http.get(
        Uri.parse(
            '${server.mainConnection!.uri}/library/sections/$libraryKey/recentlyViewed'),
        headers: headers.toMap(overrideToken: server.accessToken));
    PlexMetadataResponse sections = PlexMetadataResponse.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)));
    sections.mediaContainer!.metadata!.forEach((f) {});
    return sections.mediaContainer!.metadata!.getRange(0, 3).toList().cast();
  }

  Future<List<PlexAlbum>?> getAlbumsFromArtist(
      PlexServer server, String artistRatingKey) async {
    http.Response response = await http.get(
        Uri.parse(
            '${server.mainConnection!.uri}/library/metadata/$artistRatingKey/children'),
        headers: headers.toMap(overrideToken: server.accessToken));
    print('Getting albums for $artistRatingKey');
    print(response.body);
    PlexMetadataResponse sections = PlexMetadataResponse.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)));
    return sections.mediaContainer!.metadata?.cast();
  }

  Future<List<PlexAlbum>?> getAlbumsFromCollection(
      PlexServer server, String libraryKey, String collectionKey) async {
    http.Response response = await http.get(
        Uri.parse(
            '${server.mainConnection!.uri}/library/sections/$libraryKey/all?collection=$collectionKey&type=9&sort=originallyAvailableAt'),
        headers: headers.toMap(overrideToken: server.accessToken));
    PlexMetadataResponse sections = PlexMetadataResponse.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)));
    return sections.mediaContainer!.metadata?.cast();
  }

  Future<List<PlexTrack>?> getTracks(
      PlexServer server, String albumRatingKey) async {
    http.Response response = await http.get(
        Uri.parse(
            '${server.mainConnection!.uri}/library/metadata/$albumRatingKey/children'),
        headers: headers.toMap(overrideToken: server.accessToken));
    PlexMetadataResponse sections = PlexMetadataResponse.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)));
    return sections.mediaContainer!.metadata?.cast();
  }

  Future<List<PlexCollection>?> getCollections(
      PlexServer server, String libraryKey) async {
    http.Response response = await http.get(
        Uri.parse(
            '${server.mainConnection!.uri}/library/sections/$libraryKey/collection/?type=9'),
        headers: headers.toMap(overrideToken: server.accessToken));
    PlexCollectionsResponse collectionsResponse =
        PlexCollectionsResponse.fromJson(
            jsonDecode(utf8.decode(response.bodyBytes)));
    return collectionsResponse.mediaContainer!.directory;
  }

  Future<List<PlexAlbum>> searchAlbums(
      PlexServer server, String libraryKey, String search) async {
    http.Response albumTitleResponse = await http.get(
        Uri.parse(
            '${server.mainConnection!.uri}/library/sections/$libraryKey/all?album.title=$search&type=9'),
        headers: headers.toMap(overrideToken: server.accessToken));
    PlexMetadataResponse albumSections =
        PlexMetadataResponse.fromJson(jsonDecode(albumTitleResponse.body));
    http.Response artistTitleResponse = await http.get(
        Uri.parse(
            '${server.mainConnection!.uri}/library/sections/$libraryKey/all?artist.title=$search&type=9'),
        headers: headers.toMap(overrideToken: server.accessToken));
    PlexMetadataResponse artistSections =
        PlexMetadataResponse.fromJson(jsonDecode(artistTitleResponse.body));
    return [
      ...albumSections.mediaContainer!.metadata?.cast<PlexAlbum>() ?? [],
      ...artistSections.mediaContainer!.metadata?.cast<PlexAlbum>() ?? []
    ];
  }

  String playbackStateToString(PlexPlaybackState state) {
    switch (state) {
      case PlexPlaybackState.PAUSED:
        return 'paused';
      case PlexPlaybackState.PLAYING:
        return 'playing';
      case PlexPlaybackState.BUFFERING:
        return 'buffering';
      default:
        return 'stopped';
    }
  }

  Future savePosition(PlexServer server, String key, int currentTime,
      int duration, PlexPlaybackState state) async {
    http.Response response = await http.post(
        Uri.parse(
            '${server.mainConnection!.uri}/:/timeline?ratingKey=$key&key=${Uri.encodeComponent("/library/metadata/")}$key&state=${playbackStateToString(state)}&duration=$duration&time=$currentTime'),
        headers: headers.toMap());
    print('Save position response: ${response.body}');
    print(
        'Url: ${server.mainConnection!.uri}/:/timeline?ratingKey=$key&key=${Uri.encodeComponent("/library/metadata/")}$key&state=${playbackStateToString(state)}&duration=$duration&time=$currentTime');
  }

  ///:/timeline?ratingKey=26117&key=%2Flibrary%2Fmetadata%2F26117&state=stopped&hasMDE=1&time=1650000&duration=46141000
  // :/timeline?key=26117&%2Flibrary%2Fmetadata%2F26117&state=paused&duration=92283768&time=1660989
  // void setServer(PlexServer server) {
  //   this.server = server;
  // }

  // Future<String> getUsableUrl(String path) async {
  //   return 'http://${server.address == await getCurrentIP() ? server.localAddresses[0] : server.address}:${server.port}/$path?X-Plex-Token=${user.authToken}';
  // }

  String getUrlWithToken(PlexServer server, String path) {
    return '${server.mainConnection!.uri}$path?X-Plex-Token=${server.accessToken}&X-Plex-Client-Identifier=${headers.clientIdentifier}';
  }

  Uri getThumbnailUrl(PlexServer server, String path, [int dimension = 400]) {
    return Uri.parse(
        '${server.mainConnection!.uri}/photo/:/transcode?width=$dimension&height=$dimension&minSize=1&upscale=1&url=${Uri.encodeComponent(path)}&X-Plex-Token=${server.accessToken}&X-Plex-Client-Identifier=${headers.clientIdentifier}');
  }

  // Future<Uri> getUsableUri(path) async => Uri.http(
  //     '${server.address == await getCurrentIP() ? server.localAddresses[0] : server.address}:${server.port}',
  //     path);

  Future<String> getCurrentIP() async {
    http.Response res = await http.get(Uri.https('plex.tv', '/pms/:/ip'));
    return res.body.trim();
  }

  Uri getPinUri(String identifier) {
    return Uri.https('plex.tv', '/api/v2/pins', {'strong': 'true'});
  }

  Future<PlexPin> getPin() async {
    http.Response response = await http
        .post(getPinUri(headers.clientIdentifier), headers: headers.toMap());
    PlexPin pin = PlexPin.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    return pin;
  }

  String getOauthUrl(String code) {
    Uri theUri = Uri.https('app.plex.tv', 'auth#', {
      'code': code,
      'context[device][product]': headers.product,
      'context[device][platform]': headers.platform,
      'context[device][platformVersion]': headers.platformVersion,
      'context[device][device]': 'Audiobookly',
      'clientID': headers.clientIdentifier
    });
    return Uri.decodeFull(theUri.toString());
  }

  Future<PlexPin> getAuthToken(int pinId) async {
    http.Response response = await http.get(
        Uri.https('plex.tv', '/api/v2/pins/$pinId'),
        headers: headers.toMap());
    PlexPin pin = PlexPin.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    return pin;
  }
}

class _ProxyHttpServer {
  late HttpServer _server;

  /// Maps request keys to [_ProxyRequest]s.
  final Map<String, _ProxyRequest> _uriMap = {};

  /// The port this server is bound to on localhost. This is set only after
  /// [start] has completed.
  int get port => _server.port;

  /// Associate headers with a URL. This may be called only after [start] has
  /// completed.
  Uri addUrl(Uri url, Map<String, String> headers) {
    final path = _requestKey(url);
    _uriMap[path] = _ProxyRequest(url, headers);
    return url.replace(
      scheme: 'http',
      host: InternetAddress.loopbackIPv4.address,
      port: port,
    );
  }

  /// A unique key for each request that can be processed by this proxy,
  /// made up of the URL path and query string. It is not possible to
  /// simultaneously track requests that have the same URL path and query
  /// but differ in other respects such as the port or headers.
  String _requestKey(Uri uri) => '${uri.path}?${uri.query}';

  /// Starts the server.
  Future start() async {
    _server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    _server.listen((request) async {
      if (request.method == 'GET') {
        final path = _requestKey(request.uri);
        final proxyRequest = _uriMap[path]!;
        final originRequest = await HttpClient().getUrl(proxyRequest.uri);

        // Rewrite request headers
        final host = originRequest.headers.value('host')!;
        originRequest.headers.clear();
        request.headers.forEach((name, value) {
          originRequest.headers.set(name, value);
        });
        for (var name in proxyRequest.headers.keys) {
          originRequest.headers.set(name, proxyRequest.headers[name]!);
        }
        originRequest.headers.set('host', host);

        // Try to make normal request
        try {
          final originResponse = await originRequest.close();

          request.response.headers.clear();
          originResponse.headers.forEach((name, value) {
            request.response.headers.set(name, value);
          });
          request.response.statusCode = originResponse.statusCode;

          // Pipe response
          await originResponse.pipe(request.response);
          await request.response.close();
        } on HttpException {
          // We likely are dealing with a streaming protocol
          if (proxyRequest.uri.scheme == 'http') {
            // Try parsing HTTP 0.9 response
            //request.response.headers.clear();
            final socket = await Socket.connect(
                proxyRequest.uri.host, proxyRequest.uri.port);
            final clientSocket =
                await request.response.detachSocket(writeHeaders: false);
            Completer done = Completer();
            socket.listen(
              clientSocket.add,
              onDone: () async {
                await clientSocket.flush();
                socket.close();
                clientSocket.close();
                done.complete();
              },
            );
            // Rewrite headers
            final headers = <String, String?>{};
            request.headers.forEach((name, value) {
              if (name.toLowerCase() != 'host') {
                headers[name] = value.join(",");
              }
            });
            for (var name in proxyRequest.headers.keys) {
              headers[name] = proxyRequest.headers[name];
            }
            socket.write("GET ${proxyRequest.uri.path} HTTP/1.1\n");
            if (host != null) {
              socket.write("Host: $host\n");
            }
            for (var name in headers.keys) {
              socket.write("$name: ${headers[name]}\n");
            }
            socket.write("\n");
            await socket.flush();
            await done.future;
          }
        }
      }
    });
  }

  /// Stops the server
  Future stop() => _server.close();
}

/// A request for a URL and headers made by a [_ProxyHttpServer].
class _ProxyRequest {
  final Uri uri;
  final Map<String, String> headers;

  _ProxyRequest(this.uri, this.headers);
}
