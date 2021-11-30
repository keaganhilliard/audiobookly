import 'package:audio_service/audio_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'series_state.freezed.dart';

@freezed
class SeriesState with _$SeriesState {
  const factory SeriesState.initial() = SeriesStateInitial;
  const factory SeriesState.loaded({List<MediaItem>? series}) =
      SeriesStateLoaded;
  const factory SeriesState.loading() = SeriesStateLoading;
  const factory SeriesState.error([String? message]) = SeriesStateErrorDetails;
}
