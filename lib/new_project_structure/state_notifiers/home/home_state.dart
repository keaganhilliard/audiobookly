import 'package:audio_service/audio_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState.initial() = HomeStateInitial;
  const factory HomeState.loaded(
      {List<MediaItem> recentlyPlayed,
      List<MediaItem> recentlyAdded}) = HomeStateLoaded;
  const factory HomeState.loading() = HomeStateLoading;
  const factory HomeState.error([String message]) = HomeStateErrorDetails;
}