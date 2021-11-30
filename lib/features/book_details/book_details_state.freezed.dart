// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'book_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BookDetailsStateTearOff {
  const _$BookDetailsStateTearOff();

  BookDetailsStateInitial initial() {
    return const BookDetailsStateInitial();
  }

  BookDetailsStateLoaded loaded({MediaItem? book, List<MediaItem>? chapters}) {
    return BookDetailsStateLoaded(
      book: book,
      chapters: chapters,
    );
  }

  BookDetailsStateLoading loading() {
    return const BookDetailsStateLoading();
  }

  BookDetailsStateErrorDetails error([String? message]) {
    return BookDetailsStateErrorDetails(
      message,
    );
  }
}

/// @nodoc
const $BookDetailsState = _$BookDetailsStateTearOff();

/// @nodoc
mixin _$BookDetailsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(MediaItem? book, List<MediaItem>? chapters)
        loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(MediaItem? book, List<MediaItem>? chapters)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(MediaItem? book, List<MediaItem>? chapters)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BookDetailsStateInitial value) initial,
    required TResult Function(BookDetailsStateLoaded value) loaded,
    required TResult Function(BookDetailsStateLoading value) loading,
    required TResult Function(BookDetailsStateErrorDetails value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(BookDetailsStateInitial value)? initial,
    TResult Function(BookDetailsStateLoaded value)? loaded,
    TResult Function(BookDetailsStateLoading value)? loading,
    TResult Function(BookDetailsStateErrorDetails value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookDetailsStateInitial value)? initial,
    TResult Function(BookDetailsStateLoaded value)? loaded,
    TResult Function(BookDetailsStateLoading value)? loading,
    TResult Function(BookDetailsStateErrorDetails value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookDetailsStateCopyWith<$Res> {
  factory $BookDetailsStateCopyWith(
          BookDetailsState value, $Res Function(BookDetailsState) then) =
      _$BookDetailsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$BookDetailsStateCopyWithImpl<$Res>
    implements $BookDetailsStateCopyWith<$Res> {
  _$BookDetailsStateCopyWithImpl(this._value, this._then);

  final BookDetailsState _value;
  // ignore: unused_field
  final $Res Function(BookDetailsState) _then;
}

/// @nodoc
abstract class $BookDetailsStateInitialCopyWith<$Res> {
  factory $BookDetailsStateInitialCopyWith(BookDetailsStateInitial value,
          $Res Function(BookDetailsStateInitial) then) =
      _$BookDetailsStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$BookDetailsStateInitialCopyWithImpl<$Res>
    extends _$BookDetailsStateCopyWithImpl<$Res>
    implements $BookDetailsStateInitialCopyWith<$Res> {
  _$BookDetailsStateInitialCopyWithImpl(BookDetailsStateInitial _value,
      $Res Function(BookDetailsStateInitial) _then)
      : super(_value, (v) => _then(v as BookDetailsStateInitial));

  @override
  BookDetailsStateInitial get _value => super._value as BookDetailsStateInitial;
}

/// @nodoc

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
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BookDetailsStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(MediaItem? book, List<MediaItem>? chapters)
        loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(MediaItem? book, List<MediaItem>? chapters)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(MediaItem? book, List<MediaItem>? chapters)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BookDetailsStateInitial value) initial,
    required TResult Function(BookDetailsStateLoaded value) loaded,
    required TResult Function(BookDetailsStateLoading value) loading,
    required TResult Function(BookDetailsStateErrorDetails value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(BookDetailsStateInitial value)? initial,
    TResult Function(BookDetailsStateLoaded value)? loaded,
    TResult Function(BookDetailsStateLoading value)? loading,
    TResult Function(BookDetailsStateErrorDetails value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookDetailsStateInitial value)? initial,
    TResult Function(BookDetailsStateLoaded value)? loaded,
    TResult Function(BookDetailsStateLoading value)? loading,
    TResult Function(BookDetailsStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class BookDetailsStateInitial implements BookDetailsState {
  const factory BookDetailsStateInitial() = _$BookDetailsStateInitial;
}

/// @nodoc
abstract class $BookDetailsStateLoadedCopyWith<$Res> {
  factory $BookDetailsStateLoadedCopyWith(BookDetailsStateLoaded value,
          $Res Function(BookDetailsStateLoaded) then) =
      _$BookDetailsStateLoadedCopyWithImpl<$Res>;
  $Res call({MediaItem? book, List<MediaItem>? chapters});
}

/// @nodoc
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
    Object? book = freezed,
    Object? chapters = freezed,
  }) {
    return _then(BookDetailsStateLoaded(
      book: book == freezed
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as MediaItem?,
      chapters: chapters == freezed
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<MediaItem>?,
    ));
  }
}

/// @nodoc

class _$BookDetailsStateLoaded
    with DiagnosticableTreeMixin
    implements BookDetailsStateLoaded {
  const _$BookDetailsStateLoaded({this.book, this.chapters});

  @override
  final MediaItem? book;
  @override
  final List<MediaItem>? chapters;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BookDetailsState.loaded(book: $book, chapters: $chapters)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BookDetailsState.loaded'))
      ..add(DiagnosticsProperty('book', book))
      ..add(DiagnosticsProperty('chapters', chapters));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookDetailsStateLoaded &&
            (identical(other.book, book) || other.book == book) &&
            const DeepCollectionEquality().equals(other.chapters, chapters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, book, const DeepCollectionEquality().hash(chapters));

  @JsonKey(ignore: true)
  @override
  $BookDetailsStateLoadedCopyWith<BookDetailsStateLoaded> get copyWith =>
      _$BookDetailsStateLoadedCopyWithImpl<BookDetailsStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(MediaItem? book, List<MediaItem>? chapters)
        loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return loaded(book, chapters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(MediaItem? book, List<MediaItem>? chapters)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return loaded?.call(book, chapters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(MediaItem? book, List<MediaItem>? chapters)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(book, chapters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BookDetailsStateInitial value) initial,
    required TResult Function(BookDetailsStateLoaded value) loaded,
    required TResult Function(BookDetailsStateLoading value) loading,
    required TResult Function(BookDetailsStateErrorDetails value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(BookDetailsStateInitial value)? initial,
    TResult Function(BookDetailsStateLoaded value)? loaded,
    TResult Function(BookDetailsStateLoading value)? loading,
    TResult Function(BookDetailsStateErrorDetails value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookDetailsStateInitial value)? initial,
    TResult Function(BookDetailsStateLoaded value)? loaded,
    TResult Function(BookDetailsStateLoading value)? loading,
    TResult Function(BookDetailsStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class BookDetailsStateLoaded implements BookDetailsState {
  const factory BookDetailsStateLoaded(
      {MediaItem? book, List<MediaItem>? chapters}) = _$BookDetailsStateLoaded;

  MediaItem? get book;
  List<MediaItem>? get chapters;
  @JsonKey(ignore: true)
  $BookDetailsStateLoadedCopyWith<BookDetailsStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookDetailsStateLoadingCopyWith<$Res> {
  factory $BookDetailsStateLoadingCopyWith(BookDetailsStateLoading value,
          $Res Function(BookDetailsStateLoading) then) =
      _$BookDetailsStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$BookDetailsStateLoadingCopyWithImpl<$Res>
    extends _$BookDetailsStateCopyWithImpl<$Res>
    implements $BookDetailsStateLoadingCopyWith<$Res> {
  _$BookDetailsStateLoadingCopyWithImpl(BookDetailsStateLoading _value,
      $Res Function(BookDetailsStateLoading) _then)
      : super(_value, (v) => _then(v as BookDetailsStateLoading));

  @override
  BookDetailsStateLoading get _value => super._value as BookDetailsStateLoading;
}

/// @nodoc

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
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BookDetailsStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(MediaItem? book, List<MediaItem>? chapters)
        loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(MediaItem? book, List<MediaItem>? chapters)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(MediaItem? book, List<MediaItem>? chapters)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BookDetailsStateInitial value) initial,
    required TResult Function(BookDetailsStateLoaded value) loaded,
    required TResult Function(BookDetailsStateLoading value) loading,
    required TResult Function(BookDetailsStateErrorDetails value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(BookDetailsStateInitial value)? initial,
    TResult Function(BookDetailsStateLoaded value)? loaded,
    TResult Function(BookDetailsStateLoading value)? loading,
    TResult Function(BookDetailsStateErrorDetails value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookDetailsStateInitial value)? initial,
    TResult Function(BookDetailsStateLoaded value)? loaded,
    TResult Function(BookDetailsStateLoading value)? loading,
    TResult Function(BookDetailsStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class BookDetailsStateLoading implements BookDetailsState {
  const factory BookDetailsStateLoading() = _$BookDetailsStateLoading;
}

/// @nodoc
abstract class $BookDetailsStateErrorDetailsCopyWith<$Res> {
  factory $BookDetailsStateErrorDetailsCopyWith(
          BookDetailsStateErrorDetails value,
          $Res Function(BookDetailsStateErrorDetails) then) =
      _$BookDetailsStateErrorDetailsCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class _$BookDetailsStateErrorDetailsCopyWithImpl<$Res>
    extends _$BookDetailsStateCopyWithImpl<$Res>
    implements $BookDetailsStateErrorDetailsCopyWith<$Res> {
  _$BookDetailsStateErrorDetailsCopyWithImpl(
      BookDetailsStateErrorDetails _value,
      $Res Function(BookDetailsStateErrorDetails) _then)
      : super(_value, (v) => _then(v as BookDetailsStateErrorDetails));

  @override
  BookDetailsStateErrorDetails get _value =>
      super._value as BookDetailsStateErrorDetails;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(BookDetailsStateErrorDetails(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$BookDetailsStateErrorDetails
    with DiagnosticableTreeMixin
    implements BookDetailsStateErrorDetails {
  const _$BookDetailsStateErrorDetails([this.message]);

  @override
  final String? message;

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
        (other.runtimeType == runtimeType &&
            other is BookDetailsStateErrorDetails &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  $BookDetailsStateErrorDetailsCopyWith<BookDetailsStateErrorDetails>
      get copyWith => _$BookDetailsStateErrorDetailsCopyWithImpl<
          BookDetailsStateErrorDetails>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(MediaItem? book, List<MediaItem>? chapters)
        loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(MediaItem? book, List<MediaItem>? chapters)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(MediaItem? book, List<MediaItem>? chapters)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BookDetailsStateInitial value) initial,
    required TResult Function(BookDetailsStateLoaded value) loaded,
    required TResult Function(BookDetailsStateLoading value) loading,
    required TResult Function(BookDetailsStateErrorDetails value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(BookDetailsStateInitial value)? initial,
    TResult Function(BookDetailsStateLoaded value)? loaded,
    TResult Function(BookDetailsStateLoading value)? loading,
    TResult Function(BookDetailsStateErrorDetails value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookDetailsStateInitial value)? initial,
    TResult Function(BookDetailsStateLoaded value)? loaded,
    TResult Function(BookDetailsStateLoading value)? loading,
    TResult Function(BookDetailsStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class BookDetailsStateErrorDetails implements BookDetailsState {
  const factory BookDetailsStateErrorDetails([String? message]) =
      _$BookDetailsStateErrorDetails;

  String? get message;
  @JsonKey(ignore: true)
  $BookDetailsStateErrorDetailsCopyWith<BookDetailsStateErrorDetails>
      get copyWith => throw _privateConstructorUsedError;
}
