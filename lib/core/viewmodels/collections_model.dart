import 'package:audiobookly/core/viewmodels/base_model.dart';
import 'package:flutter/foundation.dart';

import 'package:plex_api/plex_api.dart';


class CollectionsModel extends BaseModel {
  PlexApi _api;
  
  CollectionsModel({@required PlexApi api}) : _api = api;

  List<PlexCollection> collections;

  Future fetchCollections(String libraryKey) async {
    setBusy(true);
    collections = await _api.getCollections(libraryKey);
    setBusy(false);
  }

}