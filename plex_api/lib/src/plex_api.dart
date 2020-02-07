import 'dart:convert';
import 'package:plex_api/plex_api.dart';
import 'package:plex_api/src/plex_collections_response.dart';
import 'package:plex_api/src/plex_metadata_response.dart';
import 'package:plex_api/src/plex_pin.dart';
import 'package:plex_api/src/plex_sections_response.dart';
import 'package:plex_api/src/plex_server_v2.dart';
import 'package:xml/xml.dart' as xml;
import 'package:http/http.dart' as http;
import 'package:plex_api/src/plex_login_response.dart';
import 'package:meta/meta.dart';

import '../plex_api.dart';

class PlexApi {
  String authToken;
  Uri loginUrl = Uri.https('plex.tv', '/users/sign_in.json');
  PlexHeaders headers;
  User user;
  PlexServer server;

  PlexApi({@required this.headers});

  bool isAuthorized() {
    return this.user != null;
  }

  Future<User> authenticate(String authToken) async {
    headers.token = authToken;
    http.Response response = await http.get(
        Uri.https('plex.tv', '/users/account.json'),
        headers: headers.toMap());
    PlexLoginResponse plexLoginResponse =
        PlexLoginResponse.fromJson(jsonDecode(response.body));
    user = plexLoginResponse.user;
    return user;
  }

  Future<User> login(String username, String password) async {
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
      PlexLoginResponse plexLoginResponse =
          PlexLoginResponse.fromJson(jsonDecode(response.body));
      user = plexLoginResponse.user;
      headers.token = user.authToken;
    }
    return user;
  }

  Future<List<PlexServer>> getServers() async {
    http.Response res = await http.get(Uri.https('plex.tv', '/pms/servers.xml'),
        headers: headers.toMap());
    var document = xml.parse(res.body);
    List<PlexServer> servers = [];
    document
        .findAllElements('Server')
        .forEach((node) => servers.add(PlexServer.fromXml(node)));
    return servers;
  }

  Future<List<PlexServerV2>> getServersV2() async {
    http.Response response = await http.get(
        Uri.https('plex.tv', '/api/v2/resources', {'includeHttps': '1'}),
        headers: headers.toMap());
    print(response.request.headers);
    print(response.request.url);
    List<PlexServerV2> servers = [];
    jsonDecode(response.body).toList().forEach((v) {
      PlexServerV2 server = PlexServerV2.fromJson(v);
      server.api = this;
      if (server.provides == 'server') {
        servers.add(server);
      }
    });
    return servers;
  }

  Future<List<PlexLibrary>> getLibraries(PlexServerV2 server) async {
    http.Response response = await http.get(
        '${server.mainConnection.uri}/library/sections',
        headers: headers.toMap(overrideToken: server.accessToken));
    PlexSections sections = PlexSections.fromJson(jsonDecode(response.body));
    return sections.mediaContainer.directory;
  }

  Future<List<PlexMetadata>> getMetadata(
      PlexServerV2 server, String path) async {
    http.Response response = await http.get('${server.mainConnection.uri}$path',
        headers: headers.toMap(overrideToken: server.accessToken));
    PlexMetadataResponse sections =
        PlexMetadataResponse.fromJson(jsonDecode(response.body));
    return sections.mediaContainer.metadata;
  }

  Future<List<PlexArtist>> getArtists(
      PlexServerV2 server, String libraryKey) async {
    // http.Response response = await http.get(
    //     '${server.mainConnection.uri}/library/sections/$libraryKey/all',
    //     headers: headers.toMap(overrideToken: server.accessToken));
    // print(response.request.url);
    // PlexMetadataResponse sections =
    //     PlexMetadataResponse.fromJson(jsonDecode(response.body));
    // return sections.mediaContainer.metadata;
    return getMetadata(server, '/library/sections/$libraryKey/all');
  }

  Future<List<PlexAlbum>> getAllAlbums(
      PlexServerV2 server, String libraryKey) async {
     http.Response response = await http.get(
         '${server.mainConnection.uri}/library/sections/$libraryKey/all?type=9',
         headers: headers.toMap(overrideToken: server.accessToken));
     print(response.request.url);
     PlexMetadataResponse sections =
         PlexMetadataResponse.fromJson(jsonDecode(response.body));
     return sections.mediaContainer.metadata;
//    return getMetadata(server, '/library/sections/$libraryKey/all?type=9');
  }

  Future<List<PlexAlbum>> getAlbumsFromArtist(
      PlexServerV2 server, String artistRatingKey) async {
    // http.Response response = await http.get(
    //     '${server.mainConnection.uri}/library/metadata/$artistRatingKey/children',
    //     headers: headers.toMap(overrideToken: server.accessToken));
    // print(response.request.url);
    // PlexMetadataResponse sections =
    //     PlexMetadataResponse.fromJson(jsonDecode(response.body));
    // return sections.mediaContainer.metadata;
    return getMetadata(server, '/library/metadata/$artistRatingKey/children');
  }

  Future<List<PlexAlbum>> getAlbumsFromCollection(
      PlexServerV2 server, String collectionFastKey) async {
    http.Response response = await http.get(
        '${server.mainConnection.uri}$collectionFastKey',
        headers: headers.toMap(overrideToken: server.accessToken));
    print(response.request.url);
    PlexMetadataResponse sections =
        PlexMetadataResponse.fromJson(jsonDecode(response.body));
    return sections.mediaContainer.metadata;
    // return await getMetadata(server, collectionFastKey);
  }

  Future<List<PlexTrack>> getTracks(
      PlexServerV2 server, String albumRatingKey) async {
    // http.Response response = await http.get(
    //     '${server.mainConnection.uri}/library/metadata/$albumRatingKey/children',
    //     headers: headers.toMap());
    // print(response.request.url);
    // PlexMetadataResponse sections =
    //     PlexMetadataResponse.fromJson(jsonDecode(response.body));
    // return sections.mediaContainer.metadata;
    return getMetadata(server, '/library/metadata/$albumRatingKey/children');
  }

  Future<List<PlexCollection>> getCollections(
      PlexServerV2 server, String libraryKey) async {
    http.Response response = await http.get(
        '${server.mainConnection.uri}/library/sections/$libraryKey/collection/?type=9',
        headers: headers.toMap());
    print(response.request.url);
    PlexCollectionsResponse collectionsResponse =
        PlexCollectionsResponse.fromJson(jsonDecode(response.body));
    return collectionsResponse.mediaContainer.directory;
  }

  void setServer(PlexServer server) {
    this.server = server;
  }

  Future<String> getUsableUrl(String path) async {
    return 'http://${server.address == await getCurrentIP() ? server.localAddresses[0] : server.address}:${server.port}/$path?X-Plex-Token=${user.authToken}';
  }

  String getUrlWithToken(PlexServerV2 server, String path) {
    return '${server.mainConnection.uri}$path?X-Plex-Token=${server.accessToken}';
  }

  Future<Uri> getUsableUri(path) async => Uri.http(
      '${server.address == await getCurrentIP() ? server.localAddresses[0] : server.address}:${server.port}',
      path);

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
    PlexPin pin = PlexPin.fromJson(jsonDecode(response.body));
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
    PlexPin pin = PlexPin.fromJson(jsonDecode(response.body));
    return pin;
  }
}
