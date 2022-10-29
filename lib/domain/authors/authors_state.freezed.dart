// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'authors_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthorsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? authors) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<MediaItem>? authors)? loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? authors)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthorsStateInitial value) initial,
    required TResult Function(AuthorsStateLoaded value) loaded,
    required TResult Function(AuthorsStateLoading value) loading,
    required TResult Function(AuthorsStateErrorDetails value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthorsStateInitial value)? initial,
    TResult? Function(AuthorsStateLoaded value)? loaded,
    TResult? Function(AuthorsStateLoading value)? loading,
    TResult? Function(AuthorsStateErrorDetails value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthorsStateInitial value)? initial,
    TResult Function(AuthorsStateLoaded value)? loaded,
    TResult Function(AuthorsStateLoading value)? loading,
    TResult Function(AuthorsStateErrorDetails value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorsStateCopyWith<$Res> {
  factory $AuthorsStateCopyWith(
          AuthorsState value, $Res Function(AuthorsState) then) =
      _$AuthorsStateCopyWithImpl<$Res, AuthorsState>;
}

/// @nodoc
class _$AuthorsStateCopyWithImpl<$Res, $Val extends AuthorsState>
    implements $AuthorsStateCopyWith<$Res> {
  _$AuthorsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthorsStateInitialCopyWith<$Res> {
  factory _$$AuthorsStateInitialCopyWith(_$AuthorsStateInitial value,
          $Res Function(_$AuthorsStateInitial) then) =
      __$$AuthorsStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthorsStateInitialCopyWithImpl<$Res>
    extends _$AuthorsStateCopyWithImpl<$Res, _$AuthorsStateInitial>
    implements _$$AuthorsStateInitialCopyWith<$Res> {
  __$$AuthorsStateInitialCopyWithImpl(
      _$AuthorsStateInitial _value, $Res Function(_$AuthorsStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthorsStateInitial
    with DiagnosticableTreeMixin
    implements AuthorsStateInitial {
  const _$AuthorsStateInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthorsState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthorsState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthorsStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? authors) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<MediaItem>? authors)? loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? authors)? loaded,
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
    required TResult Function(AuthorsStateInitial value) initial,
    required TResult Function(AuthorsStateLoaded value) loaded,
    required TResult Function(AuthorsStateLoading value) loading,
    required TResult Function(AuthorsStateErrorDetails value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthorsStateInitial value)? initial,
    TResult? Function(AuthorsStateLoaded value)? loaded,
    TResult? Function(AuthorsStateLoading value)? loading,
    TResult? Function(AuthorsStateErrorDetails value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthorsStateInitial value)? initial,
    TResult Function(AuthorsStateLoaded value)? loaded,
    TResult Function(AuthorsStateLoading value)? loading,
    TResult Function(AuthorsStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AuthorsStateInitial implements AuthorsState {
  const factory AuthorsStateInitial() = _$AuthorsStateInitial;
}

/// @nodoc
abstract class _$$AuthorsStateLoadedCopyWith<$Res> {
  factory _$$AuthorsStateLoadedCopyWith(_$AuthorsStateLoaded value,
          $Res Function(_$AuthorsStateLoaded) then) =
      __$$AuthorsStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MediaItem>? authors});
}

/// @nodoc
class __$$AuthorsStateLoadedCopyWithImpl<$Res>
    extends _$AuthorsStateCopyWithImpl<$Res, _$AuthorsStateLoaded>
    implements _$$AuthorsStateLoadedCopyWith<$Res> {
  __$$AuthorsStateLoadedCopyWithImpl(
      _$AuthorsStateLoaded _value, $Res Function(_$AuthorsStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authors = freezed,
  }) {
    return _then(_$AuthorsStateLoaded(
      authors: freezed == authors
          ? _value._authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<MediaItem>?,
    ));
  }
}

/// @nodoc

class _$AuthorsStateLoaded
    with DiagnosticableTreeMixin
    implements AuthorsStateLoaded {
  const _$AuthorsStateLoaded({final List<MediaItem>? authors})
      : _authors = authors;

  final List<MediaItem>? _authors;
  @override
  List<MediaItem>? get authors {
    final value = _authors;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthorsState.loaded(authors: $authors)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthorsState.loaded'))
      ..add(DiagnosticsProperty('authors', authors));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorsStateLoaded &&
            const DeepCollectionEquality().equals(other._authors, _authors));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_authors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorsStateLoadedCopyWith<_$AuthorsStateLoaded> get copyWith =>
      __$$AuthorsStateLoadedCopyWithImpl<_$AuthorsStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? authors) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return loaded(authors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<MediaItem>? authors)? loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) {
    return loaded?.call(authors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? authors)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(authors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthorsStateInitial value) initial,
    required TResult Function(AuthorsStateLoaded value) loaded,
    required TResult Function(AuthorsStateLoading value) loading,
    required TResult Function(AuthorsStateErrorDetails value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthorsStateInitial value)? initial,
    TResult? Function(AuthorsStateLoaded value)? loaded,
    TResult? Function(AuthorsStateLoading value)? loading,
    TResult? Function(AuthorsStateErrorDetails value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthorsStateInitial value)? initial,
    TResult Function(AuthorsStateLoaded value)? loaded,
    TResult Function(AuthorsStateLoading value)? loading,
    TResult Function(AuthorsStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class AuthorsStateLoaded implements AuthorsState {
  const factory AuthorsStateLoaded({final List<MediaItem>? authors}) =
      _$AuthorsStateLoaded;

  List<MediaItem>? get authors;
  @JsonKey(ignore: true)
  _$$AuthorsStateLoadedCopyWith<_$AuthorsStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthorsStateLoadingCopyWith<$Res> {
  factory _$$AuthorsStateLoadingCopyWith(_$AuthorsStateLoading value,
          $Res Function(_$AuthorsStateLoading) then) =
      __$$AuthorsStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthorsStateLoadingCopyWithImpl<$Res>
    extends _$AuthorsStateCopyWithImpl<$Res, _$AuthorsStateLoading>
    implements _$$AuthorsStateLoadingCopyWith<$Res> {
  __$$AuthorsStateLoadingCopyWithImpl(
      _$AuthorsStateLoading _value, $Res Function(_$AuthorsStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthorsStateLoading
    with DiagnosticableTreeMixin
    implements AuthorsStateLoading {
  const _$AuthorsStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthorsState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthorsState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthorsStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? authors) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<MediaItem>? authors)? loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? authors)? loaded,
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
    required TResult Function(AuthorsStateInitial value) initial,
    required TResult Function(AuthorsStateLoaded value) loaded,
    required TResult Function(AuthorsStateLoading value) loading,
    required TResult Function(AuthorsStateErrorDetails value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthorsStateInitial value)? initial,
    TResult? Function(AuthorsStateLoaded value)? loaded,
    TResult? Function(AuthorsStateLoading value)? loading,
    TResult? Function(AuthorsStateErrorDetails value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthorsStateInitial value)? initial,
    TResult Function(AuthorsStateLoaded value)? loaded,
    TResult Function(AuthorsStateLoading value)? loading,
    TResult Function(AuthorsStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuthorsStateLoading implements AuthorsState {
  const factory AuthorsStateLoading() = _$AuthorsStateLoading;
}

/// @nodoc
abstract class _$$AuthorsStateErrorDetailsCopyWith<$Res> {
  factory _$$AuthorsStateErrorDetailsCopyWith(_$AuthorsStateErrorDetails value,
          $Res Function(_$AuthorsStateErrorDetails) then) =
      __$$AuthorsStateErrorDetailsCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$AuthorsStateErrorDetailsCopyWithImpl<$Res>
    extends _$AuthorsStateCopyWithImpl<$Res, _$AuthorsStateErrorDetails>
    implements _$$AuthorsStateErrorDetailsCopyWith<$Res> {
  __$$AuthorsStateErrorDetailsCopyWithImpl(_$AuthorsStateErrorDetails _value,
      $Res Function(_$AuthorsStateErrorDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$AuthorsStateErrorDetails(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthorsStateErrorDetails
    with DiagnosticableTreeMixin
    implements AuthorsStateErrorDetails {
  const _$AuthorsStateErrorDetails([this.message]);

  @override
  final String? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthorsState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthorsState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorsStateErrorDetails &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorsStateErrorDetailsCopyWith<_$AuthorsStateErrorDetails>
      get copyWith =>
          __$$AuthorsStateErrorDetailsCopyWithImpl<_$AuthorsStateErrorDetails>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? authors) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<MediaItem>? authors)? loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? authors)? loaded,
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
    required TResult Function(AuthorsStateInitial value) initial,
    required TResult Function(AuthorsStateLoaded value) loaded,
    required TResult Function(AuthorsStateLoading value) loading,
    required TResult Function(AuthorsStateErrorDetails value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthorsStateInitial value)? initial,
    TResult? Function(AuthorsStateLoaded value)? loaded,
    TResult? Function(AuthorsStateLoading value)? loading,
    TResult? Function(AuthorsStateErrorDetails value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthorsStateInitial value)? initial,
    TResult Function(AuthorsStateLoaded value)? loaded,
    TResult Function(AuthorsStateLoading value)? loading,
    TResult Function(AuthorsStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AuthorsStateErrorDetails implements AuthorsState {
  const factory AuthorsStateErrorDetails([final String? message]) =
      _$AuthorsStateErrorDetails;

  String? get message;
  @JsonKey(ignore: true)
  _$$AuthorsStateErrorDetailsCopyWith<_$AuthorsStateErrorDetails>
      get copyWith => throw _privateConstructorUsedError;
}
