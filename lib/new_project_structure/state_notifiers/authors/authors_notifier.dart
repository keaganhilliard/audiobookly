import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/new_project_structure/repositories/media/media_repository.dart';
import 'package:audiobookly/new_project_structure/state_notifiers/authors/authors_state.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/repository/base_repository.dart';
import 'package:hooks_riverpod/all.dart';

final authorsStateProvider = StateNotifierProvider<AuthorsNotifier>((ref) {
  return AuthorsNotifier(ref.watch(mediaRepositoryProdiver));
});

class AuthorsNotifier extends StateNotifier<AuthorsState> {
  final MediaRepository _repository;

  AuthorsNotifier(this._repository) : super(AuthorsState.initial());

  Future<void> getAuthors() async {
    try {
      state = AuthorsState.loading();
      final authors = await _repository.getChildren(MediaIds.AUTHORS_ID);
      state = AuthorsState.loaded(authors: authors);
    } on Exception {
      state =
          AuthorsState.error("Couldn't fetch authors. Is the device online?");
    }
  }
}
