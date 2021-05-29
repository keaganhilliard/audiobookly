// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

  AuthStateInitial initial() {
    return const AuthStateInitial();
  }

  AuthStateLoaded loaded({User? user}) {
    return AuthStateLoaded(
      user: user,
    );
  }

  AuthStateLoading loading() {
    return const AuthStateLoading();
  }

  AuthStateErrorDetails error([String? message]) {
    return AuthStateErrorDetails(
      message,
    );
  }
}

/// @nodoc
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(User? user) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
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
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(AuthStateLoaded value) loaded,
    required TResult Function(AuthStateLoading value) loading,
    required TResult Function(AuthStateErrorDetails value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateLoaded value)? loaded,
    TResult Function(AuthStateLoading value)? loading,
    TResult Function(AuthStateErrorDetails value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

/// @nodoc
abstract class $AuthStateInitialCopyWith<$Res> {
  factory $AuthStateInitialCopyWith(
          AuthStateInitial value, $Res Function(AuthStateInitial) then) =
      _$AuthStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateInitialCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateInitialCopyWith<$Res> {
  _$AuthStateInitialCopyWithImpl(
      AuthStateInitial _value, $Res Function(AuthStateInitial) _then)
      : super(_value, (v) => _then(v as AuthStateInitial));

  @override
  AuthStateInitial get _value => super._value as AuthStateInitial;
}

/// @nodoc

class _$AuthStateInitial
    with DiagnosticableTreeMixin
    implements AuthStateInitial {
  const _$AuthStateInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AuthState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AuthStateInitial);
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
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(AuthStateLoaded value) loaded,
    required TResult Function(AuthStateLoading value) loading,
    required TResult Function(AuthStateErrorDetails value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateLoaded value)? loaded,
    TResult Function(AuthStateLoading value)? loading,
    TResult Function(AuthStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AuthStateInitial implements AuthState {
  const factory AuthStateInitial() = _$AuthStateInitial;
}

/// @nodoc
abstract class $AuthStateLoadedCopyWith<$Res> {
  factory $AuthStateLoadedCopyWith(
          AuthStateLoaded value, $Res Function(AuthStateLoaded) then) =
      _$AuthStateLoadedCopyWithImpl<$Res>;
  $Res call({User? user});
}

/// @nodoc
class _$AuthStateLoadedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateLoadedCopyWith<$Res> {
  _$AuthStateLoadedCopyWithImpl(
      AuthStateLoaded _value, $Res Function(AuthStateLoaded) _then)
      : super(_value, (v) => _then(v as AuthStateLoaded));

  @override
  AuthStateLoaded get _value => super._value as AuthStateLoaded;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(AuthStateLoaded(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class _$AuthStateLoaded
    with DiagnosticableTreeMixin
    implements AuthStateLoaded {
  const _$AuthStateLoaded({this.user});

  @override
  final User? user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.loaded(user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState.loaded'))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthStateLoaded &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  $AuthStateLoadedCopyWith<AuthStateLoaded> get copyWith =>
      _$AuthStateLoadedCopyWithImpl<AuthStateLoaded>(this, _$identity);

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
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(AuthStateLoaded value) loaded,
    required TResult Function(AuthStateLoading value) loading,
    required TResult Function(AuthStateErrorDetails value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateLoaded value)? loaded,
    TResult Function(AuthStateLoading value)? loading,
    TResult Function(AuthStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class AuthStateLoaded implements AuthState {
  const factory AuthStateLoaded({User? user}) = _$AuthStateLoaded;

  User? get user => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthStateLoadedCopyWith<AuthStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateLoadingCopyWith<$Res> {
  factory $AuthStateLoadingCopyWith(
          AuthStateLoading value, $Res Function(AuthStateLoading) then) =
      _$AuthStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateLoadingCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateLoadingCopyWith<$Res> {
  _$AuthStateLoadingCopyWithImpl(
      AuthStateLoading _value, $Res Function(AuthStateLoading) _then)
      : super(_value, (v) => _then(v as AuthStateLoading));

  @override
  AuthStateLoading get _value => super._value as AuthStateLoading;
}

/// @nodoc

class _$AuthStateLoading
    with DiagnosticableTreeMixin
    implements AuthStateLoading {
  const _$AuthStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AuthState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AuthStateLoading);
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
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(AuthStateLoaded value) loaded,
    required TResult Function(AuthStateLoading value) loading,
    required TResult Function(AuthStateErrorDetails value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateLoaded value)? loaded,
    TResult Function(AuthStateLoading value)? loading,
    TResult Function(AuthStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuthStateLoading implements AuthState {
  const factory AuthStateLoading() = _$AuthStateLoading;
}

/// @nodoc
abstract class $AuthStateErrorDetailsCopyWith<$Res> {
  factory $AuthStateErrorDetailsCopyWith(AuthStateErrorDetails value,
          $Res Function(AuthStateErrorDetails) then) =
      _$AuthStateErrorDetailsCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class _$AuthStateErrorDetailsCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateErrorDetailsCopyWith<$Res> {
  _$AuthStateErrorDetailsCopyWithImpl(
      AuthStateErrorDetails _value, $Res Function(AuthStateErrorDetails) _then)
      : super(_value, (v) => _then(v as AuthStateErrorDetails));

  @override
  AuthStateErrorDetails get _value => super._value as AuthStateErrorDetails;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(AuthStateErrorDetails(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthStateErrorDetails
    with DiagnosticableTreeMixin
    implements AuthStateErrorDetails {
  const _$AuthStateErrorDetails([this.message]);

  @override
  final String? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthStateErrorDetails &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $AuthStateErrorDetailsCopyWith<AuthStateErrorDetails> get copyWith =>
      _$AuthStateErrorDetailsCopyWithImpl<AuthStateErrorDetails>(
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
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(AuthStateLoaded value) loaded,
    required TResult Function(AuthStateLoading value) loading,
    required TResult Function(AuthStateErrorDetails value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateLoaded value)? loaded,
    TResult Function(AuthStateLoading value)? loading,
    TResult Function(AuthStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AuthStateErrorDetails implements AuthState {
  const factory AuthStateErrorDetails([String? message]) =
      _$AuthStateErrorDetails;

  String? get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthStateErrorDetailsCopyWith<AuthStateErrorDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
