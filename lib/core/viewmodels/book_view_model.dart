import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/models/audiobookly_media_item.dart';
import 'package:audiobookly/core/services/downloader.dart';
import 'package:audiobookly/core/services/plex_server_communicator.dart';
import 'package:audiobookly/core/services/server_communicator.dart';
import 'package:audiobookly/core/viewmodels/base_model.dart';
import 'package:audiobookly/core/services/audio_service.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookViewModel extends BaseModel {
  ServerCommunicator communicator;
  BookViewModel();

  Downloader dl = Downloader();

  StreamSubscription downloadSub;
  AudiobooklyMediaItem book;

  Future createCommunicator() async {
    communicator = PlexServerCommunicator();
    await communicator.getServerAndLibrary();
  }

  Future init(String bookId) async {
    await createCommunicator();
    if (bookId == null) return;
    setBusy(true);
    if (!await AudioService.running) await startAudioService();
    await AudioService.playFromMediaId(bookId);
    await createCommunicator();
    book = await communicator.getAlbumFromId(bookId);
    // downloadSub = (await dl.connect('book_view_port')).listen((event) {
    //   print('BookView: ${event.id}');
    // });
    setBusy(false);
  }

  String genDurationString(List<MediaItem> tracks) {
    int total = tracks.fold(0, (total, track) => total + track.duration);
    Duration durObj = Duration(milliseconds: total);

    int hours = durObj.inHours;
    int minutes = durObj.inMinutes.remainder(60);

    return '$hours hours and $minutes minutes';
  }

  @override
  void dispose() {
    if (downloadSub == null) {
      downloadSub.cancel();
    }
    super.dispose();
  }

  Future handleDownload(MediaItem item) async {
    print('Downloading!');
    if (item == null) return;
    var dir = await getExternalStorageDirectory();
    if (downloadSub == null) {
      downloadSub = (await dl.connect()).listen((event) {
        print('Downloading ${event.id}: ${event.progress}%');
      });
    }
    dl.downloadFile(
        item.id,
        p.join(dir.absolute.path, 'cache', item.artist, item.album),
        item.title + item.id.substring(item.id.lastIndexOf('.')).split('?')[0]);
  }
}
