import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/models/book.dart';
import 'package:audiobookly/models/track.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'book_details_state.freezed.dart';

@freezed
class BookDetailsState with _$BookDetailsState {
  const factory BookDetailsState.initial() = BookDetailsStateInitial;
  const factory BookDetailsState.loaded({
    Book? book,
    List<Track>? tracks,
  }) = BookDetailsStateLoaded;
  const factory BookDetailsState.loading() = BookDetailsStateLoading;
  const factory BookDetailsState.error([String? message]) =
      BookDetailsStateErrorDetails;
}
