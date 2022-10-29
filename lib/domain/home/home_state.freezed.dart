// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? recentlyPlayed,
            List<MediaItem>? recentlyAdded, List<MediaItem>? downloaded)
        loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<MediaItem>? recentlyPlayed,
            List<MediaItem>? recentlyAdded, List<MediaItem>? downloaded)?
        loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? recentlyPlayed,
            List<MediaItem>? recentlyAdded, List<MediaItem>? downloaded)?
        loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeStateInitial value) initial,
    required TResult Function(HomeStateLoaded value) loaded,
    required TResult Function(HomeStateLoading value) loading,
    required TResult Function(HomeStateErrorDetails value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeStateInitial value)? initial,
    TResult? Function(HomeStateLoaded value)? loaded,
    TResult? Function(HomeStateLoading value)? loading,
    TResult? Function(HomeStateErrorDetails value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeStateInitial value)? initial,
    TResult Function(HomeStateLoaded value)? loaded,
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeStateErrorDetails value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$HomeStateInitialCopyWith<$Res> {
  factory _$$HomeStateInitialCopyWith(
          _$HomeStateInitial value, $Res Function(_$HomeStateInitial) then) =
      __$$HomeStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeStateInitialCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateInitial>
    implements _$$HomeStateInitialCopyWith<$Res> {
  __$$HomeStateInitialCopyWithImpl(
      _$HomeStateInitial _value, $Res Function(_$HomeStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$HomeStateInitial
    with DiagnosticableTreeMixin
    implements HomeStateInitial {
  const _$HomeStateInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'HomeState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? recentlyPlayed,
            List<MediaItem>? recentlyAdded, List<MediaItem>? downloaded)
        loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<MediaItem>? recentlyPlayed,
            List<MediaItem>? recentlyAdded, List<MediaItem>? downloaded)?
        loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? recentlyPlayed,
            List<MediaItem>? recentlyAdded, List<MediaItem>? downloaded)?
        loaded,
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
    required TResult Function(HomeStateInitial value) initial,
    required TResult Function(HomeStateLoaded value) loaded,
    required TResult Function(HomeStateLoading value) loading,
    required TResult Function(HomeStateErrorDetails value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeStateInitial value)? initial,
    TResult? Function(HomeStateLoaded value)? loaded,
    TResult? Function(HomeStateLoading value)? loading,
    TResult? Function(HomeStateErrorDetails value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeStateInitial value)? initial,
    TResult Function(HomeStateLoaded value)? loaded,
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class HomeStateInitial implements HomeState {
  const factory HomeStateInitial() = _$HomeStateInitial;
}

/// @nodoc
abstract class _$$HomeStateLoadedCopyWith<$Res> {
  factory _$$HomeStateLoadedCopyWith(
          _$HomeStateLoaded value, $Res Function(_$HomeStateLoaded) then) =
      __$$HomeStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<MediaItem>? recentlyPlayed,
      List<MediaItem>? recentlyAdded,
      List<MediaItem>? downloaded});
}

/// @nodoc
class __$$HomeStateLoadedCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateLoaded>
    implements _$$HomeStateLoadedCopyWith<$Res> {
  __$$HomeStateLoadedCopyWithImpl(
      _$HomeStateLoaded _value, $Res Function(_$HomeStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recentlyPlayed = freezed,
    Object? recentlyAdded = freezed,
    Object? downloaded = freezed,
  }) {
    return _then(_$HomeStateLoaded(
      recentlyPlayed: freezed == recentlyPlayed
          ? _value._recentlyPlayed
          : recentlyPlayed // ignore: cast_nullable_to_non_nullable
              as List<MediaItem>?,
      recentlyAdded: freezed == recentlyAdded
          ? _value._recentlyAdded
          : recentlyAdded // ignore: cast_nullable_to_non_nullable
              as List<MediaItem>?,
      downloaded: freezed == downloaded
          ? _value._downloaded
          : downloaded // ignore: cast_nullable_to_non_nullable
              as List<MediaItem>?,
    ));
  }
}

/// @nodoc

class _$HomeStateLoaded
    with DiagnosticableTreeMixin
    implements HomeStateLoaded {
  const _$HomeStateLoaded(
      {final List<MediaItem>? recentlyPlayed,
      final List<MediaItem>? recentlyAdded,
      final List<MediaItem>? downloaded})
      : _recentlyPlayed = recentlyPlayed,
        _recentlyAdded = recentlyAdded,
        _downloaded = downloaded;

  final List<MediaItem>? _recentlyPlayed;
  @override
  List<MediaItem>? get recentlyPlayed {
    final value = _recentlyPlayed;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MediaItem>? _recentlyAdded;
  @override
  List<MediaItem>? get recentlyAdded {
    final value = _recentlyAdded;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MediaItem>? _downloaded;
  @override
  List<MediaItem>? get downloaded {
    final value = _downloaded;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeState.loaded(recentlyPlayed: $recentlyPlayed, recentlyAdded: $recentlyAdded, downloaded: $downloaded)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeState.loaded'))
      ..add(DiagnosticsProperty('recentlyPlayed', recentlyPlayed))
      ..add(DiagnosticsProperty('recentlyAdded', recentlyAdded))
      ..add(DiagnosticsProperty('downloaded', downloaded));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateLoaded &&
            const DeepCollectionEquality()
                .equals(other._recentlyPlayed, _recentlyPlayed) &&
            const DeepCollectionEquality()
                .equals(other._recentlyAdded, _recentlyAdded) &&
            const DeepCollectionEquality()
                .equals(other._downloaded, _downloaded));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_recentlyPlayed),
      const DeepCollectionEquality().hash(_recentlyAdded),
      const DeepCollectionEquality().hash(_downloaded));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateLoadedCopyWith<_$HomeStateLoaded> get copyWith =>
      __$$HomeStateLoadedCopyWithImpl<_$HomeStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? recentlyPlayed,
            List<MediaItem>? recentlyAdded, List<MediaItem>? downloaded)
        loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return loaded(recentlyPlayed, recentlyAdded, downloaded);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<MediaItem>? recentlyPlayed,
            List<MediaItem>? recentlyAdded, List<MediaItem>? downloaded)?
        loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) {
    return loaded?.call(recentlyPlayed, recentlyAdded, downloaded);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? recentlyPlayed,
            List<MediaItem>? recentlyAdded, List<MediaItem>? downloaded)?
        loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(recentlyPlayed, recentlyAdded, downloaded);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeStateInitial value) initial,
    required TResult Function(HomeStateLoaded value) loaded,
    required TResult Function(HomeStateLoading value) loading,
    required TResult Function(HomeStateErrorDetails value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeStateInitial value)? initial,
    TResult? Function(HomeStateLoaded value)? loaded,
    TResult? Function(HomeStateLoading value)? loading,
    TResult? Function(HomeStateErrorDetails value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeStateInitial value)? initial,
    TResult Function(HomeStateLoaded value)? loaded,
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class HomeStateLoaded implements HomeState {
  const factory HomeStateLoaded(
      {final List<MediaItem>? recentlyPlayed,
      final List<MediaItem>? recentlyAdded,
      final List<MediaItem>? downloaded}) = _$HomeStateLoaded;

  List<MediaItem>? get recentlyPlayed;
  List<MediaItem>? get recentlyAdded;
  List<MediaItem>? get downloaded;
  @JsonKey(ignore: true)
  _$$HomeStateLoadedCopyWith<_$HomeStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomeStateLoadingCopyWith<$Res> {
  factory _$$HomeStateLoadingCopyWith(
          _$HomeStateLoading value, $Res Function(_$HomeStateLoading) then) =
      __$$HomeStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeStateLoadingCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateLoading>
    implements _$$HomeStateLoadingCopyWith<$Res> {
  __$$HomeStateLoadingCopyWithImpl(
      _$HomeStateLoading _value, $Res Function(_$HomeStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$HomeStateLoading
    with DiagnosticableTreeMixin
    implements HomeStateLoading {
  const _$HomeStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'HomeState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? recentlyPlayed,
            List<MediaItem>? recentlyAdded, List<MediaItem>? downloaded)
        loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<MediaItem>? recentlyPlayed,
            List<MediaItem>? recentlyAdded, List<MediaItem>? downloaded)?
        loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? recentlyPlayed,
            List<MediaItem>? recentlyAdded, List<MediaItem>? downloaded)?
        loaded,
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
    required TResult Function(HomeStateInitial value) initial,
    required TResult Function(HomeStateLoaded value) loaded,
    required TResult Function(HomeStateLoading value) loading,
    required TResult Function(HomeStateErrorDetails value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeStateInitial value)? initial,
    TResult? Function(HomeStateLoaded value)? loaded,
    TResult? Function(HomeStateLoading value)? loading,
    TResult? Function(HomeStateErrorDetails value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeStateInitial value)? initial,
    TResult Function(HomeStateLoaded value)? loaded,
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class HomeStateLoading implements HomeState {
  const factory HomeStateLoading() = _$HomeStateLoading;
}

/// @nodoc
abstract class _$$HomeStateErrorDetailsCopyWith<$Res> {
  factory _$$HomeStateErrorDetailsCopyWith(_$HomeStateErrorDetails value,
          $Res Function(_$HomeStateErrorDetails) then) =
      __$$HomeStateErrorDetailsCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$HomeStateErrorDetailsCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateErrorDetails>
    implements _$$HomeStateErrorDetailsCopyWith<$Res> {
  __$$HomeStateErrorDetailsCopyWithImpl(_$HomeStateErrorDetails _value,
      $Res Function(_$HomeStateErrorDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$HomeStateErrorDetails(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$HomeStateErrorDetails
    with DiagnosticableTreeMixin
    implements HomeStateErrorDetails {
  const _$HomeStateErrorDetails([this.message]);

  @override
  final String? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateErrorDetails &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateErrorDetailsCopyWith<_$HomeStateErrorDetails> get copyWith =>
      __$$HomeStateErrorDetailsCopyWithImpl<_$HomeStateErrorDetails>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? recentlyPlayed,
            List<MediaItem>? recentlyAdded, List<MediaItem>? downloaded)
        loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<MediaItem>? recentlyPlayed,
            List<MediaItem>? recentlyAdded, List<MediaItem>? downloaded)?
        loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? recentlyPlayed,
            List<MediaItem>? recentlyAdded, List<MediaItem>? downloaded)?
        loaded,
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
    required TResult Function(HomeStateInitial value) initial,
    required TResult Function(HomeStateLoaded value) loaded,
    required TResult Function(HomeStateLoading value) loading,
    required TResult Function(HomeStateErrorDetails value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeStateInitial value)? initial,
    TResult? Function(HomeStateLoaded value)? loaded,
    TResult? Function(HomeStateLoading value)? loading,
    TResult? Function(HomeStateErrorDetails value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeStateInitial value)? initial,
    TResult Function(HomeStateLoaded value)? loaded,
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class HomeStateErrorDetails implements HomeState {
  const factory HomeStateErrorDetails([final String? message]) =
      _$HomeStateErrorDetails;

  String? get message;
  @JsonKey(ignore: true)
  _$$HomeStateErrorDetailsCopyWith<_$HomeStateErrorDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
