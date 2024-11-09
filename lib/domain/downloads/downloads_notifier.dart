import 'package:audiobookly/domain/downloads/downloads_state.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final downloadsStateProvider =
    StateNotifierProvider<DownloadsNotifier, DownloadsState>(
  (ref) => DownloadsNotifier(ref.watch(mediaRepositoryProvider)),
);

class DownloadsNotifier extends StateNotifier<DownloadsState> {
  final MediaRepository? _mediaRepository;

  DownloadsNotifier(this._mediaRepository)
      : super(const DownloadsState.initial());

  Future getBooks() async {
    try {
      state = const DownloadsState.loading();
      final books = await _mediaRepository?.getDownloads() ?? [];

      state = DownloadsState.loaded(
        books: books,
      );
    } on Exception {
      state = const DownloadsState.error("Something went wrong... :(");
    }
  }
}
