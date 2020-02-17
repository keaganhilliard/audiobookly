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
  PlexTrack currentTrack;

  Future getAllTracks(String albumRatingKey) async {
    setBusy(true);
    tracks = await _server.getTracks(albumRatingKey);
    _genDurationString();

    currentTrack = tracks.firstWhere((track) => track.viewOffset != null,
        orElse: () => null);

    setBusy(false);
  }

  void _genDurationString() {
    int total = tracks.fold(0, (total, track) => total + track.duration);
    Duration durObj = Duration(milliseconds: total);

    int hours = durObj.inHours;
    int minutes = durObj.inMinutes - (60 * durObj.inHours);

    duration = '$hours hours and $minutes minutes';
  }
}
