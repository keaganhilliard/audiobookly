// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$SettingsStateInitialCopyWith<$Res> {
  factory _$$SettingsStateInitialCopyWith(_$SettingsStateInitial value,
          $Res Function(_$SettingsStateInitial) then) =
      __$$SettingsStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SettingsStateInitialCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res>
    implements _$$SettingsStateInitialCopyWith<$Res> {
  __$$SettingsStateInitialCopyWithImpl(_$SettingsStateInitial _value,
      $Res Function(_$SettingsStateInitial) _then)
      : super(_value, (v) => _then(v as _$SettingsStateInitial));

  @override
  _$SettingsStateInitial get _value => super._value as _$SettingsStateInitial;
}

/// @nodoc

class _$SettingsStateInitial implements SettingsStateInitial {
  const _$SettingsStateInitial();

  @override
  String toString() {
    return 'SettingsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SettingsStateInitial);
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
abstract class _$$SettingsStateLoadedCopyWith<$Res> {
  factory _$$SettingsStateLoadedCopyWith(_$SettingsStateLoaded value,
          $Res Function(_$SettingsStateLoaded) then) =
      __$$SettingsStateLoadedCopyWithImpl<$Res>;
  $Res call({User? user});
}

/// @nodoc
class __$$SettingsStateLoadedCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res>
    implements _$$SettingsStateLoadedCopyWith<$Res> {
  __$$SettingsStateLoadedCopyWithImpl(
      _$SettingsStateLoaded _value, $Res Function(_$SettingsStateLoaded) _then)
      : super(_value, (v) => _then(v as _$SettingsStateLoaded));

  @override
  _$SettingsStateLoaded get _value => super._value as _$SettingsStateLoaded;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$SettingsStateLoaded(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class _$SettingsStateLoaded implements SettingsStateLoaded {
  const _$SettingsStateLoaded({this.user});

  @override
  final User? user;

  @override
  String toString() {
    return 'SettingsState.loaded(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsStateLoaded &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$SettingsStateLoadedCopyWith<_$SettingsStateLoaded> get copyWith =>
      __$$SettingsStateLoadedCopyWithImpl<_$SettingsStateLoaded>(
          this, _$identity);

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
  const factory SettingsStateLoaded({final User? user}) = _$SettingsStateLoaded;

  User? get user;
  @JsonKey(ignore: true)
  _$$SettingsStateLoadedCopyWith<_$SettingsStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SettingsStateLoadingCopyWith<$Res> {
  factory _$$SettingsStateLoadingCopyWith(_$SettingsStateLoading value,
          $Res Function(_$SettingsStateLoading) then) =
      __$$SettingsStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SettingsStateLoadingCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res>
    implements _$$SettingsStateLoadingCopyWith<$Res> {
  __$$SettingsStateLoadingCopyWithImpl(_$SettingsStateLoading _value,
      $Res Function(_$SettingsStateLoading) _then)
      : super(_value, (v) => _then(v as _$SettingsStateLoading));

  @override
  _$SettingsStateLoading get _value => super._value as _$SettingsStateLoading;
}

/// @nodoc

class _$SettingsStateLoading implements SettingsStateLoading {
  const _$SettingsStateLoading();

  @override
  String toString() {
    return 'SettingsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SettingsStateLoading);
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
abstract class _$$SettingsStateErrorDetailsCopyWith<$Res> {
  factory _$$SettingsStateErrorDetailsCopyWith(
          _$SettingsStateErrorDetails value,
          $Res Function(_$SettingsStateErrorDetails) then) =
      __$$SettingsStateErrorDetailsCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class __$$SettingsStateErrorDetailsCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res>
    implements _$$SettingsStateErrorDetailsCopyWith<$Res> {
  __$$SettingsStateErrorDetailsCopyWithImpl(_$SettingsStateErrorDetails _value,
      $Res Function(_$SettingsStateErrorDetails) _then)
      : super(_value, (v) => _then(v as _$SettingsStateErrorDetails));

  @override
  _$SettingsStateErrorDetails get _value =>
      super._value as _$SettingsStateErrorDetails;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$SettingsStateErrorDetails(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SettingsStateErrorDetails implements SettingsStateErrorDetails {
  const _$SettingsStateErrorDetails([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'SettingsState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsStateErrorDetails &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$SettingsStateErrorDetailsCopyWith<_$SettingsStateErrorDetails>
      get copyWith => __$$SettingsStateErrorDetailsCopyWithImpl<
          _$SettingsStateErrorDetails>(this, _$identity);

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
  const factory SettingsStateErrorDetails([final String? message]) =
      _$SettingsStateErrorDetails;

  String? get message;
  @JsonKey(ignore: true)
  _$$SettingsStateErrorDetailsCopyWith<_$SettingsStateErrorDetails>
      get copyWith => throw _privateConstructorUsedError;
}
