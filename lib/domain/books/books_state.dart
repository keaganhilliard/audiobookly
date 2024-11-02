import 'package:audio_service/audio_service.dart';

sealed class BooksState {
  const BooksState();
  const factory BooksState.initial() = BooksStateInitial;
  factory BooksState.loaded({
    List<MediaItem>? books,
    String? currentParent,
    int totalItems,
  }) = BooksStateLoaded;
  const factory BooksState.loading() = BooksStateLoading;
  const factory BooksState.error({
    String? message,
    String? errorDetails,
    String? stackTrace,
  }) = BooksStateError;
}

class BooksStateInitial extends BooksState {
  const BooksStateInitial();
}

class BooksStateLoading extends BooksState {
  const BooksStateLoading();
}

class BooksStateLoaded extends BooksState {
  List<MediaItem>? books;
  String? currentParent;
  int totalItems;

  BooksStateLoaded({
    this.books,
    this.currentParent,
    this.totalItems = 0,
  });
}

class BooksStateError extends BooksState {
  final String? message;
  final String? errorDetails;
  final String? stackTrace;

  const BooksStateError({
    this.message,
    this.errorDetails,
    this.stackTrace,
  });
}
