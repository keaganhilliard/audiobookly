// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'authors_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AuthorsStateTearOff {
  const _$AuthorsStateTearOff();

// ignore: unused_element
  AuthorsStateInitial initial() {
    return const AuthorsStateInitial();
  }

// ignore: unused_element
  AuthorsStateLoaded loaded({List<MediaItem> authors}) {
    return AuthorsStateLoaded(
      authors: authors,
    );
  }

// ignore: unused_element
  AuthorsStateLoading loading() {
    return const AuthorsStateLoading();
  }

// ignore: unused_element
  AuthorsStateErrorDetails error([String message]) {
    return AuthorsStateErrorDetails(
      message,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AuthorsState = _$AuthorsStateTearOff();

/// @nodoc
mixin _$AuthorsState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loaded(List<MediaItem> authors),
    @required TResult loading(),
    @required TResult error(String message),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loaded(List<MediaItem> authors),
    TResult loading(),
    TResult error(String message),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(AuthorsStateInitial value),
    @required TResult loaded(AuthorsStateLoaded value),
    @required TResult loading(AuthorsStateLoading value),
    @required TResult error(AuthorsStateErrorDetails value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(AuthorsStateInitial value),
    TResult loaded(AuthorsStateLoaded value),
    TResult loading(AuthorsStateLoading value),
    TResult error(AuthorsStateErrorDetails value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $AuthorsStateCopyWith<$Res> {
  factory $AuthorsStateCopyWith(
          AuthorsState value, $Res Function(AuthorsState) then) =
      _$AuthorsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthorsStateCopyWithImpl<$Res> implements $AuthorsStateCopyWith<$Res> {
  _$AuthorsStateCopyWithImpl(this._value, this._then);

  final AuthorsState _value;
  // ignore: unused_field
  final $Res Function(AuthorsState) _then;
}

/// @nodoc
abstract class $AuthorsStateInitialCopyWith<$Res> {
  factory $AuthorsStateInitialCopyWith(
          AuthorsStateInitial value, $Res Function(AuthorsStateInitial) then) =
      _$AuthorsStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthorsStateInitialCopyWithImpl<$Res>
    extends _$AuthorsStateCopyWithImpl<$Res>
    implements $AuthorsStateInitialCopyWith<$Res> {
  _$AuthorsStateInitialCopyWithImpl(
      AuthorsStateInitial _value, $Res Function(AuthorsStateInitial) _then)
      : super(_value, (v) => _then(v as AuthorsStateInitial));

  @override
  AuthorsStateInitial get _value => super._value as AuthorsStateInitial;
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
    properties..add(DiagnosticsProperty('type', 'AuthorsState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AuthorsStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loaded(List<MediaItem> authors),
    @required TResult loading(),
    @required TResult error(String message),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loaded(List<MediaItem> authors),
    TResult loading(),
    TResult error(String message),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(AuthorsStateInitial value),
    @required TResult loaded(AuthorsStateLoaded value),
    @required TResult loading(AuthorsStateLoading value),
    @required TResult error(AuthorsStateErrorDetails value),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(AuthorsStateInitial value),
    TResult loaded(AuthorsStateLoaded value),
    TResult loading(AuthorsStateLoading value),
    TResult error(AuthorsStateErrorDetails value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
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
abstract class $AuthorsStateLoadedCopyWith<$Res> {
  factory $AuthorsStateLoadedCopyWith(
          AuthorsStateLoaded value, $Res Function(AuthorsStateLoaded) then) =
      _$AuthorsStateLoadedCopyWithImpl<$Res>;
  $Res call({List<MediaItem> authors});
}

/// @nodoc
class _$AuthorsStateLoadedCopyWithImpl<$Res>
    extends _$AuthorsStateCopyWithImpl<$Res>
    implements $AuthorsStateLoadedCopyWith<$Res> {
  _$AuthorsStateLoadedCopyWithImpl(
      AuthorsStateLoaded _value, $Res Function(AuthorsStateLoaded) _then)
      : super(_value, (v) => _then(v as AuthorsStateLoaded));

  @override
  AuthorsStateLoaded get _value => super._value as AuthorsStateLoaded;

  @override
  $Res call({
    Object authors = freezed,
  }) {
    return _then(AuthorsStateLoaded(
      authors: authors == freezed ? _value.authors : authors as List<MediaItem>,
    ));
  }
}

/// @nodoc
class _$AuthorsStateLoaded
    with DiagnosticableTreeMixin
    implements AuthorsStateLoaded {
  const _$AuthorsStateLoaded({this.authors});

  @override
  final List<MediaItem> authors;

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
        (other is AuthorsStateLoaded &&
            (identical(other.authors, authors) ||
                const DeepCollectionEquality().equals(other.authors, authors)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(authors);

  @JsonKey(ignore: true)
  @override
  $AuthorsStateLoadedCopyWith<AuthorsStateLoaded> get copyWith =>
      _$AuthorsStateLoadedCopyWithImpl<AuthorsStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loaded(List<MediaItem> authors),
    @required TResult loading(),
    @required TResult error(String message),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    return loaded(authors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loaded(List<MediaItem> authors),
    TResult loading(),
    TResult error(String message),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(authors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(AuthorsStateInitial value),
    @required TResult loaded(AuthorsStateLoaded value),
    @required TResult loading(AuthorsStateLoading value),
    @required TResult error(AuthorsStateErrorDetails value),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(AuthorsStateInitial value),
    TResult loaded(AuthorsStateLoaded value),
    TResult loading(AuthorsStateLoading value),
    TResult error(AuthorsStateErrorDetails value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class AuthorsStateLoaded implements AuthorsState {
  const factory AuthorsStateLoaded({List<MediaItem> authors}) =
      _$AuthorsStateLoaded;

  List<MediaItem> get authors;
  @JsonKey(ignore: true)
  $AuthorsStateLoadedCopyWith<AuthorsStateLoaded> get copyWith;
}

/// @nodoc
abstract class $AuthorsStateLoadingCopyWith<$Res> {
  factory $AuthorsStateLoadingCopyWith(
          AuthorsStateLoading value, $Res Function(AuthorsStateLoading) then) =
      _$AuthorsStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthorsStateLoadingCopyWithImpl<$Res>
    extends _$AuthorsStateCopyWithImpl<$Res>
    implements $AuthorsStateLoadingCopyWith<$Res> {
  _$AuthorsStateLoadingCopyWithImpl(
      AuthorsStateLoading _value, $Res Function(AuthorsStateLoading) _then)
      : super(_value, (v) => _then(v as AuthorsStateLoading));

  @override
  AuthorsStateLoading get _value => super._value as AuthorsStateLoading;
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
    properties..add(DiagnosticsProperty('type', 'AuthorsState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AuthorsStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loaded(List<MediaItem> authors),
    @required TResult loading(),
    @required TResult error(String message),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loaded(List<MediaItem> authors),
    TResult loading(),
    TResult error(String message),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(AuthorsStateInitial value),
    @required TResult loaded(AuthorsStateLoaded value),
    @required TResult loading(AuthorsStateLoading value),
    @required TResult error(AuthorsStateErrorDetails value),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(AuthorsStateInitial value),
    TResult loaded(AuthorsStateLoaded value),
    TResult loading(AuthorsStateLoading value),
    TResult error(AuthorsStateErrorDetails value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
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
abstract class $AuthorsStateErrorDetailsCopyWith<$Res> {
  factory $AuthorsStateErrorDetailsCopyWith(AuthorsStateErrorDetails value,
          $Res Function(AuthorsStateErrorDetails) then) =
      _$AuthorsStateErrorDetailsCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$AuthorsStateErrorDetailsCopyWithImpl<$Res>
    extends _$AuthorsStateCopyWithImpl<$Res>
    implements $AuthorsStateErrorDetailsCopyWith<$Res> {
  _$AuthorsStateErrorDetailsCopyWithImpl(AuthorsStateErrorDetails _value,
      $Res Function(AuthorsStateErrorDetails) _then)
      : super(_value, (v) => _then(v as AuthorsStateErrorDetails));

  @override
  AuthorsStateErrorDetails get _value =>
      super._value as AuthorsStateErrorDetails;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(AuthorsStateErrorDetails(
      message == freezed ? _value.message : message as String,
    ));
  }
}

/// @nodoc
class _$AuthorsStateErrorDetails
    with DiagnosticableTreeMixin
    implements AuthorsStateErrorDetails {
  const _$AuthorsStateErrorDetails([this.message]);

  @override
  final String message;

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
        (other is AuthorsStateErrorDetails &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $AuthorsStateErrorDetailsCopyWith<AuthorsStateErrorDetails> get copyWith =>
      _$AuthorsStateErrorDetailsCopyWithImpl<AuthorsStateErrorDetails>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loaded(List<MediaItem> authors),
    @required TResult loading(),
    @required TResult error(String message),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loaded(List<MediaItem> authors),
    TResult loading(),
    TResult error(String message),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(AuthorsStateInitial value),
    @required TResult loaded(AuthorsStateLoaded value),
    @required TResult loading(AuthorsStateLoading value),
    @required TResult error(AuthorsStateErrorDetails value),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(AuthorsStateInitial value),
    TResult loaded(AuthorsStateLoaded value),
    TResult loading(AuthorsStateLoading value),
    TResult error(AuthorsStateErrorDetails value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AuthorsStateErrorDetails implements AuthorsState {
  const factory AuthorsStateErrorDetails([String message]) =
      _$AuthorsStateErrorDetails;

  String get message;
  @JsonKey(ignore: true)
  $AuthorsStateErrorDetailsCopyWith<AuthorsStateErrorDetails> get copyWith;
}
