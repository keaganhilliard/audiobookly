// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'library_select_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$LibrarySelectStateTearOff {
  const _$LibrarySelectStateTearOff();

// ignore: unused_element
  LibrarySelectStateInitial initial() {
    return const LibrarySelectStateInitial();
  }

// ignore: unused_element
  LibrarySelectStateLoaded loaded({List<Library> libraries}) {
    return LibrarySelectStateLoaded(
      libraries: libraries,
    );
  }

// ignore: unused_element
  LibrarySelectStateLoading loading() {
    return const LibrarySelectStateLoading();
  }

// ignore: unused_element
  LibrarySelectStateErrorDetails error([String message]) {
    return LibrarySelectStateErrorDetails(
      message,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $LibrarySelectState = _$LibrarySelectStateTearOff();

/// @nodoc
mixin _$LibrarySelectState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loaded(List<Library> libraries),
    @required TResult loading(),
    @required TResult error(String message),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loaded(List<Library> libraries),
    TResult loading(),
    TResult error(String message),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(LibrarySelectStateInitial value),
    @required TResult loaded(LibrarySelectStateLoaded value),
    @required TResult loading(LibrarySelectStateLoading value),
    @required TResult error(LibrarySelectStateErrorDetails value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(LibrarySelectStateInitial value),
    TResult loaded(LibrarySelectStateLoaded value),
    TResult loading(LibrarySelectStateLoading value),
    TResult error(LibrarySelectStateErrorDetails value),
    @required TResult orElse(),
  });
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
    return identical(this, other) || (other is LibrarySelectStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loaded(List<Library> libraries),
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
    TResult loaded(List<Library> libraries),
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
    @required TResult initial(LibrarySelectStateInitial value),
    @required TResult loaded(LibrarySelectStateLoaded value),
    @required TResult loading(LibrarySelectStateLoading value),
    @required TResult error(LibrarySelectStateErrorDetails value),
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
    TResult initial(LibrarySelectStateInitial value),
    TResult loaded(LibrarySelectStateLoaded value),
    TResult loading(LibrarySelectStateLoading value),
    TResult error(LibrarySelectStateErrorDetails value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
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
  $Res call({List<Library> libraries});
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
    Object libraries = freezed,
  }) {
    return _then(LibrarySelectStateLoaded(
      libraries:
          libraries == freezed ? _value.libraries : libraries as List<Library>,
    ));
  }
}

/// @nodoc
class _$LibrarySelectStateLoaded
    with DiagnosticableTreeMixin
    implements LibrarySelectStateLoaded {
  const _$LibrarySelectStateLoaded({this.libraries});

  @override
  final List<Library> libraries;

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
        (other is LibrarySelectStateLoaded &&
            (identical(other.libraries, libraries) ||
                const DeepCollectionEquality()
                    .equals(other.libraries, libraries)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(libraries);

  @JsonKey(ignore: true)
  @override
  $LibrarySelectStateLoadedCopyWith<LibrarySelectStateLoaded> get copyWith =>
      _$LibrarySelectStateLoadedCopyWithImpl<LibrarySelectStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loaded(List<Library> libraries),
    @required TResult loading(),
    @required TResult error(String message),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    return loaded(libraries);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loaded(List<Library> libraries),
    TResult loading(),
    TResult error(String message),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(libraries);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(LibrarySelectStateInitial value),
    @required TResult loaded(LibrarySelectStateLoaded value),
    @required TResult loading(LibrarySelectStateLoading value),
    @required TResult error(LibrarySelectStateErrorDetails value),
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
    TResult initial(LibrarySelectStateInitial value),
    TResult loaded(LibrarySelectStateLoaded value),
    TResult loading(LibrarySelectStateLoading value),
    TResult error(LibrarySelectStateErrorDetails value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LibrarySelectStateLoaded implements LibrarySelectState {
  const factory LibrarySelectStateLoaded({List<Library> libraries}) =
      _$LibrarySelectStateLoaded;

  List<Library> get libraries;
  @JsonKey(ignore: true)
  $LibrarySelectStateLoadedCopyWith<LibrarySelectStateLoaded> get copyWith;
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
    return identical(this, other) || (other is LibrarySelectStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loaded(List<Library> libraries),
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
    TResult loaded(List<Library> libraries),
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
    @required TResult initial(LibrarySelectStateInitial value),
    @required TResult loaded(LibrarySelectStateLoaded value),
    @required TResult loading(LibrarySelectStateLoading value),
    @required TResult error(LibrarySelectStateErrorDetails value),
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
    TResult initial(LibrarySelectStateInitial value),
    TResult loaded(LibrarySelectStateLoaded value),
    TResult loading(LibrarySelectStateLoading value),
    TResult error(LibrarySelectStateErrorDetails value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
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
  $Res call({String message});
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
    Object message = freezed,
  }) {
    return _then(LibrarySelectStateErrorDetails(
      message == freezed ? _value.message : message as String,
    ));
  }
}

/// @nodoc
class _$LibrarySelectStateErrorDetails
    with DiagnosticableTreeMixin
    implements LibrarySelectStateErrorDetails {
  const _$LibrarySelectStateErrorDetails([this.message]);

  @override
  final String message;

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
        (other is LibrarySelectStateErrorDetails &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $LibrarySelectStateErrorDetailsCopyWith<LibrarySelectStateErrorDetails>
      get copyWith => _$LibrarySelectStateErrorDetailsCopyWithImpl<
          LibrarySelectStateErrorDetails>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loaded(List<Library> libraries),
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
    TResult loaded(List<Library> libraries),
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
    @required TResult initial(LibrarySelectStateInitial value),
    @required TResult loaded(LibrarySelectStateLoaded value),
    @required TResult loading(LibrarySelectStateLoading value),
    @required TResult error(LibrarySelectStateErrorDetails value),
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
    TResult initial(LibrarySelectStateInitial value),
    TResult loaded(LibrarySelectStateLoaded value),
    TResult loading(LibrarySelectStateLoading value),
    TResult error(LibrarySelectStateErrorDetails value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class LibrarySelectStateErrorDetails implements LibrarySelectState {
  const factory LibrarySelectStateErrorDetails([String message]) =
      _$LibrarySelectStateErrorDetails;

  String get message;
  @JsonKey(ignore: true)
  $LibrarySelectStateErrorDetailsCopyWith<LibrarySelectStateErrorDetails>
      get copyWith;
}
