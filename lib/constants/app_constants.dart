import 'package:plex_api/plex_api.dart';

class Routes {
  static const String login = '/login';
  static const String home = '/';
  static const String authors = '/authors';
  static const String author = '/author';
  static const String collections = '/collections';
  static const String collection = '/collection';
  static const String books = '/books';
  static const String book = '/book';
  static const String player = '/player';
  static const String series = '/series';
  static const String playlists = '/playlists';
  static const String playlist = '/playlist';
}

class MediaIds {
  static const String authorsId = '@authors';
  static const String booksId = '@books';
  static const String collectionsId = '@collections';
  static const String seriesId = '@series';
  static const String recentlyPlayed = '@recentlyPlayed';
  static const String recentlyAdded = '@recentlyAdded';
  static const String downloads = '@downloads';
  static const String playlistsId = '@playlists';
}

class PlexSettings {
  static PlexHeaders headers = PlexHeaders(
      clientIdentifier: 'Audiobookly',
      device: 'Android',
      product: 'Audiobookly');
}
