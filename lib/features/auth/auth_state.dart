import 'package:audiobookly/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthStateInitial;
  const factory AuthState.loaded({User user}) = AuthStateLoaded;
  const factory AuthState.loading() = AuthStateLoading;
  const factory AuthState.error([String message]) = AuthStateErrorDetails;
}
