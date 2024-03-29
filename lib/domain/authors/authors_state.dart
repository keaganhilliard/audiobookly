import 'package:audio_service/audio_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'authors_state.freezed.dart';

@freezed
sealed class AuthorsState with _$AuthorsState {
  const factory AuthorsState.initial() = AuthorsStateInitial;
  const factory AuthorsState.loaded({
    List<MediaItem>? authors,
    @Default(0) int totalResults,
    @Default(0) int page,
  }) = AuthorsStateLoaded;
  const factory AuthorsState.loading() = AuthorsStateLoading;
  const factory AuthorsState.error([String? message]) = AuthorsStateError;
}
