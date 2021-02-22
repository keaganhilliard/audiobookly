// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$HomeStateTearOff {
  const _$HomeStateTearOff();

// ignore: unused_element
  HomeStateInitial initial() {
    return const HomeStateInitial();
  }

// ignore: unused_element
  HomeStateLoaded loaded(
      {List<MediaItem> recentlyPlayed, List<MediaItem> recentlyAdded}) {
    return HomeStateLoaded(
      recentlyPlayed: recentlyPlayed,
      recentlyAdded: recentlyAdded,
    );
  }

// ignore: unused_element
  HomeStateLoading loading() {
    return const HomeStateLoading();
  }

// ignore: unused_element
  HomeStateErrorDetails error([String message]) {
    return HomeStateErrorDetails(
      message,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $HomeState = _$HomeStateTearOff();

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required
        TResult loaded(
            List<MediaItem> recentlyPlayed, List<MediaItem> recentlyAdded),
    @required TResult loading(),
    @required TResult error(String message),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loaded(
        List<MediaItem> recentlyPlayed, List<MediaItem> recentlyAdded),
    TResult loading(),
    TResult error(String message),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(HomeStateInitial value),
    @required TResult loaded(HomeStateLoaded value),
    @required TResult loading(HomeStateLoading value),
    @required TResult error(HomeStateErrorDetails value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(HomeStateInitial value),
    TResult loaded(HomeStateLoaded value),
    TResult loading(HomeStateLoading value),
    TResult error(HomeStateErrorDetails value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;
}

/// @nodoc
abstract class $HomeStateInitialCopyWith<$Res> {
  factory $HomeStateInitialCopyWith(
          HomeStateInitial value, $Res Function(HomeStateInitial) then) =
      _$HomeStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeStateInitialCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateInitialCopyWith<$Res> {
  _$HomeStateInitialCopyWithImpl(
      HomeStateInitial _value, $Res Function(HomeStateInitial) _then)
      : super(_value, (v) => _then(v as HomeStateInitial));

  @override
  HomeStateInitial get _value => super._value as HomeStateInitial;
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
    properties..add(DiagnosticsProperty('type', 'HomeState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is HomeStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required
        TResult loaded(
            List<MediaItem> recentlyPlayed, List<MediaItem> recentlyAdded),
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
    TResult loaded(
        List<MediaItem> recentlyPlayed, List<MediaItem> recentlyAdded),
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
    @required TResult initial(HomeStateInitial value),
    @required TResult loaded(HomeStateLoaded value),
    @required TResult loading(HomeStateLoading value),
    @required TResult error(HomeStateErrorDetails value),
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
    TResult initial(HomeStateInitial value),
    TResult loaded(HomeStateLoaded value),
    TResult loading(HomeStateLoading value),
    TResult error(HomeStateErrorDetails value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
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
abstract class $HomeStateLoadedCopyWith<$Res> {
  factory $HomeStateLoadedCopyWith(
          HomeStateLoaded value, $Res Function(HomeStateLoaded) then) =
      _$HomeStateLoadedCopyWithImpl<$Res>;
  $Res call({List<MediaItem> recentlyPlayed, List<MediaItem> recentlyAdded});
}

/// @nodoc
class _$HomeStateLoadedCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateLoadedCopyWith<$Res> {
  _$HomeStateLoadedCopyWithImpl(
      HomeStateLoaded _value, $Res Function(HomeStateLoaded) _then)
      : super(_value, (v) => _then(v as HomeStateLoaded));

  @override
  HomeStateLoaded get _value => super._value as HomeStateLoaded;

  @override
  $Res call({
    Object recentlyPlayed = freezed,
    Object recentlyAdded = freezed,
  }) {
    return _then(HomeStateLoaded(
      recentlyPlayed: recentlyPlayed == freezed
          ? _value.recentlyPlayed
          : recentlyPlayed as List<MediaItem>,
      recentlyAdded: recentlyAdded == freezed
          ? _value.recentlyAdded
          : recentlyAdded as List<MediaItem>,
    ));
  }
}

/// @nodoc
class _$HomeStateLoaded
    with DiagnosticableTreeMixin
    implements HomeStateLoaded {
  const _$HomeStateLoaded({this.recentlyPlayed, this.recentlyAdded});

  @override
  final List<MediaItem> recentlyPlayed;
  @override
  final List<MediaItem> recentlyAdded;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeState.loaded(recentlyPlayed: $recentlyPlayed, recentlyAdded: $recentlyAdded)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeState.loaded'))
      ..add(DiagnosticsProperty('recentlyPlayed', recentlyPlayed))
      ..add(DiagnosticsProperty('recentlyAdded', recentlyAdded));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HomeStateLoaded &&
            (identical(other.recentlyPlayed, recentlyPlayed) ||
                const DeepCollectionEquality()
                    .equals(other.recentlyPlayed, recentlyPlayed)) &&
            (identical(other.recentlyAdded, recentlyAdded) ||
                const DeepCollectionEquality()
                    .equals(other.recentlyAdded, recentlyAdded)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(recentlyPlayed) ^
      const DeepCollectionEquality().hash(recentlyAdded);

  @JsonKey(ignore: true)
  @override
  $HomeStateLoadedCopyWith<HomeStateLoaded> get copyWith =>
      _$HomeStateLoadedCopyWithImpl<HomeStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required
        TResult loaded(
            List<MediaItem> recentlyPlayed, List<MediaItem> recentlyAdded),
    @required TResult loading(),
    @required TResult error(String message),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    return loaded(recentlyPlayed, recentlyAdded);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loaded(
        List<MediaItem> recentlyPlayed, List<MediaItem> recentlyAdded),
    TResult loading(),
    TResult error(String message),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(recentlyPlayed, recentlyAdded);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(HomeStateInitial value),
    @required TResult loaded(HomeStateLoaded value),
    @required TResult loading(HomeStateLoading value),
    @required TResult error(HomeStateErrorDetails value),
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
    TResult initial(HomeStateInitial value),
    TResult loaded(HomeStateLoaded value),
    TResult loading(HomeStateLoading value),
    TResult error(HomeStateErrorDetails value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class HomeStateLoaded implements HomeState {
  const factory HomeStateLoaded(
      {List<MediaItem> recentlyPlayed,
      List<MediaItem> recentlyAdded}) = _$HomeStateLoaded;

  List<MediaItem> get recentlyPlayed;
  List<MediaItem> get recentlyAdded;
  @JsonKey(ignore: true)
  $HomeStateLoadedCopyWith<HomeStateLoaded> get copyWith;
}

/// @nodoc
abstract class $HomeStateLoadingCopyWith<$Res> {
  factory $HomeStateLoadingCopyWith(
          HomeStateLoading value, $Res Function(HomeStateLoading) then) =
      _$HomeStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeStateLoadingCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateLoadingCopyWith<$Res> {
  _$HomeStateLoadingCopyWithImpl(
      HomeStateLoading _value, $Res Function(HomeStateLoading) _then)
      : super(_value, (v) => _then(v as HomeStateLoading));

  @override
  HomeStateLoading get _value => super._value as HomeStateLoading;
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
    properties..add(DiagnosticsProperty('type', 'HomeState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is HomeStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required
        TResult loaded(
            List<MediaItem> recentlyPlayed, List<MediaItem> recentlyAdded),
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
    TResult loaded(
        List<MediaItem> recentlyPlayed, List<MediaItem> recentlyAdded),
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
    @required TResult initial(HomeStateInitial value),
    @required TResult loaded(HomeStateLoaded value),
    @required TResult loading(HomeStateLoading value),
    @required TResult error(HomeStateErrorDetails value),
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
    TResult initial(HomeStateInitial value),
    TResult loaded(HomeStateLoaded value),
    TResult loading(HomeStateLoading value),
    TResult error(HomeStateErrorDetails value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
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
abstract class $HomeStateErrorDetailsCopyWith<$Res> {
  factory $HomeStateErrorDetailsCopyWith(HomeStateErrorDetails value,
          $Res Function(HomeStateErrorDetails) then) =
      _$HomeStateErrorDetailsCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$HomeStateErrorDetailsCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateErrorDetailsCopyWith<$Res> {
  _$HomeStateErrorDetailsCopyWithImpl(
      HomeStateErrorDetails _value, $Res Function(HomeStateErrorDetails) _then)
      : super(_value, (v) => _then(v as HomeStateErrorDetails));

  @override
  HomeStateErrorDetails get _value => super._value as HomeStateErrorDetails;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(HomeStateErrorDetails(
      message == freezed ? _value.message : message as String,
    ));
  }
}

/// @nodoc
class _$HomeStateErrorDetails
    with DiagnosticableTreeMixin
    implements HomeStateErrorDetails {
  const _$HomeStateErrorDetails([this.message]);

  @override
  final String message;

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
        (other is HomeStateErrorDetails &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $HomeStateErrorDetailsCopyWith<HomeStateErrorDetails> get copyWith =>
      _$HomeStateErrorDetailsCopyWithImpl<HomeStateErrorDetails>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required
        TResult loaded(
            List<MediaItem> recentlyPlayed, List<MediaItem> recentlyAdded),
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
    TResult loaded(
        List<MediaItem> recentlyPlayed, List<MediaItem> recentlyAdded),
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
    @required TResult initial(HomeStateInitial value),
    @required TResult loaded(HomeStateLoaded value),
    @required TResult loading(HomeStateLoading value),
    @required TResult error(HomeStateErrorDetails value),
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
    TResult initial(HomeStateInitial value),
    TResult loaded(HomeStateLoaded value),
    TResult loading(HomeStateLoading value),
    TResult error(HomeStateErrorDetails value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class HomeStateErrorDetails implements HomeState {
  const factory HomeStateErrorDetails([String message]) =
      _$HomeStateErrorDetails;

  String get message;
  @JsonKey(ignore: true)
  $HomeStateErrorDetailsCopyWith<HomeStateErrorDetails> get copyWith;
}
