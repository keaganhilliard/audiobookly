import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/domain/authors/authors_state.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/utils/refresher_state_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authorsStateProvider =
    StateNotifierProvider<AuthorsNotifier, AuthorsState>((ref) {
  return AuthorsNotifier(ref.watch(mediaRepositoryProvider));
});

class AuthorsNotifier extends RefresherStateNotifier<AuthorsState> {
  final MediaRepository? _repository;

  AuthorsNotifier(this._repository) : super(const AuthorsState.initial());

  Future refresh() async {
    await getAuthors();
  }

  Future handleItemCreated(int index) async {}

  Future<void> getAuthors() async {
    try {
      final authors = await _repository!.getAuthors();
      state = AuthorsState.loaded(authors: authors);
    } on Exception {
      state = const AuthorsState.error(
        message: "Couldn't fetch authors. Is the device online?",
      );
    }
  }
}
