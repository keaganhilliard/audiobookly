import 'package:audiobookly/models/author.dart';

sealed class AuthorsState {
  const AuthorsState();
  const factory AuthorsState.initial() = AuthorsStateInitial;
  const factory AuthorsState.loading() = AuthorsStateLoading;
  factory AuthorsState.loaded({
    required List<Author>? authors,
    int? totalResults,
    int? page,
  }) = AuthorsStateLoaded;
  const factory AuthorsState.error({String? message}) = AuthorsStateError;
}

class AuthorsStateInitial extends AuthorsState {
  const AuthorsStateInitial();
}

class AuthorsStateLoading extends AuthorsState {
  const AuthorsStateLoading();
}

class AuthorsStateLoaded extends AuthorsState {
  final List<Author>? authors;
  int? totalResults;
  int? page;

  AuthorsStateLoaded({
    required this.authors,
    this.totalResults,
    this.page,
  });
}

class AuthorsStateError extends AuthorsState {
  final String? message;

  const AuthorsStateError({this.message});
}
