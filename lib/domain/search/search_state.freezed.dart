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
abstract class _$$SearchStateInitialCopyWith<$Res> {
  factory _$$SearchStateInitialCopyWith(_$SearchStateInitial value,
          $Res Function(_$SearchStateInitial) then) =
      __$$SearchStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchStateInitialCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchStateInitial>
    implements _$$SearchStateInitialCopyWith<$Res> {
  __$$SearchStateInitialCopyWithImpl(
      _$SearchStateInitial _value, $Res Function(_$SearchStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SearchStateInitial
    with DiagnosticableTreeMixin
    implements SearchStateInitial {
  const _$SearchStateInitial();

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
        (other.runtimeType == runtimeType && other is _$SearchStateInitial);
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
  const factory SearchStateInitial() = _$SearchStateInitial;
}

/// @nodoc
abstract class _$$SearchStateLoadedCopyWith<$Res> {
  factory _$$SearchStateLoadedCopyWith(
          _$SearchStateLoaded value, $Res Function(_$SearchStateLoaded) then) =
      __$$SearchStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<MediaItem>? authorResults,
      List<MediaItem>? bookResults,
      List<MediaItem>? seriesResults});
}

/// @nodoc
class __$$SearchStateLoadedCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchStateLoaded>
    implements _$$SearchStateLoadedCopyWith<$Res> {
  __$$SearchStateLoadedCopyWithImpl(
      _$SearchStateLoaded _value, $Res Function(_$SearchStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorResults = freezed,
    Object? bookResults = freezed,
    Object? seriesResults = freezed,
  }) {
    return _then(_$SearchStateLoaded(
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

class _$SearchStateLoaded
    with DiagnosticableTreeMixin
    implements SearchStateLoaded {
  const _$SearchStateLoaded(
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
            other is _$SearchStateLoaded &&
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
  _$$SearchStateLoadedCopyWith<_$SearchStateLoaded> get copyWith =>
      __$$SearchStateLoadedCopyWithImpl<_$SearchStateLoaded>(this, _$identity);

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
      final List<MediaItem>? seriesResults}) = _$SearchStateLoaded;

  List<MediaItem>? get authorResults;
  List<MediaItem>? get bookResults;
  List<MediaItem>? get seriesResults;
  @JsonKey(ignore: true)
  _$$SearchStateLoadedCopyWith<_$SearchStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchStateLoadingCopyWith<$Res> {
  factory _$$SearchStateLoadingCopyWith(_$SearchStateLoading value,
          $Res Function(_$SearchStateLoading) then) =
      __$$SearchStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchStateLoadingCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchStateLoading>
    implements _$$SearchStateLoadingCopyWith<$Res> {
  __$$SearchStateLoadingCopyWithImpl(
      _$SearchStateLoading _value, $Res Function(_$SearchStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SearchStateLoading
    with DiagnosticableTreeMixin
    implements SearchStateLoading {
  const _$SearchStateLoading();

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
        (other.runtimeType == runtimeType && other is _$SearchStateLoading);
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
  const factory SearchStateLoading() = _$SearchStateLoading;
}

/// @nodoc
abstract class _$$SearchStateErrorDetailsCopyWith<$Res> {
  factory _$$SearchStateErrorDetailsCopyWith(_$SearchStateErrorDetails value,
          $Res Function(_$SearchStateErrorDetails) then) =
      __$$SearchStateErrorDetailsCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$SearchStateErrorDetailsCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchStateErrorDetails>
    implements _$$SearchStateErrorDetailsCopyWith<$Res> {
  __$$SearchStateErrorDetailsCopyWithImpl(_$SearchStateErrorDetails _value,
      $Res Function(_$SearchStateErrorDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$SearchStateErrorDetails(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SearchStateErrorDetails
    with DiagnosticableTreeMixin
    implements SearchStateErrorDetails {
  const _$SearchStateErrorDetails([this.message]);

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
            other is _$SearchStateErrorDetails &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchStateErrorDetailsCopyWith<_$SearchStateErrorDetails> get copyWith =>
      __$$SearchStateErrorDetailsCopyWithImpl<_$SearchStateErrorDetails>(
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
      _$SearchStateErrorDetails;

  String? get message;
  @JsonKey(ignore: true)
  _$$SearchStateErrorDetailsCopyWith<_$SearchStateErrorDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
