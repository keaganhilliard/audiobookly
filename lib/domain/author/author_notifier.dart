import 'package:audiobookly/domain/author/author_state.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authorStateProvider =
    StateNotifierProvider.family<AuthorNotifier, AuthorState, String>(
        (ref, id) {
  return AuthorNotifier(ref.watch(mediaRepositoryProvider), id);
});

class AuthorNotifier extends StateNotifier<AuthorState> {
  final MediaRepository? _repository;
  final String _id;
  final refreshState = GlobalKey<RefreshIndicatorState>();

  AuthorNotifier(this._repository, this._id)
      : super(const AuthorState.initial());

  Future refresh() async {
    await getAuthor();
  }

  Future<void> getAuthor() async {
    try {
      final author = await _repository!.getAuthorDetails(
        _id.replaceAll('@author/', ''),
      );
      state = AuthorState.loaded(author: author);
    } on Exception {
      state = const AuthorState.error(
          "Couldn't fetch authors. Is the device online?");
    }
  }
}
