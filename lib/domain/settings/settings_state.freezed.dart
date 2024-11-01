// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SettingsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(User? user, Library? lib) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(User? user, Library? lib)? loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User? user, Library? lib)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SettingsStateInitial value) initial,
    required TResult Function(SettingsStateLoaded value) loaded,
    required TResult Function(SettingsStateLoading value) loading,
    required TResult Function(SettingsStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsStateInitial value)? initial,
    TResult? Function(SettingsStateLoaded value)? loaded,
    TResult? Function(SettingsStateLoading value)? loading,
    TResult? Function(SettingsStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsStateInitial value)? initial,
    TResult Function(SettingsStateLoaded value)? loaded,
    TResult Function(SettingsStateLoading value)? loading,
    TResult Function(SettingsStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res, SettingsState>;
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res, $Val extends SettingsState>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SettingsStateInitialImplCopyWith<$Res> {
  factory _$$SettingsStateInitialImplCopyWith(_$SettingsStateInitialImpl value,
          $Res Function(_$SettingsStateInitialImpl) then) =
      __$$SettingsStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SettingsStateInitialImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$SettingsStateInitialImpl>
    implements _$$SettingsStateInitialImplCopyWith<$Res> {
  __$$SettingsStateInitialImplCopyWithImpl(_$SettingsStateInitialImpl _value,
      $Res Function(_$SettingsStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SettingsStateInitialImpl
    with DiagnosticableTreeMixin
    implements SettingsStateInitial {
  const _$SettingsStateInitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SettingsState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SettingsState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(User? user, Library? lib) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(User? user, Library? lib)? loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User? user, Library? lib)? loaded,
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
    required TResult Function(SettingsStateInitial value) initial,
    required TResult Function(SettingsStateLoaded value) loaded,
    required TResult Function(SettingsStateLoading value) loading,
    required TResult Function(SettingsStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsStateInitial value)? initial,
    TResult? Function(SettingsStateLoaded value)? loaded,
    TResult? Function(SettingsStateLoading value)? loading,
    TResult? Function(SettingsStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsStateInitial value)? initial,
    TResult Function(SettingsStateLoaded value)? loaded,
    TResult Function(SettingsStateLoading value)? loading,
    TResult Function(SettingsStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SettingsStateInitial implements SettingsState {
  const factory SettingsStateInitial() = _$SettingsStateInitialImpl;
}

/// @nodoc
abstract class _$$SettingsStateLoadedImplCopyWith<$Res> {
  factory _$$SettingsStateLoadedImplCopyWith(_$SettingsStateLoadedImpl value,
          $Res Function(_$SettingsStateLoadedImpl) then) =
      __$$SettingsStateLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User? user, Library? lib});
}

/// @nodoc
class __$$SettingsStateLoadedImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$SettingsStateLoadedImpl>
    implements _$$SettingsStateLoadedImplCopyWith<$Res> {
  __$$SettingsStateLoadedImplCopyWithImpl(_$SettingsStateLoadedImpl _value,
      $Res Function(_$SettingsStateLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? lib = freezed,
  }) {
    return _then(_$SettingsStateLoadedImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      lib: freezed == lib
          ? _value.lib
          : lib // ignore: cast_nullable_to_non_nullable
              as Library?,
    ));
  }
}

/// @nodoc

class _$SettingsStateLoadedImpl
    with DiagnosticableTreeMixin
    implements SettingsStateLoaded {
  const _$SettingsStateLoadedImpl({this.user, this.lib});

  @override
  final User? user;
  @override
  final Library? lib;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SettingsState.loaded(user: $user, lib: $lib)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SettingsState.loaded'))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('lib', lib));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsStateLoadedImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.lib, lib) || other.lib == lib));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, lib);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsStateLoadedImplCopyWith<_$SettingsStateLoadedImpl> get copyWith =>
      __$$SettingsStateLoadedImplCopyWithImpl<_$SettingsStateLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(User? user, Library? lib) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return loaded(user, lib);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(User? user, Library? lib)? loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) {
    return loaded?.call(user, lib);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User? user, Library? lib)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(user, lib);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SettingsStateInitial value) initial,
    required TResult Function(SettingsStateLoaded value) loaded,
    required TResult Function(SettingsStateLoading value) loading,
    required TResult Function(SettingsStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsStateInitial value)? initial,
    TResult? Function(SettingsStateLoaded value)? loaded,
    TResult? Function(SettingsStateLoading value)? loading,
    TResult? Function(SettingsStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsStateInitial value)? initial,
    TResult Function(SettingsStateLoaded value)? loaded,
    TResult Function(SettingsStateLoading value)? loading,
    TResult Function(SettingsStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class SettingsStateLoaded implements SettingsState {
  const factory SettingsStateLoaded({final User? user, final Library? lib}) =
      _$SettingsStateLoadedImpl;

  User? get user;
  Library? get lib;
  @JsonKey(ignore: true)
  _$$SettingsStateLoadedImplCopyWith<_$SettingsStateLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SettingsStateLoadingImplCopyWith<$Res> {
  factory _$$SettingsStateLoadingImplCopyWith(_$SettingsStateLoadingImpl value,
          $Res Function(_$SettingsStateLoadingImpl) then) =
      __$$SettingsStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SettingsStateLoadingImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$SettingsStateLoadingImpl>
    implements _$$SettingsStateLoadingImplCopyWith<$Res> {
  __$$SettingsStateLoadingImplCopyWithImpl(_$SettingsStateLoadingImpl _value,
      $Res Function(_$SettingsStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SettingsStateLoadingImpl
    with DiagnosticableTreeMixin
    implements SettingsStateLoading {
  const _$SettingsStateLoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SettingsState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SettingsState.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(User? user, Library? lib) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(User? user, Library? lib)? loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User? user, Library? lib)? loaded,
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
    required TResult Function(SettingsStateInitial value) initial,
    required TResult Function(SettingsStateLoaded value) loaded,
    required TResult Function(SettingsStateLoading value) loading,
    required TResult Function(SettingsStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsStateInitial value)? initial,
    TResult? Function(SettingsStateLoaded value)? loaded,
    TResult? Function(SettingsStateLoading value)? loading,
    TResult? Function(SettingsStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsStateInitial value)? initial,
    TResult Function(SettingsStateLoaded value)? loaded,
    TResult Function(SettingsStateLoading value)? loading,
    TResult Function(SettingsStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SettingsStateLoading implements SettingsState {
  const factory SettingsStateLoading() = _$SettingsStateLoadingImpl;
}

/// @nodoc
abstract class _$$SettingsStateErrorImplCopyWith<$Res> {
  factory _$$SettingsStateErrorImplCopyWith(_$SettingsStateErrorImpl value,
          $Res Function(_$SettingsStateErrorImpl) then) =
      __$$SettingsStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$SettingsStateErrorImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$SettingsStateErrorImpl>
    implements _$$SettingsStateErrorImplCopyWith<$Res> {
  __$$SettingsStateErrorImplCopyWithImpl(_$SettingsStateErrorImpl _value,
      $Res Function(_$SettingsStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$SettingsStateErrorImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SettingsStateErrorImpl
    with DiagnosticableTreeMixin
    implements SettingsStateError {
  const _$SettingsStateErrorImpl([this.message]);

  @override
  final String? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SettingsState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SettingsState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsStateErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsStateErrorImplCopyWith<_$SettingsStateErrorImpl> get copyWith =>
      __$$SettingsStateErrorImplCopyWithImpl<_$SettingsStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(User? user, Library? lib) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(User? user, Library? lib)? loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User? user, Library? lib)? loaded,
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
    required TResult Function(SettingsStateInitial value) initial,
    required TResult Function(SettingsStateLoaded value) loaded,
    required TResult Function(SettingsStateLoading value) loading,
    required TResult Function(SettingsStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsStateInitial value)? initial,
    TResult? Function(SettingsStateLoaded value)? loaded,
    TResult? Function(SettingsStateLoading value)? loading,
    TResult? Function(SettingsStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsStateInitial value)? initial,
    TResult Function(SettingsStateLoaded value)? loaded,
    TResult Function(SettingsStateLoading value)? loading,
    TResult Function(SettingsStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SettingsStateError implements SettingsState {
  const factory SettingsStateError([final String? message]) =
      _$SettingsStateErrorImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$SettingsStateErrorImplCopyWith<_$SettingsStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
