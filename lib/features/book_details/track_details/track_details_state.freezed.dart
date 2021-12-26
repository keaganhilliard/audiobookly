// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'track_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TrackDetailsStateTearOff {
  const _$TrackDetailsStateTearOff();

  TrackDetailsStateInitial initial() {
    return const TrackDetailsStateInitial();
  }

  TrackDetailsStateLoaded loaded({List<MediaItem>? chapters}) {
    return TrackDetailsStateLoaded(
      chapters: chapters,
    );
  }

  TrackDetailsStateLoading loading() {
    return const TrackDetailsStateLoading();
  }

  TrackDetailsStateErrorDetails error([String? message]) {
    return TrackDetailsStateErrorDetails(
      message,
    );
  }
}

/// @nodoc
const $TrackDetailsState = _$TrackDetailsStateTearOff();

/// @nodoc
mixin _$TrackDetailsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? chapters) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? chapters)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? chapters)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TrackDetailsStateInitial value) initial,
    required TResult Function(TrackDetailsStateLoaded value) loaded,
    required TResult Function(TrackDetailsStateLoading value) loading,
    required TResult Function(TrackDetailsStateErrorDetails value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TrackDetailsStateInitial value)? initial,
    TResult Function(TrackDetailsStateLoaded value)? loaded,
    TResult Function(TrackDetailsStateLoading value)? loading,
    TResult Function(TrackDetailsStateErrorDetails value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TrackDetailsStateInitial value)? initial,
    TResult Function(TrackDetailsStateLoaded value)? loaded,
    TResult Function(TrackDetailsStateLoading value)? loading,
    TResult Function(TrackDetailsStateErrorDetails value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackDetailsStateCopyWith<$Res> {
  factory $TrackDetailsStateCopyWith(
          TrackDetailsState value, $Res Function(TrackDetailsState) then) =
      _$TrackDetailsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TrackDetailsStateCopyWithImpl<$Res>
    implements $TrackDetailsStateCopyWith<$Res> {
  _$TrackDetailsStateCopyWithImpl(this._value, this._then);

  final TrackDetailsState _value;
  // ignore: unused_field
  final $Res Function(TrackDetailsState) _then;
}

/// @nodoc
abstract class $TrackDetailsStateInitialCopyWith<$Res> {
  factory $TrackDetailsStateInitialCopyWith(TrackDetailsStateInitial value,
          $Res Function(TrackDetailsStateInitial) then) =
      _$TrackDetailsStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$TrackDetailsStateInitialCopyWithImpl<$Res>
    extends _$TrackDetailsStateCopyWithImpl<$Res>
    implements $TrackDetailsStateInitialCopyWith<$Res> {
  _$TrackDetailsStateInitialCopyWithImpl(TrackDetailsStateInitial _value,
      $Res Function(TrackDetailsStateInitial) _then)
      : super(_value, (v) => _then(v as TrackDetailsStateInitial));

  @override
  TrackDetailsStateInitial get _value =>
      super._value as TrackDetailsStateInitial;
}

/// @nodoc

class _$TrackDetailsStateInitial
    with DiagnosticableTreeMixin
    implements TrackDetailsStateInitial {
  const _$TrackDetailsStateInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TrackDetailsState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'TrackDetailsState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TrackDetailsStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? chapters) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? chapters)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? chapters)? loaded,
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
    required TResult Function(TrackDetailsStateInitial value) initial,
    required TResult Function(TrackDetailsStateLoaded value) loaded,
    required TResult Function(TrackDetailsStateLoading value) loading,
    required TResult Function(TrackDetailsStateErrorDetails value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TrackDetailsStateInitial value)? initial,
    TResult Function(TrackDetailsStateLoaded value)? loaded,
    TResult Function(TrackDetailsStateLoading value)? loading,
    TResult Function(TrackDetailsStateErrorDetails value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TrackDetailsStateInitial value)? initial,
    TResult Function(TrackDetailsStateLoaded value)? loaded,
    TResult Function(TrackDetailsStateLoading value)? loading,
    TResult Function(TrackDetailsStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TrackDetailsStateInitial implements TrackDetailsState {
  const factory TrackDetailsStateInitial() = _$TrackDetailsStateInitial;
}

/// @nodoc
abstract class $TrackDetailsStateLoadedCopyWith<$Res> {
  factory $TrackDetailsStateLoadedCopyWith(TrackDetailsStateLoaded value,
          $Res Function(TrackDetailsStateLoaded) then) =
      _$TrackDetailsStateLoadedCopyWithImpl<$Res>;
  $Res call({List<MediaItem>? chapters});
}

/// @nodoc
class _$TrackDetailsStateLoadedCopyWithImpl<$Res>
    extends _$TrackDetailsStateCopyWithImpl<$Res>
    implements $TrackDetailsStateLoadedCopyWith<$Res> {
  _$TrackDetailsStateLoadedCopyWithImpl(TrackDetailsStateLoaded _value,
      $Res Function(TrackDetailsStateLoaded) _then)
      : super(_value, (v) => _then(v as TrackDetailsStateLoaded));

  @override
  TrackDetailsStateLoaded get _value => super._value as TrackDetailsStateLoaded;

  @override
  $Res call({
    Object? chapters = freezed,
  }) {
    return _then(TrackDetailsStateLoaded(
      chapters: chapters == freezed
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<MediaItem>?,
    ));
  }
}

/// @nodoc

class _$TrackDetailsStateLoaded
    with DiagnosticableTreeMixin
    implements TrackDetailsStateLoaded {
  const _$TrackDetailsStateLoaded({this.chapters});

  @override
  final List<MediaItem>? chapters;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TrackDetailsState.loaded(chapters: $chapters)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TrackDetailsState.loaded'))
      ..add(DiagnosticsProperty('chapters', chapters));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TrackDetailsStateLoaded &&
            const DeepCollectionEquality().equals(other.chapters, chapters));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(chapters));

  @JsonKey(ignore: true)
  @override
  $TrackDetailsStateLoadedCopyWith<TrackDetailsStateLoaded> get copyWith =>
      _$TrackDetailsStateLoadedCopyWithImpl<TrackDetailsStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? chapters) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return loaded(chapters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? chapters)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return loaded?.call(chapters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? chapters)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(chapters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TrackDetailsStateInitial value) initial,
    required TResult Function(TrackDetailsStateLoaded value) loaded,
    required TResult Function(TrackDetailsStateLoading value) loading,
    required TResult Function(TrackDetailsStateErrorDetails value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TrackDetailsStateInitial value)? initial,
    TResult Function(TrackDetailsStateLoaded value)? loaded,
    TResult Function(TrackDetailsStateLoading value)? loading,
    TResult Function(TrackDetailsStateErrorDetails value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TrackDetailsStateInitial value)? initial,
    TResult Function(TrackDetailsStateLoaded value)? loaded,
    TResult Function(TrackDetailsStateLoading value)? loading,
    TResult Function(TrackDetailsStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class TrackDetailsStateLoaded implements TrackDetailsState {
  const factory TrackDetailsStateLoaded({List<MediaItem>? chapters}) =
      _$TrackDetailsStateLoaded;

  List<MediaItem>? get chapters;
  @JsonKey(ignore: true)
  $TrackDetailsStateLoadedCopyWith<TrackDetailsStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackDetailsStateLoadingCopyWith<$Res> {
  factory $TrackDetailsStateLoadingCopyWith(TrackDetailsStateLoading value,
          $Res Function(TrackDetailsStateLoading) then) =
      _$TrackDetailsStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$TrackDetailsStateLoadingCopyWithImpl<$Res>
    extends _$TrackDetailsStateCopyWithImpl<$Res>
    implements $TrackDetailsStateLoadingCopyWith<$Res> {
  _$TrackDetailsStateLoadingCopyWithImpl(TrackDetailsStateLoading _value,
      $Res Function(TrackDetailsStateLoading) _then)
      : super(_value, (v) => _then(v as TrackDetailsStateLoading));

  @override
  TrackDetailsStateLoading get _value =>
      super._value as TrackDetailsStateLoading;
}

/// @nodoc

class _$TrackDetailsStateLoading
    with DiagnosticableTreeMixin
    implements TrackDetailsStateLoading {
  const _$TrackDetailsStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TrackDetailsState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'TrackDetailsState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TrackDetailsStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? chapters) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? chapters)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? chapters)? loaded,
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
    required TResult Function(TrackDetailsStateInitial value) initial,
    required TResult Function(TrackDetailsStateLoaded value) loaded,
    required TResult Function(TrackDetailsStateLoading value) loading,
    required TResult Function(TrackDetailsStateErrorDetails value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TrackDetailsStateInitial value)? initial,
    TResult Function(TrackDetailsStateLoaded value)? loaded,
    TResult Function(TrackDetailsStateLoading value)? loading,
    TResult Function(TrackDetailsStateErrorDetails value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TrackDetailsStateInitial value)? initial,
    TResult Function(TrackDetailsStateLoaded value)? loaded,
    TResult Function(TrackDetailsStateLoading value)? loading,
    TResult Function(TrackDetailsStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TrackDetailsStateLoading implements TrackDetailsState {
  const factory TrackDetailsStateLoading() = _$TrackDetailsStateLoading;
}

/// @nodoc
abstract class $TrackDetailsStateErrorDetailsCopyWith<$Res> {
  factory $TrackDetailsStateErrorDetailsCopyWith(
          TrackDetailsStateErrorDetails value,
          $Res Function(TrackDetailsStateErrorDetails) then) =
      _$TrackDetailsStateErrorDetailsCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class _$TrackDetailsStateErrorDetailsCopyWithImpl<$Res>
    extends _$TrackDetailsStateCopyWithImpl<$Res>
    implements $TrackDetailsStateErrorDetailsCopyWith<$Res> {
  _$TrackDetailsStateErrorDetailsCopyWithImpl(
      TrackDetailsStateErrorDetails _value,
      $Res Function(TrackDetailsStateErrorDetails) _then)
      : super(_value, (v) => _then(v as TrackDetailsStateErrorDetails));

  @override
  TrackDetailsStateErrorDetails get _value =>
      super._value as TrackDetailsStateErrorDetails;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(TrackDetailsStateErrorDetails(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TrackDetailsStateErrorDetails
    with DiagnosticableTreeMixin
    implements TrackDetailsStateErrorDetails {
  const _$TrackDetailsStateErrorDetails([this.message]);

  @override
  final String? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TrackDetailsState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TrackDetailsState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TrackDetailsStateErrorDetails &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  $TrackDetailsStateErrorDetailsCopyWith<TrackDetailsStateErrorDetails>
      get copyWith => _$TrackDetailsStateErrorDetailsCopyWithImpl<
          TrackDetailsStateErrorDetails>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? chapters) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? chapters)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? chapters)? loaded,
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
    required TResult Function(TrackDetailsStateInitial value) initial,
    required TResult Function(TrackDetailsStateLoaded value) loaded,
    required TResult Function(TrackDetailsStateLoading value) loading,
    required TResult Function(TrackDetailsStateErrorDetails value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TrackDetailsStateInitial value)? initial,
    TResult Function(TrackDetailsStateLoaded value)? loaded,
    TResult Function(TrackDetailsStateLoading value)? loading,
    TResult Function(TrackDetailsStateErrorDetails value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TrackDetailsStateInitial value)? initial,
    TResult Function(TrackDetailsStateLoaded value)? loaded,
    TResult Function(TrackDetailsStateLoading value)? loading,
    TResult Function(TrackDetailsStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TrackDetailsStateErrorDetails implements TrackDetailsState {
  const factory TrackDetailsStateErrorDetails([String? message]) =
      _$TrackDetailsStateErrorDetails;

  String? get message;
  @JsonKey(ignore: true)
  $TrackDetailsStateErrorDetailsCopyWith<TrackDetailsStateErrorDetails>
      get copyWith => throw _privateConstructorUsedError;
}
