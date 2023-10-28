// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_select_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
    TResult? Function()? initial,
    TResult? Function(List<Library>? libraries)? loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
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
    required TResult Function(LibrarySelectStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LibrarySelectStateInitial value)? initial,
    TResult? Function(LibrarySelectStateLoaded value)? loaded,
    TResult? Function(LibrarySelectStateLoading value)? loading,
    TResult? Function(LibrarySelectStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LibrarySelectStateInitial value)? initial,
    TResult Function(LibrarySelectStateLoaded value)? loaded,
    TResult Function(LibrarySelectStateLoading value)? loading,
    TResult Function(LibrarySelectStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibrarySelectStateCopyWith<$Res> {
  factory $LibrarySelectStateCopyWith(
          LibrarySelectState value, $Res Function(LibrarySelectState) then) =
      _$LibrarySelectStateCopyWithImpl<$Res, LibrarySelectState>;
}

/// @nodoc
class _$LibrarySelectStateCopyWithImpl<$Res, $Val extends LibrarySelectState>
    implements $LibrarySelectStateCopyWith<$Res> {
  _$LibrarySelectStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LibrarySelectStateInitialImplCopyWith<$Res> {
  factory _$$LibrarySelectStateInitialImplCopyWith(
          _$LibrarySelectStateInitialImpl value,
          $Res Function(_$LibrarySelectStateInitialImpl) then) =
      __$$LibrarySelectStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LibrarySelectStateInitialImplCopyWithImpl<$Res>
    extends _$LibrarySelectStateCopyWithImpl<$Res,
        _$LibrarySelectStateInitialImpl>
    implements _$$LibrarySelectStateInitialImplCopyWith<$Res> {
  __$$LibrarySelectStateInitialImplCopyWithImpl(
      _$LibrarySelectStateInitialImpl _value,
      $Res Function(_$LibrarySelectStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LibrarySelectStateInitialImpl
    with DiagnosticableTreeMixin
    implements LibrarySelectStateInitial {
  const _$LibrarySelectStateInitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LibrarySelectState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'LibrarySelectState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LibrarySelectStateInitialImpl);
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
    TResult? Function()? initial,
    TResult? Function(List<Library>? libraries)? loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
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
    required TResult Function(LibrarySelectStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LibrarySelectStateInitial value)? initial,
    TResult? Function(LibrarySelectStateLoaded value)? loaded,
    TResult? Function(LibrarySelectStateLoading value)? loading,
    TResult? Function(LibrarySelectStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LibrarySelectStateInitial value)? initial,
    TResult Function(LibrarySelectStateLoaded value)? loaded,
    TResult Function(LibrarySelectStateLoading value)? loading,
    TResult Function(LibrarySelectStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class LibrarySelectStateInitial implements LibrarySelectState {
  const factory LibrarySelectStateInitial() = _$LibrarySelectStateInitialImpl;
}

/// @nodoc
abstract class _$$LibrarySelectStateLoadedImplCopyWith<$Res> {
  factory _$$LibrarySelectStateLoadedImplCopyWith(
          _$LibrarySelectStateLoadedImpl value,
          $Res Function(_$LibrarySelectStateLoadedImpl) then) =
      __$$LibrarySelectStateLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Library>? libraries});
}

/// @nodoc
class __$$LibrarySelectStateLoadedImplCopyWithImpl<$Res>
    extends _$LibrarySelectStateCopyWithImpl<$Res,
        _$LibrarySelectStateLoadedImpl>
    implements _$$LibrarySelectStateLoadedImplCopyWith<$Res> {
  __$$LibrarySelectStateLoadedImplCopyWithImpl(
      _$LibrarySelectStateLoadedImpl _value,
      $Res Function(_$LibrarySelectStateLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? libraries = freezed,
  }) {
    return _then(_$LibrarySelectStateLoadedImpl(
      libraries: freezed == libraries
          ? _value._libraries
          : libraries // ignore: cast_nullable_to_non_nullable
              as List<Library>?,
    ));
  }
}

/// @nodoc

class _$LibrarySelectStateLoadedImpl
    with DiagnosticableTreeMixin
    implements LibrarySelectStateLoaded {
  const _$LibrarySelectStateLoadedImpl({final List<Library>? libraries})
      : _libraries = libraries;

  final List<Library>? _libraries;
  @override
  List<Library>? get libraries {
    final value = _libraries;
    if (value == null) return null;
    if (_libraries is EqualUnmodifiableListView) return _libraries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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
            other is _$LibrarySelectStateLoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._libraries, _libraries));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_libraries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LibrarySelectStateLoadedImplCopyWith<_$LibrarySelectStateLoadedImpl>
      get copyWith => __$$LibrarySelectStateLoadedImplCopyWithImpl<
          _$LibrarySelectStateLoadedImpl>(this, _$identity);

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
    TResult? Function()? initial,
    TResult? Function(List<Library>? libraries)? loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
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
    required TResult Function(LibrarySelectStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LibrarySelectStateInitial value)? initial,
    TResult? Function(LibrarySelectStateLoaded value)? loaded,
    TResult? Function(LibrarySelectStateLoading value)? loading,
    TResult? Function(LibrarySelectStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LibrarySelectStateInitial value)? initial,
    TResult Function(LibrarySelectStateLoaded value)? loaded,
    TResult Function(LibrarySelectStateLoading value)? loading,
    TResult Function(LibrarySelectStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LibrarySelectStateLoaded implements LibrarySelectState {
  const factory LibrarySelectStateLoaded({final List<Library>? libraries}) =
      _$LibrarySelectStateLoadedImpl;

  List<Library>? get libraries;
  @JsonKey(ignore: true)
  _$$LibrarySelectStateLoadedImplCopyWith<_$LibrarySelectStateLoadedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LibrarySelectStateLoadingImplCopyWith<$Res> {
  factory _$$LibrarySelectStateLoadingImplCopyWith(
          _$LibrarySelectStateLoadingImpl value,
          $Res Function(_$LibrarySelectStateLoadingImpl) then) =
      __$$LibrarySelectStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LibrarySelectStateLoadingImplCopyWithImpl<$Res>
    extends _$LibrarySelectStateCopyWithImpl<$Res,
        _$LibrarySelectStateLoadingImpl>
    implements _$$LibrarySelectStateLoadingImplCopyWith<$Res> {
  __$$LibrarySelectStateLoadingImplCopyWithImpl(
      _$LibrarySelectStateLoadingImpl _value,
      $Res Function(_$LibrarySelectStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LibrarySelectStateLoadingImpl
    with DiagnosticableTreeMixin
    implements LibrarySelectStateLoading {
  const _$LibrarySelectStateLoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LibrarySelectState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'LibrarySelectState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LibrarySelectStateLoadingImpl);
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
    TResult? Function()? initial,
    TResult? Function(List<Library>? libraries)? loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
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
    required TResult Function(LibrarySelectStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LibrarySelectStateInitial value)? initial,
    TResult? Function(LibrarySelectStateLoaded value)? loaded,
    TResult? Function(LibrarySelectStateLoading value)? loading,
    TResult? Function(LibrarySelectStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LibrarySelectStateInitial value)? initial,
    TResult Function(LibrarySelectStateLoaded value)? loaded,
    TResult Function(LibrarySelectStateLoading value)? loading,
    TResult Function(LibrarySelectStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LibrarySelectStateLoading implements LibrarySelectState {
  const factory LibrarySelectStateLoading() = _$LibrarySelectStateLoadingImpl;
}

/// @nodoc
abstract class _$$LibrarySelectStateErrorImplCopyWith<$Res> {
  factory _$$LibrarySelectStateErrorImplCopyWith(
          _$LibrarySelectStateErrorImpl value,
          $Res Function(_$LibrarySelectStateErrorImpl) then) =
      __$$LibrarySelectStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$LibrarySelectStateErrorImplCopyWithImpl<$Res>
    extends _$LibrarySelectStateCopyWithImpl<$Res,
        _$LibrarySelectStateErrorImpl>
    implements _$$LibrarySelectStateErrorImplCopyWith<$Res> {
  __$$LibrarySelectStateErrorImplCopyWithImpl(
      _$LibrarySelectStateErrorImpl _value,
      $Res Function(_$LibrarySelectStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$LibrarySelectStateErrorImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LibrarySelectStateErrorImpl
    with DiagnosticableTreeMixin
    implements LibrarySelectStateError {
  const _$LibrarySelectStateErrorImpl([this.message]);

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
            other is _$LibrarySelectStateErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LibrarySelectStateErrorImplCopyWith<_$LibrarySelectStateErrorImpl>
      get copyWith => __$$LibrarySelectStateErrorImplCopyWithImpl<
          _$LibrarySelectStateErrorImpl>(this, _$identity);

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
    TResult? Function()? initial,
    TResult? Function(List<Library>? libraries)? loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
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
    required TResult Function(LibrarySelectStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LibrarySelectStateInitial value)? initial,
    TResult? Function(LibrarySelectStateLoaded value)? loaded,
    TResult? Function(LibrarySelectStateLoading value)? loading,
    TResult? Function(LibrarySelectStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LibrarySelectStateInitial value)? initial,
    TResult Function(LibrarySelectStateLoaded value)? loaded,
    TResult Function(LibrarySelectStateLoading value)? loading,
    TResult Function(LibrarySelectStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class LibrarySelectStateError implements LibrarySelectState {
  const factory LibrarySelectStateError([final String? message]) =
      _$LibrarySelectStateErrorImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$LibrarySelectStateErrorImplCopyWith<_$LibrarySelectStateErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
