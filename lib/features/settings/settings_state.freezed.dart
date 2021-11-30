// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SettingsStateTearOff {
  const _$SettingsStateTearOff();

  SettingsStateInitial initial() {
    return const SettingsStateInitial();
  }

  SettingsStateLoaded loaded({User? user}) {
    return SettingsStateLoaded(
      user: user,
    );
  }

  SettingsStateLoading loading() {
    return const SettingsStateLoading();
  }

  SettingsStateErrorDetails error([String? message]) {
    return SettingsStateErrorDetails(
      message,
    );
  }
}

/// @nodoc
const $SettingsState = _$SettingsStateTearOff();

/// @nodoc
mixin _$SettingsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(User? user) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User? user)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User? user)? loaded,
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
    required TResult Function(SettingsStateErrorDetails value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SettingsStateInitial value)? initial,
    TResult Function(SettingsStateLoaded value)? loaded,
    TResult Function(SettingsStateLoading value)? loading,
    TResult Function(SettingsStateErrorDetails value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsStateInitial value)? initial,
    TResult Function(SettingsStateLoaded value)? loaded,
    TResult Function(SettingsStateLoading value)? loading,
    TResult Function(SettingsStateErrorDetails value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  final SettingsState _value;
  // ignore: unused_field
  final $Res Function(SettingsState) _then;
}

/// @nodoc
abstract class $SettingsStateInitialCopyWith<$Res> {
  factory $SettingsStateInitialCopyWith(SettingsStateInitial value,
          $Res Function(SettingsStateInitial) then) =
      _$SettingsStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$SettingsStateInitialCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res>
    implements $SettingsStateInitialCopyWith<$Res> {
  _$SettingsStateInitialCopyWithImpl(
      SettingsStateInitial _value, $Res Function(SettingsStateInitial) _then)
      : super(_value, (v) => _then(v as SettingsStateInitial));

  @override
  SettingsStateInitial get _value => super._value as SettingsStateInitial;
}

/// @nodoc

class _$SettingsStateInitial
    with DiagnosticableTreeMixin
    implements SettingsStateInitial {
  const _$SettingsStateInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SettingsState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'SettingsState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SettingsStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(User? user) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User? user)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User? user)? loaded,
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
    required TResult Function(SettingsStateErrorDetails value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SettingsStateInitial value)? initial,
    TResult Function(SettingsStateLoaded value)? loaded,
    TResult Function(SettingsStateLoading value)? loading,
    TResult Function(SettingsStateErrorDetails value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsStateInitial value)? initial,
    TResult Function(SettingsStateLoaded value)? loaded,
    TResult Function(SettingsStateLoading value)? loading,
    TResult Function(SettingsStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SettingsStateInitial implements SettingsState {
  const factory SettingsStateInitial() = _$SettingsStateInitial;
}

/// @nodoc
abstract class $SettingsStateLoadedCopyWith<$Res> {
  factory $SettingsStateLoadedCopyWith(
          SettingsStateLoaded value, $Res Function(SettingsStateLoaded) then) =
      _$SettingsStateLoadedCopyWithImpl<$Res>;
  $Res call({User? user});
}

/// @nodoc
class _$SettingsStateLoadedCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res>
    implements $SettingsStateLoadedCopyWith<$Res> {
  _$SettingsStateLoadedCopyWithImpl(
      SettingsStateLoaded _value, $Res Function(SettingsStateLoaded) _then)
      : super(_value, (v) => _then(v as SettingsStateLoaded));

  @override
  SettingsStateLoaded get _value => super._value as SettingsStateLoaded;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(SettingsStateLoaded(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class _$SettingsStateLoaded
    with DiagnosticableTreeMixin
    implements SettingsStateLoaded {
  const _$SettingsStateLoaded({this.user});

  @override
  final User? user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SettingsState.loaded(user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SettingsState.loaded'))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SettingsStateLoaded &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  $SettingsStateLoadedCopyWith<SettingsStateLoaded> get copyWith =>
      _$SettingsStateLoadedCopyWithImpl<SettingsStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(User? user) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return loaded(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User? user)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return loaded?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User? user)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SettingsStateInitial value) initial,
    required TResult Function(SettingsStateLoaded value) loaded,
    required TResult Function(SettingsStateLoading value) loading,
    required TResult Function(SettingsStateErrorDetails value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SettingsStateInitial value)? initial,
    TResult Function(SettingsStateLoaded value)? loaded,
    TResult Function(SettingsStateLoading value)? loading,
    TResult Function(SettingsStateErrorDetails value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsStateInitial value)? initial,
    TResult Function(SettingsStateLoaded value)? loaded,
    TResult Function(SettingsStateLoading value)? loading,
    TResult Function(SettingsStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class SettingsStateLoaded implements SettingsState {
  const factory SettingsStateLoaded({User? user}) = _$SettingsStateLoaded;

  User? get user;
  @JsonKey(ignore: true)
  $SettingsStateLoadedCopyWith<SettingsStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateLoadingCopyWith<$Res> {
  factory $SettingsStateLoadingCopyWith(SettingsStateLoading value,
          $Res Function(SettingsStateLoading) then) =
      _$SettingsStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$SettingsStateLoadingCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res>
    implements $SettingsStateLoadingCopyWith<$Res> {
  _$SettingsStateLoadingCopyWithImpl(
      SettingsStateLoading _value, $Res Function(SettingsStateLoading) _then)
      : super(_value, (v) => _then(v as SettingsStateLoading));

  @override
  SettingsStateLoading get _value => super._value as SettingsStateLoading;
}

/// @nodoc

class _$SettingsStateLoading
    with DiagnosticableTreeMixin
    implements SettingsStateLoading {
  const _$SettingsStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SettingsState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'SettingsState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SettingsStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(User? user) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User? user)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User? user)? loaded,
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
    required TResult Function(SettingsStateErrorDetails value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SettingsStateInitial value)? initial,
    TResult Function(SettingsStateLoaded value)? loaded,
    TResult Function(SettingsStateLoading value)? loading,
    TResult Function(SettingsStateErrorDetails value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsStateInitial value)? initial,
    TResult Function(SettingsStateLoaded value)? loaded,
    TResult Function(SettingsStateLoading value)? loading,
    TResult Function(SettingsStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SettingsStateLoading implements SettingsState {
  const factory SettingsStateLoading() = _$SettingsStateLoading;
}

/// @nodoc
abstract class $SettingsStateErrorDetailsCopyWith<$Res> {
  factory $SettingsStateErrorDetailsCopyWith(SettingsStateErrorDetails value,
          $Res Function(SettingsStateErrorDetails) then) =
      _$SettingsStateErrorDetailsCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class _$SettingsStateErrorDetailsCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res>
    implements $SettingsStateErrorDetailsCopyWith<$Res> {
  _$SettingsStateErrorDetailsCopyWithImpl(SettingsStateErrorDetails _value,
      $Res Function(SettingsStateErrorDetails) _then)
      : super(_value, (v) => _then(v as SettingsStateErrorDetails));

  @override
  SettingsStateErrorDetails get _value =>
      super._value as SettingsStateErrorDetails;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(SettingsStateErrorDetails(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SettingsStateErrorDetails
    with DiagnosticableTreeMixin
    implements SettingsStateErrorDetails {
  const _$SettingsStateErrorDetails([this.message]);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SettingsStateErrorDetails &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  $SettingsStateErrorDetailsCopyWith<SettingsStateErrorDetails> get copyWith =>
      _$SettingsStateErrorDetailsCopyWithImpl<SettingsStateErrorDetails>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(User? user) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User? user)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User? user)? loaded,
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
    required TResult Function(SettingsStateErrorDetails value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SettingsStateInitial value)? initial,
    TResult Function(SettingsStateLoaded value)? loaded,
    TResult Function(SettingsStateLoading value)? loading,
    TResult Function(SettingsStateErrorDetails value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsStateInitial value)? initial,
    TResult Function(SettingsStateLoaded value)? loaded,
    TResult Function(SettingsStateLoading value)? loading,
    TResult Function(SettingsStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SettingsStateErrorDetails implements SettingsState {
  const factory SettingsStateErrorDetails([String? message]) =
      _$SettingsStateErrorDetails;

  String? get message;
  @JsonKey(ignore: true)
  $SettingsStateErrorDetailsCopyWith<SettingsStateErrorDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
