// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'series_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
    TResult? Function()? initial,
    TResult? Function(List<MediaItem>? series)? loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
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
    TResult? Function(SeriesStateInitial value)? initial,
    TResult? Function(SeriesStateLoaded value)? loaded,
    TResult? Function(SeriesStateLoading value)? loading,
    TResult? Function(SeriesStateErrorDetails value)? error,
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
      _$SeriesStateCopyWithImpl<$Res, SeriesState>;
}

/// @nodoc
class _$SeriesStateCopyWithImpl<$Res, $Val extends SeriesState>
    implements $SeriesStateCopyWith<$Res> {
  _$SeriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SeriesStateInitialImplCopyWith<$Res> {
  factory _$$SeriesStateInitialImplCopyWith(_$SeriesStateInitialImpl value,
          $Res Function(_$SeriesStateInitialImpl) then) =
      __$$SeriesStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SeriesStateInitialImplCopyWithImpl<$Res>
    extends _$SeriesStateCopyWithImpl<$Res, _$SeriesStateInitialImpl>
    implements _$$SeriesStateInitialImplCopyWith<$Res> {
  __$$SeriesStateInitialImplCopyWithImpl(_$SeriesStateInitialImpl _value,
      $Res Function(_$SeriesStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SeriesStateInitialImpl
    with DiagnosticableTreeMixin
    implements SeriesStateInitial {
  const _$SeriesStateInitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SeriesState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SeriesState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SeriesStateInitialImpl);
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
    TResult? Function()? initial,
    TResult? Function(List<MediaItem>? series)? loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
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
    TResult? Function(SeriesStateInitial value)? initial,
    TResult? Function(SeriesStateLoaded value)? loaded,
    TResult? Function(SeriesStateLoading value)? loading,
    TResult? Function(SeriesStateErrorDetails value)? error,
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
  const factory SeriesStateInitial() = _$SeriesStateInitialImpl;
}

/// @nodoc
abstract class _$$SeriesStateLoadedImplCopyWith<$Res> {
  factory _$$SeriesStateLoadedImplCopyWith(_$SeriesStateLoadedImpl value,
          $Res Function(_$SeriesStateLoadedImpl) then) =
      __$$SeriesStateLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MediaItem>? series});
}

/// @nodoc
class __$$SeriesStateLoadedImplCopyWithImpl<$Res>
    extends _$SeriesStateCopyWithImpl<$Res, _$SeriesStateLoadedImpl>
    implements _$$SeriesStateLoadedImplCopyWith<$Res> {
  __$$SeriesStateLoadedImplCopyWithImpl(_$SeriesStateLoadedImpl _value,
      $Res Function(_$SeriesStateLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? series = freezed,
  }) {
    return _then(_$SeriesStateLoadedImpl(
      series: freezed == series
          ? _value._series
          : series // ignore: cast_nullable_to_non_nullable
              as List<MediaItem>?,
    ));
  }
}

/// @nodoc

class _$SeriesStateLoadedImpl
    with DiagnosticableTreeMixin
    implements SeriesStateLoaded {
  const _$SeriesStateLoadedImpl({final List<MediaItem>? series})
      : _series = series;

  final List<MediaItem>? _series;
  @override
  List<MediaItem>? get series {
    final value = _series;
    if (value == null) return null;
    if (_series is EqualUnmodifiableListView) return _series;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeriesStateLoadedImpl &&
            const DeepCollectionEquality().equals(other._series, _series));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_series));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SeriesStateLoadedImplCopyWith<_$SeriesStateLoadedImpl> get copyWith =>
      __$$SeriesStateLoadedImplCopyWithImpl<_$SeriesStateLoadedImpl>(
          this, _$identity);

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
    TResult? Function()? initial,
    TResult? Function(List<MediaItem>? series)? loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
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
    TResult? Function(SeriesStateInitial value)? initial,
    TResult? Function(SeriesStateLoaded value)? loaded,
    TResult? Function(SeriesStateLoading value)? loading,
    TResult? Function(SeriesStateErrorDetails value)? error,
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
      _$SeriesStateLoadedImpl;

  List<MediaItem>? get series;
  @JsonKey(ignore: true)
  _$$SeriesStateLoadedImplCopyWith<_$SeriesStateLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SeriesStateLoadingImplCopyWith<$Res> {
  factory _$$SeriesStateLoadingImplCopyWith(_$SeriesStateLoadingImpl value,
          $Res Function(_$SeriesStateLoadingImpl) then) =
      __$$SeriesStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SeriesStateLoadingImplCopyWithImpl<$Res>
    extends _$SeriesStateCopyWithImpl<$Res, _$SeriesStateLoadingImpl>
    implements _$$SeriesStateLoadingImplCopyWith<$Res> {
  __$$SeriesStateLoadingImplCopyWithImpl(_$SeriesStateLoadingImpl _value,
      $Res Function(_$SeriesStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SeriesStateLoadingImpl
    with DiagnosticableTreeMixin
    implements SeriesStateLoading {
  const _$SeriesStateLoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SeriesState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SeriesState.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SeriesStateLoadingImpl);
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
    TResult? Function()? initial,
    TResult? Function(List<MediaItem>? series)? loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
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
    TResult? Function(SeriesStateInitial value)? initial,
    TResult? Function(SeriesStateLoaded value)? loaded,
    TResult? Function(SeriesStateLoading value)? loading,
    TResult? Function(SeriesStateErrorDetails value)? error,
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
  const factory SeriesStateLoading() = _$SeriesStateLoadingImpl;
}

/// @nodoc
abstract class _$$SeriesStateErrorDetailsImplCopyWith<$Res> {
  factory _$$SeriesStateErrorDetailsImplCopyWith(
          _$SeriesStateErrorDetailsImpl value,
          $Res Function(_$SeriesStateErrorDetailsImpl) then) =
      __$$SeriesStateErrorDetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$SeriesStateErrorDetailsImplCopyWithImpl<$Res>
    extends _$SeriesStateCopyWithImpl<$Res, _$SeriesStateErrorDetailsImpl>
    implements _$$SeriesStateErrorDetailsImplCopyWith<$Res> {
  __$$SeriesStateErrorDetailsImplCopyWithImpl(
      _$SeriesStateErrorDetailsImpl _value,
      $Res Function(_$SeriesStateErrorDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$SeriesStateErrorDetailsImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SeriesStateErrorDetailsImpl
    with DiagnosticableTreeMixin
    implements SeriesStateErrorDetails {
  const _$SeriesStateErrorDetailsImpl([this.message]);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeriesStateErrorDetailsImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SeriesStateErrorDetailsImplCopyWith<_$SeriesStateErrorDetailsImpl>
      get copyWith => __$$SeriesStateErrorDetailsImplCopyWithImpl<
          _$SeriesStateErrorDetailsImpl>(this, _$identity);

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
    TResult? Function()? initial,
    TResult? Function(List<MediaItem>? series)? loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
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
    TResult? Function(SeriesStateInitial value)? initial,
    TResult? Function(SeriesStateLoaded value)? loaded,
    TResult? Function(SeriesStateLoading value)? loading,
    TResult? Function(SeriesStateErrorDetails value)? error,
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
      _$SeriesStateErrorDetailsImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$SeriesStateErrorDetailsImplCopyWith<_$SeriesStateErrorDetailsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
