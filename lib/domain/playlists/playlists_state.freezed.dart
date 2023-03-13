// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playlists_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlaylistsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Playlist>? playlists) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Playlist>? playlists)? loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Playlist>? playlists)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlaylistsStateInitial value) initial,
    required TResult Function(PlaylistsStateLoaded value) loaded,
    required TResult Function(PlaylistsStateLoading value) loading,
    required TResult Function(PlaylistsStateErrorDetails value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlaylistsStateInitial value)? initial,
    TResult? Function(PlaylistsStateLoaded value)? loaded,
    TResult? Function(PlaylistsStateLoading value)? loading,
    TResult? Function(PlaylistsStateErrorDetails value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlaylistsStateInitial value)? initial,
    TResult Function(PlaylistsStateLoaded value)? loaded,
    TResult Function(PlaylistsStateLoading value)? loading,
    TResult Function(PlaylistsStateErrorDetails value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistsStateCopyWith<$Res> {
  factory $PlaylistsStateCopyWith(
          PlaylistsState value, $Res Function(PlaylistsState) then) =
      _$PlaylistsStateCopyWithImpl<$Res, PlaylistsState>;
}

/// @nodoc
class _$PlaylistsStateCopyWithImpl<$Res, $Val extends PlaylistsState>
    implements $PlaylistsStateCopyWith<$Res> {
  _$PlaylistsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PlaylistsStateInitialCopyWith<$Res> {
  factory _$$PlaylistsStateInitialCopyWith(_$PlaylistsStateInitial value,
          $Res Function(_$PlaylistsStateInitial) then) =
      __$$PlaylistsStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PlaylistsStateInitialCopyWithImpl<$Res>
    extends _$PlaylistsStateCopyWithImpl<$Res, _$PlaylistsStateInitial>
    implements _$$PlaylistsStateInitialCopyWith<$Res> {
  __$$PlaylistsStateInitialCopyWithImpl(_$PlaylistsStateInitial _value,
      $Res Function(_$PlaylistsStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PlaylistsStateInitial
    with DiagnosticableTreeMixin
    implements PlaylistsStateInitial {
  const _$PlaylistsStateInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlaylistsState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'PlaylistsState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PlaylistsStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Playlist>? playlists) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Playlist>? playlists)? loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Playlist>? playlists)? loaded,
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
    required TResult Function(PlaylistsStateInitial value) initial,
    required TResult Function(PlaylistsStateLoaded value) loaded,
    required TResult Function(PlaylistsStateLoading value) loading,
    required TResult Function(PlaylistsStateErrorDetails value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlaylistsStateInitial value)? initial,
    TResult? Function(PlaylistsStateLoaded value)? loaded,
    TResult? Function(PlaylistsStateLoading value)? loading,
    TResult? Function(PlaylistsStateErrorDetails value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlaylistsStateInitial value)? initial,
    TResult Function(PlaylistsStateLoaded value)? loaded,
    TResult Function(PlaylistsStateLoading value)? loading,
    TResult Function(PlaylistsStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class PlaylistsStateInitial implements PlaylistsState {
  const factory PlaylistsStateInitial() = _$PlaylistsStateInitial;
}

/// @nodoc
abstract class _$$PlaylistsStateLoadedCopyWith<$Res> {
  factory _$$PlaylistsStateLoadedCopyWith(_$PlaylistsStateLoaded value,
          $Res Function(_$PlaylistsStateLoaded) then) =
      __$$PlaylistsStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Playlist>? playlists});
}

/// @nodoc
class __$$PlaylistsStateLoadedCopyWithImpl<$Res>
    extends _$PlaylistsStateCopyWithImpl<$Res, _$PlaylistsStateLoaded>
    implements _$$PlaylistsStateLoadedCopyWith<$Res> {
  __$$PlaylistsStateLoadedCopyWithImpl(_$PlaylistsStateLoaded _value,
      $Res Function(_$PlaylistsStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playlists = freezed,
  }) {
    return _then(_$PlaylistsStateLoaded(
      playlists: freezed == playlists
          ? _value._playlists
          : playlists // ignore: cast_nullable_to_non_nullable
              as List<Playlist>?,
    ));
  }
}

/// @nodoc

class _$PlaylistsStateLoaded
    with DiagnosticableTreeMixin
    implements PlaylistsStateLoaded {
  const _$PlaylistsStateLoaded({final List<Playlist>? playlists})
      : _playlists = playlists;

  final List<Playlist>? _playlists;
  @override
  List<Playlist>? get playlists {
    final value = _playlists;
    if (value == null) return null;
    if (_playlists is EqualUnmodifiableListView) return _playlists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlaylistsState.loaded(playlists: $playlists)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlaylistsState.loaded'))
      ..add(DiagnosticsProperty('playlists', playlists));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaylistsStateLoaded &&
            const DeepCollectionEquality()
                .equals(other._playlists, _playlists));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_playlists));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaylistsStateLoadedCopyWith<_$PlaylistsStateLoaded> get copyWith =>
      __$$PlaylistsStateLoadedCopyWithImpl<_$PlaylistsStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Playlist>? playlists) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return loaded(playlists);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Playlist>? playlists)? loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) {
    return loaded?.call(playlists);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Playlist>? playlists)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(playlists);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlaylistsStateInitial value) initial,
    required TResult Function(PlaylistsStateLoaded value) loaded,
    required TResult Function(PlaylistsStateLoading value) loading,
    required TResult Function(PlaylistsStateErrorDetails value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlaylistsStateInitial value)? initial,
    TResult? Function(PlaylistsStateLoaded value)? loaded,
    TResult? Function(PlaylistsStateLoading value)? loading,
    TResult? Function(PlaylistsStateErrorDetails value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlaylistsStateInitial value)? initial,
    TResult Function(PlaylistsStateLoaded value)? loaded,
    TResult Function(PlaylistsStateLoading value)? loading,
    TResult Function(PlaylistsStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class PlaylistsStateLoaded implements PlaylistsState {
  const factory PlaylistsStateLoaded({final List<Playlist>? playlists}) =
      _$PlaylistsStateLoaded;

  List<Playlist>? get playlists;
  @JsonKey(ignore: true)
  _$$PlaylistsStateLoadedCopyWith<_$PlaylistsStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlaylistsStateLoadingCopyWith<$Res> {
  factory _$$PlaylistsStateLoadingCopyWith(_$PlaylistsStateLoading value,
          $Res Function(_$PlaylistsStateLoading) then) =
      __$$PlaylistsStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PlaylistsStateLoadingCopyWithImpl<$Res>
    extends _$PlaylistsStateCopyWithImpl<$Res, _$PlaylistsStateLoading>
    implements _$$PlaylistsStateLoadingCopyWith<$Res> {
  __$$PlaylistsStateLoadingCopyWithImpl(_$PlaylistsStateLoading _value,
      $Res Function(_$PlaylistsStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PlaylistsStateLoading
    with DiagnosticableTreeMixin
    implements PlaylistsStateLoading {
  const _$PlaylistsStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlaylistsState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'PlaylistsState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PlaylistsStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Playlist>? playlists) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Playlist>? playlists)? loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Playlist>? playlists)? loaded,
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
    required TResult Function(PlaylistsStateInitial value) initial,
    required TResult Function(PlaylistsStateLoaded value) loaded,
    required TResult Function(PlaylistsStateLoading value) loading,
    required TResult Function(PlaylistsStateErrorDetails value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlaylistsStateInitial value)? initial,
    TResult? Function(PlaylistsStateLoaded value)? loaded,
    TResult? Function(PlaylistsStateLoading value)? loading,
    TResult? Function(PlaylistsStateErrorDetails value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlaylistsStateInitial value)? initial,
    TResult Function(PlaylistsStateLoaded value)? loaded,
    TResult Function(PlaylistsStateLoading value)? loading,
    TResult Function(PlaylistsStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PlaylistsStateLoading implements PlaylistsState {
  const factory PlaylistsStateLoading() = _$PlaylistsStateLoading;
}

/// @nodoc
abstract class _$$PlaylistsStateErrorDetailsCopyWith<$Res> {
  factory _$$PlaylistsStateErrorDetailsCopyWith(
          _$PlaylistsStateErrorDetails value,
          $Res Function(_$PlaylistsStateErrorDetails) then) =
      __$$PlaylistsStateErrorDetailsCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$PlaylistsStateErrorDetailsCopyWithImpl<$Res>
    extends _$PlaylistsStateCopyWithImpl<$Res, _$PlaylistsStateErrorDetails>
    implements _$$PlaylistsStateErrorDetailsCopyWith<$Res> {
  __$$PlaylistsStateErrorDetailsCopyWithImpl(
      _$PlaylistsStateErrorDetails _value,
      $Res Function(_$PlaylistsStateErrorDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$PlaylistsStateErrorDetails(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PlaylistsStateErrorDetails
    with DiagnosticableTreeMixin
    implements PlaylistsStateErrorDetails {
  const _$PlaylistsStateErrorDetails([this.message]);

  @override
  final String? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlaylistsState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlaylistsState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaylistsStateErrorDetails &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaylistsStateErrorDetailsCopyWith<_$PlaylistsStateErrorDetails>
      get copyWith => __$$PlaylistsStateErrorDetailsCopyWithImpl<
          _$PlaylistsStateErrorDetails>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Playlist>? playlists) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Playlist>? playlists)? loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Playlist>? playlists)? loaded,
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
    required TResult Function(PlaylistsStateInitial value) initial,
    required TResult Function(PlaylistsStateLoaded value) loaded,
    required TResult Function(PlaylistsStateLoading value) loading,
    required TResult Function(PlaylistsStateErrorDetails value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlaylistsStateInitial value)? initial,
    TResult? Function(PlaylistsStateLoaded value)? loaded,
    TResult? Function(PlaylistsStateLoading value)? loading,
    TResult? Function(PlaylistsStateErrorDetails value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlaylistsStateInitial value)? initial,
    TResult Function(PlaylistsStateLoaded value)? loaded,
    TResult Function(PlaylistsStateLoading value)? loading,
    TResult Function(PlaylistsStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class PlaylistsStateErrorDetails implements PlaylistsState {
  const factory PlaylistsStateErrorDetails([final String? message]) =
      _$PlaylistsStateErrorDetails;

  String? get message;
  @JsonKey(ignore: true)
  _$$PlaylistsStateErrorDetailsCopyWith<_$PlaylistsStateErrorDetails>
      get copyWith => throw _privateConstructorUsedError;
}
