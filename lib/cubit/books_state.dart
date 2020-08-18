import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'books_state.freezed.dart';

// part of 'books_cubit.dart';

@freezed
abstract class BooksState with _$BooksState {
  const factory BooksState({String parentId}) = _BooksState;
  const factory BooksState.loading() = Loading;
  const factory BooksState.error([String message]) = ErrorDetails;
}
