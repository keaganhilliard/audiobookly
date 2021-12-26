// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'library_select_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LibrarySelectStateTearOff {
  const _$LibrarySelectStateTearOff();

  LibrarySelectStateInitial initial() {
    return const LibrarySelectStateInitial();
  }

  LibrarySelectStateLoaded loaded({List<Library>? libraries}) {
    return LibrarySelectStateLoaded(
      libraries: libraries,
    );
  }

  LibrarySelectStateLoading loading() {
    return const LibrarySelectStateLoading();
  }

  LibrarySelectStateErrorDetails error([String? message]) {
    return LibrarySelectStateErrorDetails(
      message,
    );
  }
}

/// @nodoc
const $LibrarySelectState = _$LibrarySelectStateTearOff();

/// @nodoc
mixin _$LibrarySelectState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Library>? libraries) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Library>? libraries)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Library>? libraries)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LibrarySelectStateInitial value) initial,
    required TResult Function(LibrarySelectStateLoaded value) loaded,
    required TResult Function(LibrarySelectStateLoading value) loading,
    required TResult Function(LibrarySelectStateErrorDetails value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LibrarySelectStateInitial value)? initial,
    TResult Function(LibrarySelectStateLoaded value)? loaded,
    TResult Function(LibrarySelectStateLoading value)? loading,
    TResult Function(LibrarySelectStateErrorDetails value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LibrarySelectStateInitial value)? initial,
    TResult Function(LibrarySelectStateLoaded value)? loaded,
    TResult Function(LibrarySelectStateLoading value)? loading,
    TResult Function(LibrarySelectStateErrorDetails value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibrarySelectStateCopyWith<$Res> {
  factory $LibrarySelectStateCopyWith(
          LibrarySelectState value, $Res Function(LibrarySelectState) then) =
      _$LibrarySelectStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LibrarySelectStateCopyWithImpl<$Res>
    implements $LibrarySelectStateCopyWith<$Res> {
  _$LibrarySelectStateCopyWithImpl(this._value, this._then);

  final LibrarySelectState _value;
  // ignore: unused_field
  final $Res Function(LibrarySelectState) _then;
}

/// @nodoc
abstract class $LibrarySelectStateInitialCopyWith<$Res> {
  factory $LibrarySelectStateInitialCopyWith(LibrarySelectStateInitial value,
          $Res Function(LibrarySelectStateInitial) then) =
      _$LibrarySelectStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$LibrarySelectStateInitialCopyWithImpl<$Res>
    extends _$LibrarySelectStateCopyWithImpl<$Res>
    implements $LibrarySelectStateInitialCopyWith<$Res> {
  _$LibrarySelectStateInitialCopyWithImpl(LibrarySelectStateInitial _value,
      $Res Function(LibrarySelectStateInitial) _then)
      : super(_value, (v) => _then(v as LibrarySelectStateInitial));

  @override
  LibrarySelectStateInitial get _value =>
      super._value as LibrarySelectStateInitial;
}

/// @nodoc

class _$LibrarySelectStateInitial
    with DiagnosticableTreeMixin
    implements LibrarySelectStateInitial {
  const _$LibrarySelectStateInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LibrarySelectState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'LibrarySelectState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LibrarySelectStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Library>? libraries) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Library>? libraries)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Library>? libraries)? loaded,
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
    required TResult Function(LibrarySelectStateInitial value) initial,
    required TResult Function(LibrarySelectStateLoaded value) loaded,
    required TResult Function(LibrarySelectStateLoading value) loading,
    required TResult Function(LibrarySelectStateErrorDetails value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LibrarySelectStateInitial value)? initial,
    TResult Function(LibrarySelectStateLoaded value)? loaded,
    TResult Function(LibrarySelectStateLoading value)? loading,
    TResult Function(LibrarySelectStateErrorDetails value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LibrarySelectStateInitial value)? initial,
    TResult Function(LibrarySelectStateLoaded value)? loaded,
    TResult Function(LibrarySelectStateLoading value)? loading,
    TResult Function(LibrarySelectStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class LibrarySelectStateInitial implements LibrarySelectState {
  const factory LibrarySelectStateInitial() = _$LibrarySelectStateInitial;
}

/// @nodoc
abstract class $LibrarySelectStateLoadedCopyWith<$Res> {
  factory $LibrarySelectStateLoadedCopyWith(LibrarySelectStateLoaded value,
          $Res Function(LibrarySelectStateLoaded) then) =
      _$LibrarySelectStateLoadedCopyWithImpl<$Res>;
  $Res call({List<Library>? libraries});
}

/// @nodoc
class _$LibrarySelectStateLoadedCopyWithImpl<$Res>
    extends _$LibrarySelectStateCopyWithImpl<$Res>
    implements $LibrarySelectStateLoadedCopyWith<$Res> {
  _$LibrarySelectStateLoadedCopyWithImpl(LibrarySelectStateLoaded _value,
      $Res Function(LibrarySelectStateLoaded) _then)
      : super(_value, (v) => _then(v as LibrarySelectStateLoaded));

  @override
  LibrarySelectStateLoaded get _value =>
      super._value as LibrarySelectStateLoaded;

  @override
  $Res call({
    Object? libraries = freezed,
  }) {
    return _then(LibrarySelectStateLoaded(
      libraries: libraries == freezed
          ? _value.libraries
          : libraries // ignore: cast_nullable_to_non_nullable
              as List<Library>?,
    ));
  }
}

/// @nodoc

class _$LibrarySelectStateLoaded
    with DiagnosticableTreeMixin
    implements LibrarySelectStateLoaded {
  const _$LibrarySelectStateLoaded({this.libraries});

  @override
  final List<Library>? libraries;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LibrarySelectState.loaded(libraries: $libraries)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LibrarySelectState.loaded'))
      ..add(DiagnosticsProperty('libraries', libraries));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LibrarySelectStateLoaded &&
            const DeepCollectionEquality().equals(other.libraries, libraries));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(libraries));

  @JsonKey(ignore: true)
  @override
  $LibrarySelectStateLoadedCopyWith<LibrarySelectStateLoaded> get copyWith =>
      _$LibrarySelectStateLoadedCopyWithImpl<LibrarySelectStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Library>? libraries) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return loaded(libraries);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Library>? libraries)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return loaded?.call(libraries);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Library>? libraries)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(libraries);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LibrarySelectStateInitial value) initial,
    required TResult Function(LibrarySelectStateLoaded value) loaded,
    required TResult Function(LibrarySelectStateLoading value) loading,
    required TResult Function(LibrarySelectStateErrorDetails value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LibrarySelectStateInitial value)? initial,
    TResult Function(LibrarySelectStateLoaded value)? loaded,
    TResult Function(LibrarySelectStateLoading value)? loading,
    TResult Function(LibrarySelectStateErrorDetails value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LibrarySelectStateInitial value)? initial,
    TResult Function(LibrarySelectStateLoaded value)? loaded,
    TResult Function(LibrarySelectStateLoading value)? loading,
    TResult Function(LibrarySelectStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LibrarySelectStateLoaded implements LibrarySelectState {
  const factory LibrarySelectStateLoaded({List<Library>? libraries}) =
      _$LibrarySelectStateLoaded;

  List<Library>? get libraries;
  @JsonKey(ignore: true)
  $LibrarySelectStateLoadedCopyWith<LibrarySelectStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibrarySelectStateLoadingCopyWith<$Res> {
  factory $LibrarySelectStateLoadingCopyWith(LibrarySelectStateLoading value,
          $Res Function(LibrarySelectStateLoading) then) =
      _$LibrarySelectStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$LibrarySelectStateLoadingCopyWithImpl<$Res>
    extends _$LibrarySelectStateCopyWithImpl<$Res>
    implements $LibrarySelectStateLoadingCopyWith<$Res> {
  _$LibrarySelectStateLoadingCopyWithImpl(LibrarySelectStateLoading _value,
      $Res Function(LibrarySelectStateLoading) _then)
      : super(_value, (v) => _then(v as LibrarySelectStateLoading));

  @override
  LibrarySelectStateLoading get _value =>
      super._value as LibrarySelectStateLoading;
}

/// @nodoc

class _$LibrarySelectStateLoading
    with DiagnosticableTreeMixin
    implements LibrarySelectStateLoading {
  const _$LibrarySelectStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LibrarySelectState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'LibrarySelectState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LibrarySelectStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Library>? libraries) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Library>? libraries)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Library>? libraries)? loaded,
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
    required TResult Function(LibrarySelectStateInitial value) initial,
    required TResult Function(LibrarySelectStateLoaded value) loaded,
    required TResult Function(LibrarySelectStateLoading value) loading,
    required TResult Function(LibrarySelectStateErrorDetails value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LibrarySelectStateInitial value)? initial,
    TResult Function(LibrarySelectStateLoaded value)? loaded,
    TResult Function(LibrarySelectStateLoading value)? loading,
    TResult Function(LibrarySelectStateErrorDetails value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LibrarySelectStateInitial value)? initial,
    TResult Function(LibrarySelectStateLoaded value)? loaded,
    TResult Function(LibrarySelectStateLoading value)? loading,
    TResult Function(LibrarySelectStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LibrarySelectStateLoading implements LibrarySelectState {
  const factory LibrarySelectStateLoading() = _$LibrarySelectStateLoading;
}

/// @nodoc
abstract class $LibrarySelectStateErrorDetailsCopyWith<$Res> {
  factory $LibrarySelectStateErrorDetailsCopyWith(
          LibrarySelectStateErrorDetails value,
          $Res Function(LibrarySelectStateErrorDetails) then) =
      _$LibrarySelectStateErrorDetailsCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class _$LibrarySelectStateErrorDetailsCopyWithImpl<$Res>
    extends _$LibrarySelectStateCopyWithImpl<$Res>
    implements $LibrarySelectStateErrorDetailsCopyWith<$Res> {
  _$LibrarySelectStateErrorDetailsCopyWithImpl(
      LibrarySelectStateErrorDetails _value,
      $Res Function(LibrarySelectStateErrorDetails) _then)
      : super(_value, (v) => _then(v as LibrarySelectStateErrorDetails));

  @override
  LibrarySelectStateErrorDetails get _value =>
      super._value as LibrarySelectStateErrorDetails;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(LibrarySelectStateErrorDetails(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LibrarySelectStateErrorDetails
    with DiagnosticableTreeMixin
    implements LibrarySelectStateErrorDetails {
  const _$LibrarySelectStateErrorDetails([this.message]);

  @override
  final String? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LibrarySelectState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LibrarySelectState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LibrarySelectStateErrorDetails &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  $LibrarySelectStateErrorDetailsCopyWith<LibrarySelectStateErrorDetails>
      get copyWith => _$LibrarySelectStateErrorDetailsCopyWithImpl<
          LibrarySelectStateErrorDetails>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Library>? libraries) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Library>? libraries)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Library>? libraries)? loaded,
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
    required TResult Function(LibrarySelectStateInitial value) initial,
    required TResult Function(LibrarySelectStateLoaded value) loaded,
    required TResult Function(LibrarySelectStateLoading value) loading,
    required TResult Function(LibrarySelectStateErrorDetails value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LibrarySelectStateInitial value)? initial,
    TResult Function(LibrarySelectStateLoaded value)? loaded,
    TResult Function(LibrarySelectStateLoading value)? loading,
    TResult Function(LibrarySelectStateErrorDetails value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LibrarySelectStateInitial value)? initial,
    TResult Function(LibrarySelectStateLoaded value)? loaded,
    TResult Function(LibrarySelectStateLoading value)? loading,
    TResult Function(LibrarySelectStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class LibrarySelectStateErrorDetails implements LibrarySelectState {
  const factory LibrarySelectStateErrorDetails([String? message]) =
      _$LibrarySelectStateErrorDetails;

  String? get message;
  @JsonKey(ignore: true)
  $LibrarySelectStateErrorDetailsCopyWith<LibrarySelectStateErrorDetails>
      get copyWith => throw _privateConstructorUsedError;
}
