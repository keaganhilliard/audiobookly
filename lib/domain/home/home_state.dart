import 'package:audiobookly/models/model_union.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = HomeStateInitial;
  const factory HomeState.loaded({
    Map<String, List<ModelUnion>>? rowsData,
    List<ModelUnion>? downloaded,
  }) = HomeStateLoaded;
  const factory HomeState.loading() = HomeStateLoading;
  const factory HomeState.error([String? message]) = HomeStateErrorDetails;
}
