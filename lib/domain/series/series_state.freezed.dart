// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'series_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SeriesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? series) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? series)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? series)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SeriesStateInitial value) initial,
    required TResult Function(SeriesStateLoaded value) loaded,
    required TResult Function(SeriesStateLoading value) loading,
    required TResult Function(SeriesStateErrorDetails value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SeriesStateInitial value)? initial,
    TResult Function(SeriesStateLoaded value)? loaded,
    TResult Function(SeriesStateLoading value)? loading,
    TResult Function(SeriesStateErrorDetails value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SeriesStateInitial value)? initial,
    TResult Function(SeriesStateLoaded value)? loaded,
    TResult Function(SeriesStateLoading value)? loading,
    TResult Function(SeriesStateErrorDetails value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeriesStateCopyWith<$Res> {
  factory $SeriesStateCopyWith(
          SeriesState value, $Res Function(SeriesState) then) =
      _$SeriesStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SeriesStateCopyWithImpl<$Res> implements $SeriesStateCopyWith<$Res> {
  _$SeriesStateCopyWithImpl(this._value, this._then);

  final SeriesState _value;
  // ignore: unused_field
  final $Res Function(SeriesState) _then;
}

/// @nodoc
abstract class _$$SeriesStateInitialCopyWith<$Res> {
  factory _$$SeriesStateInitialCopyWith(_$SeriesStateInitial value,
          $Res Function(_$SeriesStateInitial) then) =
      __$$SeriesStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SeriesStateInitialCopyWithImpl<$Res>
    extends _$SeriesStateCopyWithImpl<$Res>
    implements _$$SeriesStateInitialCopyWith<$Res> {
  __$$SeriesStateInitialCopyWithImpl(
      _$SeriesStateInitial _value, $Res Function(_$SeriesStateInitial) _then)
      : super(_value, (v) => _then(v as _$SeriesStateInitial));

  @override
  _$SeriesStateInitial get _value => super._value as _$SeriesStateInitial;
}

/// @nodoc

class _$SeriesStateInitial implements SeriesStateInitial {
  const _$SeriesStateInitial();

  @override
  String toString() {
    return 'SeriesState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SeriesStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? series) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? series)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? series)? loaded,
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
    required TResult Function(SeriesStateInitial value) initial,
    required TResult Function(SeriesStateLoaded value) loaded,
    required TResult Function(SeriesStateLoading value) loading,
    required TResult Function(SeriesStateErrorDetails value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SeriesStateInitial value)? initial,
    TResult Function(SeriesStateLoaded value)? loaded,
    TResult Function(SeriesStateLoading value)? loading,
    TResult Function(SeriesStateErrorDetails value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SeriesStateInitial value)? initial,
    TResult Function(SeriesStateLoaded value)? loaded,
    TResult Function(SeriesStateLoading value)? loading,
    TResult Function(SeriesStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SeriesStateInitial implements SeriesState {
  const factory SeriesStateInitial() = _$SeriesStateInitial;
}

/// @nodoc
abstract class _$$SeriesStateLoadedCopyWith<$Res> {
  factory _$$SeriesStateLoadedCopyWith(
          _$SeriesStateLoaded value, $Res Function(_$SeriesStateLoaded) then) =
      __$$SeriesStateLoadedCopyWithImpl<$Res>;
  $Res call({List<MediaItem>? series});
}

/// @nodoc
class __$$SeriesStateLoadedCopyWithImpl<$Res>
    extends _$SeriesStateCopyWithImpl<$Res>
    implements _$$SeriesStateLoadedCopyWith<$Res> {
  __$$SeriesStateLoadedCopyWithImpl(
      _$SeriesStateLoaded _value, $Res Function(_$SeriesStateLoaded) _then)
      : super(_value, (v) => _then(v as _$SeriesStateLoaded));

  @override
  _$SeriesStateLoaded get _value => super._value as _$SeriesStateLoaded;

  @override
  $Res call({
    Object? series = freezed,
  }) {
    return _then(_$SeriesStateLoaded(
      series: series == freezed
          ? _value._series
          : series // ignore: cast_nullable_to_non_nullable
              as List<MediaItem>?,
    ));
  }
}

/// @nodoc

class _$SeriesStateLoaded implements SeriesStateLoaded {
  const _$SeriesStateLoaded({final List<MediaItem>? series}) : _series = series;

  final List<MediaItem>? _series;
  @override
  List<MediaItem>? get series {
    final value = _series;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SeriesState.loaded(series: $series)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeriesStateLoaded &&
            const DeepCollectionEquality().equals(other._series, _series));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_series));

  @JsonKey(ignore: true)
  @override
  _$$SeriesStateLoadedCopyWith<_$SeriesStateLoaded> get copyWith =>
      __$$SeriesStateLoadedCopyWithImpl<_$SeriesStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? series) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return loaded(series);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? series)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return loaded?.call(series);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? series)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(series);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SeriesStateInitial value) initial,
    required TResult Function(SeriesStateLoaded value) loaded,
    required TResult Function(SeriesStateLoading value) loading,
    required TResult Function(SeriesStateErrorDetails value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SeriesStateInitial value)? initial,
    TResult Function(SeriesStateLoaded value)? loaded,
    TResult Function(SeriesStateLoading value)? loading,
    TResult Function(SeriesStateErrorDetails value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SeriesStateInitial value)? initial,
    TResult Function(SeriesStateLoaded value)? loaded,
    TResult Function(SeriesStateLoading value)? loading,
    TResult Function(SeriesStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class SeriesStateLoaded implements SeriesState {
  const factory SeriesStateLoaded({final List<MediaItem>? series}) =
      _$SeriesStateLoaded;

  List<MediaItem>? get series;
  @JsonKey(ignore: true)
  _$$SeriesStateLoadedCopyWith<_$SeriesStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SeriesStateLoadingCopyWith<$Res> {
  factory _$$SeriesStateLoadingCopyWith(_$SeriesStateLoading value,
          $Res Function(_$SeriesStateLoading) then) =
      __$$SeriesStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SeriesStateLoadingCopyWithImpl<$Res>
    extends _$SeriesStateCopyWithImpl<$Res>
    implements _$$SeriesStateLoadingCopyWith<$Res> {
  __$$SeriesStateLoadingCopyWithImpl(
      _$SeriesStateLoading _value, $Res Function(_$SeriesStateLoading) _then)
      : super(_value, (v) => _then(v as _$SeriesStateLoading));

  @override
  _$SeriesStateLoading get _value => super._value as _$SeriesStateLoading;
}

/// @nodoc

class _$SeriesStateLoading implements SeriesStateLoading {
  const _$SeriesStateLoading();

  @override
  String toString() {
    return 'SeriesState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SeriesStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? series) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? series)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? series)? loaded,
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
    required TResult Function(SeriesStateInitial value) initial,
    required TResult Function(SeriesStateLoaded value) loaded,
    required TResult Function(SeriesStateLoading value) loading,
    required TResult Function(SeriesStateErrorDetails value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SeriesStateInitial value)? initial,
    TResult Function(SeriesStateLoaded value)? loaded,
    TResult Function(SeriesStateLoading value)? loading,
    TResult Function(SeriesStateErrorDetails value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SeriesStateInitial value)? initial,
    TResult Function(SeriesStateLoaded value)? loaded,
    TResult Function(SeriesStateLoading value)? loading,
    TResult Function(SeriesStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SeriesStateLoading implements SeriesState {
  const factory SeriesStateLoading() = _$SeriesStateLoading;
}

/// @nodoc
abstract class _$$SeriesStateErrorDetailsCopyWith<$Res> {
  factory _$$SeriesStateErrorDetailsCopyWith(_$SeriesStateErrorDetails value,
          $Res Function(_$SeriesStateErrorDetails) then) =
      __$$SeriesStateErrorDetailsCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class __$$SeriesStateErrorDetailsCopyWithImpl<$Res>
    extends _$SeriesStateCopyWithImpl<$Res>
    implements _$$SeriesStateErrorDetailsCopyWith<$Res> {
  __$$SeriesStateErrorDetailsCopyWithImpl(_$SeriesStateErrorDetails _value,
      $Res Function(_$SeriesStateErrorDetails) _then)
      : super(_value, (v) => _then(v as _$SeriesStateErrorDetails));

  @override
  _$SeriesStateErrorDetails get _value =>
      super._value as _$SeriesStateErrorDetails;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$SeriesStateErrorDetails(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SeriesStateErrorDetails implements SeriesStateErrorDetails {
  const _$SeriesStateErrorDetails([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'SeriesState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeriesStateErrorDetails &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$SeriesStateErrorDetailsCopyWith<_$SeriesStateErrorDetails> get copyWith =>
      __$$SeriesStateErrorDetailsCopyWithImpl<_$SeriesStateErrorDetails>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? series) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? series)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? series)? loaded,
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
    required TResult Function(SeriesStateInitial value) initial,
    required TResult Function(SeriesStateLoaded value) loaded,
    required TResult Function(SeriesStateLoading value) loading,
    required TResult Function(SeriesStateErrorDetails value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SeriesStateInitial value)? initial,
    TResult Function(SeriesStateLoaded value)? loaded,
    TResult Function(SeriesStateLoading value)? loading,
    TResult Function(SeriesStateErrorDetails value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SeriesStateInitial value)? initial,
    TResult Function(SeriesStateLoaded value)? loaded,
    TResult Function(SeriesStateLoading value)? loading,
    TResult Function(SeriesStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SeriesStateErrorDetails implements SeriesState {
  const factory SeriesStateErrorDetails([final String? message]) =
      _$SeriesStateErrorDetails;

  String? get message;
  @JsonKey(ignore: true)
  _$$SeriesStateErrorDetailsCopyWith<_$SeriesStateErrorDetails> get copyWith =>
      throw _privateConstructorUsedError;
}