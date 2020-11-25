// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SettingsStateTearOff {
  const _$SettingsStateTearOff();

// ignore: unused_element
  SettingsStateInitial initial() {
    return const SettingsStateInitial();
  }

// ignore: unused_element
  SettingsStateLoaded loaded({User user}) {
    return SettingsStateLoaded(
      user: user,
    );
  }

// ignore: unused_element
  SettingsStateLoading loading() {
    return const SettingsStateLoading();
  }

// ignore: unused_element
  SettingsStateErrorDetails error([String message]) {
    return SettingsStateErrorDetails(
      message,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SettingsState = _$SettingsStateTearOff();

/// @nodoc
mixin _$SettingsState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loaded(User user),
    @required Result loading(),
    @required Result error(String message),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loaded(User user),
    Result loading(),
    Result error(String message),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(SettingsStateInitial value),
    @required Result loaded(SettingsStateLoaded value),
    @required Result loading(SettingsStateLoading value),
    @required Result error(SettingsStateErrorDetails value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(SettingsStateInitial value),
    Result loaded(SettingsStateLoaded value),
    Result loading(SettingsStateLoading value),
    Result error(SettingsStateErrorDetails value),
    @required Result orElse(),
  });
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
    return identical(this, other) || (other is SettingsStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loaded(User user),
    @required Result loading(),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loaded(User user),
    Result loading(),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(SettingsStateInitial value),
    @required Result loaded(SettingsStateLoaded value),
    @required Result loading(SettingsStateLoading value),
    @required Result error(SettingsStateErrorDetails value),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(SettingsStateInitial value),
    Result loaded(SettingsStateLoaded value),
    Result loading(SettingsStateLoading value),
    Result error(SettingsStateErrorDetails value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
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
  $Res call({User user});
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
    Object user = freezed,
  }) {
    return _then(SettingsStateLoaded(
      user: user == freezed ? _value.user : user as User,
    ));
  }
}

/// @nodoc
class _$SettingsStateLoaded
    with DiagnosticableTreeMixin
    implements SettingsStateLoaded {
  const _$SettingsStateLoaded({this.user});

  @override
  final User user;

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
        (other is SettingsStateLoaded &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(user);

  @override
  $SettingsStateLoadedCopyWith<SettingsStateLoaded> get copyWith =>
      _$SettingsStateLoadedCopyWithImpl<SettingsStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loaded(User user),
    @required Result loading(),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    return loaded(user);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loaded(User user),
    Result loading(),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(SettingsStateInitial value),
    @required Result loaded(SettingsStateLoaded value),
    @required Result loading(SettingsStateLoading value),
    @required Result error(SettingsStateErrorDetails value),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(SettingsStateInitial value),
    Result loaded(SettingsStateLoaded value),
    Result loading(SettingsStateLoading value),
    Result error(SettingsStateErrorDetails value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class SettingsStateLoaded implements SettingsState {
  const factory SettingsStateLoaded({User user}) = _$SettingsStateLoaded;

  User get user;
  $SettingsStateLoadedCopyWith<SettingsStateLoaded> get copyWith;
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
    return identical(this, other) || (other is SettingsStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loaded(User user),
    @required Result loading(),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loaded(User user),
    Result loading(),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(SettingsStateInitial value),
    @required Result loaded(SettingsStateLoaded value),
    @required Result loading(SettingsStateLoading value),
    @required Result error(SettingsStateErrorDetails value),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(SettingsStateInitial value),
    Result loaded(SettingsStateLoaded value),
    Result loading(SettingsStateLoading value),
    Result error(SettingsStateErrorDetails value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
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
  $Res call({String message});
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
    Object message = freezed,
  }) {
    return _then(SettingsStateErrorDetails(
      message == freezed ? _value.message : message as String,
    ));
  }
}

/// @nodoc
class _$SettingsStateErrorDetails
    with DiagnosticableTreeMixin
    implements SettingsStateErrorDetails {
  const _$SettingsStateErrorDetails([this.message]);

  @override
  final String message;

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
        (other is SettingsStateErrorDetails &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  $SettingsStateErrorDetailsCopyWith<SettingsStateErrorDetails> get copyWith =>
      _$SettingsStateErrorDetailsCopyWithImpl<SettingsStateErrorDetails>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loaded(User user),
    @required Result loading(),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    return error(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loaded(User user),
    Result loading(),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(SettingsStateInitial value),
    @required Result loaded(SettingsStateLoaded value),
    @required Result loading(SettingsStateLoading value),
    @required Result error(SettingsStateErrorDetails value),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(SettingsStateInitial value),
    Result loaded(SettingsStateLoaded value),
    Result loading(SettingsStateLoading value),
    Result error(SettingsStateErrorDetails value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SettingsStateErrorDetails implements SettingsState {
  const factory SettingsStateErrorDetails([String message]) =
      _$SettingsStateErrorDetails;

  String get message;
  $SettingsStateErrorDetailsCopyWith<SettingsStateErrorDetails> get copyWith;
}
