// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offline_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
    required TResult Function(OfflineStateInitial value) initial,
    required TResult Function(OfflineStateLoaded value) loaded,
    required TResult Function(OfflineStateLoading value) loading,
    required TResult Function(OfflineStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OfflineStateInitial value)? initial,
    TResult? Function(OfflineStateLoaded value)? loaded,
    TResult? Function(OfflineStateLoading value)? loading,
    TResult? Function(OfflineStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OfflineStateInitial value)? initial,
    TResult Function(OfflineStateLoaded value)? loaded,
    TResult Function(OfflineStateLoading value)? loading,
    TResult Function(OfflineStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfflineStateCopyWith<$Res> {
  factory $OfflineStateCopyWith(
          OfflineState value, $Res Function(OfflineState) then) =
      _$OfflineStateCopyWithImpl<$Res, OfflineState>;
}

/// @nodoc
class _$OfflineStateCopyWithImpl<$Res, $Val extends OfflineState>
    implements $OfflineStateCopyWith<$Res> {
  _$OfflineStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OfflineStateInitialImplCopyWith<$Res> {
  factory _$$OfflineStateInitialImplCopyWith(_$OfflineStateInitialImpl value,
          $Res Function(_$OfflineStateInitialImpl) then) =
      __$$OfflineStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OfflineStateInitialImplCopyWithImpl<$Res>
    extends _$OfflineStateCopyWithImpl<$Res, _$OfflineStateInitialImpl>
    implements _$$OfflineStateInitialImplCopyWith<$Res> {
  __$$OfflineStateInitialImplCopyWithImpl(_$OfflineStateInitialImpl _value,
      $Res Function(_$OfflineStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OfflineStateInitialImpl
    with DiagnosticableTreeMixin
    implements OfflineStateInitial {
  const _$OfflineStateInitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OfflineState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'OfflineState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfflineStateInitialImpl);
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
    required TResult Function(OfflineStateInitial value) initial,
    required TResult Function(OfflineStateLoaded value) loaded,
    required TResult Function(OfflineStateLoading value) loading,
    required TResult Function(OfflineStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OfflineStateInitial value)? initial,
    TResult? Function(OfflineStateLoaded value)? loaded,
    TResult? Function(OfflineStateLoading value)? loading,
    TResult? Function(OfflineStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OfflineStateInitial value)? initial,
    TResult Function(OfflineStateLoaded value)? loaded,
    TResult Function(OfflineStateLoading value)? loading,
    TResult Function(OfflineStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class OfflineStateInitial implements OfflineState {
  const factory OfflineStateInitial() = _$OfflineStateInitialImpl;
}

/// @nodoc
abstract class _$$OfflineStateLoadedImplCopyWith<$Res> {
  factory _$$OfflineStateLoadedImplCopyWith(_$OfflineStateLoadedImpl value,
          $Res Function(_$OfflineStateLoadedImpl) then) =
      __$$OfflineStateLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MediaItem>? books});
}

/// @nodoc
class __$$OfflineStateLoadedImplCopyWithImpl<$Res>
    extends _$OfflineStateCopyWithImpl<$Res, _$OfflineStateLoadedImpl>
    implements _$$OfflineStateLoadedImplCopyWith<$Res> {
  __$$OfflineStateLoadedImplCopyWithImpl(_$OfflineStateLoadedImpl _value,
      $Res Function(_$OfflineStateLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? books = freezed,
  }) {
    return _then(_$OfflineStateLoadedImpl(
      books: freezed == books
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<MediaItem>?,
    ));
  }
}

/// @nodoc

class _$OfflineStateLoadedImpl
    with DiagnosticableTreeMixin
    implements OfflineStateLoaded {
  const _$OfflineStateLoadedImpl({final List<MediaItem>? books})
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfflineStateLoadedImpl &&
            const DeepCollectionEquality().equals(other._books, _books));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_books));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OfflineStateLoadedImplCopyWith<_$OfflineStateLoadedImpl> get copyWith =>
      __$$OfflineStateLoadedImplCopyWithImpl<_$OfflineStateLoadedImpl>(
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
    required TResult Function(OfflineStateInitial value) initial,
    required TResult Function(OfflineStateLoaded value) loaded,
    required TResult Function(OfflineStateLoading value) loading,
    required TResult Function(OfflineStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OfflineStateInitial value)? initial,
    TResult? Function(OfflineStateLoaded value)? loaded,
    TResult? Function(OfflineStateLoading value)? loading,
    TResult? Function(OfflineStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OfflineStateInitial value)? initial,
    TResult Function(OfflineStateLoaded value)? loaded,
    TResult Function(OfflineStateLoading value)? loading,
    TResult Function(OfflineStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class OfflineStateLoaded implements OfflineState {
  const factory OfflineStateLoaded({final List<MediaItem>? books}) =
      _$OfflineStateLoadedImpl;

  List<MediaItem>? get books;
  @JsonKey(ignore: true)
  _$$OfflineStateLoadedImplCopyWith<_$OfflineStateLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OfflineStateLoadingImplCopyWith<$Res> {
  factory _$$OfflineStateLoadingImplCopyWith(_$OfflineStateLoadingImpl value,
          $Res Function(_$OfflineStateLoadingImpl) then) =
      __$$OfflineStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OfflineStateLoadingImplCopyWithImpl<$Res>
    extends _$OfflineStateCopyWithImpl<$Res, _$OfflineStateLoadingImpl>
    implements _$$OfflineStateLoadingImplCopyWith<$Res> {
  __$$OfflineStateLoadingImplCopyWithImpl(_$OfflineStateLoadingImpl _value,
      $Res Function(_$OfflineStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OfflineStateLoadingImpl
    with DiagnosticableTreeMixin
    implements OfflineStateLoading {
  const _$OfflineStateLoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OfflineState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'OfflineState.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfflineStateLoadingImpl);
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
    required TResult Function(OfflineStateInitial value) initial,
    required TResult Function(OfflineStateLoaded value) loaded,
    required TResult Function(OfflineStateLoading value) loading,
    required TResult Function(OfflineStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OfflineStateInitial value)? initial,
    TResult? Function(OfflineStateLoaded value)? loaded,
    TResult? Function(OfflineStateLoading value)? loading,
    TResult? Function(OfflineStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OfflineStateInitial value)? initial,
    TResult Function(OfflineStateLoaded value)? loaded,
    TResult Function(OfflineStateLoading value)? loading,
    TResult Function(OfflineStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class OfflineStateLoading implements OfflineState {
  const factory OfflineStateLoading() = _$OfflineStateLoadingImpl;
}

/// @nodoc
abstract class _$$OfflineStateErrorImplCopyWith<$Res> {
  factory _$$OfflineStateErrorImplCopyWith(_$OfflineStateErrorImpl value,
          $Res Function(_$OfflineStateErrorImpl) then) =
      __$$OfflineStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$OfflineStateErrorImplCopyWithImpl<$Res>
    extends _$OfflineStateCopyWithImpl<$Res, _$OfflineStateErrorImpl>
    implements _$$OfflineStateErrorImplCopyWith<$Res> {
  __$$OfflineStateErrorImplCopyWithImpl(_$OfflineStateErrorImpl _value,
      $Res Function(_$OfflineStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$OfflineStateErrorImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$OfflineStateErrorImpl
    with DiagnosticableTreeMixin
    implements OfflineStateError {
  const _$OfflineStateErrorImpl([this.message]);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfflineStateErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OfflineStateErrorImplCopyWith<_$OfflineStateErrorImpl> get copyWith =>
      __$$OfflineStateErrorImplCopyWithImpl<_$OfflineStateErrorImpl>(
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
    required TResult Function(OfflineStateInitial value) initial,
    required TResult Function(OfflineStateLoaded value) loaded,
    required TResult Function(OfflineStateLoading value) loading,
    required TResult Function(OfflineStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OfflineStateInitial value)? initial,
    TResult? Function(OfflineStateLoaded value)? loaded,
    TResult? Function(OfflineStateLoading value)? loading,
    TResult? Function(OfflineStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OfflineStateInitial value)? initial,
    TResult Function(OfflineStateLoaded value)? loaded,
    TResult Function(OfflineStateLoading value)? loading,
    TResult Function(OfflineStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class OfflineStateError implements OfflineState {
  const factory OfflineStateError([final String? message]) =
      _$OfflineStateErrorImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$OfflineStateErrorImplCopyWith<_$OfflineStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
