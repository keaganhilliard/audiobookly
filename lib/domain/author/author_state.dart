import 'package:audiobookly/models/author.dart';

sealed class AuthorState {
  const factory AuthorState.initial() = AuthorStateInitial;
  const factory AuthorState.loaded({Author? author}) = AuthorStateLoaded;
  const factory AuthorState.loading() = AuthorStateLoading;
  const factory AuthorState.error([String? message]) = AuthorStateError;
}

class AuthorStateInitial implements AuthorState {
  const AuthorStateInitial();
}

class AuthorStateLoaded implements AuthorState {
  final Author? author;

  const AuthorStateLoaded({this.author});
}

class AuthorStateLoading implements AuthorState {
  const AuthorStateLoading();
}

class AuthorStateError implements AuthorState {
  final String? message;

  const AuthorStateError([this.message]);
}
