import 'package:audiobookly/features/downloads/downloads_state.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:audiobookly/singletons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/utils/utils.dart';

final downloadsStateProvider =
    StateNotifierProvider<DownloadsNotifier, DownloadsState>(
  (ref) => DownloadsNotifier(),
);

class DownloadsNotifier extends StateNotifier<DownloadsState> {
  final DatabaseService _databaseService = getIt();

  DownloadsNotifier() : super(DownloadsState.initial()) {
    getBooks();
  }

  Future getBooks() async {
    try {
      state = DownloadsState.loading();
      final books = (await _databaseService.getBooks().first)
          .map((book) => MediaHelpers.fromBook(book))
          .toList();
      state = DownloadsState.loaded(
        books: books,
      );
    } on Exception {
      state = DownloadsState.error("Something went wrong... :(");
    }
  }
}
