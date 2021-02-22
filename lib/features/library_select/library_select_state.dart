import 'package:audiobookly/models/library.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'library_select_state.freezed.dart';

@freezed
abstract class LibrarySelectState with _$LibrarySelectState {
  const factory LibrarySelectState.initial() = LibrarySelectStateInitial;
  const factory LibrarySelectState.loaded({
    List<Library> libraries,
  }) = LibrarySelectStateLoaded;
  const factory LibrarySelectState.loading() = LibrarySelectStateLoading;
  const factory LibrarySelectState.error([String message]) =
      LibrarySelectStateErrorDetails;
}
