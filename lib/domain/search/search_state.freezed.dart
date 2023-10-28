// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? authorResults,
            List<MediaItem>? bookResults, List<MediaItem>? seriesResults)
        loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<MediaItem>? authorResults,
            List<MediaItem>? bookResults, List<MediaItem>? seriesResults)?
        loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? authorResults,
            List<MediaItem>? bookResults, List<MediaItem>? seriesResults)?
        loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchStateInitial value) initial,
    required TResult Function(SearchStateLoaded value) loaded,
    required TResult Function(SearchStateLoading value) loading,
    required TResult Function(SearchStateErrorDetails value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchStateInitial value)? initial,
    TResult? Function(SearchStateLoaded value)? loaded,
    TResult? Function(SearchStateLoading value)? loading,
    TResult? Function(SearchStateErrorDetails value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchStateInitial value)? initial,
    TResult Function(SearchStateLoaded value)? loaded,
    TResult Function(SearchStateLoading value)? loading,
    TResult Function(SearchStateErrorDetails value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SearchStateInitialImplCopyWith<$Res> {
  factory _$$SearchStateInitialImplCopyWith(_$SearchStateInitialImpl value,
          $Res Function(_$SearchStateInitialImpl) then) =
      __$$SearchStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchStateInitialImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchStateInitialImpl>
    implements _$$SearchStateInitialImplCopyWith<$Res> {
  __$$SearchStateInitialImplCopyWithImpl(_$SearchStateInitialImpl _value,
      $Res Function(_$SearchStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SearchStateInitialImpl
    with DiagnosticableTreeMixin
    implements SearchStateInitial {
  const _$SearchStateInitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SearchState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SearchStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? authorResults,
            List<MediaItem>? bookResults, List<MediaItem>? seriesResults)
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
    TResult? Function(List<MediaItem>? authorResults,
            List<MediaItem>? bookResults, List<MediaItem>? seriesResults)?
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
    TResult Function(List<MediaItem>? authorResults,
            List<MediaItem>? bookResults, List<MediaItem>? seriesResults)?
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
    required TResult Function(SearchStateInitial value) initial,
    required TResult Function(SearchStateLoaded value) loaded,
    required TResult Function(SearchStateLoading value) loading,
    required TResult Function(SearchStateErrorDetails value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchStateInitial value)? initial,
    TResult? Function(SearchStateLoaded value)? loaded,
    TResult? Function(SearchStateLoading value)? loading,
    TResult? Function(SearchStateErrorDetails value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchStateInitial value)? initial,
    TResult Function(SearchStateLoaded value)? loaded,
    TResult Function(SearchStateLoading value)? loading,
    TResult Function(SearchStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SearchStateInitial implements SearchState {
  const factory SearchStateInitial() = _$SearchStateInitialImpl;
}

/// @nodoc
abstract class _$$SearchStateLoadedImplCopyWith<$Res> {
  factory _$$SearchStateLoadedImplCopyWith(_$SearchStateLoadedImpl value,
          $Res Function(_$SearchStateLoadedImpl) then) =
      __$$SearchStateLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<MediaItem>? authorResults,
      List<MediaItem>? bookResults,
      List<MediaItem>? seriesResults});
}

/// @nodoc
class __$$SearchStateLoadedImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchStateLoadedImpl>
    implements _$$SearchStateLoadedImplCopyWith<$Res> {
  __$$SearchStateLoadedImplCopyWithImpl(_$SearchStateLoadedImpl _value,
      $Res Function(_$SearchStateLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorResults = freezed,
    Object? bookResults = freezed,
    Object? seriesResults = freezed,
  }) {
    return _then(_$SearchStateLoadedImpl(
      authorResults: freezed == authorResults
          ? _value._authorResults
          : authorResults // ignore: cast_nullable_to_non_nullable
              as List<MediaItem>?,
      bookResults: freezed == bookResults
          ? _value._bookResults
          : bookResults // ignore: cast_nullable_to_non_nullable
              as List<MediaItem>?,
      seriesResults: freezed == seriesResults
          ? _value._seriesResults
          : seriesResults // ignore: cast_nullable_to_non_nullable
              as List<MediaItem>?,
    ));
  }
}

/// @nodoc

class _$SearchStateLoadedImpl
    with DiagnosticableTreeMixin
    implements SearchStateLoaded {
  const _$SearchStateLoadedImpl(
      {final List<MediaItem>? authorResults,
      final List<MediaItem>? bookResults,
      final List<MediaItem>? seriesResults})
      : _authorResults = authorResults,
        _bookResults = bookResults,
        _seriesResults = seriesResults;

  final List<MediaItem>? _authorResults;
  @override
  List<MediaItem>? get authorResults {
    final value = _authorResults;
    if (value == null) return null;
    if (_authorResults is EqualUnmodifiableListView) return _authorResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MediaItem>? _bookResults;
  @override
  List<MediaItem>? get bookResults {
    final value = _bookResults;
    if (value == null) return null;
    if (_bookResults is EqualUnmodifiableListView) return _bookResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MediaItem>? _seriesResults;
  @override
  List<MediaItem>? get seriesResults {
    final value = _seriesResults;
    if (value == null) return null;
    if (_seriesResults is EqualUnmodifiableListView) return _seriesResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchState.loaded(authorResults: $authorResults, bookResults: $bookResults, seriesResults: $seriesResults)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SearchState.loaded'))
      ..add(DiagnosticsProperty('authorResults', authorResults))
      ..add(DiagnosticsProperty('bookResults', bookResults))
      ..add(DiagnosticsProperty('seriesResults', seriesResults));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchStateLoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._authorResults, _authorResults) &&
            const DeepCollectionEquality()
                .equals(other._bookResults, _bookResults) &&
            const DeepCollectionEquality()
                .equals(other._seriesResults, _seriesResults));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_authorResults),
      const DeepCollectionEquality().hash(_bookResults),
      const DeepCollectionEquality().hash(_seriesResults));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchStateLoadedImplCopyWith<_$SearchStateLoadedImpl> get copyWith =>
      __$$SearchStateLoadedImplCopyWithImpl<_$SearchStateLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? authorResults,
            List<MediaItem>? bookResults, List<MediaItem>? seriesResults)
        loaded,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return loaded(authorResults, bookResults, seriesResults);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<MediaItem>? authorResults,
            List<MediaItem>? bookResults, List<MediaItem>? seriesResults)?
        loaded,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) {
    return loaded?.call(authorResults, bookResults, seriesResults);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<MediaItem>? authorResults,
            List<MediaItem>? bookResults, List<MediaItem>? seriesResults)?
        loaded,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(authorResults, bookResults, seriesResults);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchStateInitial value) initial,
    required TResult Function(SearchStateLoaded value) loaded,
    required TResult Function(SearchStateLoading value) loading,
    required TResult Function(SearchStateErrorDetails value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchStateInitial value)? initial,
    TResult? Function(SearchStateLoaded value)? loaded,
    TResult? Function(SearchStateLoading value)? loading,
    TResult? Function(SearchStateErrorDetails value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchStateInitial value)? initial,
    TResult Function(SearchStateLoaded value)? loaded,
    TResult Function(SearchStateLoading value)? loading,
    TResult Function(SearchStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class SearchStateLoaded implements SearchState {
  const factory SearchStateLoaded(
      {final List<MediaItem>? authorResults,
      final List<MediaItem>? bookResults,
      final List<MediaItem>? seriesResults}) = _$SearchStateLoadedImpl;

  List<MediaItem>? get authorResults;
  List<MediaItem>? get bookResults;
  List<MediaItem>? get seriesResults;
  @JsonKey(ignore: true)
  _$$SearchStateLoadedImplCopyWith<_$SearchStateLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchStateLoadingImplCopyWith<$Res> {
  factory _$$SearchStateLoadingImplCopyWith(_$SearchStateLoadingImpl value,
          $Res Function(_$SearchStateLoadingImpl) then) =
      __$$SearchStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchStateLoadingImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchStateLoadingImpl>
    implements _$$SearchStateLoadingImplCopyWith<$Res> {
  __$$SearchStateLoadingImplCopyWithImpl(_$SearchStateLoadingImpl _value,
      $Res Function(_$SearchStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SearchStateLoadingImpl
    with DiagnosticableTreeMixin
    implements SearchStateLoading {
  const _$SearchStateLoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SearchState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SearchStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? authorResults,
            List<MediaItem>? bookResults, List<MediaItem>? seriesResults)
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
    TResult? Function(List<MediaItem>? authorResults,
            List<MediaItem>? bookResults, List<MediaItem>? seriesResults)?
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
    TResult Function(List<MediaItem>? authorResults,
            List<MediaItem>? bookResults, List<MediaItem>? seriesResults)?
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
    required TResult Function(SearchStateInitial value) initial,
    required TResult Function(SearchStateLoaded value) loaded,
    required TResult Function(SearchStateLoading value) loading,
    required TResult Function(SearchStateErrorDetails value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchStateInitial value)? initial,
    TResult? Function(SearchStateLoaded value)? loaded,
    TResult? Function(SearchStateLoading value)? loading,
    TResult? Function(SearchStateErrorDetails value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchStateInitial value)? initial,
    TResult Function(SearchStateLoaded value)? loaded,
    TResult Function(SearchStateLoading value)? loading,
    TResult Function(SearchStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SearchStateLoading implements SearchState {
  const factory SearchStateLoading() = _$SearchStateLoadingImpl;
}

/// @nodoc
abstract class _$$SearchStateErrorDetailsImplCopyWith<$Res> {
  factory _$$SearchStateErrorDetailsImplCopyWith(
          _$SearchStateErrorDetailsImpl value,
          $Res Function(_$SearchStateErrorDetailsImpl) then) =
      __$$SearchStateErrorDetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$SearchStateErrorDetailsImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchStateErrorDetailsImpl>
    implements _$$SearchStateErrorDetailsImplCopyWith<$Res> {
  __$$SearchStateErrorDetailsImplCopyWithImpl(
      _$SearchStateErrorDetailsImpl _value,
      $Res Function(_$SearchStateErrorDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$SearchStateErrorDetailsImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SearchStateErrorDetailsImpl
    with DiagnosticableTreeMixin
    implements SearchStateErrorDetails {
  const _$SearchStateErrorDetailsImpl([this.message]);

  @override
  final String? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SearchState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchStateErrorDetailsImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchStateErrorDetailsImplCopyWith<_$SearchStateErrorDetailsImpl>
      get copyWith => __$$SearchStateErrorDetailsImplCopyWithImpl<
          _$SearchStateErrorDetailsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<MediaItem>? authorResults,
            List<MediaItem>? bookResults, List<MediaItem>? seriesResults)
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
    TResult? Function(List<MediaItem>? authorResults,
            List<MediaItem>? bookResults, List<MediaItem>? seriesResults)?
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
    TResult Function(List<MediaItem>? authorResults,
            List<MediaItem>? bookResults, List<MediaItem>? seriesResults)?
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
    required TResult Function(SearchStateInitial value) initial,
    required TResult Function(SearchStateLoaded value) loaded,
    required TResult Function(SearchStateLoading value) loading,
    required TResult Function(SearchStateErrorDetails value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchStateInitial value)? initial,
    TResult? Function(SearchStateLoaded value)? loaded,
    TResult? Function(SearchStateLoading value)? loading,
    TResult? Function(SearchStateErrorDetails value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchStateInitial value)? initial,
    TResult Function(SearchStateLoaded value)? loaded,
    TResult Function(SearchStateLoading value)? loading,
    TResult Function(SearchStateErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SearchStateErrorDetails implements SearchState {
  const factory SearchStateErrorDetails([final String? message]) =
      _$SearchStateErrorDetailsImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$SearchStateErrorDetailsImplCopyWith<_$SearchStateErrorDetailsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
