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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
    required TResult Function(BooksStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BooksStateInitial value)? initial,
    TResult? Function(BooksStateLoaded value)? loaded,
    TResult? Function(BooksStateLoading value)? loading,
    TResult? Function(BooksStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BooksStateInitial value)? initial,
    TResult Function(BooksStateLoaded value)? loaded,
    TResult Function(BooksStateLoading value)? loading,
    TResult Function(BooksStateError value)? error,
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
abstract class _$$BooksStateInitialImplCopyWith<$Res> {
  factory _$$BooksStateInitialImplCopyWith(_$BooksStateInitialImpl value,
          $Res Function(_$BooksStateInitialImpl) then) =
      __$$BooksStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BooksStateInitialImplCopyWithImpl<$Res>
    extends _$BooksStateCopyWithImpl<$Res, _$BooksStateInitialImpl>
    implements _$$BooksStateInitialImplCopyWith<$Res> {
  __$$BooksStateInitialImplCopyWithImpl(_$BooksStateInitialImpl _value,
      $Res Function(_$BooksStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BooksStateInitialImpl
    with DiagnosticableTreeMixin
    implements BooksStateInitial {
  const _$BooksStateInitialImpl();

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BooksStateInitialImpl);
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
    required TResult Function(BooksStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BooksStateInitial value)? initial,
    TResult? Function(BooksStateLoaded value)? loaded,
    TResult? Function(BooksStateLoading value)? loading,
    TResult? Function(BooksStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BooksStateInitial value)? initial,
    TResult Function(BooksStateLoaded value)? loaded,
    TResult Function(BooksStateLoading value)? loading,
    TResult Function(BooksStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class BooksStateInitial implements BooksState {
  const factory BooksStateInitial() = _$BooksStateInitialImpl;
}

/// @nodoc
abstract class _$$BooksStateLoadedImplCopyWith<$Res> {
  factory _$$BooksStateLoadedImplCopyWith(_$BooksStateLoadedImpl value,
          $Res Function(_$BooksStateLoadedImpl) then) =
      __$$BooksStateLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MediaItem>? books, String? currentParent, int totalItems});
}

/// @nodoc
class __$$BooksStateLoadedImplCopyWithImpl<$Res>
    extends _$BooksStateCopyWithImpl<$Res, _$BooksStateLoadedImpl>
    implements _$$BooksStateLoadedImplCopyWith<$Res> {
  __$$BooksStateLoadedImplCopyWithImpl(_$BooksStateLoadedImpl _value,
      $Res Function(_$BooksStateLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? books = freezed,
    Object? currentParent = freezed,
    Object? totalItems = null,
  }) {
    return _then(_$BooksStateLoadedImpl(
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

class _$BooksStateLoadedImpl
    with DiagnosticableTreeMixin
    implements BooksStateLoaded {
  const _$BooksStateLoadedImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BooksStateLoadedImpl &&
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
  _$$BooksStateLoadedImplCopyWith<_$BooksStateLoadedImpl> get copyWith =>
      __$$BooksStateLoadedImplCopyWithImpl<_$BooksStateLoadedImpl>(
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
    required TResult Function(BooksStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BooksStateInitial value)? initial,
    TResult? Function(BooksStateLoaded value)? loaded,
    TResult? Function(BooksStateLoading value)? loading,
    TResult? Function(BooksStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BooksStateInitial value)? initial,
    TResult Function(BooksStateLoaded value)? loaded,
    TResult Function(BooksStateLoading value)? loading,
    TResult Function(BooksStateError value)? error,
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
      final int totalItems}) = _$BooksStateLoadedImpl;

  List<MediaItem>? get books;
  String? get currentParent;
  int get totalItems;
  @JsonKey(ignore: true)
  _$$BooksStateLoadedImplCopyWith<_$BooksStateLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BooksStateLoadingImplCopyWith<$Res> {
  factory _$$BooksStateLoadingImplCopyWith(_$BooksStateLoadingImpl value,
          $Res Function(_$BooksStateLoadingImpl) then) =
      __$$BooksStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BooksStateLoadingImplCopyWithImpl<$Res>
    extends _$BooksStateCopyWithImpl<$Res, _$BooksStateLoadingImpl>
    implements _$$BooksStateLoadingImplCopyWith<$Res> {
  __$$BooksStateLoadingImplCopyWithImpl(_$BooksStateLoadingImpl _value,
      $Res Function(_$BooksStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BooksStateLoadingImpl
    with DiagnosticableTreeMixin
    implements BooksStateLoading {
  const _$BooksStateLoadingImpl();

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BooksStateLoadingImpl);
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
    required TResult Function(BooksStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BooksStateInitial value)? initial,
    TResult? Function(BooksStateLoaded value)? loaded,
    TResult? Function(BooksStateLoading value)? loading,
    TResult? Function(BooksStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BooksStateInitial value)? initial,
    TResult Function(BooksStateLoaded value)? loaded,
    TResult Function(BooksStateLoading value)? loading,
    TResult Function(BooksStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class BooksStateLoading implements BooksState {
  const factory BooksStateLoading() = _$BooksStateLoadingImpl;
}

/// @nodoc
abstract class _$$BooksStateErrorImplCopyWith<$Res> {
  factory _$$BooksStateErrorImplCopyWith(_$BooksStateErrorImpl value,
          $Res Function(_$BooksStateErrorImpl) then) =
      __$$BooksStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message, String? errorDetails, String? stackTrace});
}

/// @nodoc
class __$$BooksStateErrorImplCopyWithImpl<$Res>
    extends _$BooksStateCopyWithImpl<$Res, _$BooksStateErrorImpl>
    implements _$$BooksStateErrorImplCopyWith<$Res> {
  __$$BooksStateErrorImplCopyWithImpl(
      _$BooksStateErrorImpl _value, $Res Function(_$BooksStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? errorDetails = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$BooksStateErrorImpl(
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

class _$BooksStateErrorImpl
    with DiagnosticableTreeMixin
    implements BooksStateError {
  const _$BooksStateErrorImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BooksStateErrorImpl &&
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
  _$$BooksStateErrorImplCopyWith<_$BooksStateErrorImpl> get copyWith =>
      __$$BooksStateErrorImplCopyWithImpl<_$BooksStateErrorImpl>(
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
    required TResult Function(BooksStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BooksStateInitial value)? initial,
    TResult? Function(BooksStateLoaded value)? loaded,
    TResult? Function(BooksStateLoading value)? loading,
    TResult? Function(BooksStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BooksStateInitial value)? initial,
    TResult Function(BooksStateLoaded value)? loaded,
    TResult Function(BooksStateLoading value)? loading,
    TResult Function(BooksStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class BooksStateError implements BooksState {
  const factory BooksStateError(
      [final String? message,
      final String? errorDetails,
      final String? stackTrace]) = _$BooksStateErrorImpl;

  String? get message;
  String? get errorDetails;
  String? get stackTrace;
  @JsonKey(ignore: true)
  _$$BooksStateErrorImplCopyWith<_$BooksStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
