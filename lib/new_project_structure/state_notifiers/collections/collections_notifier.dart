import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/new_project_structure/repositories/media/media_repository.dart';
import 'package:audiobookly/new_project_structure/state_notifiers/authors/authors_state.dart';
import 'package:audiobookly/new_project_structure/state_notifiers/collections/collections_state.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/repository/base_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final collectionsStateProvider =
    StateNotifierProvider<CollectionsNotifier>((ref) {
  return CollectionsNotifier(ref.watch(mediaRepositoryProdiver));
});

class CollectionsNotifier extends StateNotifier<CollectionsState> {
  final MediaRepository _repository;

  CollectionsNotifier(this._repository) : super(CollectionsState.initial());

  Future<void> getCollections() async {
    try {
      state = CollectionsState.loading();
      final collections =
          await _repository.getChildren(MediaIds.COLLECTIONS_ID);
      state = CollectionsState.loaded(collections: collections);
    } on Exception {
      state = CollectionsState.error(
          "Couldn't fetch authors. Is the device online?");
    }
  }
}
