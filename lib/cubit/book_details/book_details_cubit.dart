import 'package:audiobookly/core/services/server_communicator.dart';
import 'package:audiobookly/cubit/book_details/book_details_state.dart';
import 'package:bloc/bloc.dart';

class BookDetailsCubit extends Cubit<BookDetailsState> {
  final ServerCommunicator _communicator;

  BookDetailsCubit(this._communicator) : super(BookDetailsState.initial());

  Future<void> getAuthors(String mediaId) async {
    try {
      emit(BookDetailsState.loading());
      final book = await _communicator.getAlbumFromId(mediaId);
      emit(BookDetailsState.loaded(book: book));
    } on Exception {
      emit(BookDetailsState.error(
          "Couldn't fetch book details. Is the device online?"));
    }
  }
}
