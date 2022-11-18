import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/models/chapter.dart';
import 'package:audiobookly/models/track.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'track_details_state.freezed.dart';

@freezed
class TrackDetailsState with _$TrackDetailsState {
  const factory TrackDetailsState.initial() = TrackDetailsStateInitial;
  const factory TrackDetailsState.loaded({
    List<Track>? tracks,
    List<Chapter>? chapters,
  }) = TrackDetailsStateLoaded;
  const factory TrackDetailsState.loading() = TrackDetailsStateLoading;
  const factory TrackDetailsState.error([String? message]) =
      TrackDetailsStateErrorDetails;
}
