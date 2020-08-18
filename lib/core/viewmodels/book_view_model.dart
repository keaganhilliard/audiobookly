import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/viewmodels/base_model.dart';

class BookViewModel extends BaseModel {
  MediaItem currentItem;
  BookViewModel({MediaItem item}) : currentItem = item;
  MediaItem book;
  List<MediaItem> tracks;

  String genDurationString(List<MediaItem> tracks) {
    int total =
        tracks.fold(0, (total, track) => total + track.duration.inMilliseconds);
    return genDuration(total);
  }

  String genDuration(int durationInMilliseconds) {
    if (durationInMilliseconds == null) return 'Calculating...';
    Duration durObj = Duration(milliseconds: durationInMilliseconds);

    int hours = durObj.inHours;
    int minutes = durObj.inMinutes.remainder(60);

    return '$hours hours and $minutes minutes';
  }

  String getDurationLeftText(int currentPosition, int duration) {
    String text = '';
    if (currentPosition != null && duration != null) {
      int durationLeft = duration - currentPosition;
      String durationLeftText = genDuration(durationLeft);
      text = (currentPosition / duration * 100).toStringAsFixed(0) +
          '% ($durationLeftText left)';
    }
    return text;
  }

  String get duration => genDuration(book?.duration?.inMilliseconds);

  @override
  void dispose() {
    super.dispose();
  }
}
