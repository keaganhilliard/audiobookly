import 'package:audiobookly/core/services/audio_service.dart';
import 'package:audiobookly/core/services/server_communicator.dart';
import 'package:audiobookly/cubit/authors/authors_state.dart';
import 'package:bloc/bloc.dart';

class AuthorsCubit extends Cubit<AuthorsState> {
  final ServerCommunicator _communicator;

  AuthorsCubit(this._communicator) : super(AuthorsState.initial());

  Future<void> getAuthors() async {
    try {
      emit(AuthorsState.loading());
      final authors =
          await _communicator.getChildren(AudioPlayerTask.AUTHORS_ID);
      emit(AuthorsState.loaded(authors: authors));
    } on Exception {
      emit(AuthorsState.error("Couldn't fetch authors. Is the device online?"));
    }
  }
}
