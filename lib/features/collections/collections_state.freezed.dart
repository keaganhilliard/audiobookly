// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'collections_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? collections)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CollectionsStateInitial value)? initial,
    TResult Function(CollectionsStateLoaded value)? loaded,
    TResult Function(CollectionsStateLoading value)? loading,
    TResult Function(CollectionsStateErrorDetails value)? error,
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
abstract class _$$CollectionsStateInitialCopyWith<$Res> {
  factory _$$CollectionsStateInitialCopyWith(_$CollectionsStateInitial value,
          $Res Function(_$CollectionsStateInitial) then) =
      __$$CollectionsStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CollectionsStateInitialCopyWithImpl<$Res>
    extends _$CollectionsStateCopyWithImpl<$Res>
    implements _$$CollectionsStateInitialCopyWith<$Res> {
  __$$CollectionsStateInitialCopyWithImpl(_$CollectionsStateInitial _value,
      $Res Function(_$CollectionsStateInitial) _then)
      : super(_value, (v) => _then(v as _$CollectionsStateInitial));

  @override
  _$CollectionsStateInitial get _value =>
      super._value as _$CollectionsStateInitial;
}

/// @nodoc

class _$CollectionsStateInitial implements CollectionsStateInitial {
  const _$CollectionsStateInitial();

  @override
  String toString() {
    return 'CollectionsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionsStateInitial);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? collections)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return initial?.call();
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CollectionsStateInitial value)? initial,
    TResult Function(CollectionsStateLoaded value)? loaded,
    TResult Function(CollectionsStateLoading value)? loading,
    TResult Function(CollectionsStateErrorDetails value)? error,
  }) {
    return initial?.call(this);
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
abstract class _$$CollectionsStateLoadedCopyWith<$Res> {
  factory _$$CollectionsStateLoadedCopyWith(_$CollectionsStateLoaded value,
          $Res Function(_$CollectionsStateLoaded) then) =
      __$$CollectionsStateLoadedCopyWithImpl<$Res>;
  $Res call({List<MediaItem>? collections});
}

/// @nodoc
class __$$CollectionsStateLoadedCopyWithImpl<$Res>
    extends _$CollectionsStateCopyWithImpl<$Res>
    implements _$$CollectionsStateLoadedCopyWith<$Res> {
  __$$CollectionsStateLoadedCopyWithImpl(_$CollectionsStateLoaded _value,
      $Res Function(_$CollectionsStateLoaded) _then)
      : super(_value, (v) => _then(v as _$CollectionsStateLoaded));

  @override
  _$CollectionsStateLoaded get _value =>
      super._value as _$CollectionsStateLoaded;

  @override
  $Res call({
    Object? collections = freezed,
  }) {
    return _then(_$CollectionsStateLoaded(
      collections: collections == freezed
          ? _value._collections
          : collections // ignore: cast_nullable_to_non_nullable
              as List<MediaItem>?,
    ));
  }
}

/// @nodoc

class _$CollectionsStateLoaded implements CollectionsStateLoaded {
  const _$CollectionsStateLoaded({final List<MediaItem>? collections})
      : _collections = collections;

  final List<MediaItem>? _collections;
  @override
  List<MediaItem>? get collections {
    final value = _collections;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CollectionsState.loaded(collections: $collections)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionsStateLoaded &&
            const DeepCollectionEquality()
                .equals(other._collections, _collections));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_collections));

  @JsonKey(ignore: true)
  @override
  _$$CollectionsStateLoadedCopyWith<_$CollectionsStateLoaded> get copyWith =>
      __$$CollectionsStateLoadedCopyWithImpl<_$CollectionsStateLoaded>(
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? collections)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return loaded?.call(collections);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CollectionsStateInitial value)? initial,
    TResult Function(CollectionsStateLoaded value)? loaded,
    TResult Function(CollectionsStateLoading value)? loading,
    TResult Function(CollectionsStateErrorDetails value)? error,
  }) {
    return loaded?.call(this);
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
  const factory CollectionsStateLoaded({final List<MediaItem>? collections}) =
      _$CollectionsStateLoaded;

  List<MediaItem>? get collections;
  @JsonKey(ignore: true)
  _$$CollectionsStateLoadedCopyWith<_$CollectionsStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CollectionsStateLoadingCopyWith<$Res> {
  factory _$$CollectionsStateLoadingCopyWith(_$CollectionsStateLoading value,
          $Res Function(_$CollectionsStateLoading) then) =
      __$$CollectionsStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CollectionsStateLoadingCopyWithImpl<$Res>
    extends _$CollectionsStateCopyWithImpl<$Res>
    implements _$$CollectionsStateLoadingCopyWith<$Res> {
  __$$CollectionsStateLoadingCopyWithImpl(_$CollectionsStateLoading _value,
      $Res Function(_$CollectionsStateLoading) _then)
      : super(_value, (v) => _then(v as _$CollectionsStateLoading));

  @override
  _$CollectionsStateLoading get _value =>
      super._value as _$CollectionsStateLoading;
}

/// @nodoc

class _$CollectionsStateLoading implements CollectionsStateLoading {
  const _$CollectionsStateLoading();

  @override
  String toString() {
    return 'CollectionsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionsStateLoading);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? collections)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return loading?.call();
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CollectionsStateInitial value)? initial,
    TResult Function(CollectionsStateLoaded value)? loaded,
    TResult Function(CollectionsStateLoading value)? loading,
    TResult Function(CollectionsStateErrorDetails value)? error,
  }) {
    return loading?.call(this);
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
abstract class _$$CollectionsStateErrorDetailsCopyWith<$Res> {
  factory _$$CollectionsStateErrorDetailsCopyWith(
          _$CollectionsStateErrorDetails value,
          $Res Function(_$CollectionsStateErrorDetails) then) =
      __$$CollectionsStateErrorDetailsCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class __$$CollectionsStateErrorDetailsCopyWithImpl<$Res>
    extends _$CollectionsStateCopyWithImpl<$Res>
    implements _$$CollectionsStateErrorDetailsCopyWith<$Res> {
  __$$CollectionsStateErrorDetailsCopyWithImpl(
      _$CollectionsStateErrorDetails _value,
      $Res Function(_$CollectionsStateErrorDetails) _then)
      : super(_value, (v) => _then(v as _$CollectionsStateErrorDetails));

  @override
  _$CollectionsStateErrorDetails get _value =>
      super._value as _$CollectionsStateErrorDetails;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$CollectionsStateErrorDetails(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CollectionsStateErrorDetails implements CollectionsStateErrorDetails {
  const _$CollectionsStateErrorDetails([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'CollectionsState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionsStateErrorDetails &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$CollectionsStateErrorDetailsCopyWith<_$CollectionsStateErrorDetails>
      get copyWith => __$$CollectionsStateErrorDetailsCopyWithImpl<
          _$CollectionsStateErrorDetails>(this, _$identity);

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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? collections)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return error?.call(message);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CollectionsStateInitial value)? initial,
    TResult Function(CollectionsStateLoaded value)? loaded,
    TResult Function(CollectionsStateLoading value)? loading,
    TResult Function(CollectionsStateErrorDetails value)? error,
  }) {
    return error?.call(this);
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
  const factory CollectionsStateErrorDetails([final String? message]) =
      _$CollectionsStateErrorDetails;

  String? get message;
  @JsonKey(ignore: true)
  _$$CollectionsStateErrorDetailsCopyWith<_$CollectionsStateErrorDetails>
      get copyWith => throw _privateConstructorUsedError;
}
