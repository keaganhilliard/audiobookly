import 'package:audiobookly/features/downloads/downloads_state.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:audiobookly/singletons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/utils/utils.dart';

final downloadsStateProvider =
    StateNotifierProvider.autoDispose<DownloadsNotifier, DownloadsState>(
  (ref) => DownloadsNotifier(),
);

class DownloadsNotifier extends StateNotifier<DownloadsState> {
  final DatabaseService _databaseService = getIt();

  DownloadsNotifier() : super(const DownloadsState.initial()) {
    getBooks();
  }

  Future getBooks() async {
    try {
      state = const DownloadsState.loading();
      final books = (await _databaseService.getBooks().first)
          .where((book) => book.downloadCompleted)
          .map((book) => MediaHelpers.fromBook(book))
          .toList();
      state = DownloadsState.loaded(
        books: books,
      );
    } on Exception {
      state = const DownloadsState.error("Something went wrong... :(");
    }
  }
}
