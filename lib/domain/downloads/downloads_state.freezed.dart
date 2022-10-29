// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'downloads_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
    TResult? Function()? initial,
    TResult? Function(List<MediaItem>? books)? loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
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
    TResult? Function(DownloadsStateInitial value)? initial,
    TResult? Function(DownloadsStateLoaded value)? loaded,
    TResult? Function(DownloadsStateLoading value)? loading,
    TResult? Function(DownloadsStateErrorDetails value)? error,
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
      _$DownloadsStateCopyWithImpl<$Res, DownloadsState>;
}

/// @nodoc
class _$DownloadsStateCopyWithImpl<$Res, $Val extends DownloadsState>
    implements $DownloadsStateCopyWith<$Res> {
  _$DownloadsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DownloadsStateInitialCopyWith<$Res> {
  factory _$$DownloadsStateInitialCopyWith(_$DownloadsStateInitial value,
          $Res Function(_$DownloadsStateInitial) then) =
      __$$DownloadsStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DownloadsStateInitialCopyWithImpl<$Res>
    extends _$DownloadsStateCopyWithImpl<$Res, _$DownloadsStateInitial>
    implements _$$DownloadsStateInitialCopyWith<$Res> {
  __$$DownloadsStateInitialCopyWithImpl(_$DownloadsStateInitial _value,
      $Res Function(_$DownloadsStateInitial) _then)
      : super(_value, _then);
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
    properties.add(DiagnosticsProperty('type', 'DownloadsState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DownloadsStateInitial);
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
    TResult? Function()? initial,
    TResult? Function(List<MediaItem>? books)? loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
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
    TResult? Function(DownloadsStateInitial value)? initial,
    TResult? Function(DownloadsStateLoaded value)? loaded,
    TResult? Function(DownloadsStateLoading value)? loading,
    TResult? Function(DownloadsStateErrorDetails value)? error,
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
abstract class _$$DownloadsStateLoadedCopyWith<$Res> {
  factory _$$DownloadsStateLoadedCopyWith(_$DownloadsStateLoaded value,
          $Res Function(_$DownloadsStateLoaded) then) =
      __$$DownloadsStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MediaItem>? books});
}

/// @nodoc
class __$$DownloadsStateLoadedCopyWithImpl<$Res>
    extends _$DownloadsStateCopyWithImpl<$Res, _$DownloadsStateLoaded>
    implements _$$DownloadsStateLoadedCopyWith<$Res> {
  __$$DownloadsStateLoadedCopyWithImpl(_$DownloadsStateLoaded _value,
      $Res Function(_$DownloadsStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? books = freezed,
  }) {
    return _then(_$DownloadsStateLoaded(
      books: freezed == books
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<MediaItem>?,
    ));
  }
}

/// @nodoc

class _$DownloadsStateLoaded
    with DiagnosticableTreeMixin
    implements DownloadsStateLoaded {
  const _$DownloadsStateLoaded({final List<MediaItem>? books}) : _books = books;

  final List<MediaItem>? _books;
  @override
  List<MediaItem>? get books {
    final value = _books;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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
            other is _$DownloadsStateLoaded &&
            const DeepCollectionEquality().equals(other._books, _books));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_books));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadsStateLoadedCopyWith<_$DownloadsStateLoaded> get copyWith =>
      __$$DownloadsStateLoadedCopyWithImpl<_$DownloadsStateLoaded>(
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
    TResult? Function()? initial,
    TResult? Function(List<MediaItem>? books)? loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
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
    TResult? Function(DownloadsStateInitial value)? initial,
    TResult? Function(DownloadsStateLoaded value)? loaded,
    TResult? Function(DownloadsStateLoading value)? loading,
    TResult? Function(DownloadsStateErrorDetails value)? error,
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
  const factory DownloadsStateLoaded({final List<MediaItem>? books}) =
      _$DownloadsStateLoaded;

  List<MediaItem>? get books;
  @JsonKey(ignore: true)
  _$$DownloadsStateLoadedCopyWith<_$DownloadsStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DownloadsStateLoadingCopyWith<$Res> {
  factory _$$DownloadsStateLoadingCopyWith(_$DownloadsStateLoading value,
          $Res Function(_$DownloadsStateLoading) then) =
      __$$DownloadsStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DownloadsStateLoadingCopyWithImpl<$Res>
    extends _$DownloadsStateCopyWithImpl<$Res, _$DownloadsStateLoading>
    implements _$$DownloadsStateLoadingCopyWith<$Res> {
  __$$DownloadsStateLoadingCopyWithImpl(_$DownloadsStateLoading _value,
      $Res Function(_$DownloadsStateLoading) _then)
      : super(_value, _then);
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
    properties.add(DiagnosticsProperty('type', 'DownloadsState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DownloadsStateLoading);
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
    TResult? Function()? initial,
    TResult? Function(List<MediaItem>? books)? loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
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
    TResult? Function(DownloadsStateInitial value)? initial,
    TResult? Function(DownloadsStateLoaded value)? loaded,
    TResult? Function(DownloadsStateLoading value)? loading,
    TResult? Function(DownloadsStateErrorDetails value)? error,
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
abstract class _$$DownloadsStateErrorDetailsCopyWith<$Res> {
  factory _$$DownloadsStateErrorDetailsCopyWith(
          _$DownloadsStateErrorDetails value,
          $Res Function(_$DownloadsStateErrorDetails) then) =
      __$$DownloadsStateErrorDetailsCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$DownloadsStateErrorDetailsCopyWithImpl<$Res>
    extends _$DownloadsStateCopyWithImpl<$Res, _$DownloadsStateErrorDetails>
    implements _$$DownloadsStateErrorDetailsCopyWith<$Res> {
  __$$DownloadsStateErrorDetailsCopyWithImpl(
      _$DownloadsStateErrorDetails _value,
      $Res Function(_$DownloadsStateErrorDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$DownloadsStateErrorDetails(
      freezed == message
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
            other is _$DownloadsStateErrorDetails &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadsStateErrorDetailsCopyWith<_$DownloadsStateErrorDetails>
      get copyWith => __$$DownloadsStateErrorDetailsCopyWithImpl<
          _$DownloadsStateErrorDetails>(this, _$identity);

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
    TResult? Function()? initial,
    TResult? Function(List<MediaItem>? books)? loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
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
    TResult? Function(DownloadsStateInitial value)? initial,
    TResult? Function(DownloadsStateLoaded value)? loaded,
    TResult? Function(DownloadsStateLoading value)? loading,
    TResult? Function(DownloadsStateErrorDetails value)? error,
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
  const factory DownloadsStateErrorDetails([final String? message]) =
      _$DownloadsStateErrorDetails;

  String? get message;
  @JsonKey(ignore: true)
  _$$DownloadsStateErrorDetailsCopyWith<_$DownloadsStateErrorDetails>
      get copyWith => throw _privateConstructorUsedError;
}
