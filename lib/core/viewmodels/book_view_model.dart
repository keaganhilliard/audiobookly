import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/models/audiobookly_media_item.dart';
import 'package:audiobookly/core/services/plex_server_communicator.dart';
import 'package:audiobookly/core/services/server_communicator.dart';
import 'package:audiobookly/core/viewmodels/base_model.dart';
import 'package:audiobookly/core/services/audio_service.dart';

class BookViewModel extends BaseModel {
  ServerCommunicator communicator;
  MediaItem currentItem;
  BookViewModel({MediaItem item}) : currentItem = item;
  AudiobooklyMediaItem book;
  List<AudiobooklyMediaItem> tracks;

  Future createCommunicator() async {
    if (communicator == null) {
      communicator = PlexServerCommunicator();
      await communicator.getServerAndLibrary();
    }
  }

  Future init(String bookId) async {
    // setBusy(true);
    // if (!AudioService.running) await startAudioService();
    // await createCommunicator();
    // currentItem = AudioService.currentMediaItem;

    // if (bookId == null && currentItem != null) {
    //   book = await communicator.getAlbumFromId(currentItem.id);
    //   tracks = await communicator.getTracksForBook(currentItem.id);
    // }
    // if (bookId == null) {
    //   setBusy(false);
    //   return;
    // } else {
    //   book = await communicator.getAlbumFromId(bookId);
    //   tracks = await communicator.getTracksForBook(bookId);
    // }
    // print('Freaking play...');
    // if (currentItem?.id != bookId) {
    //   await AudioService.playFromMediaId(bookId);
    // }
    // setBusy(false);
  }

  String genDurationString(List<MediaItem> tracks) {
    int total = tracks.fold(0, (total, track) => total + track.duration);
    return genDuration(total);
  }

  String genDuration(int durationInMilliseconds) {
    if (durationInMilliseconds == null) return 'Calculating...';
    Duration durObj = Duration(milliseconds: durationInMilliseconds);

    int hours = durObj.inHours;
    int minutes = durObj.inMinutes.remainder(60);

    return '$hours hours and $minutes minutes';
  }

  String get duration => genDuration(book?.duration);

  @override
  void dispose() {
    super.dispose();
  }
}
