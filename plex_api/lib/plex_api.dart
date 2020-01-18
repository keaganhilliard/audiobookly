library plex_api;


export 'src/plex_api.dart';
export 'src/plex_album.dart';
export 'src/plex_artist.dart';
export 'src/plex_country.dart';
export 'src/plex_genre.dart';
export 'src/plex_headers.dart';
export 'src/plex_library.dart';
export 'src/plex_login_response.dart';
export 'src/plex_metadata.dart';
export 'src/plex_server.dart';
export 'src/plex_track.dart';

/**
 * PlexApi api = PlexApi(
      headers: PlexHeaders(clientIdentifier: 'Audiobookly', device: "Android"));
  // await api.login('');
  await api.authenticate("");
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
 */