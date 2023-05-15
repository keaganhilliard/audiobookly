import 'package:audiobookly/models/playlist.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'playlists_state.freezed.dart';

@freezed
class PlaylistsState with _$PlaylistsState {
  const factory PlaylistsState.initial() = PlaylistsStateInitial;
  const factory PlaylistsState.loaded({List<Playlist>? playlists}) =
      PlaylistsStateLoaded;
  const factory PlaylistsState.loading() = PlaylistsStateLoading;
  const factory PlaylistsState.error([String? message]) =
      PlaylistsStateErrorDetails;
}
