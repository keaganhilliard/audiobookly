// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'books_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$BooksStateTearOff {
  const _$BooksStateTearOff();

// ignore: unused_element
  BooksStateInitial initial() {
    return const BooksStateInitial();
  }

// ignore: unused_element
  BooksStateLoaded loaded({List<MediaItem> books, String currentParent}) {
    return BooksStateLoaded(
      books: books,
      currentParent: currentParent,
    );
  }

// ignore: unused_element
  BooksStateLoading loading() {
    return const BooksStateLoading();
  }

// ignore: unused_element
  BooksStateErrorDetails error([String message]) {
    return BooksStateErrorDetails(
      message,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $BooksState = _$BooksStateTearOff();

/// @nodoc
mixin _$BooksState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loaded(List<MediaItem> books, String currentParent),
    @required TResult loading(),
    @required TResult error(String message),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loaded(List<MediaItem> books, String currentParent),
    TResult loading(),
    TResult error(String message),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(BooksStateInitial value),
    @required TResult loaded(BooksStateLoaded value),
    @required TResult loading(BooksStateLoading value),
    @required TResult error(BooksStateErrorDetails value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(BooksStateInitial value),
    TResult loaded(BooksStateLoaded value),
    TResult loading(BooksStateLoading value),
    TResult error(BooksStateErrorDetails value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $BooksStateCopyWith<$Res> {
  factory $BooksStateCopyWith(
          BooksState value, $Res Function(BooksState) then) =
      _$BooksStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$BooksStateCopyWithImpl<$Res> implements $BooksStateCopyWith<$Res> {
  _$BooksStateCopyWithImpl(this._value, this._then);

  final BooksState _value;
  // ignore: unused_field
  final $Res Function(BooksState) _then;
}

/// @nodoc
abstract class $BooksStateInitialCopyWith<$Res> {
  factory $BooksStateInitialCopyWith(
          BooksStateInitial value, $Res Function(BooksStateInitial) then) =
      _$BooksStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$BooksStateInitialCopyWithImpl<$Res>
    extends _$BooksStateCopyWithImpl<$Res>
    implements $BooksStateInitialCopyWith<$Res> {
  _$BooksStateInitialCopyWithImpl(
      BooksStateInitial _value, $Res Function(BooksStateInitial) _then)
      : super(_value, (v) => _then(v as BooksStateInitial));

  @override
  BooksStateInitial get _value => super._value as BooksStateInitial;
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
    properties..add(DiagnosticsProperty('type', 'BooksState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BooksStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loaded(List<MediaItem> books, String currentParent),
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
    TResult loaded(List<MediaItem> books, String currentParent),
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
    @required TResult initial(BooksStateInitial value),
    @required TResult loaded(BooksStateLoaded value),
    @required TResult loading(BooksStateLoading value),
    @required TResult error(BooksStateErrorDetails value),
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
    TResult initial(BooksStateInitial value),
    TResult loaded(BooksStateLoaded value),
    TResult loading(BooksStateLoading value),
    TResult error(BooksStateErrorDetails value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
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
abstract class $BooksStateLoadedCopyWith<$Res> {
  factory $BooksStateLoadedCopyWith(
          BooksStateLoaded value, $Res Function(BooksStateLoaded) then) =
      _$BooksStateLoadedCopyWithImpl<$Res>;
  $Res call({List<MediaItem> books, String currentParent});
}

/// @nodoc
class _$BooksStateLoadedCopyWithImpl<$Res>
    extends _$BooksStateCopyWithImpl<$Res>
    implements $BooksStateLoadedCopyWith<$Res> {
  _$BooksStateLoadedCopyWithImpl(
      BooksStateLoaded _value, $Res Function(BooksStateLoaded) _then)
      : super(_value, (v) => _then(v as BooksStateLoaded));

  @override
  BooksStateLoaded get _value => super._value as BooksStateLoaded;

  @override
  $Res call({
    Object books = freezed,
    Object currentParent = freezed,
  }) {
    return _then(BooksStateLoaded(
      books: books == freezed ? _value.books : books as List<MediaItem>,
      currentParent: currentParent == freezed
          ? _value.currentParent
          : currentParent as String,
    ));
  }
}

/// @nodoc
class _$BooksStateLoaded
    with DiagnosticableTreeMixin
    implements BooksStateLoaded {
  const _$BooksStateLoaded({this.books, this.currentParent});

  @override
  final List<MediaItem> books;
  @override
  final String currentParent;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BooksState.loaded(books: $books, currentParent: $currentParent)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BooksState.loaded'))
      ..add(DiagnosticsProperty('books', books))
      ..add(DiagnosticsProperty('currentParent', currentParent));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BooksStateLoaded &&
            (identical(other.books, books) ||
                const DeepCollectionEquality().equals(other.books, books)) &&
            (identical(other.currentParent, currentParent) ||
                const DeepCollectionEquality()
                    .equals(other.currentParent, currentParent)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(books) ^
      const DeepCollectionEquality().hash(currentParent);

  @JsonKey(ignore: true)
  @override
  $BooksStateLoadedCopyWith<BooksStateLoaded> get copyWith =>
      _$BooksStateLoadedCopyWithImpl<BooksStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loaded(List<MediaItem> books, String currentParent),
    @required TResult loading(),
    @required TResult error(String message),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    return loaded(books, currentParent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loaded(List<MediaItem> books, String currentParent),
    TResult loading(),
    TResult error(String message),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(books, currentParent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(BooksStateInitial value),
    @required TResult loaded(BooksStateLoaded value),
    @required TResult loading(BooksStateLoading value),
    @required TResult error(BooksStateErrorDetails value),
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
    TResult initial(BooksStateInitial value),
    TResult loaded(BooksStateLoaded value),
    TResult loading(BooksStateLoading value),
    TResult error(BooksStateErrorDetails value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class BooksStateLoaded implements BooksState {
  const factory BooksStateLoaded(
      {List<MediaItem> books, String currentParent}) = _$BooksStateLoaded;

  List<MediaItem> get books;
  String get currentParent;
  @JsonKey(ignore: true)
  $BooksStateLoadedCopyWith<BooksStateLoaded> get copyWith;
}

/// @nodoc
abstract class $BooksStateLoadingCopyWith<$Res> {
  factory $BooksStateLoadingCopyWith(
          BooksStateLoading value, $Res Function(BooksStateLoading) then) =
      _$BooksStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$BooksStateLoadingCopyWithImpl<$Res>
    extends _$BooksStateCopyWithImpl<$Res>
    implements $BooksStateLoadingCopyWith<$Res> {
  _$BooksStateLoadingCopyWithImpl(
      BooksStateLoading _value, $Res Function(BooksStateLoading) _then)
      : super(_value, (v) => _then(v as BooksStateLoading));

  @override
  BooksStateLoading get _value => super._value as BooksStateLoading;
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
    properties..add(DiagnosticsProperty('type', 'BooksState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BooksStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loaded(List<MediaItem> books, String currentParent),
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
    TResult loaded(List<MediaItem> books, String currentParent),
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
    @required TResult initial(BooksStateInitial value),
    @required TResult loaded(BooksStateLoaded value),
    @required TResult loading(BooksStateLoading value),
    @required TResult error(BooksStateErrorDetails value),
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
    TResult initial(BooksStateInitial value),
    TResult loaded(BooksStateLoaded value),
    TResult loading(BooksStateLoading value),
    TResult error(BooksStateErrorDetails value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
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
abstract class $BooksStateErrorDetailsCopyWith<$Res> {
  factory $BooksStateErrorDetailsCopyWith(BooksStateErrorDetails value,
          $Res Function(BooksStateErrorDetails) then) =
      _$BooksStateErrorDetailsCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$BooksStateErrorDetailsCopyWithImpl<$Res>
    extends _$BooksStateCopyWithImpl<$Res>
    implements $BooksStateErrorDetailsCopyWith<$Res> {
  _$BooksStateErrorDetailsCopyWithImpl(BooksStateErrorDetails _value,
      $Res Function(BooksStateErrorDetails) _then)
      : super(_value, (v) => _then(v as BooksStateErrorDetails));

  @override
  BooksStateErrorDetails get _value => super._value as BooksStateErrorDetails;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(BooksStateErrorDetails(
      message == freezed ? _value.message : message as String,
    ));
  }
}

/// @nodoc
class _$BooksStateErrorDetails
    with DiagnosticableTreeMixin
    implements BooksStateErrorDetails {
  const _$BooksStateErrorDetails([this.message]);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BooksState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BooksState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BooksStateErrorDetails &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $BooksStateErrorDetailsCopyWith<BooksStateErrorDetails> get copyWith =>
      _$BooksStateErrorDetailsCopyWithImpl<BooksStateErrorDetails>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loaded(List<MediaItem> books, String currentParent),
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
    TResult loaded(List<MediaItem> books, String currentParent),
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
    @required TResult initial(BooksStateInitial value),
    @required TResult loaded(BooksStateLoaded value),
    @required TResult loading(BooksStateLoading value),
    @required TResult error(BooksStateErrorDetails value),
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
    TResult initial(BooksStateInitial value),
    TResult loaded(BooksStateLoaded value),
    TResult loading(BooksStateLoading value),
    TResult error(BooksStateErrorDetails value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class BooksStateErrorDetails implements BooksState {
  const factory BooksStateErrorDetails([String message]) =
      _$BooksStateErrorDetails;

  String get message;
  @JsonKey(ignore: true)
  $BooksStateErrorDetailsCopyWith<BooksStateErrorDetails> get copyWith;
}
