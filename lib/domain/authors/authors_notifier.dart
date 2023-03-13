import 'package:audiobookly/constants/app_constants.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/domain/authors/authors_state.dart';
import 'package:audiobookly/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authorsStateProvider =
    StateNotifierProvider<AuthorsNotifier, AuthorsState>((ref) {
  return AuthorsNotifier(ref.watch(mediaRepositoryProvider));
});

class AuthorsNotifier extends StateNotifier<AuthorsState> {
  final MediaRepository? _repository;

  AuthorsNotifier(this._repository) : super(const AuthorsState.initial()) {
    getAuthors();
  }

  Future refresh() async {
    try {
      final authors = await _repository!.getChildren(MediaIds.authorsId);
      state =
          AuthorsState.loaded(authors: authors, totalResults: authors.length);
    } on Exception {
      state = const AuthorsState.error(
          "Couldn't fetch authors. Is the device online?");
    }
  }

  Future handleItemCreated(int index) async {}

  Future<void> getAuthors() async {
    try {
      state = const AuthorsState.loading();
      final authors = await _repository!.getChildren(MediaIds.authorsId);
      state = AuthorsState.loaded(authors: authors);
    } on Exception {
      state = const AuthorsState.error(
          "Couldn't fetch authors. Is the device online?");
    }
  }
}
