import 'package:audio_service/audio_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'offline_state.freezed.dart';

@freezed
class OfflineState with _$OfflineState {
  const factory OfflineState.initial() = OfflineStateInitial;
  const factory OfflineState.loaded({List<MediaItem>? books}) =
      OfflineStateLoaded;
  const factory OfflineState.loading() = OfflineStateLoading;
  const factory OfflineState.error([String? message]) =
      OfflineStateErrorDetails;
}
