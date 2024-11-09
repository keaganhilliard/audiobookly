import 'package:audiobookly/models/book.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'downloads_state.freezed.dart';

@freezed
class DownloadsState with _$DownloadsState {
  const factory DownloadsState.initial() = DownloadsStateInitial;
  const factory DownloadsState.loaded({
    List<Book>? books,
  }) = DownloadsStateLoaded;
  const factory DownloadsState.loading() = DownloadsStateLoading;
  const factory DownloadsState.error([String? message]) = DownloadsStateError;
}
