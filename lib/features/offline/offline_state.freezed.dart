// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'offline_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$OfflineStateTearOff {
  const _$OfflineStateTearOff();

  OfflineStateInitial initial() {
    return const OfflineStateInitial();
  }

  OfflineStateLoaded loaded({List<MediaItem>? books}) {
    return OfflineStateLoaded(
      books: books,
    );
  }

  OfflineStateLoading loading() {
    return const OfflineStateLoading();
  }

  OfflineStateErrorDetails error([String? message]) {
    return OfflineStateErrorDetails(
      message,
    );
  }
}

/// @nodoc
const $OfflineState = _$OfflineStateTearOff();

/// @nodoc
mixin _$OfflineState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? books) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? books)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OfflineStateInitial value) initial,
    required TResult Function(OfflineStateLoaded value) loaded,
    required TResult Function(OfflineStateLoading value) loading,
    required TResult Function(OfflineStateErrorDetails value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OfflineStateInitial value)? initial,
    TResult Function(OfflineStateLoaded value)? loaded,
    TResult Function(OfflineStateLoading value)? loading,
    TResult Function(OfflineStateErrorDetails value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfflineStateCopyWith<$Res> {
  factory $OfflineStateCopyWith(
          OfflineState value, $Res Function(OfflineState) then) =
      _$OfflineStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$OfflineStateCopyWithImpl<$Res> implements $OfflineStateCopyWith<$Res> {
  _$OfflineStateCopyWithImpl(this._value, this._then);

  final OfflineState _value;
  // ignore: unused_field
  final $Res Function(OfflineState) _then;
}

/// @nodoc
abstract class $OfflineStateInitialCopyWith<$Res> {
  factory $OfflineStateInitialCopyWith(
          OfflineStateInitial value, $Res Function(OfflineStateInitial) then) =
      _$OfflineStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$OfflineStateInitialCopyWithImpl<$Res>
    extends _$OfflineStateCopyWithImpl<$Res>
    implements $OfflineStateInitialCopyWith<$Res> {
  _$OfflineStateInitialCopyWithImpl(
      OfflineStateInitial _value, $Res Function(OfflineStateInitial) _then)
      : super(_value, (v) => _then(v as OfflineStateInitial));

  @override
  OfflineStateInitial get _value => super._value as OfflineStateInitial;
}

/// @nodoc

class _$OfflineStateInitial
    with DiagnosticableTreeMixin
    implements OfflineStateInitial {
  const _$OfflineStateInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OfflineState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'OfflineState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is OfflineStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? books) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? books)? loaded,
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
    required TResult Function(OfflineStateInitial value) initial,
    required TResult Function(OfflineStateLoaded value) loaded,
    required TResult Function(OfflineStateLoading value) loading,
    required TResult Function(OfflineStateErrorDetails value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OfflineStateInitial value)? initial,
    TResult Function(OfflineStateLoaded value)? loaded,
    TResult Function(OfflineStateLoading value)? loading,
    TResult Function(OfflineStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class OfflineStateInitial implements OfflineState {
  const factory OfflineStateInitial() = _$OfflineStateInitial;
}

/// @nodoc
abstract class $OfflineStateLoadedCopyWith<$Res> {
  factory $OfflineStateLoadedCopyWith(
          OfflineStateLoaded value, $Res Function(OfflineStateLoaded) then) =
      _$OfflineStateLoadedCopyWithImpl<$Res>;
  $Res call({List<MediaItem>? books});
}

/// @nodoc
class _$OfflineStateLoadedCopyWithImpl<$Res>
    extends _$OfflineStateCopyWithImpl<$Res>
    implements $OfflineStateLoadedCopyWith<$Res> {
  _$OfflineStateLoadedCopyWithImpl(
      OfflineStateLoaded _value, $Res Function(OfflineStateLoaded) _then)
      : super(_value, (v) => _then(v as OfflineStateLoaded));

  @override
  OfflineStateLoaded get _value => super._value as OfflineStateLoaded;

  @override
  $Res call({
    Object? books = freezed,
  }) {
    return _then(OfflineStateLoaded(
      books: books == freezed
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<MediaItem>?,
    ));
  }
}

/// @nodoc

class _$OfflineStateLoaded
    with DiagnosticableTreeMixin
    implements OfflineStateLoaded {
  const _$OfflineStateLoaded({this.books});

  @override
  final List<MediaItem>? books;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OfflineState.loaded(books: $books)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OfflineState.loaded'))
      ..add(DiagnosticsProperty('books', books));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OfflineStateLoaded &&
            (identical(other.books, books) ||
                const DeepCollectionEquality().equals(other.books, books)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(books);

  @JsonKey(ignore: true)
  @override
  $OfflineStateLoadedCopyWith<OfflineStateLoaded> get copyWith =>
      _$OfflineStateLoadedCopyWithImpl<OfflineStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? books) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return loaded(books);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? books)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(books);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OfflineStateInitial value) initial,
    required TResult Function(OfflineStateLoaded value) loaded,
    required TResult Function(OfflineStateLoading value) loading,
    required TResult Function(OfflineStateErrorDetails value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OfflineStateInitial value)? initial,
    TResult Function(OfflineStateLoaded value)? loaded,
    TResult Function(OfflineStateLoading value)? loading,
    TResult Function(OfflineStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class OfflineStateLoaded implements OfflineState {
  const factory OfflineStateLoaded({List<MediaItem>? books}) =
      _$OfflineStateLoaded;

  List<MediaItem>? get books => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfflineStateLoadedCopyWith<OfflineStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfflineStateLoadingCopyWith<$Res> {
  factory $OfflineStateLoadingCopyWith(
          OfflineStateLoading value, $Res Function(OfflineStateLoading) then) =
      _$OfflineStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$OfflineStateLoadingCopyWithImpl<$Res>
    extends _$OfflineStateCopyWithImpl<$Res>
    implements $OfflineStateLoadingCopyWith<$Res> {
  _$OfflineStateLoadingCopyWithImpl(
      OfflineStateLoading _value, $Res Function(OfflineStateLoading) _then)
      : super(_value, (v) => _then(v as OfflineStateLoading));

  @override
  OfflineStateLoading get _value => super._value as OfflineStateLoading;
}

/// @nodoc

class _$OfflineStateLoading
    with DiagnosticableTreeMixin
    implements OfflineStateLoading {
  const _$OfflineStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OfflineState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'OfflineState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is OfflineStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? books) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? books)? loaded,
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
    required TResult Function(OfflineStateInitial value) initial,
    required TResult Function(OfflineStateLoaded value) loaded,
    required TResult Function(OfflineStateLoading value) loading,
    required TResult Function(OfflineStateErrorDetails value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OfflineStateInitial value)? initial,
    TResult Function(OfflineStateLoaded value)? loaded,
    TResult Function(OfflineStateLoading value)? loading,
    TResult Function(OfflineStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class OfflineStateLoading implements OfflineState {
  const factory OfflineStateLoading() = _$OfflineStateLoading;
}

/// @nodoc
abstract class $OfflineStateErrorDetailsCopyWith<$Res> {
  factory $OfflineStateErrorDetailsCopyWith(OfflineStateErrorDetails value,
          $Res Function(OfflineStateErrorDetails) then) =
      _$OfflineStateErrorDetailsCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class _$OfflineStateErrorDetailsCopyWithImpl<$Res>
    extends _$OfflineStateCopyWithImpl<$Res>
    implements $OfflineStateErrorDetailsCopyWith<$Res> {
  _$OfflineStateErrorDetailsCopyWithImpl(OfflineStateErrorDetails _value,
      $Res Function(OfflineStateErrorDetails) _then)
      : super(_value, (v) => _then(v as OfflineStateErrorDetails));

  @override
  OfflineStateErrorDetails get _value =>
      super._value as OfflineStateErrorDetails;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(OfflineStateErrorDetails(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$OfflineStateErrorDetails
    with DiagnosticableTreeMixin
    implements OfflineStateErrorDetails {
  const _$OfflineStateErrorDetails([this.message]);

  @override
  final String? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OfflineState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OfflineState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OfflineStateErrorDetails &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $OfflineStateErrorDetailsCopyWith<OfflineStateErrorDetails> get copyWith =>
      _$OfflineStateErrorDetailsCopyWithImpl<OfflineStateErrorDetails>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? books) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? books)? loaded,
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
    required TResult Function(OfflineStateInitial value) initial,
    required TResult Function(OfflineStateLoaded value) loaded,
    required TResult Function(OfflineStateLoading value) loading,
    required TResult Function(OfflineStateErrorDetails value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OfflineStateInitial value)? initial,
    TResult Function(OfflineStateLoaded value)? loaded,
    TResult Function(OfflineStateLoading value)? loading,
    TResult Function(OfflineStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class OfflineStateErrorDetails implements OfflineState {
  const factory OfflineStateErrorDetails([String? message]) =
      _$OfflineStateErrorDetails;

  String? get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfflineStateErrorDetailsCopyWith<OfflineStateErrorDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
