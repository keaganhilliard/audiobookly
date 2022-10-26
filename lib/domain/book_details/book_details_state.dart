import 'package:audio_service/audio_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'book_details_state.freezed.dart';

@freezed
class BookDetailsState with _$BookDetailsState {
  const factory BookDetailsState.initial() = BookDetailsStateInitial;
  const factory BookDetailsState.loaded({
    MediaItem? book,
    List<MediaItem>? chapters,
  }) = BookDetailsStateLoaded;
  const factory BookDetailsState.loading() = BookDetailsStateLoading;
  const factory BookDetailsState.error([String? message]) =
      BookDetailsStateErrorDetails;
}
