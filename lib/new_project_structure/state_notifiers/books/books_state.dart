import 'package:audio_service/audio_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'books_state.freezed.dart';

// part of 'books_cubit.dart';

@freezed
abstract class BooksState with _$BooksState {
  const factory BooksState.initial() = BooksStateInitial;
  const factory BooksState.loaded(
      {List<MediaItem> books, String currentParent}) = BooksStateLoaded;
  const factory BooksState.loading() = BooksStateLoading;
  const factory BooksState.error([String message]) = BooksStateErrorDetails;
}
