import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/core/services/audio_handler.dart';
import 'package:audiobookly/core/services/server_communicator.dart';
import 'package:audiobookly/cubit/books/books_state.dart';
import 'package:bloc/bloc.dart';

class BooksCubit extends Cubit<BooksState> {
  final ServerCommunicator _communicator;
  String currentParent;

  BooksCubit(this._communicator) : super(BooksState.initial());

  Future<void> getBooks(String parentId) async {
    currentParent = parentId;
    try {
      emit(BooksState.loading());
      final books =
          await _communicator.getChildren(parentId ?? MediaIds.BOOKS_ID);
      emit(BooksState.loaded(books: books));
    } on Exception {
      emit(BooksState.error("Couldn't fetch books. Is the device online?"));
    }
  }
}
