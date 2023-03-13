// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'books_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BooksState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<MediaItem>? books, String? currentParent, int totalItems)
        loaded,
    required TResult Function() loading,
    required TResult Function(
            String? message, String? errorDetails, String? stackTrace)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            List<MediaItem>? books, String? currentParent, int totalItems)?
        loaded,
    TResult? Function()? loading,
    TResult? Function(
            String? message, String? errorDetails, String? stackTrace)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<MediaItem>? books, String? currentParent, int totalItems)?
        loaded,
    TResult Function()? loading,
    TResult Function(String? message, String? errorDetails, String? stackTrace)?
        error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BooksStateInitial value) initial,
    required TResult Function(BooksStateLoaded value) loaded,
    required TResult Function(BooksStateLoading value) loading,
    required TResult Function(BooksStateErrorDetails value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BooksStateInitial value)? initial,
    TResult? Function(BooksStateLoaded value)? loaded,
    TResult? Function(BooksStateLoading value)? loading,
    TResult? Function(BooksStateErrorDetails value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BooksStateInitial value)? initial,
    TResult Function(BooksStateLoaded value)? loaded,
    TResult Function(BooksStateLoading value)? loading,
    TResult Function(BooksStateErrorDetails value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BooksStateCopyWith<$Res> {
  factory $BooksStateCopyWith(
          BooksState value, $Res Function(BooksState) then) =
      _$BooksStateCopyWithImpl<$Res, BooksState>;
}

/// @nodoc
class _$BooksStateCopyWithImpl<$Res, $Val extends BooksState>
    implements $BooksStateCopyWith<$Res> {
  _$BooksStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$BooksStateInitialCopyWith<$Res> {
  factory _$$BooksStateInitialCopyWith(
          _$BooksStateInitial value, $Res Function(_$BooksStateInitial) then) =
      __$$BooksStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BooksStateInitialCopyWithImpl<$Res>
    extends _$BooksStateCopyWithImpl<$Res, _$BooksStateInitial>
    implements _$$BooksStateInitialCopyWith<$Res> {
  __$$BooksStateInitialCopyWithImpl(
      _$BooksStateInitial _value, $Res Function(_$BooksStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BooksStateInitial
    with DiagnosticableTreeMixin
    implements BooksStateInitial {
  const _$BooksStateInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BooksState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'BooksState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BooksStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<MediaItem>? books, String? currentParent, int totalItems)
        loaded,
    required TResult Function() loading,
    required TResult Function(
            String? message, String? errorDetails, String? stackTrace)
        error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            List<MediaItem>? books, String? currentParent, int totalItems)?
        loaded,
    TResult? Function()? loading,
    TResult? Function(
            String? message, String? errorDetails, String? stackTrace)?
        error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<MediaItem>? books, String? currentParent, int totalItems)?
        loaded,
    TResult Function()? loading,
    TResult Function(String? message, String? errorDetails, String? stackTrace)?
        error,
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
    required TResult Function(BooksStateInitial value) initial,
    required TResult Function(BooksStateLoaded value) loaded,
    required TResult Function(BooksStateLoading value) loading,
    required TResult Function(BooksStateErrorDetails value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BooksStateInitial value)? initial,
    TResult? Function(BooksStateLoaded value)? loaded,
    TResult? Function(BooksStateLoading value)? loading,
    TResult? Function(BooksStateErrorDetails value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BooksStateInitial value)? initial,
    TResult Function(BooksStateLoaded value)? loaded,
    TResult Function(BooksStateLoading value)? loading,
    TResult Function(BooksStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class BooksStateInitial implements BooksState {
  const factory BooksStateInitial() = _$BooksStateInitial;
}

/// @nodoc
abstract class _$$BooksStateLoadedCopyWith<$Res> {
  factory _$$BooksStateLoadedCopyWith(
          _$BooksStateLoaded value, $Res Function(_$BooksStateLoaded) then) =
      __$$BooksStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MediaItem>? books, String? currentParent, int totalItems});
}

/// @nodoc
class __$$BooksStateLoadedCopyWithImpl<$Res>
    extends _$BooksStateCopyWithImpl<$Res, _$BooksStateLoaded>
    implements _$$BooksStateLoadedCopyWith<$Res> {
  __$$BooksStateLoadedCopyWithImpl(
      _$BooksStateLoaded _value, $Res Function(_$BooksStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? books = freezed,
    Object? currentParent = freezed,
    Object? totalItems = null,
  }) {
    return _then(_$BooksStateLoaded(
      books: freezed == books
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<MediaItem>?,
      currentParent: freezed == currentParent
          ? _value.currentParent
          : currentParent // ignore: cast_nullable_to_non_nullable
              as String?,
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$BooksStateLoaded
    with DiagnosticableTreeMixin
    implements BooksStateLoaded {
  const _$BooksStateLoaded(
      {final List<MediaItem>? books, this.currentParent, this.totalItems = 0})
      : _books = books;

  final List<MediaItem>? _books;
  @override
  List<MediaItem>? get books {
    final value = _books;
    if (value == null) return null;
    if (_books is EqualUnmodifiableListView) return _books;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? currentParent;
  @override
  @JsonKey()
  final int totalItems;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BooksState.loaded(books: $books, currentParent: $currentParent, totalItems: $totalItems)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BooksState.loaded'))
      ..add(DiagnosticsProperty('books', books))
      ..add(DiagnosticsProperty('currentParent', currentParent))
      ..add(DiagnosticsProperty('totalItems', totalItems));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BooksStateLoaded &&
            const DeepCollectionEquality().equals(other._books, _books) &&
            (identical(other.currentParent, currentParent) ||
                other.currentParent == currentParent) &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_books), currentParent, totalItems);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BooksStateLoadedCopyWith<_$BooksStateLoaded> get copyWith =>
      __$$BooksStateLoadedCopyWithImpl<_$BooksStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<MediaItem>? books, String? currentParent, int totalItems)
        loaded,
    required TResult Function() loading,
    required TResult Function(
            String? message, String? errorDetails, String? stackTrace)
        error,
  }) {
    return loaded(books, currentParent, totalItems);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            List<MediaItem>? books, String? currentParent, int totalItems)?
        loaded,
    TResult? Function()? loading,
    TResult? Function(
            String? message, String? errorDetails, String? stackTrace)?
        error,
  }) {
    return loaded?.call(books, currentParent, totalItems);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<MediaItem>? books, String? currentParent, int totalItems)?
        loaded,
    TResult Function()? loading,
    TResult Function(String? message, String? errorDetails, String? stackTrace)?
        error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(books, currentParent, totalItems);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BooksStateInitial value) initial,
    required TResult Function(BooksStateLoaded value) loaded,
    required TResult Function(BooksStateLoading value) loading,
    required TResult Function(BooksStateErrorDetails value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BooksStateInitial value)? initial,
    TResult? Function(BooksStateLoaded value)? loaded,
    TResult? Function(BooksStateLoading value)? loading,
    TResult? Function(BooksStateErrorDetails value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BooksStateInitial value)? initial,
    TResult Function(BooksStateLoaded value)? loaded,
    TResult Function(BooksStateLoading value)? loading,
    TResult Function(BooksStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class BooksStateLoaded implements BooksState {
  const factory BooksStateLoaded(
      {final List<MediaItem>? books,
      final String? currentParent,
      final int totalItems}) = _$BooksStateLoaded;

  List<MediaItem>? get books;
  String? get currentParent;
  int get totalItems;
  @JsonKey(ignore: true)
  _$$BooksStateLoadedCopyWith<_$BooksStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BooksStateLoadingCopyWith<$Res> {
  factory _$$BooksStateLoadingCopyWith(
          _$BooksStateLoading value, $Res Function(_$BooksStateLoading) then) =
      __$$BooksStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BooksStateLoadingCopyWithImpl<$Res>
    extends _$BooksStateCopyWithImpl<$Res, _$BooksStateLoading>
    implements _$$BooksStateLoadingCopyWith<$Res> {
  __$$BooksStateLoadingCopyWithImpl(
      _$BooksStateLoading _value, $Res Function(_$BooksStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BooksStateLoading
    with DiagnosticableTreeMixin
    implements BooksStateLoading {
  const _$BooksStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BooksState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'BooksState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BooksStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<MediaItem>? books, String? currentParent, int totalItems)
        loaded,
    required TResult Function() loading,
    required TResult Function(
            String? message, String? errorDetails, String? stackTrace)
        error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            List<MediaItem>? books, String? currentParent, int totalItems)?
        loaded,
    TResult? Function()? loading,
    TResult? Function(
            String? message, String? errorDetails, String? stackTrace)?
        error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<MediaItem>? books, String? currentParent, int totalItems)?
        loaded,
    TResult Function()? loading,
    TResult Function(String? message, String? errorDetails, String? stackTrace)?
        error,
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
    required TResult Function(BooksStateInitial value) initial,
    required TResult Function(BooksStateLoaded value) loaded,
    required TResult Function(BooksStateLoading value) loading,
    required TResult Function(BooksStateErrorDetails value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BooksStateInitial value)? initial,
    TResult? Function(BooksStateLoaded value)? loaded,
    TResult? Function(BooksStateLoading value)? loading,
    TResult? Function(BooksStateErrorDetails value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BooksStateInitial value)? initial,
    TResult Function(BooksStateLoaded value)? loaded,
    TResult Function(BooksStateLoading value)? loading,
    TResult Function(BooksStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class BooksStateLoading implements BooksState {
  const factory BooksStateLoading() = _$BooksStateLoading;
}

/// @nodoc
abstract class _$$BooksStateErrorDetailsCopyWith<$Res> {
  factory _$$BooksStateErrorDetailsCopyWith(_$BooksStateErrorDetails value,
          $Res Function(_$BooksStateErrorDetails) then) =
      __$$BooksStateErrorDetailsCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message, String? errorDetails, String? stackTrace});
}

/// @nodoc
class __$$BooksStateErrorDetailsCopyWithImpl<$Res>
    extends _$BooksStateCopyWithImpl<$Res, _$BooksStateErrorDetails>
    implements _$$BooksStateErrorDetailsCopyWith<$Res> {
  __$$BooksStateErrorDetailsCopyWithImpl(_$BooksStateErrorDetails _value,
      $Res Function(_$BooksStateErrorDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? errorDetails = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$BooksStateErrorDetails(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == errorDetails
          ? _value.errorDetails
          : errorDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$BooksStateErrorDetails
    with DiagnosticableTreeMixin
    implements BooksStateErrorDetails {
  const _$BooksStateErrorDetails(
      [this.message, this.errorDetails, this.stackTrace]);

  @override
  final String? message;
  @override
  final String? errorDetails;
  @override
  final String? stackTrace;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BooksState.error(message: $message, errorDetails: $errorDetails, stackTrace: $stackTrace)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BooksState.error'))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('errorDetails', errorDetails))
      ..add(DiagnosticsProperty('stackTrace', stackTrace));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BooksStateErrorDetails &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.errorDetails, errorDetails) ||
                other.errorDetails == errorDetails) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, message, errorDetails, stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BooksStateErrorDetailsCopyWith<_$BooksStateErrorDetails> get copyWith =>
      __$$BooksStateErrorDetailsCopyWithImpl<_$BooksStateErrorDetails>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<MediaItem>? books, String? currentParent, int totalItems)
        loaded,
    required TResult Function() loading,
    required TResult Function(
            String? message, String? errorDetails, String? stackTrace)
        error,
  }) {
    return error(message, errorDetails, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            List<MediaItem>? books, String? currentParent, int totalItems)?
        loaded,
    TResult? Function()? loading,
    TResult? Function(
            String? message, String? errorDetails, String? stackTrace)?
        error,
  }) {
    return error?.call(message, errorDetails, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<MediaItem>? books, String? currentParent, int totalItems)?
        loaded,
    TResult Function()? loading,
    TResult Function(String? message, String? errorDetails, String? stackTrace)?
        error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, errorDetails, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BooksStateInitial value) initial,
    required TResult Function(BooksStateLoaded value) loaded,
    required TResult Function(BooksStateLoading value) loading,
    required TResult Function(BooksStateErrorDetails value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BooksStateInitial value)? initial,
    TResult? Function(BooksStateLoaded value)? loaded,
    TResult? Function(BooksStateLoading value)? loading,
    TResult? Function(BooksStateErrorDetails value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BooksStateInitial value)? initial,
    TResult Function(BooksStateLoaded value)? loaded,
    TResult Function(BooksStateLoading value)? loading,
    TResult Function(BooksStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class BooksStateErrorDetails implements BooksState {
  const factory BooksStateErrorDetails(
      [final String? message,
      final String? errorDetails,
      final String? stackTrace]) = _$BooksStateErrorDetails;

  String? get message;
  String? get errorDetails;
  String? get stackTrace;
  @JsonKey(ignore: true)
  _$$BooksStateErrorDetailsCopyWith<_$BooksStateErrorDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
