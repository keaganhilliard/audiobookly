import 'package:audiobookly/models/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'collections_state.freezed.dart';

@freezed
class CollectionsState with _$CollectionsState {
  const factory CollectionsState.initial() = CollectionsStateInitial;
  const factory CollectionsState.loaded({List<Collection>? collections}) =
      CollectionsStateLoaded;
  const factory CollectionsState.loading() = CollectionsStateLoading;
  const factory CollectionsState.error([String? message]) =
      CollectionsStateErrorDetails;
}
