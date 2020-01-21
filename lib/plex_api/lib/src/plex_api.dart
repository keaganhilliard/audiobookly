
import 'dart:convert';
import 'package:plex_api/plex_api.dart';
import 'package:plex_api/src/plex_metadata_response.dart';
import 'package:plex_api/src/plex_sections_response.dart';
import 'package:xml/xml.dart' as xml;
import 'package:http/http.dart' as http;
import 'package:plex_api/src/plex_login_response.dart';
import 'package:meta/meta.dart';

class PlexApi {
  String authToken;
  Uri loginUrl = Uri.https('plex.tv', '/users/sign_in.json');
  PlexHeaders headers;
  User user;
  PlexServer server;

  PlexApi({
    @required
    this.headers
  });

  bool isAuthorized() {
    return this.user != null;
  }

  Future<void> authenticate(String authToken) async {
    headers.token = authToken;
    http.Response response = await http.get(
        Uri.https('plex.tv', '/users/account.json'),
        headers: headers.toMap());
    PlexLoginResponse plexLoginResponse =
        PlexLoginResponse.fromJson(jsonDecode(response.body));
    user = plexLoginResponse.user;
  }

  Future<void> login(String username, String password) async {
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

  Future<List<PlexLibrary>> getLibraries() async {
    Uri endpoint = await getUsableUri("library/sections");
    http.Response response = await http.get(endpoint,
        headers: headers.toMap());
    PlexSections sections = PlexSections.fromJson(jsonDecode(response.body));
    return sections.mediaContainer.directory;
  }

  Future<List<PlexArtist>> getArtists(String libraryKey) async {
    Uri endpoint = await getUsableUri('/library/sections/$libraryKey/all');
    http.Response response = await http.get(endpoint,
        headers: headers.toMap());
    print(response.request.url);
    PlexMetadataResponse sections = PlexMetadataResponse.fromJson(jsonDecode(response.body));
    return sections.mediaContainer.metadata;
  }

  Future<List<PlexAlbum>> getAlbums(String artistRatingKey) async {
    Uri endpoint = await getUsableUri('/library/metadata/$artistRatingKey/children');
    http.Response response = await http.get(endpoint,
        headers: headers.toMap());
    print(response.request.url);
    PlexMetadataResponse sections = PlexMetadataResponse.fromJson(jsonDecode(response.body));
    return sections.mediaContainer.metadata;
  }

  Future<List<PlexTrack>> getTracks(String albumRatingKey) async {
    Uri endpoint = await getUsableUri('/library/metadata/$albumRatingKey/children');
    http.Response response = await http.get(endpoint,
        headers: headers.toMap());
    print(response.request.url);
    PlexMetadataResponse sections = PlexMetadataResponse.fromJson(jsonDecode(response.body));
    return sections.mediaContainer.metadata;
  }

  void setServer(PlexServer server) {
    this.server = server;
  }

  Future<String> getUsableUrl(String path) async {
    return 'http://${server.address == await getCurrentIP() ? server.localAddresses[0] : server.address}:${server.port}/$path?X-Plex-Token=${user.authToken}';
  }

  Future<Uri> getUsableUri(path) async => Uri.http('${server.address == await getCurrentIP() ? server.localAddresses[0] : server.address}:${server.port}', path);

  Future<String> getCurrentIP() async {
    http.Response res = await http.get(Uri.https('plex.tv', '/pms/:/ip'));
    return res.body.trim();
  }
}
