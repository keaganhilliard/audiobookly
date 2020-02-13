import 'package:plex_api/plex_api.dart';

class Routes {
  static const String Login = '/login';
  static const String Home = '/';
  static const String Authors = '/authors';
  static const String Author = '/author';
  static const String Collections = '/collections';
  static const String Collection = '/collection';
  static const String Books = '/books';
  static const String Book = '/book';
}

class SharedPrefStrings {
  static const PLEX_TOKEN = 'plexToken';
  static const PLEX_SERVER = 'plexServer';
  static const PLEX_LIBRARY = 'plexLibrary';
}

class PlexSettings {
  static PlexHeaders headers = PlexHeaders(
      clientIdentifier: 'Audiobookly',
      device: 'Android',
      product: 'Audiobookly');
}
