// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'books_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BooksState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? books, String? currentParent)
        loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? books, String? currentParent)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? books, String? currentParent)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BooksStateInitial value) initial,
    required TResult Function(BooksStateLoaded value) loaded,
    required TResult Function(BooksStateLoading value) loading,
    required TResult Function(BooksStateErrorDetails value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(BooksStateInitial value)? initial,
    TResult Function(BooksStateLoaded value)? loaded,
    TResult Function(BooksStateLoading value)? loading,
    TResult Function(BooksStateErrorDetails value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BooksStateInitial value)? initial,
    TResult Function(BooksStateLoaded value)? loaded,
    TResult Function(BooksStateLoading value)? loading,
    TResult Function(BooksStateErrorDetails value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BooksStateCopyWith<$Res> {
  factory $BooksStateCopyWith(
          BooksState value, $Res Function(BooksState) then) =
      _$BooksStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$BooksStateCopyWithImpl<$Res> implements $BooksStateCopyWith<$Res> {
  _$BooksStateCopyWithImpl(this._value, this._then);

  final BooksState _value;
  // ignore: unused_field
  final $Res Function(BooksState) _then;
}

/// @nodoc
abstract class _$$BooksStateInitialCopyWith<$Res> {
  factory _$$BooksStateInitialCopyWith(
          _$BooksStateInitial value, $Res Function(_$BooksStateInitial) then) =
      __$$BooksStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BooksStateInitialCopyWithImpl<$Res>
    extends _$BooksStateCopyWithImpl<$Res>
    implements _$$BooksStateInitialCopyWith<$Res> {
  __$$BooksStateInitialCopyWithImpl(
      _$BooksStateInitial _value, $Res Function(_$BooksStateInitial) _then)
      : super(_value, (v) => _then(v as _$BooksStateInitial));

  @override
  _$BooksStateInitial get _value => super._value as _$BooksStateInitial;
}

/// @nodoc

class _$BooksStateInitial implements BooksStateInitial {
  const _$BooksStateInitial();

  @override
  String toString() {
    return 'BooksState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BooksStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? books, String? currentParent)
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
    TResult Function(List<MediaItem>? books, String? currentParent)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? books, String? currentParent)? loaded,
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
    required TResult Function(BooksStateInitial value) initial,
    required TResult Function(BooksStateLoaded value) loaded,
    required TResult Function(BooksStateLoading value) loading,
    required TResult Function(BooksStateErrorDetails value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(BooksStateInitial value)? initial,
    TResult Function(BooksStateLoaded value)? loaded,
    TResult Function(BooksStateLoading value)? loading,
    TResult Function(BooksStateErrorDetails value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BooksStateInitial value)? initial,
    TResult Function(BooksStateLoaded value)? loaded,
    TResult Function(BooksStateLoading value)? loading,
    TResult Function(BooksStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class BooksStateInitial implements BooksState {
  const factory BooksStateInitial() = _$BooksStateInitial;
}

/// @nodoc
abstract class _$$BooksStateLoadedCopyWith<$Res> {
  factory _$$BooksStateLoadedCopyWith(
          _$BooksStateLoaded value, $Res Function(_$BooksStateLoaded) then) =
      __$$BooksStateLoadedCopyWithImpl<$Res>;
  $Res call({List<MediaItem>? books, String? currentParent});
}

/// @nodoc
class __$$BooksStateLoadedCopyWithImpl<$Res>
    extends _$BooksStateCopyWithImpl<$Res>
    implements _$$BooksStateLoadedCopyWith<$Res> {
  __$$BooksStateLoadedCopyWithImpl(
      _$BooksStateLoaded _value, $Res Function(_$BooksStateLoaded) _then)
      : super(_value, (v) => _then(v as _$BooksStateLoaded));

  @override
  _$BooksStateLoaded get _value => super._value as _$BooksStateLoaded;

  @override
  $Res call({
    Object? books = freezed,
    Object? currentParent = freezed,
  }) {
    return _then(_$BooksStateLoaded(
      books: books == freezed
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<MediaItem>?,
      currentParent: currentParent == freezed
          ? _value.currentParent
          : currentParent // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$BooksStateLoaded implements BooksStateLoaded {
  const _$BooksStateLoaded({final List<MediaItem>? books, this.currentParent})
      : _books = books;

  final List<MediaItem>? _books;
  @override
  List<MediaItem>? get books {
    final value = _books;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? currentParent;

  @override
  String toString() {
    return 'BooksState.loaded(books: $books, currentParent: $currentParent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BooksStateLoaded &&
            const DeepCollectionEquality().equals(other._books, _books) &&
            const DeepCollectionEquality()
                .equals(other.currentParent, currentParent));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_books),
      const DeepCollectionEquality().hash(currentParent));

  @JsonKey(ignore: true)
  @override
  _$$BooksStateLoadedCopyWith<_$BooksStateLoaded> get copyWith =>
      __$$BooksStateLoadedCopyWithImpl<_$BooksStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? books, String? currentParent)
        loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return loaded(books, currentParent);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? books, String? currentParent)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return loaded?.call(books, currentParent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? books, String? currentParent)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(books, currentParent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BooksStateInitial value) initial,
    required TResult Function(BooksStateLoaded value) loaded,
    required TResult Function(BooksStateLoading value) loading,
    required TResult Function(BooksStateErrorDetails value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(BooksStateInitial value)? initial,
    TResult Function(BooksStateLoaded value)? loaded,
    TResult Function(BooksStateLoading value)? loading,
    TResult Function(BooksStateErrorDetails value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BooksStateInitial value)? initial,
    TResult Function(BooksStateLoaded value)? loaded,
    TResult Function(BooksStateLoading value)? loading,
    TResult Function(BooksStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class BooksStateLoaded implements BooksState {
  const factory BooksStateLoaded(
      {final List<MediaItem>? books,
      final String? currentParent}) = _$BooksStateLoaded;

  List<MediaItem>? get books;
  String? get currentParent;
  @JsonKey(ignore: true)
  _$$BooksStateLoadedCopyWith<_$BooksStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BooksStateLoadingCopyWith<$Res> {
  factory _$$BooksStateLoadingCopyWith(
          _$BooksStateLoading value, $Res Function(_$BooksStateLoading) then) =
      __$$BooksStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BooksStateLoadingCopyWithImpl<$Res>
    extends _$BooksStateCopyWithImpl<$Res>
    implements _$$BooksStateLoadingCopyWith<$Res> {
  __$$BooksStateLoadingCopyWithImpl(
      _$BooksStateLoading _value, $Res Function(_$BooksStateLoading) _then)
      : super(_value, (v) => _then(v as _$BooksStateLoading));

  @override
  _$BooksStateLoading get _value => super._value as _$BooksStateLoading;
}

/// @nodoc

class _$BooksStateLoading implements BooksStateLoading {
  const _$BooksStateLoading();

  @override
  String toString() {
    return 'BooksState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BooksStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? books, String? currentParent)
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
    TResult Function(List<MediaItem>? books, String? currentParent)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? books, String? currentParent)? loaded,
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
    required TResult Function(BooksStateInitial value) initial,
    required TResult Function(BooksStateLoaded value) loaded,
    required TResult Function(BooksStateLoading value) loading,
    required TResult Function(BooksStateErrorDetails value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(BooksStateInitial value)? initial,
    TResult Function(BooksStateLoaded value)? loaded,
    TResult Function(BooksStateLoading value)? loading,
    TResult Function(BooksStateErrorDetails value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BooksStateInitial value)? initial,
    TResult Function(BooksStateLoaded value)? loaded,
    TResult Function(BooksStateLoading value)? loading,
    TResult Function(BooksStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class BooksStateLoading implements BooksState {
  const factory BooksStateLoading() = _$BooksStateLoading;
}

/// @nodoc
abstract class _$$BooksStateErrorDetailsCopyWith<$Res> {
  factory _$$BooksStateErrorDetailsCopyWith(_$BooksStateErrorDetails value,
          $Res Function(_$BooksStateErrorDetails) then) =
      __$$BooksStateErrorDetailsCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class __$$BooksStateErrorDetailsCopyWithImpl<$Res>
    extends _$BooksStateCopyWithImpl<$Res>
    implements _$$BooksStateErrorDetailsCopyWith<$Res> {
  __$$BooksStateErrorDetailsCopyWithImpl(_$BooksStateErrorDetails _value,
      $Res Function(_$BooksStateErrorDetails) _then)
      : super(_value, (v) => _then(v as _$BooksStateErrorDetails));

  @override
  _$BooksStateErrorDetails get _value =>
      super._value as _$BooksStateErrorDetails;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$BooksStateErrorDetails(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$BooksStateErrorDetails implements BooksStateErrorDetails {
  const _$BooksStateErrorDetails([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'BooksState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BooksStateErrorDetails &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$BooksStateErrorDetailsCopyWith<_$BooksStateErrorDetails> get copyWith =>
      __$$BooksStateErrorDetailsCopyWithImpl<_$BooksStateErrorDetails>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? books, String? currentParent)
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
    TResult Function(List<MediaItem>? books, String? currentParent)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? books, String? currentParent)? loaded,
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
    required TResult Function(BooksStateInitial value) initial,
    required TResult Function(BooksStateLoaded value) loaded,
    required TResult Function(BooksStateLoading value) loading,
    required TResult Function(BooksStateErrorDetails value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(BooksStateInitial value)? initial,
    TResult Function(BooksStateLoaded value)? loaded,
    TResult Function(BooksStateLoading value)? loading,
    TResult Function(BooksStateErrorDetails value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BooksStateInitial value)? initial,
    TResult Function(BooksStateLoaded value)? loaded,
    TResult Function(BooksStateLoading value)? loading,
    TResult Function(BooksStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class BooksStateErrorDetails implements BooksState {
  const factory BooksStateErrorDetails([final String? message]) =
      _$BooksStateErrorDetails;

  String? get message;
  @JsonKey(ignore: true)
  _$$BooksStateErrorDetailsCopyWith<_$BooksStateErrorDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
