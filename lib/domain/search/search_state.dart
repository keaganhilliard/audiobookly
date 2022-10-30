import 'package:audio_service/audio_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = SearchStateInitial;
  const factory SearchState.loaded({
    List<MediaItem>? authorResults,
    List<MediaItem>? bookResults,
    List<MediaItem>? seriesResults,
  }) = SearchStateLoaded;
  const factory SearchState.loading() = SearchStateLoading;
  const factory SearchState.error([String? message]) = SearchStateErrorDetails;
}
