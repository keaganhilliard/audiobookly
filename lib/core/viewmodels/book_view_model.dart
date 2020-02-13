import 'package:audiobookly/core/viewmodels/base_model.dart';
import 'package:flutter/foundation.dart';

import 'package:plex_api/plex_api.dart';

class BookViewModel extends BaseModel {
  PlexServerV2 _server;

  BookViewModel({
    @required PlexServerV2 server,
  }) : _server = server;

  List<PlexTrack> tracks = [];
  String duration;

  Future getAllTracks(String albumRatingKey) async {
    setBusy(true);
    tracks = await _server.getTracks(albumRatingKey);
    int total = tracks.fold(0, (total, track) => total + track.duration);
    Duration durObj = Duration(milliseconds: total);

    int hours = durObj.inHours;
    int minutes = durObj.inMinutes - (60 * durObj.inHours);

    duration = '$hours hours and $minutes minutes';

    setBusy(false);
  }
}
