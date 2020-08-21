// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'books_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$BooksStateTearOff {
  const _$BooksStateTearOff();

// ignore: unused_element
  BooksStateInitial initial() {
    return const BooksStateInitial();
  }

// ignore: unused_element
  BooksStateLoaded loaded({List<MediaItem> books}) {
    return BooksStateLoaded(
      books: books,
    );
  }

// ignore: unused_element
  BooksStateLoading loading() {
    return const BooksStateLoading();
  }

// ignore: unused_element
  BooksStateErrorDetails error([String message]) {
    return BooksStateErrorDetails(
      message,
    );
  }
}

// ignore: unused_element
const $BooksState = _$BooksStateTearOff();

mixin _$BooksState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loaded(List<MediaItem> books),
    @required Result loading(),
    @required Result error(String message),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loaded(List<MediaItem> books),
    Result loading(),
    Result error(String message),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(BooksStateInitial value),
    @required Result loaded(BooksStateLoaded value),
    @required Result loading(BooksStateLoading value),
    @required Result error(BooksStateErrorDetails value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(BooksStateInitial value),
    Result loaded(BooksStateLoaded value),
    Result loading(BooksStateLoading value),
    Result error(BooksStateErrorDetails value),
    @required Result orElse(),
  });
}

abstract class $BooksStateCopyWith<$Res> {
  factory $BooksStateCopyWith(
          BooksState value, $Res Function(BooksState) then) =
      _$BooksStateCopyWithImpl<$Res>;
}

class _$BooksStateCopyWithImpl<$Res> implements $BooksStateCopyWith<$Res> {
  _$BooksStateCopyWithImpl(this._value, this._then);

  final BooksState _value;
  // ignore: unused_field
  final $Res Function(BooksState) _then;
}

abstract class $BooksStateInitialCopyWith<$Res> {
  factory $BooksStateInitialCopyWith(
          BooksStateInitial value, $Res Function(BooksStateInitial) then) =
      _$BooksStateInitialCopyWithImpl<$Res>;
}

class _$BooksStateInitialCopyWithImpl<$Res>
    extends _$BooksStateCopyWithImpl<$Res>
    implements $BooksStateInitialCopyWith<$Res> {
  _$BooksStateInitialCopyWithImpl(
      BooksStateInitial _value, $Res Function(BooksStateInitial) _then)
      : super(_value, (v) => _then(v as BooksStateInitial));

  @override
  BooksStateInitial get _value => super._value as BooksStateInitial;
}

class _$BooksStateInitial
    with DiagnosticableTreeMixin
    implements BooksStateInitial {
  const _$BooksStateInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BooksState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'BooksState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BooksStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loaded(List<MediaItem> books),
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
    Result loaded(List<MediaItem> books),
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
    @required Result initial(BooksStateInitial value),
    @required Result loaded(BooksStateLoaded value),
    @required Result loading(BooksStateLoading value),
    @required Result error(BooksStateErrorDetails value),
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
    Result initial(BooksStateInitial value),
    Result loaded(BooksStateLoaded value),
    Result loading(BooksStateLoading value),
    Result error(BooksStateErrorDetails value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class BooksStateInitial implements BooksState {
  const factory BooksStateInitial() = _$BooksStateInitial;
}

abstract class $BooksStateLoadedCopyWith<$Res> {
  factory $BooksStateLoadedCopyWith(
          BooksStateLoaded value, $Res Function(BooksStateLoaded) then) =
      _$BooksStateLoadedCopyWithImpl<$Res>;
  $Res call({List<MediaItem> books});
}

class _$BooksStateLoadedCopyWithImpl<$Res>
    extends _$BooksStateCopyWithImpl<$Res>
    implements $BooksStateLoadedCopyWith<$Res> {
  _$BooksStateLoadedCopyWithImpl(
      BooksStateLoaded _value, $Res Function(BooksStateLoaded) _then)
      : super(_value, (v) => _then(v as BooksStateLoaded));

  @override
  BooksStateLoaded get _value => super._value as BooksStateLoaded;

  @override
  $Res call({
    Object books = freezed,
  }) {
    return _then(BooksStateLoaded(
      books: books == freezed ? _value.books : books as List<MediaItem>,
    ));
  }
}

class _$BooksStateLoaded
    with DiagnosticableTreeMixin
    implements BooksStateLoaded {
  const _$BooksStateLoaded({this.books});

  @override
  final List<MediaItem> books;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BooksState.loaded(books: $books)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BooksState.loaded'))
      ..add(DiagnosticsProperty('books', books));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BooksStateLoaded &&
            (identical(other.books, books) ||
                const DeepCollectionEquality().equals(other.books, books)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(books);

  @override
  $BooksStateLoadedCopyWith<BooksStateLoaded> get copyWith =>
      _$BooksStateLoadedCopyWithImpl<BooksStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loaded(List<MediaItem> books),
    @required Result loading(),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    return loaded(books);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loaded(List<MediaItem> books),
    Result loading(),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(books);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(BooksStateInitial value),
    @required Result loaded(BooksStateLoaded value),
    @required Result loading(BooksStateLoading value),
    @required Result error(BooksStateErrorDetails value),
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
    Result initial(BooksStateInitial value),
    Result loaded(BooksStateLoaded value),
    Result loading(BooksStateLoading value),
    Result error(BooksStateErrorDetails value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class BooksStateLoaded implements BooksState {
  const factory BooksStateLoaded({List<MediaItem> books}) = _$BooksStateLoaded;

  List<MediaItem> get books;
  $BooksStateLoadedCopyWith<BooksStateLoaded> get copyWith;
}

abstract class $BooksStateLoadingCopyWith<$Res> {
  factory $BooksStateLoadingCopyWith(
          BooksStateLoading value, $Res Function(BooksStateLoading) then) =
      _$BooksStateLoadingCopyWithImpl<$Res>;
}

class _$BooksStateLoadingCopyWithImpl<$Res>
    extends _$BooksStateCopyWithImpl<$Res>
    implements $BooksStateLoadingCopyWith<$Res> {
  _$BooksStateLoadingCopyWithImpl(
      BooksStateLoading _value, $Res Function(BooksStateLoading) _then)
      : super(_value, (v) => _then(v as BooksStateLoading));

  @override
  BooksStateLoading get _value => super._value as BooksStateLoading;
}

class _$BooksStateLoading
    with DiagnosticableTreeMixin
    implements BooksStateLoading {
  const _$BooksStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BooksState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'BooksState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BooksStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loaded(List<MediaItem> books),
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
    Result loaded(List<MediaItem> books),
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
    @required Result initial(BooksStateInitial value),
    @required Result loaded(BooksStateLoaded value),
    @required Result loading(BooksStateLoading value),
    @required Result error(BooksStateErrorDetails value),
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
    Result initial(BooksStateInitial value),
    Result loaded(BooksStateLoaded value),
    Result loading(BooksStateLoading value),
    Result error(BooksStateErrorDetails value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class BooksStateLoading implements BooksState {
  const factory BooksStateLoading() = _$BooksStateLoading;
}

abstract class $BooksStateErrorDetailsCopyWith<$Res> {
  factory $BooksStateErrorDetailsCopyWith(BooksStateErrorDetails value,
          $Res Function(BooksStateErrorDetails) then) =
      _$BooksStateErrorDetailsCopyWithImpl<$Res>;
  $Res call({String message});
}

class _$BooksStateErrorDetailsCopyWithImpl<$Res>
    extends _$BooksStateCopyWithImpl<$Res>
    implements $BooksStateErrorDetailsCopyWith<$Res> {
  _$BooksStateErrorDetailsCopyWithImpl(BooksStateErrorDetails _value,
      $Res Function(BooksStateErrorDetails) _then)
      : super(_value, (v) => _then(v as BooksStateErrorDetails));

  @override
  BooksStateErrorDetails get _value => super._value as BooksStateErrorDetails;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(BooksStateErrorDetails(
      message == freezed ? _value.message : message as String,
    ));
  }
}

class _$BooksStateErrorDetails
    with DiagnosticableTreeMixin
    implements BooksStateErrorDetails {
  const _$BooksStateErrorDetails([this.message]);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BooksState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BooksState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BooksStateErrorDetails &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  $BooksStateErrorDetailsCopyWith<BooksStateErrorDetails> get copyWith =>
      _$BooksStateErrorDetailsCopyWithImpl<BooksStateErrorDetails>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loaded(List<MediaItem> books),
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
    Result loaded(List<MediaItem> books),
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
    @required Result initial(BooksStateInitial value),
    @required Result loaded(BooksStateLoaded value),
    @required Result loading(BooksStateLoading value),
    @required Result error(BooksStateErrorDetails value),
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
    Result initial(BooksStateInitial value),
    Result loaded(BooksStateLoaded value),
    Result loading(BooksStateLoading value),
    Result error(BooksStateErrorDetails value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class BooksStateErrorDetails implements BooksState {
  const factory BooksStateErrorDetails([String message]) =
      _$BooksStateErrorDetails;

  String get message;
  $BooksStateErrorDetailsCopyWith<BooksStateErrorDetails> get copyWith;
}
