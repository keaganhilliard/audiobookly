// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'book_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$BookDetailsStateTearOff {
  const _$BookDetailsStateTearOff();

// ignore: unused_element
  BookDetailsStateInitial initial() {
    return const BookDetailsStateInitial();
  }

// ignore: unused_element
  BookDetailsStateLoaded loaded({MediaItem book}) {
    return BookDetailsStateLoaded(
      book: book,
    );
  }

// ignore: unused_element
  BookDetailsStateLoading loading() {
    return const BookDetailsStateLoading();
  }

// ignore: unused_element
  AuthorsStateErrorDetails error([String message]) {
    return AuthorsStateErrorDetails(
      message,
    );
  }
}

// ignore: unused_element
const $BookDetailsState = _$BookDetailsStateTearOff();

mixin _$BookDetailsState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loaded(MediaItem book),
    @required Result loading(),
    @required Result error(String message),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loaded(MediaItem book),
    Result loading(),
    Result error(String message),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(BookDetailsStateInitial value),
    @required Result loaded(BookDetailsStateLoaded value),
    @required Result loading(BookDetailsStateLoading value),
    @required Result error(AuthorsStateErrorDetails value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(BookDetailsStateInitial value),
    Result loaded(BookDetailsStateLoaded value),
    Result loading(BookDetailsStateLoading value),
    Result error(AuthorsStateErrorDetails value),
    @required Result orElse(),
  });
}

abstract class $BookDetailsStateCopyWith<$Res> {
  factory $BookDetailsStateCopyWith(
          BookDetailsState value, $Res Function(BookDetailsState) then) =
      _$BookDetailsStateCopyWithImpl<$Res>;
}

class _$BookDetailsStateCopyWithImpl<$Res>
    implements $BookDetailsStateCopyWith<$Res> {
  _$BookDetailsStateCopyWithImpl(this._value, this._then);

  final BookDetailsState _value;
  // ignore: unused_field
  final $Res Function(BookDetailsState) _then;
}

abstract class $BookDetailsStateInitialCopyWith<$Res> {
  factory $BookDetailsStateInitialCopyWith(BookDetailsStateInitial value,
          $Res Function(BookDetailsStateInitial) then) =
      _$BookDetailsStateInitialCopyWithImpl<$Res>;
}

class _$BookDetailsStateInitialCopyWithImpl<$Res>
    extends _$BookDetailsStateCopyWithImpl<$Res>
    implements $BookDetailsStateInitialCopyWith<$Res> {
  _$BookDetailsStateInitialCopyWithImpl(BookDetailsStateInitial _value,
      $Res Function(BookDetailsStateInitial) _then)
      : super(_value, (v) => _then(v as BookDetailsStateInitial));

  @override
  BookDetailsStateInitial get _value => super._value as BookDetailsStateInitial;
}

class _$BookDetailsStateInitial
    with DiagnosticableTreeMixin
    implements BookDetailsStateInitial {
  const _$BookDetailsStateInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BookDetailsState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'BookDetailsState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BookDetailsStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loaded(MediaItem book),
    @required Result loading(),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loaded(MediaItem book),
    Result loading(),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(BookDetailsStateInitial value),
    @required Result loaded(BookDetailsStateLoaded value),
    @required Result loading(BookDetailsStateLoading value),
    @required Result error(AuthorsStateErrorDetails value),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(BookDetailsStateInitial value),
    Result loaded(BookDetailsStateLoaded value),
    Result loading(BookDetailsStateLoading value),
    Result error(AuthorsStateErrorDetails value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class BookDetailsStateInitial implements BookDetailsState {
  const factory BookDetailsStateInitial() = _$BookDetailsStateInitial;
}

abstract class $BookDetailsStateLoadedCopyWith<$Res> {
  factory $BookDetailsStateLoadedCopyWith(BookDetailsStateLoaded value,
          $Res Function(BookDetailsStateLoaded) then) =
      _$BookDetailsStateLoadedCopyWithImpl<$Res>;
  $Res call({MediaItem book});
}

class _$BookDetailsStateLoadedCopyWithImpl<$Res>
    extends _$BookDetailsStateCopyWithImpl<$Res>
    implements $BookDetailsStateLoadedCopyWith<$Res> {
  _$BookDetailsStateLoadedCopyWithImpl(BookDetailsStateLoaded _value,
      $Res Function(BookDetailsStateLoaded) _then)
      : super(_value, (v) => _then(v as BookDetailsStateLoaded));

  @override
  BookDetailsStateLoaded get _value => super._value as BookDetailsStateLoaded;

  @override
  $Res call({
    Object book = freezed,
  }) {
    return _then(BookDetailsStateLoaded(
      book: book == freezed ? _value.book : book as MediaItem,
    ));
  }
}

class _$BookDetailsStateLoaded
    with DiagnosticableTreeMixin
    implements BookDetailsStateLoaded {
  const _$BookDetailsStateLoaded({this.book});

  @override
  final MediaItem book;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BookDetailsState.loaded(book: $book)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BookDetailsState.loaded'))
      ..add(DiagnosticsProperty('book', book));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BookDetailsStateLoaded &&
            (identical(other.book, book) ||
                const DeepCollectionEquality().equals(other.book, book)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(book);

  @override
  $BookDetailsStateLoadedCopyWith<BookDetailsStateLoaded> get copyWith =>
      _$BookDetailsStateLoadedCopyWithImpl<BookDetailsStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loaded(MediaItem book),
    @required Result loading(),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    return loaded(book);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loaded(MediaItem book),
    Result loading(),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(book);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(BookDetailsStateInitial value),
    @required Result loaded(BookDetailsStateLoaded value),
    @required Result loading(BookDetailsStateLoading value),
    @required Result error(AuthorsStateErrorDetails value),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(BookDetailsStateInitial value),
    Result loaded(BookDetailsStateLoaded value),
    Result loading(BookDetailsStateLoading value),
    Result error(AuthorsStateErrorDetails value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class BookDetailsStateLoaded implements BookDetailsState {
  const factory BookDetailsStateLoaded({MediaItem book}) =
      _$BookDetailsStateLoaded;

  MediaItem get book;
  $BookDetailsStateLoadedCopyWith<BookDetailsStateLoaded> get copyWith;
}

abstract class $BookDetailsStateLoadingCopyWith<$Res> {
  factory $BookDetailsStateLoadingCopyWith(BookDetailsStateLoading value,
          $Res Function(BookDetailsStateLoading) then) =
      _$BookDetailsStateLoadingCopyWithImpl<$Res>;
}

class _$BookDetailsStateLoadingCopyWithImpl<$Res>
    extends _$BookDetailsStateCopyWithImpl<$Res>
    implements $BookDetailsStateLoadingCopyWith<$Res> {
  _$BookDetailsStateLoadingCopyWithImpl(BookDetailsStateLoading _value,
      $Res Function(BookDetailsStateLoading) _then)
      : super(_value, (v) => _then(v as BookDetailsStateLoading));

  @override
  BookDetailsStateLoading get _value => super._value as BookDetailsStateLoading;
}

class _$BookDetailsStateLoading
    with DiagnosticableTreeMixin
    implements BookDetailsStateLoading {
  const _$BookDetailsStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BookDetailsState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'BookDetailsState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BookDetailsStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loaded(MediaItem book),
    @required Result loading(),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loaded(MediaItem book),
    Result loading(),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(BookDetailsStateInitial value),
    @required Result loaded(BookDetailsStateLoaded value),
    @required Result loading(BookDetailsStateLoading value),
    @required Result error(AuthorsStateErrorDetails value),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(BookDetailsStateInitial value),
    Result loaded(BookDetailsStateLoaded value),
    Result loading(BookDetailsStateLoading value),
    Result error(AuthorsStateErrorDetails value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class BookDetailsStateLoading implements BookDetailsState {
  const factory BookDetailsStateLoading() = _$BookDetailsStateLoading;
}

abstract class $AuthorsStateErrorDetailsCopyWith<$Res> {
  factory $AuthorsStateErrorDetailsCopyWith(AuthorsStateErrorDetails value,
          $Res Function(AuthorsStateErrorDetails) then) =
      _$AuthorsStateErrorDetailsCopyWithImpl<$Res>;
  $Res call({String message});
}

class _$AuthorsStateErrorDetailsCopyWithImpl<$Res>
    extends _$BookDetailsStateCopyWithImpl<$Res>
    implements $AuthorsStateErrorDetailsCopyWith<$Res> {
  _$AuthorsStateErrorDetailsCopyWithImpl(AuthorsStateErrorDetails _value,
      $Res Function(AuthorsStateErrorDetails) _then)
      : super(_value, (v) => _then(v as AuthorsStateErrorDetails));

  @override
  AuthorsStateErrorDetails get _value =>
      super._value as AuthorsStateErrorDetails;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(AuthorsStateErrorDetails(
      message == freezed ? _value.message : message as String,
    ));
  }
}

class _$AuthorsStateErrorDetails
    with DiagnosticableTreeMixin
    implements AuthorsStateErrorDetails {
  const _$AuthorsStateErrorDetails([this.message]);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BookDetailsState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BookDetailsState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthorsStateErrorDetails &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  $AuthorsStateErrorDetailsCopyWith<AuthorsStateErrorDetails> get copyWith =>
      _$AuthorsStateErrorDetailsCopyWithImpl<AuthorsStateErrorDetails>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loaded(MediaItem book),
    @required Result loading(),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    return error(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loaded(MediaItem book),
    Result loading(),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(BookDetailsStateInitial value),
    @required Result loaded(BookDetailsStateLoaded value),
    @required Result loading(BookDetailsStateLoading value),
    @required Result error(AuthorsStateErrorDetails value),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(BookDetailsStateInitial value),
    Result loaded(BookDetailsStateLoaded value),
    Result loading(BookDetailsStateLoading value),
    Result error(AuthorsStateErrorDetails value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AuthorsStateErrorDetails implements BookDetailsState {
  const factory AuthorsStateErrorDetails([String message]) =
      _$AuthorsStateErrorDetails;

  String get message;
  $AuthorsStateErrorDetailsCopyWith<AuthorsStateErrorDetails> get copyWith;
}
