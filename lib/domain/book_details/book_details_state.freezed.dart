// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'book_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$BookDetailsStateInitialCopyWith<$Res> {
  factory _$$BookDetailsStateInitialCopyWith(_$BookDetailsStateInitial value,
          $Res Function(_$BookDetailsStateInitial) then) =
      __$$BookDetailsStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BookDetailsStateInitialCopyWithImpl<$Res>
    extends _$BookDetailsStateCopyWithImpl<$Res>
    implements _$$BookDetailsStateInitialCopyWith<$Res> {
  __$$BookDetailsStateInitialCopyWithImpl(_$BookDetailsStateInitial _value,
      $Res Function(_$BookDetailsStateInitial) _then)
      : super(_value, (v) => _then(v as _$BookDetailsStateInitial));

  @override
  _$BookDetailsStateInitial get _value =>
      super._value as _$BookDetailsStateInitial;
}

/// @nodoc

class _$BookDetailsStateInitial implements BookDetailsStateInitial {
  const _$BookDetailsStateInitial();

  @override
  String toString() {
    return 'BookDetailsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookDetailsStateInitial);
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
abstract class _$$BookDetailsStateLoadedCopyWith<$Res> {
  factory _$$BookDetailsStateLoadedCopyWith(_$BookDetailsStateLoaded value,
          $Res Function(_$BookDetailsStateLoaded) then) =
      __$$BookDetailsStateLoadedCopyWithImpl<$Res>;
  $Res call({MediaItem? book, List<MediaItem>? chapters});
}

/// @nodoc
class __$$BookDetailsStateLoadedCopyWithImpl<$Res>
    extends _$BookDetailsStateCopyWithImpl<$Res>
    implements _$$BookDetailsStateLoadedCopyWith<$Res> {
  __$$BookDetailsStateLoadedCopyWithImpl(_$BookDetailsStateLoaded _value,
      $Res Function(_$BookDetailsStateLoaded) _then)
      : super(_value, (v) => _then(v as _$BookDetailsStateLoaded));

  @override
  _$BookDetailsStateLoaded get _value =>
      super._value as _$BookDetailsStateLoaded;

  @override
  $Res call({
    Object? book = freezed,
    Object? chapters = freezed,
  }) {
    return _then(_$BookDetailsStateLoaded(
      book: book == freezed
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as MediaItem?,
      chapters: chapters == freezed
          ? _value._chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<MediaItem>?,
    ));
  }
}

/// @nodoc

class _$BookDetailsStateLoaded implements BookDetailsStateLoaded {
  const _$BookDetailsStateLoaded({this.book, final List<MediaItem>? chapters})
      : _chapters = chapters;

  @override
  final MediaItem? book;
  final List<MediaItem>? _chapters;
  @override
  List<MediaItem>? get chapters {
    final value = _chapters;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BookDetailsState.loaded(book: $book, chapters: $chapters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookDetailsStateLoaded &&
            const DeepCollectionEquality().equals(other.book, book) &&
            const DeepCollectionEquality().equals(other._chapters, _chapters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(book),
      const DeepCollectionEquality().hash(_chapters));

  @JsonKey(ignore: true)
  @override
  _$$BookDetailsStateLoadedCopyWith<_$BookDetailsStateLoaded> get copyWith =>
      __$$BookDetailsStateLoadedCopyWithImpl<_$BookDetailsStateLoaded>(
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
      {final MediaItem? book,
      final List<MediaItem>? chapters}) = _$BookDetailsStateLoaded;

  MediaItem? get book;
  List<MediaItem>? get chapters;
  @JsonKey(ignore: true)
  _$$BookDetailsStateLoadedCopyWith<_$BookDetailsStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BookDetailsStateLoadingCopyWith<$Res> {
  factory _$$BookDetailsStateLoadingCopyWith(_$BookDetailsStateLoading value,
          $Res Function(_$BookDetailsStateLoading) then) =
      __$$BookDetailsStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BookDetailsStateLoadingCopyWithImpl<$Res>
    extends _$BookDetailsStateCopyWithImpl<$Res>
    implements _$$BookDetailsStateLoadingCopyWith<$Res> {
  __$$BookDetailsStateLoadingCopyWithImpl(_$BookDetailsStateLoading _value,
      $Res Function(_$BookDetailsStateLoading) _then)
      : super(_value, (v) => _then(v as _$BookDetailsStateLoading));

  @override
  _$BookDetailsStateLoading get _value =>
      super._value as _$BookDetailsStateLoading;
}

/// @nodoc

class _$BookDetailsStateLoading implements BookDetailsStateLoading {
  const _$BookDetailsStateLoading();

  @override
  String toString() {
    return 'BookDetailsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookDetailsStateLoading);
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
abstract class _$$BookDetailsStateErrorDetailsCopyWith<$Res> {
  factory _$$BookDetailsStateErrorDetailsCopyWith(
          _$BookDetailsStateErrorDetails value,
          $Res Function(_$BookDetailsStateErrorDetails) then) =
      __$$BookDetailsStateErrorDetailsCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class __$$BookDetailsStateErrorDetailsCopyWithImpl<$Res>
    extends _$BookDetailsStateCopyWithImpl<$Res>
    implements _$$BookDetailsStateErrorDetailsCopyWith<$Res> {
  __$$BookDetailsStateErrorDetailsCopyWithImpl(
      _$BookDetailsStateErrorDetails _value,
      $Res Function(_$BookDetailsStateErrorDetails) _then)
      : super(_value, (v) => _then(v as _$BookDetailsStateErrorDetails));

  @override
  _$BookDetailsStateErrorDetails get _value =>
      super._value as _$BookDetailsStateErrorDetails;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$BookDetailsStateErrorDetails(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$BookDetailsStateErrorDetails implements BookDetailsStateErrorDetails {
  const _$BookDetailsStateErrorDetails([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'BookDetailsState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookDetailsStateErrorDetails &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$BookDetailsStateErrorDetailsCopyWith<_$BookDetailsStateErrorDetails>
      get copyWith => __$$BookDetailsStateErrorDetailsCopyWithImpl<
          _$BookDetailsStateErrorDetails>(this, _$identity);

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
  const factory BookDetailsStateErrorDetails([final String? message]) =
      _$BookDetailsStateErrorDetails;

  String? get message;
  @JsonKey(ignore: true)
  _$$BookDetailsStateErrorDetailsCopyWith<_$BookDetailsStateErrorDetails>
      get copyWith => throw _privateConstructorUsedError;
}
