import 'package:audiobookly/domain/offline/offline_state.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:audiobookly/singletons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/utils/utils.dart';

final offlineStateProvider =
    StateNotifierProvider<OfflineNotifier, OfflineState>(
  (ref) => OfflineNotifier(),
);

class OfflineNotifier extends StateNotifier<OfflineState> {
  final DatabaseService _databaseService = getIt();

  OfflineNotifier() : super(OfflineState.initial()) {
    getBooks();
  }

  Future getBooks() async {
    try {
      state = OfflineState.loading();
      final books = (await _databaseService.getBooks().first)
          .map((book) => MediaHelpers.fromBook(book))
          .toList();
      state = OfflineState.loaded(
        books: books,
      );
    } on Exception {
      state = OfflineState.error("Something went wrong... :(");
    }
  }
}
