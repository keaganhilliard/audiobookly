// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authors_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthorsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<MediaItem>? authors, int totalResults, int page)
        loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<MediaItem>? authors, int totalResults, int page)?
        loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? authors, int totalResults, int page)?
        loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthorsStateInitial value) initial,
    required TResult Function(AuthorsStateLoaded value) loaded,
    required TResult Function(AuthorsStateLoading value) loading,
    required TResult Function(AuthorsStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthorsStateInitial value)? initial,
    TResult? Function(AuthorsStateLoaded value)? loaded,
    TResult? Function(AuthorsStateLoading value)? loading,
    TResult? Function(AuthorsStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthorsStateInitial value)? initial,
    TResult Function(AuthorsStateLoaded value)? loaded,
    TResult Function(AuthorsStateLoading value)? loading,
    TResult Function(AuthorsStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorsStateCopyWith<$Res> {
  factory $AuthorsStateCopyWith(
          AuthorsState value, $Res Function(AuthorsState) then) =
      _$AuthorsStateCopyWithImpl<$Res, AuthorsState>;
}

/// @nodoc
class _$AuthorsStateCopyWithImpl<$Res, $Val extends AuthorsState>
    implements $AuthorsStateCopyWith<$Res> {
  _$AuthorsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthorsStateInitialImplCopyWith<$Res> {
  factory _$$AuthorsStateInitialImplCopyWith(_$AuthorsStateInitialImpl value,
          $Res Function(_$AuthorsStateInitialImpl) then) =
      __$$AuthorsStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthorsStateInitialImplCopyWithImpl<$Res>
    extends _$AuthorsStateCopyWithImpl<$Res, _$AuthorsStateInitialImpl>
    implements _$$AuthorsStateInitialImplCopyWith<$Res> {
  __$$AuthorsStateInitialImplCopyWithImpl(_$AuthorsStateInitialImpl _value,
      $Res Function(_$AuthorsStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthorsStateInitialImpl
    with DiagnosticableTreeMixin
    implements AuthorsStateInitial {
  const _$AuthorsStateInitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthorsState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthorsState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorsStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<MediaItem>? authors, int totalResults, int page)
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
    TResult? Function(List<MediaItem>? authors, int totalResults, int page)?
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
    TResult Function(List<MediaItem>? authors, int totalResults, int page)?
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
    required TResult Function(AuthorsStateInitial value) initial,
    required TResult Function(AuthorsStateLoaded value) loaded,
    required TResult Function(AuthorsStateLoading value) loading,
    required TResult Function(AuthorsStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthorsStateInitial value)? initial,
    TResult? Function(AuthorsStateLoaded value)? loaded,
    TResult? Function(AuthorsStateLoading value)? loading,
    TResult? Function(AuthorsStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthorsStateInitial value)? initial,
    TResult Function(AuthorsStateLoaded value)? loaded,
    TResult Function(AuthorsStateLoading value)? loading,
    TResult Function(AuthorsStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AuthorsStateInitial implements AuthorsState {
  const factory AuthorsStateInitial() = _$AuthorsStateInitialImpl;
}

/// @nodoc
abstract class _$$AuthorsStateLoadedImplCopyWith<$Res> {
  factory _$$AuthorsStateLoadedImplCopyWith(_$AuthorsStateLoadedImpl value,
          $Res Function(_$AuthorsStateLoadedImpl) then) =
      __$$AuthorsStateLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MediaItem>? authors, int totalResults, int page});
}

/// @nodoc
class __$$AuthorsStateLoadedImplCopyWithImpl<$Res>
    extends _$AuthorsStateCopyWithImpl<$Res, _$AuthorsStateLoadedImpl>
    implements _$$AuthorsStateLoadedImplCopyWith<$Res> {
  __$$AuthorsStateLoadedImplCopyWithImpl(_$AuthorsStateLoadedImpl _value,
      $Res Function(_$AuthorsStateLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authors = freezed,
    Object? totalResults = null,
    Object? page = null,
  }) {
    return _then(_$AuthorsStateLoadedImpl(
      authors: freezed == authors
          ? _value._authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<MediaItem>?,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AuthorsStateLoadedImpl
    with DiagnosticableTreeMixin
    implements AuthorsStateLoaded {
  const _$AuthorsStateLoadedImpl(
      {final List<MediaItem>? authors, this.totalResults = 0, this.page = 0})
      : _authors = authors;

  final List<MediaItem>? _authors;
  @override
  List<MediaItem>? get authors {
    final value = _authors;
    if (value == null) return null;
    if (_authors is EqualUnmodifiableListView) return _authors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final int totalResults;
  @override
  @JsonKey()
  final int page;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthorsState.loaded(authors: $authors, totalResults: $totalResults, page: $page)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthorsState.loaded'))
      ..add(DiagnosticsProperty('authors', authors))
      ..add(DiagnosticsProperty('totalResults', totalResults))
      ..add(DiagnosticsProperty('page', page));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorsStateLoadedImpl &&
            const DeepCollectionEquality().equals(other._authors, _authors) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_authors), totalResults, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorsStateLoadedImplCopyWith<_$AuthorsStateLoadedImpl> get copyWith =>
      __$$AuthorsStateLoadedImplCopyWithImpl<_$AuthorsStateLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<MediaItem>? authors, int totalResults, int page)
        loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return loaded(authors, totalResults, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<MediaItem>? authors, int totalResults, int page)?
        loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) {
    return loaded?.call(authors, totalResults, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? authors, int totalResults, int page)?
        loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(authors, totalResults, page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthorsStateInitial value) initial,
    required TResult Function(AuthorsStateLoaded value) loaded,
    required TResult Function(AuthorsStateLoading value) loading,
    required TResult Function(AuthorsStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthorsStateInitial value)? initial,
    TResult? Function(AuthorsStateLoaded value)? loaded,
    TResult? Function(AuthorsStateLoading value)? loading,
    TResult? Function(AuthorsStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthorsStateInitial value)? initial,
    TResult Function(AuthorsStateLoaded value)? loaded,
    TResult Function(AuthorsStateLoading value)? loading,
    TResult Function(AuthorsStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class AuthorsStateLoaded implements AuthorsState {
  const factory AuthorsStateLoaded(
      {final List<MediaItem>? authors,
      final int totalResults,
      final int page}) = _$AuthorsStateLoadedImpl;

  List<MediaItem>? get authors;
  int get totalResults;
  int get page;
  @JsonKey(ignore: true)
  _$$AuthorsStateLoadedImplCopyWith<_$AuthorsStateLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthorsStateLoadingImplCopyWith<$Res> {
  factory _$$AuthorsStateLoadingImplCopyWith(_$AuthorsStateLoadingImpl value,
          $Res Function(_$AuthorsStateLoadingImpl) then) =
      __$$AuthorsStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthorsStateLoadingImplCopyWithImpl<$Res>
    extends _$AuthorsStateCopyWithImpl<$Res, _$AuthorsStateLoadingImpl>
    implements _$$AuthorsStateLoadingImplCopyWith<$Res> {
  __$$AuthorsStateLoadingImplCopyWithImpl(_$AuthorsStateLoadingImpl _value,
      $Res Function(_$AuthorsStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthorsStateLoadingImpl
    with DiagnosticableTreeMixin
    implements AuthorsStateLoading {
  const _$AuthorsStateLoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthorsState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthorsState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorsStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<MediaItem>? authors, int totalResults, int page)
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
    TResult? Function(List<MediaItem>? authors, int totalResults, int page)?
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
    TResult Function(List<MediaItem>? authors, int totalResults, int page)?
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
    required TResult Function(AuthorsStateInitial value) initial,
    required TResult Function(AuthorsStateLoaded value) loaded,
    required TResult Function(AuthorsStateLoading value) loading,
    required TResult Function(AuthorsStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthorsStateInitial value)? initial,
    TResult? Function(AuthorsStateLoaded value)? loaded,
    TResult? Function(AuthorsStateLoading value)? loading,
    TResult? Function(AuthorsStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthorsStateInitial value)? initial,
    TResult Function(AuthorsStateLoaded value)? loaded,
    TResult Function(AuthorsStateLoading value)? loading,
    TResult Function(AuthorsStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuthorsStateLoading implements AuthorsState {
  const factory AuthorsStateLoading() = _$AuthorsStateLoadingImpl;
}

/// @nodoc
abstract class _$$AuthorsStateErrorImplCopyWith<$Res> {
  factory _$$AuthorsStateErrorImplCopyWith(_$AuthorsStateErrorImpl value,
          $Res Function(_$AuthorsStateErrorImpl) then) =
      __$$AuthorsStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$AuthorsStateErrorImplCopyWithImpl<$Res>
    extends _$AuthorsStateCopyWithImpl<$Res, _$AuthorsStateErrorImpl>
    implements _$$AuthorsStateErrorImplCopyWith<$Res> {
  __$$AuthorsStateErrorImplCopyWithImpl(_$AuthorsStateErrorImpl _value,
      $Res Function(_$AuthorsStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$AuthorsStateErrorImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthorsStateErrorImpl
    with DiagnosticableTreeMixin
    implements AuthorsStateError {
  const _$AuthorsStateErrorImpl([this.message]);

  @override
  final String? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthorsState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthorsState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorsStateErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorsStateErrorImplCopyWith<_$AuthorsStateErrorImpl> get copyWith =>
      __$$AuthorsStateErrorImplCopyWithImpl<_$AuthorsStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<MediaItem>? authors, int totalResults, int page)
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
    TResult? Function(List<MediaItem>? authors, int totalResults, int page)?
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
    TResult Function(List<MediaItem>? authors, int totalResults, int page)?
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
    required TResult Function(AuthorsStateInitial value) initial,
    required TResult Function(AuthorsStateLoaded value) loaded,
    required TResult Function(AuthorsStateLoading value) loading,
    required TResult Function(AuthorsStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthorsStateInitial value)? initial,
    TResult? Function(AuthorsStateLoaded value)? loaded,
    TResult? Function(AuthorsStateLoading value)? loading,
    TResult? Function(AuthorsStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthorsStateInitial value)? initial,
    TResult Function(AuthorsStateLoaded value)? loaded,
    TResult Function(AuthorsStateLoading value)? loading,
    TResult Function(AuthorsStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AuthorsStateError implements AuthorsState {
  const factory AuthorsStateError([final String? message]) =
      _$AuthorsStateErrorImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$AuthorsStateErrorImplCopyWith<_$AuthorsStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
