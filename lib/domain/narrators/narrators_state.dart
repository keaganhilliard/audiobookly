import 'package:audiobookly/models/author.dart';

sealed class NarratorsState {
  const NarratorsState();
  const factory NarratorsState.initial() = NarratorsStateInitial;
  const factory NarratorsState.loading() = NarratorsStateLoading;
  factory NarratorsState.loaded({
    required List<Author>? narrators,
  }) = NarratorsStateLoaded;
  const factory NarratorsState.error({String? message}) = NarratorsStateError;
}

class NarratorsStateInitial extends NarratorsState {
  const NarratorsStateInitial();
}

class NarratorsStateLoading extends NarratorsState {
  const NarratorsStateLoading();
}

class NarratorsStateLoaded extends NarratorsState {
  final List<Author>? narrators;

  NarratorsStateLoaded({
    required this.narrators,
  });
}

class NarratorsStateError extends NarratorsState {
  final String? message;

  const NarratorsStateError({this.message});
}
