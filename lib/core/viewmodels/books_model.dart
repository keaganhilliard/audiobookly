import 'package:audiobookly/core/viewmodels/base_model.dart';
import 'package:flutter/foundation.dart';

import 'package:plex_api/plex_api.dart';


class BooksModel extends BaseModel {
  PlexApi _api;
  
  BooksModel({@required PlexApi api}) : _api = api;

  List<PlexAlbum> books;

  Future fetchAllAlbums(String libraryKey) async {
    setBusy(true);
    books = await _api.getAllAlbums(libraryKey);
    setBusy(false);
  }

}