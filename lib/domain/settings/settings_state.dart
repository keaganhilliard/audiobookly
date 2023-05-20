import 'package:audiobookly/models/library.dart';
import 'package:audiobookly/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'settings_state.freezed.dart';

// part of 'books_cubit.dart';

@freezed
sealed class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = SettingsStateInitial;
  const factory SettingsState.loaded({User? user, Library? lib}) =
      SettingsStateLoaded;
  const factory SettingsState.loading() = SettingsStateLoading;
  const factory SettingsState.error([String? message]) = SettingsStateError;
}
