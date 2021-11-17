// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'collections_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CollectionsStateTearOff {
  const _$CollectionsStateTearOff();

  CollectionsStateInitial initial() {
    return const CollectionsStateInitial();
  }

  CollectionsStateLoaded loaded({List<MediaItem>? collections}) {
    return CollectionsStateLoaded(
      collections: collections,
    );
  }

  CollectionsStateLoading loading() {
    return const CollectionsStateLoading();
  }

  CollectionsStateErrorDetails error([String? message]) {
    return CollectionsStateErrorDetails(
      message,
    );
  }
}

/// @nodoc
const $CollectionsState = _$CollectionsStateTearOff();

/// @nodoc
mixin _$CollectionsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? collections) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? collections)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CollectionsStateInitial value) initial,
    required TResult Function(CollectionsStateLoaded value) loaded,
    required TResult Function(CollectionsStateLoading value) loading,
    required TResult Function(CollectionsStateErrorDetails value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CollectionsStateInitial value)? initial,
    TResult Function(CollectionsStateLoaded value)? loaded,
    TResult Function(CollectionsStateLoading value)? loading,
    TResult Function(CollectionsStateErrorDetails value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionsStateCopyWith<$Res> {
  factory $CollectionsStateCopyWith(
          CollectionsState value, $Res Function(CollectionsState) then) =
      _$CollectionsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CollectionsStateCopyWithImpl<$Res>
    implements $CollectionsStateCopyWith<$Res> {
  _$CollectionsStateCopyWithImpl(this._value, this._then);

  final CollectionsState _value;
  // ignore: unused_field
  final $Res Function(CollectionsState) _then;
}

/// @nodoc
abstract class $CollectionsStateInitialCopyWith<$Res> {
  factory $CollectionsStateInitialCopyWith(CollectionsStateInitial value,
          $Res Function(CollectionsStateInitial) then) =
      _$CollectionsStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$CollectionsStateInitialCopyWithImpl<$Res>
    extends _$CollectionsStateCopyWithImpl<$Res>
    implements $CollectionsStateInitialCopyWith<$Res> {
  _$CollectionsStateInitialCopyWithImpl(CollectionsStateInitial _value,
      $Res Function(CollectionsStateInitial) _then)
      : super(_value, (v) => _then(v as CollectionsStateInitial));

  @override
  CollectionsStateInitial get _value => super._value as CollectionsStateInitial;
}

/// @nodoc

class _$CollectionsStateInitial
    with DiagnosticableTreeMixin
    implements CollectionsStateInitial {
  const _$CollectionsStateInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CollectionsState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'CollectionsState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is CollectionsStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? collections) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? collections)? loaded,
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
    required TResult Function(CollectionsStateInitial value) initial,
    required TResult Function(CollectionsStateLoaded value) loaded,
    required TResult Function(CollectionsStateLoading value) loading,
    required TResult Function(CollectionsStateErrorDetails value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CollectionsStateInitial value)? initial,
    TResult Function(CollectionsStateLoaded value)? loaded,
    TResult Function(CollectionsStateLoading value)? loading,
    TResult Function(CollectionsStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class CollectionsStateInitial implements CollectionsState {
  const factory CollectionsStateInitial() = _$CollectionsStateInitial;
}

/// @nodoc
abstract class $CollectionsStateLoadedCopyWith<$Res> {
  factory $CollectionsStateLoadedCopyWith(CollectionsStateLoaded value,
          $Res Function(CollectionsStateLoaded) then) =
      _$CollectionsStateLoadedCopyWithImpl<$Res>;
  $Res call({List<MediaItem>? collections});
}

/// @nodoc
class _$CollectionsStateLoadedCopyWithImpl<$Res>
    extends _$CollectionsStateCopyWithImpl<$Res>
    implements $CollectionsStateLoadedCopyWith<$Res> {
  _$CollectionsStateLoadedCopyWithImpl(CollectionsStateLoaded _value,
      $Res Function(CollectionsStateLoaded) _then)
      : super(_value, (v) => _then(v as CollectionsStateLoaded));

  @override
  CollectionsStateLoaded get _value => super._value as CollectionsStateLoaded;

  @override
  $Res call({
    Object? collections = freezed,
  }) {
    return _then(CollectionsStateLoaded(
      collections: collections == freezed
          ? _value.collections
          : collections // ignore: cast_nullable_to_non_nullable
              as List<MediaItem>?,
    ));
  }
}

/// @nodoc

class _$CollectionsStateLoaded
    with DiagnosticableTreeMixin
    implements CollectionsStateLoaded {
  const _$CollectionsStateLoaded({this.collections});

  @override
  final List<MediaItem>? collections;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CollectionsState.loaded(collections: $collections)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CollectionsState.loaded'))
      ..add(DiagnosticsProperty('collections', collections));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CollectionsStateLoaded &&
            (identical(other.collections, collections) ||
                const DeepCollectionEquality()
                    .equals(other.collections, collections)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(collections);

  @JsonKey(ignore: true)
  @override
  $CollectionsStateLoadedCopyWith<CollectionsStateLoaded> get copyWith =>
      _$CollectionsStateLoadedCopyWithImpl<CollectionsStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? collections) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return loaded(collections);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? collections)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(collections);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CollectionsStateInitial value) initial,
    required TResult Function(CollectionsStateLoaded value) loaded,
    required TResult Function(CollectionsStateLoading value) loading,
    required TResult Function(CollectionsStateErrorDetails value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CollectionsStateInitial value)? initial,
    TResult Function(CollectionsStateLoaded value)? loaded,
    TResult Function(CollectionsStateLoading value)? loading,
    TResult Function(CollectionsStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class CollectionsStateLoaded implements CollectionsState {
  const factory CollectionsStateLoaded({List<MediaItem>? collections}) =
      _$CollectionsStateLoaded;

  List<MediaItem>? get collections => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CollectionsStateLoadedCopyWith<CollectionsStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionsStateLoadingCopyWith<$Res> {
  factory $CollectionsStateLoadingCopyWith(CollectionsStateLoading value,
          $Res Function(CollectionsStateLoading) then) =
      _$CollectionsStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$CollectionsStateLoadingCopyWithImpl<$Res>
    extends _$CollectionsStateCopyWithImpl<$Res>
    implements $CollectionsStateLoadingCopyWith<$Res> {
  _$CollectionsStateLoadingCopyWithImpl(CollectionsStateLoading _value,
      $Res Function(CollectionsStateLoading) _then)
      : super(_value, (v) => _then(v as CollectionsStateLoading));

  @override
  CollectionsStateLoading get _value => super._value as CollectionsStateLoading;
}

/// @nodoc

class _$CollectionsStateLoading
    with DiagnosticableTreeMixin
    implements CollectionsStateLoading {
  const _$CollectionsStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CollectionsState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'CollectionsState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is CollectionsStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? collections) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? collections)? loaded,
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
    required TResult Function(CollectionsStateInitial value) initial,
    required TResult Function(CollectionsStateLoaded value) loaded,
    required TResult Function(CollectionsStateLoading value) loading,
    required TResult Function(CollectionsStateErrorDetails value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CollectionsStateInitial value)? initial,
    TResult Function(CollectionsStateLoaded value)? loaded,
    TResult Function(CollectionsStateLoading value)? loading,
    TResult Function(CollectionsStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CollectionsStateLoading implements CollectionsState {
  const factory CollectionsStateLoading() = _$CollectionsStateLoading;
}

/// @nodoc
abstract class $CollectionsStateErrorDetailsCopyWith<$Res> {
  factory $CollectionsStateErrorDetailsCopyWith(
          CollectionsStateErrorDetails value,
          $Res Function(CollectionsStateErrorDetails) then) =
      _$CollectionsStateErrorDetailsCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class _$CollectionsStateErrorDetailsCopyWithImpl<$Res>
    extends _$CollectionsStateCopyWithImpl<$Res>
    implements $CollectionsStateErrorDetailsCopyWith<$Res> {
  _$CollectionsStateErrorDetailsCopyWithImpl(
      CollectionsStateErrorDetails _value,
      $Res Function(CollectionsStateErrorDetails) _then)
      : super(_value, (v) => _then(v as CollectionsStateErrorDetails));

  @override
  CollectionsStateErrorDetails get _value =>
      super._value as CollectionsStateErrorDetails;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(CollectionsStateErrorDetails(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CollectionsStateErrorDetails
    with DiagnosticableTreeMixin
    implements CollectionsStateErrorDetails {
  const _$CollectionsStateErrorDetails([this.message]);

  @override
  final String? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CollectionsState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CollectionsState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CollectionsStateErrorDetails &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $CollectionsStateErrorDetailsCopyWith<CollectionsStateErrorDetails>
      get copyWith => _$CollectionsStateErrorDetailsCopyWithImpl<
          CollectionsStateErrorDetails>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? collections) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? collections)? loaded,
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
    required TResult Function(CollectionsStateInitial value) initial,
    required TResult Function(CollectionsStateLoaded value) loaded,
    required TResult Function(CollectionsStateLoading value) loading,
    required TResult Function(CollectionsStateErrorDetails value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CollectionsStateInitial value)? initial,
    TResult Function(CollectionsStateLoaded value)? loaded,
    TResult Function(CollectionsStateLoading value)? loading,
    TResult Function(CollectionsStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CollectionsStateErrorDetails implements CollectionsState {
  const factory CollectionsStateErrorDetails([String? message]) =
      _$CollectionsStateErrorDetails;

  String? get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CollectionsStateErrorDetailsCopyWith<CollectionsStateErrorDetails>
      get copyWith => throw _privateConstructorUsedError;
}
