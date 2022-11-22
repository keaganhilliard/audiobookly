import 'dart:async';
import 'dart:developer';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/constants/app_constants.dart';
import 'package:audiobookly/models/book.dart';
import 'package:audiobookly/models/model_union.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:audiobookly/domain/home/home_state.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final homeStateProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier(ref.watch(mediaRepositoryProvider));
});

class HomeNotifier extends StateNotifier<HomeState> {
  final MediaRepository? _repository;
  StreamSubscription<List<Book>>? booksSub;

  HomeNotifier(this._repository) : super(const HomeState.initial()) {
    getBooks();
  }

  Future refresh() async {
    Map<String, List<ModelUnion>>? rowsData;

    try {
      rowsData = await _repository!.getHomeData();
    } catch (e, stack) {
      log('$e');
      log('$stack');
    }
    final downloaded = [
      for (final value in await _repository!.getDownloads())
        ModelUnion.book(value)
    ];
    booksSub ??= GetIt.I<DatabaseService>()
        .getBooks()
        .debounceTime(const Duration(milliseconds: 200))
        .listen((books) async {
      if (state is HomeStateLoaded) {
        final stateAsLoaded = (state as HomeStateLoaded);
        state = stateAsLoaded.copyWith(
          downloaded: [
            for (final value in await _repository!.getDownloads())
              ModelUnion.book(value)
          ],
        );
      }
    });
    state = HomeState.loaded(
      rowsData: rowsData,
      downloaded: downloaded,
    );
  }

  Future<void> getBooks() async {
    try {
      state = const HomeState.loading();
      await refresh();
    } on Exception {
      state =
          const HomeState.error("Couldn't fetch books. Is the device online?");
    }
  }
}
