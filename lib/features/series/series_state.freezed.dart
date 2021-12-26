// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'series_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SeriesStateTearOff {
  const _$SeriesStateTearOff();

  SeriesStateInitial initial() {
    return const SeriesStateInitial();
  }

  SeriesStateLoaded loaded({List<MediaItem>? series}) {
    return SeriesStateLoaded(
      series: series,
    );
  }

  SeriesStateLoading loading() {
    return const SeriesStateLoading();
  }

  SeriesStateErrorDetails error([String? message]) {
    return SeriesStateErrorDetails(
      message,
    );
  }
}

/// @nodoc
const $SeriesState = _$SeriesStateTearOff();

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
abstract class $SeriesStateInitialCopyWith<$Res> {
  factory $SeriesStateInitialCopyWith(
          SeriesStateInitial value, $Res Function(SeriesStateInitial) then) =
      _$SeriesStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$SeriesStateInitialCopyWithImpl<$Res>
    extends _$SeriesStateCopyWithImpl<$Res>
    implements $SeriesStateInitialCopyWith<$Res> {
  _$SeriesStateInitialCopyWithImpl(
      SeriesStateInitial _value, $Res Function(SeriesStateInitial) _then)
      : super(_value, (v) => _then(v as SeriesStateInitial));

  @override
  SeriesStateInitial get _value => super._value as SeriesStateInitial;
}

/// @nodoc

class _$SeriesStateInitial
    with DiagnosticableTreeMixin
    implements SeriesStateInitial {
  const _$SeriesStateInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SeriesState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'SeriesState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SeriesStateInitial);
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
abstract class $SeriesStateLoadedCopyWith<$Res> {
  factory $SeriesStateLoadedCopyWith(
          SeriesStateLoaded value, $Res Function(SeriesStateLoaded) then) =
      _$SeriesStateLoadedCopyWithImpl<$Res>;
  $Res call({List<MediaItem>? series});
}

/// @nodoc
class _$SeriesStateLoadedCopyWithImpl<$Res>
    extends _$SeriesStateCopyWithImpl<$Res>
    implements $SeriesStateLoadedCopyWith<$Res> {
  _$SeriesStateLoadedCopyWithImpl(
      SeriesStateLoaded _value, $Res Function(SeriesStateLoaded) _then)
      : super(_value, (v) => _then(v as SeriesStateLoaded));

  @override
  SeriesStateLoaded get _value => super._value as SeriesStateLoaded;

  @override
  $Res call({
    Object? series = freezed,
  }) {
    return _then(SeriesStateLoaded(
      series: series == freezed
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as List<MediaItem>?,
    ));
  }
}

/// @nodoc

class _$SeriesStateLoaded
    with DiagnosticableTreeMixin
    implements SeriesStateLoaded {
  const _$SeriesStateLoaded({this.series});

  @override
  final List<MediaItem>? series;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SeriesState.loaded(series: $series)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SeriesState.loaded'))
      ..add(DiagnosticsProperty('series', series));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SeriesStateLoaded &&
            const DeepCollectionEquality().equals(other.series, series));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(series));

  @JsonKey(ignore: true)
  @override
  $SeriesStateLoadedCopyWith<SeriesStateLoaded> get copyWith =>
      _$SeriesStateLoadedCopyWithImpl<SeriesStateLoaded>(this, _$identity);

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
  const factory SeriesStateLoaded({List<MediaItem>? series}) =
      _$SeriesStateLoaded;

  List<MediaItem>? get series;
  @JsonKey(ignore: true)
  $SeriesStateLoadedCopyWith<SeriesStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeriesStateLoadingCopyWith<$Res> {
  factory $SeriesStateLoadingCopyWith(
          SeriesStateLoading value, $Res Function(SeriesStateLoading) then) =
      _$SeriesStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$SeriesStateLoadingCopyWithImpl<$Res>
    extends _$SeriesStateCopyWithImpl<$Res>
    implements $SeriesStateLoadingCopyWith<$Res> {
  _$SeriesStateLoadingCopyWithImpl(
      SeriesStateLoading _value, $Res Function(SeriesStateLoading) _then)
      : super(_value, (v) => _then(v as SeriesStateLoading));

  @override
  SeriesStateLoading get _value => super._value as SeriesStateLoading;
}

/// @nodoc

class _$SeriesStateLoading
    with DiagnosticableTreeMixin
    implements SeriesStateLoading {
  const _$SeriesStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SeriesState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'SeriesState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SeriesStateLoading);
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
abstract class $SeriesStateErrorDetailsCopyWith<$Res> {
  factory $SeriesStateErrorDetailsCopyWith(SeriesStateErrorDetails value,
          $Res Function(SeriesStateErrorDetails) then) =
      _$SeriesStateErrorDetailsCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class _$SeriesStateErrorDetailsCopyWithImpl<$Res>
    extends _$SeriesStateCopyWithImpl<$Res>
    implements $SeriesStateErrorDetailsCopyWith<$Res> {
  _$SeriesStateErrorDetailsCopyWithImpl(SeriesStateErrorDetails _value,
      $Res Function(SeriesStateErrorDetails) _then)
      : super(_value, (v) => _then(v as SeriesStateErrorDetails));

  @override
  SeriesStateErrorDetails get _value => super._value as SeriesStateErrorDetails;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(SeriesStateErrorDetails(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SeriesStateErrorDetails
    with DiagnosticableTreeMixin
    implements SeriesStateErrorDetails {
  const _$SeriesStateErrorDetails([this.message]);

  @override
  final String? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SeriesState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SeriesState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SeriesStateErrorDetails &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  $SeriesStateErrorDetailsCopyWith<SeriesStateErrorDetails> get copyWith =>
      _$SeriesStateErrorDetailsCopyWithImpl<SeriesStateErrorDetails>(
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
  const factory SeriesStateErrorDetails([String? message]) =
      _$SeriesStateErrorDetails;

  String? get message;
  @JsonKey(ignore: true)
  $SeriesStateErrorDetailsCopyWith<SeriesStateErrorDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
