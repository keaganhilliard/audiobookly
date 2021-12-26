// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'downloads_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DownloadsStateTearOff {
  const _$DownloadsStateTearOff();

  DownloadsStateInitial initial() {
    return const DownloadsStateInitial();
  }

  DownloadsStateLoaded loaded({List<MediaItem>? books}) {
    return DownloadsStateLoaded(
      books: books,
    );
  }

  DownloadsStateLoading loading() {
    return const DownloadsStateLoading();
  }

  DownloadsStateErrorDetails error([String? message]) {
    return DownloadsStateErrorDetails(
      message,
    );
  }
}

/// @nodoc
const $DownloadsState = _$DownloadsStateTearOff();

/// @nodoc
mixin _$DownloadsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? books) loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? books)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
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
    required TResult Function(DownloadsStateInitial value) initial,
    required TResult Function(DownloadsStateLoaded value) loaded,
    required TResult Function(DownloadsStateLoading value) loading,
    required TResult Function(DownloadsStateErrorDetails value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DownloadsStateInitial value)? initial,
    TResult Function(DownloadsStateLoaded value)? loaded,
    TResult Function(DownloadsStateLoading value)? loading,
    TResult Function(DownloadsStateErrorDetails value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadsStateInitial value)? initial,
    TResult Function(DownloadsStateLoaded value)? loaded,
    TResult Function(DownloadsStateLoading value)? loading,
    TResult Function(DownloadsStateErrorDetails value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadsStateCopyWith<$Res> {
  factory $DownloadsStateCopyWith(
          DownloadsState value, $Res Function(DownloadsState) then) =
      _$DownloadsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$DownloadsStateCopyWithImpl<$Res>
    implements $DownloadsStateCopyWith<$Res> {
  _$DownloadsStateCopyWithImpl(this._value, this._then);

  final DownloadsState _value;
  // ignore: unused_field
  final $Res Function(DownloadsState) _then;
}

/// @nodoc
abstract class $DownloadsStateInitialCopyWith<$Res> {
  factory $DownloadsStateInitialCopyWith(DownloadsStateInitial value,
          $Res Function(DownloadsStateInitial) then) =
      _$DownloadsStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$DownloadsStateInitialCopyWithImpl<$Res>
    extends _$DownloadsStateCopyWithImpl<$Res>
    implements $DownloadsStateInitialCopyWith<$Res> {
  _$DownloadsStateInitialCopyWithImpl(
      DownloadsStateInitial _value, $Res Function(DownloadsStateInitial) _then)
      : super(_value, (v) => _then(v as DownloadsStateInitial));

  @override
  DownloadsStateInitial get _value => super._value as DownloadsStateInitial;
}

/// @nodoc

class _$DownloadsStateInitial
    with DiagnosticableTreeMixin
    implements DownloadsStateInitial {
  const _$DownloadsStateInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DownloadsState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'DownloadsState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DownloadsStateInitial);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? books)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return initial?.call();
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
    required TResult Function(DownloadsStateInitial value) initial,
    required TResult Function(DownloadsStateLoaded value) loaded,
    required TResult Function(DownloadsStateLoading value) loading,
    required TResult Function(DownloadsStateErrorDetails value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DownloadsStateInitial value)? initial,
    TResult Function(DownloadsStateLoaded value)? loaded,
    TResult Function(DownloadsStateLoading value)? loading,
    TResult Function(DownloadsStateErrorDetails value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadsStateInitial value)? initial,
    TResult Function(DownloadsStateLoaded value)? loaded,
    TResult Function(DownloadsStateLoading value)? loading,
    TResult Function(DownloadsStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class DownloadsStateInitial implements DownloadsState {
  const factory DownloadsStateInitial() = _$DownloadsStateInitial;
}

/// @nodoc
abstract class $DownloadsStateLoadedCopyWith<$Res> {
  factory $DownloadsStateLoadedCopyWith(DownloadsStateLoaded value,
          $Res Function(DownloadsStateLoaded) then) =
      _$DownloadsStateLoadedCopyWithImpl<$Res>;
  $Res call({List<MediaItem>? books});
}

/// @nodoc
class _$DownloadsStateLoadedCopyWithImpl<$Res>
    extends _$DownloadsStateCopyWithImpl<$Res>
    implements $DownloadsStateLoadedCopyWith<$Res> {
  _$DownloadsStateLoadedCopyWithImpl(
      DownloadsStateLoaded _value, $Res Function(DownloadsStateLoaded) _then)
      : super(_value, (v) => _then(v as DownloadsStateLoaded));

  @override
  DownloadsStateLoaded get _value => super._value as DownloadsStateLoaded;

  @override
  $Res call({
    Object? books = freezed,
  }) {
    return _then(DownloadsStateLoaded(
      books: books == freezed
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<MediaItem>?,
    ));
  }
}

/// @nodoc

class _$DownloadsStateLoaded
    with DiagnosticableTreeMixin
    implements DownloadsStateLoaded {
  const _$DownloadsStateLoaded({this.books});

  @override
  final List<MediaItem>? books;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DownloadsState.loaded(books: $books)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DownloadsState.loaded'))
      ..add(DiagnosticsProperty('books', books));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DownloadsStateLoaded &&
            const DeepCollectionEquality().equals(other.books, books));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(books));

  @JsonKey(ignore: true)
  @override
  $DownloadsStateLoadedCopyWith<DownloadsStateLoaded> get copyWith =>
      _$DownloadsStateLoadedCopyWithImpl<DownloadsStateLoaded>(
          this, _$identity);

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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? books)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return loaded?.call(books);
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
    required TResult Function(DownloadsStateInitial value) initial,
    required TResult Function(DownloadsStateLoaded value) loaded,
    required TResult Function(DownloadsStateLoading value) loading,
    required TResult Function(DownloadsStateErrorDetails value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DownloadsStateInitial value)? initial,
    TResult Function(DownloadsStateLoaded value)? loaded,
    TResult Function(DownloadsStateLoading value)? loading,
    TResult Function(DownloadsStateErrorDetails value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadsStateInitial value)? initial,
    TResult Function(DownloadsStateLoaded value)? loaded,
    TResult Function(DownloadsStateLoading value)? loading,
    TResult Function(DownloadsStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class DownloadsStateLoaded implements DownloadsState {
  const factory DownloadsStateLoaded({List<MediaItem>? books}) =
      _$DownloadsStateLoaded;

  List<MediaItem>? get books;
  @JsonKey(ignore: true)
  $DownloadsStateLoadedCopyWith<DownloadsStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadsStateLoadingCopyWith<$Res> {
  factory $DownloadsStateLoadingCopyWith(DownloadsStateLoading value,
          $Res Function(DownloadsStateLoading) then) =
      _$DownloadsStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$DownloadsStateLoadingCopyWithImpl<$Res>
    extends _$DownloadsStateCopyWithImpl<$Res>
    implements $DownloadsStateLoadingCopyWith<$Res> {
  _$DownloadsStateLoadingCopyWithImpl(
      DownloadsStateLoading _value, $Res Function(DownloadsStateLoading) _then)
      : super(_value, (v) => _then(v as DownloadsStateLoading));

  @override
  DownloadsStateLoading get _value => super._value as DownloadsStateLoading;
}

/// @nodoc

class _$DownloadsStateLoading
    with DiagnosticableTreeMixin
    implements DownloadsStateLoading {
  const _$DownloadsStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DownloadsState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'DownloadsState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DownloadsStateLoading);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? books)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return loading?.call();
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
    required TResult Function(DownloadsStateInitial value) initial,
    required TResult Function(DownloadsStateLoaded value) loaded,
    required TResult Function(DownloadsStateLoading value) loading,
    required TResult Function(DownloadsStateErrorDetails value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DownloadsStateInitial value)? initial,
    TResult Function(DownloadsStateLoaded value)? loaded,
    TResult Function(DownloadsStateLoading value)? loading,
    TResult Function(DownloadsStateErrorDetails value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadsStateInitial value)? initial,
    TResult Function(DownloadsStateLoaded value)? loaded,
    TResult Function(DownloadsStateLoading value)? loading,
    TResult Function(DownloadsStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class DownloadsStateLoading implements DownloadsState {
  const factory DownloadsStateLoading() = _$DownloadsStateLoading;
}

/// @nodoc
abstract class $DownloadsStateErrorDetailsCopyWith<$Res> {
  factory $DownloadsStateErrorDetailsCopyWith(DownloadsStateErrorDetails value,
          $Res Function(DownloadsStateErrorDetails) then) =
      _$DownloadsStateErrorDetailsCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class _$DownloadsStateErrorDetailsCopyWithImpl<$Res>
    extends _$DownloadsStateCopyWithImpl<$Res>
    implements $DownloadsStateErrorDetailsCopyWith<$Res> {
  _$DownloadsStateErrorDetailsCopyWithImpl(DownloadsStateErrorDetails _value,
      $Res Function(DownloadsStateErrorDetails) _then)
      : super(_value, (v) => _then(v as DownloadsStateErrorDetails));

  @override
  DownloadsStateErrorDetails get _value =>
      super._value as DownloadsStateErrorDetails;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(DownloadsStateErrorDetails(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DownloadsStateErrorDetails
    with DiagnosticableTreeMixin
    implements DownloadsStateErrorDetails {
  const _$DownloadsStateErrorDetails([this.message]);

  @override
  final String? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DownloadsState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DownloadsState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DownloadsStateErrorDetails &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  $DownloadsStateErrorDetailsCopyWith<DownloadsStateErrorDetails>
      get copyWith =>
          _$DownloadsStateErrorDetailsCopyWithImpl<DownloadsStateErrorDetails>(
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? books)? loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return error?.call(message);
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
    required TResult Function(DownloadsStateInitial value) initial,
    required TResult Function(DownloadsStateLoaded value) loaded,
    required TResult Function(DownloadsStateLoading value) loading,
    required TResult Function(DownloadsStateErrorDetails value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DownloadsStateInitial value)? initial,
    TResult Function(DownloadsStateLoaded value)? loaded,
    TResult Function(DownloadsStateLoading value)? loading,
    TResult Function(DownloadsStateErrorDetails value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadsStateInitial value)? initial,
    TResult Function(DownloadsStateLoaded value)? loaded,
    TResult Function(DownloadsStateLoading value)? loading,
    TResult Function(DownloadsStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DownloadsStateErrorDetails implements DownloadsState {
  const factory DownloadsStateErrorDetails([String? message]) =
      _$DownloadsStateErrorDetails;

  String? get message;
  @JsonKey(ignore: true)
  $DownloadsStateErrorDetailsCopyWith<DownloadsStateErrorDetails>
      get copyWith => throw _privateConstructorUsedError;
}
