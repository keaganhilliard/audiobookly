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
  static const String Player = '/player';
}

class SharedPrefStrings {
  static const PLEX_TOKEN = 'plexToken';
  static const PLEX_SERVER = 'plexServer';
  static const PLEX_LIBRARY = 'plexLibrary';
  static const PLAYBACK_SPEED = 'playbackSpeed';
}

class MediaIds {
  static const String AUTHORS_ID = '@authors';
  static const String BOOKS_ID = '@books';
  static const String COLLECTIONS_ID = '@collections';
  static const String RECENTLY_PLAYED = '@recentlyPlayed';
  static const String RECENTLY_ADDED = '@recentlyAdded';
  static const String DOWNLOADS = '@downloads';
}

class PlexSettings {
  static PlexHeaders headers = PlexHeaders(
      clientIdentifier: 'Audiobookly',
      device: 'Android',
      product: 'Audiobookly');
}
