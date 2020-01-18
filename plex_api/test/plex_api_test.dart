import 'package:flutter_test/flutter_test.dart';

import 'package:plex_api/plex_api.dart';

void main() async {
  PlexApi api = PlexApi(
      headers: PlexHeaders(clientIdentifier: 'Audiobookly', device: "Android"));
  // await api.login('azothforgotten', 'BruceusMaximus27');
  await api.authenticate("uxsxYqRx2hGMw1u-R2sG");
  print(api.user.authToken);
  print(await api.getServers());
  List<PlexServer> plexServers = await api.getServers();
  for (PlexServer plexServer in plexServers) {
    if (plexServer.name == 'Blade') api.setServer(plexServer);
  }
  print(await api.getLibraries());
  List<PlexArtist> artists = await api.getArtists("4");
  artists.forEach((artist) => print(artist.toJson()));
  // print(await api.getUsableUrl("/library/sections"));
  // for (PlexAlbum pa in await api.getAlbums("25500")) {
  //   print(pa.toJson());
  // }
  // for (PlexTrack pt in await api.getTracks("25501")) {
  //   print(pt.toJson());
  // }
}
