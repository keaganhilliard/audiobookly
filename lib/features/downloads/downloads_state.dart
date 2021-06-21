import 'package:audio_service/audio_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'downloads_state.freezed.dart';

@freezed
class DownloadsState with _$DownloadsState {
  const factory DownloadsState.initial() = DownloadsStateInitial;
  const factory DownloadsState.loaded({List<MediaItem>? books}) =
      DownloadsStateLoaded;
  const factory DownloadsState.loading() = DownloadsStateLoading;
  const factory DownloadsState.error([String? message]) =
      DownloadsStateErrorDetails;
}
