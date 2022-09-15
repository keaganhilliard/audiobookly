// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'offline_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OfflineState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? books) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? books)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? books)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OfflineStateInitial value) initial,
    required TResult Function(OfflineStateLoaded value) loaded,
    required TResult Function(OfflineStateLoading value) loading,
    required TResult Function(OfflineStateErrorDetails value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OfflineStateInitial value)? initial,
    TResult Function(OfflineStateLoaded value)? loaded,
    TResult Function(OfflineStateLoading value)? loading,
    TResult Function(OfflineStateErrorDetails value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OfflineStateInitial value)? initial,
    TResult Function(OfflineStateLoaded value)? loaded,
    TResult Function(OfflineStateLoading value)? loading,
    TResult Function(OfflineStateErrorDetails value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfflineStateCopyWith<$Res> {
  factory $OfflineStateCopyWith(
          OfflineState value, $Res Function(OfflineState) then) =
      _$OfflineStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$OfflineStateCopyWithImpl<$Res> implements $OfflineStateCopyWith<$Res> {
  _$OfflineStateCopyWithImpl(this._value, this._then);

  final OfflineState _value;
  // ignore: unused_field
  final $Res Function(OfflineState) _then;
}

/// @nodoc
abstract class _$$OfflineStateInitialCopyWith<$Res> {
  factory _$$OfflineStateInitialCopyWith(_$OfflineStateInitial value,
          $Res Function(_$OfflineStateInitial) then) =
      __$$OfflineStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OfflineStateInitialCopyWithImpl<$Res>
    extends _$OfflineStateCopyWithImpl<$Res>
    implements _$$OfflineStateInitialCopyWith<$Res> {
  __$$OfflineStateInitialCopyWithImpl(
      _$OfflineStateInitial _value, $Res Function(_$OfflineStateInitial) _then)
      : super(_value, (v) => _then(v as _$OfflineStateInitial));

  @override
  _$OfflineStateInitial get _value => super._value as _$OfflineStateInitial;
}

/// @nodoc

class _$OfflineStateInitial implements OfflineStateInitial {
  const _$OfflineStateInitial();

  @override
  String toString() {
    return 'OfflineState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OfflineStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? books) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? books)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? books)? loaded,
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
    required TResult Function(OfflineStateInitial value) initial,
    required TResult Function(OfflineStateLoaded value) loaded,
    required TResult Function(OfflineStateLoading value) loading,
    required TResult Function(OfflineStateErrorDetails value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OfflineStateInitial value)? initial,
    TResult Function(OfflineStateLoaded value)? loaded,
    TResult Function(OfflineStateLoading value)? loading,
    TResult Function(OfflineStateErrorDetails value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OfflineStateInitial value)? initial,
    TResult Function(OfflineStateLoaded value)? loaded,
    TResult Function(OfflineStateLoading value)? loading,
    TResult Function(OfflineStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class OfflineStateInitial implements OfflineState {
  const factory OfflineStateInitial() = _$OfflineStateInitial;
}

/// @nodoc
abstract class _$$OfflineStateLoadedCopyWith<$Res> {
  factory _$$OfflineStateLoadedCopyWith(_$OfflineStateLoaded value,
          $Res Function(_$OfflineStateLoaded) then) =
      __$$OfflineStateLoadedCopyWithImpl<$Res>;
  $Res call({List<MediaItem>? books});
}

/// @nodoc
class __$$OfflineStateLoadedCopyWithImpl<$Res>
    extends _$OfflineStateCopyWithImpl<$Res>
    implements _$$OfflineStateLoadedCopyWith<$Res> {
  __$$OfflineStateLoadedCopyWithImpl(
      _$OfflineStateLoaded _value, $Res Function(_$OfflineStateLoaded) _then)
      : super(_value, (v) => _then(v as _$OfflineStateLoaded));

  @override
  _$OfflineStateLoaded get _value => super._value as _$OfflineStateLoaded;

  @override
  $Res call({
    Object? books = freezed,
  }) {
    return _then(_$OfflineStateLoaded(
      books: books == freezed
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<MediaItem>?,
    ));
  }
}

/// @nodoc

class _$OfflineStateLoaded implements OfflineStateLoaded {
  const _$OfflineStateLoaded({final List<MediaItem>? books}) : _books = books;

  final List<MediaItem>? _books;
  @override
  List<MediaItem>? get books {
    final value = _books;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'OfflineState.loaded(books: $books)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfflineStateLoaded &&
            const DeepCollectionEquality().equals(other._books, _books));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_books));

  @JsonKey(ignore: true)
  @override
  _$$OfflineStateLoadedCopyWith<_$OfflineStateLoaded> get copyWith =>
      __$$OfflineStateLoadedCopyWithImpl<_$OfflineStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? books) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return loaded(books);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? books)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return loaded?.call(books);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? books)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(books);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OfflineStateInitial value) initial,
    required TResult Function(OfflineStateLoaded value) loaded,
    required TResult Function(OfflineStateLoading value) loading,
    required TResult Function(OfflineStateErrorDetails value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OfflineStateInitial value)? initial,
    TResult Function(OfflineStateLoaded value)? loaded,
    TResult Function(OfflineStateLoading value)? loading,
    TResult Function(OfflineStateErrorDetails value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OfflineStateInitial value)? initial,
    TResult Function(OfflineStateLoaded value)? loaded,
    TResult Function(OfflineStateLoading value)? loading,
    TResult Function(OfflineStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class OfflineStateLoaded implements OfflineState {
  const factory OfflineStateLoaded({final List<MediaItem>? books}) =
      _$OfflineStateLoaded;

  List<MediaItem>? get books;
  @JsonKey(ignore: true)
  _$$OfflineStateLoadedCopyWith<_$OfflineStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OfflineStateLoadingCopyWith<$Res> {
  factory _$$OfflineStateLoadingCopyWith(_$OfflineStateLoading value,
          $Res Function(_$OfflineStateLoading) then) =
      __$$OfflineStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OfflineStateLoadingCopyWithImpl<$Res>
    extends _$OfflineStateCopyWithImpl<$Res>
    implements _$$OfflineStateLoadingCopyWith<$Res> {
  __$$OfflineStateLoadingCopyWithImpl(
      _$OfflineStateLoading _value, $Res Function(_$OfflineStateLoading) _then)
      : super(_value, (v) => _then(v as _$OfflineStateLoading));

  @override
  _$OfflineStateLoading get _value => super._value as _$OfflineStateLoading;
}

/// @nodoc

class _$OfflineStateLoading implements OfflineStateLoading {
  const _$OfflineStateLoading();

  @override
  String toString() {
    return 'OfflineState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OfflineStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? books) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? books)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? books)? loaded,
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
    required TResult Function(OfflineStateInitial value) initial,
    required TResult Function(OfflineStateLoaded value) loaded,
    required TResult Function(OfflineStateLoading value) loading,
    required TResult Function(OfflineStateErrorDetails value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OfflineStateInitial value)? initial,
    TResult Function(OfflineStateLoaded value)? loaded,
    TResult Function(OfflineStateLoading value)? loading,
    TResult Function(OfflineStateErrorDetails value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OfflineStateInitial value)? initial,
    TResult Function(OfflineStateLoaded value)? loaded,
    TResult Function(OfflineStateLoading value)? loading,
    TResult Function(OfflineStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class OfflineStateLoading implements OfflineState {
  const factory OfflineStateLoading() = _$OfflineStateLoading;
}

/// @nodoc
abstract class _$$OfflineStateErrorDetailsCopyWith<$Res> {
  factory _$$OfflineStateErrorDetailsCopyWith(_$OfflineStateErrorDetails value,
          $Res Function(_$OfflineStateErrorDetails) then) =
      __$$OfflineStateErrorDetailsCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class __$$OfflineStateErrorDetailsCopyWithImpl<$Res>
    extends _$OfflineStateCopyWithImpl<$Res>
    implements _$$OfflineStateErrorDetailsCopyWith<$Res> {
  __$$OfflineStateErrorDetailsCopyWithImpl(_$OfflineStateErrorDetails _value,
      $Res Function(_$OfflineStateErrorDetails) _then)
      : super(_value, (v) => _then(v as _$OfflineStateErrorDetails));

  @override
  _$OfflineStateErrorDetails get _value =>
      super._value as _$OfflineStateErrorDetails;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$OfflineStateErrorDetails(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$OfflineStateErrorDetails implements OfflineStateErrorDetails {
  const _$OfflineStateErrorDetails([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'OfflineState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfflineStateErrorDetails &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$OfflineStateErrorDetailsCopyWith<_$OfflineStateErrorDetails>
      get copyWith =>
          __$$OfflineStateErrorDetailsCopyWithImpl<_$OfflineStateErrorDetails>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? books) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? books)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? books)? loaded,
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
    required TResult Function(OfflineStateInitial value) initial,
    required TResult Function(OfflineStateLoaded value) loaded,
    required TResult Function(OfflineStateLoading value) loading,
    required TResult Function(OfflineStateErrorDetails value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OfflineStateInitial value)? initial,
    TResult Function(OfflineStateLoaded value)? loaded,
    TResult Function(OfflineStateLoading value)? loading,
    TResult Function(OfflineStateErrorDetails value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OfflineStateInitial value)? initial,
    TResult Function(OfflineStateLoaded value)? loaded,
    TResult Function(OfflineStateLoading value)? loading,
    TResult Function(OfflineStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class OfflineStateErrorDetails implements OfflineState {
  const factory OfflineStateErrorDetails([final String? message]) =
      _$OfflineStateErrorDetails;

  String? get message;
  @JsonKey(ignore: true)
  _$$OfflineStateErrorDetailsCopyWith<_$OfflineStateErrorDetails>
      get copyWith => throw _privateConstructorUsedError;
}
