import 'package:audio_service/audio_service.dart';

class PlayerState {
  MediaItem item;
  PlaybackState state;
  PlayerState(this.item, this.state);
}
