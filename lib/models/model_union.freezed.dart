// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model_union.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ModelUnion {
  Object get value => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Book value) book,
    required TResult Function(Author value) author,
    required TResult Function(Series value) series,
    required TResult Function(Collection value) collection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Book value)? book,
    TResult? Function(Author value)? author,
    TResult? Function(Series value)? series,
    TResult? Function(Collection value)? collection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Book value)? book,
    TResult Function(Author value)? author,
    TResult Function(Series value)? series,
    TResult Function(Collection value)? collection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BookValue value) book,
    required TResult Function(AuthorValue value) author,
    required TResult Function(SeriesValue value) series,
    required TResult Function(CollectionValue value) collection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BookValue value)? book,
    TResult? Function(AuthorValue value)? author,
    TResult? Function(SeriesValue value)? series,
    TResult? Function(CollectionValue value)? collection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookValue value)? book,
    TResult Function(AuthorValue value)? author,
    TResult Function(SeriesValue value)? series,
    TResult Function(CollectionValue value)? collection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModelUnionCopyWith<$Res> {
  factory $ModelUnionCopyWith(
          ModelUnion value, $Res Function(ModelUnion) then) =
      _$ModelUnionCopyWithImpl<$Res, ModelUnion>;
}

/// @nodoc
class _$ModelUnionCopyWithImpl<$Res, $Val extends ModelUnion>
    implements $ModelUnionCopyWith<$Res> {
  _$ModelUnionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$BookValueCopyWith<$Res> {
  factory _$$BookValueCopyWith(
          _$BookValue value, $Res Function(_$BookValue) then) =
      __$$BookValueCopyWithImpl<$Res>;
  @useResult
  $Res call({Book value});
}

/// @nodoc
class __$$BookValueCopyWithImpl<$Res>
    extends _$ModelUnionCopyWithImpl<$Res, _$BookValue>
    implements _$$BookValueCopyWith<$Res> {
  __$$BookValueCopyWithImpl(
      _$BookValue _value, $Res Function(_$BookValue) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$BookValue(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Book,
    ));
  }
}

/// @nodoc

class _$BookValue implements BookValue {
  const _$BookValue(this.value);

  @override
  final Book value;

  @override
  String toString() {
    return 'ModelUnion.book(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookValue &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookValueCopyWith<_$BookValue> get copyWith =>
      __$$BookValueCopyWithImpl<_$BookValue>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Book value) book,
    required TResult Function(Author value) author,
    required TResult Function(Series value) series,
    required TResult Function(Collection value) collection,
  }) {
    return book(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Book value)? book,
    TResult? Function(Author value)? author,
    TResult? Function(Series value)? series,
    TResult? Function(Collection value)? collection,
  }) {
    return book?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Book value)? book,
    TResult Function(Author value)? author,
    TResult Function(Series value)? series,
    TResult Function(Collection value)? collection,
    required TResult orElse(),
  }) {
    if (book != null) {
      return book(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BookValue value) book,
    required TResult Function(AuthorValue value) author,
    required TResult Function(SeriesValue value) series,
    required TResult Function(CollectionValue value) collection,
  }) {
    return book(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BookValue value)? book,
    TResult? Function(AuthorValue value)? author,
    TResult? Function(SeriesValue value)? series,
    TResult? Function(CollectionValue value)? collection,
  }) {
    return book?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookValue value)? book,
    TResult Function(AuthorValue value)? author,
    TResult Function(SeriesValue value)? series,
    TResult Function(CollectionValue value)? collection,
    required TResult orElse(),
  }) {
    if (book != null) {
      return book(this);
    }
    return orElse();
  }
}

abstract class BookValue implements ModelUnion {
  const factory BookValue(final Book value) = _$BookValue;

  @override
  Book get value;
  @JsonKey(ignore: true)
  _$$BookValueCopyWith<_$BookValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthorValueCopyWith<$Res> {
  factory _$$AuthorValueCopyWith(
          _$AuthorValue value, $Res Function(_$AuthorValue) then) =
      __$$AuthorValueCopyWithImpl<$Res>;
  @useResult
  $Res call({Author value});
}

/// @nodoc
class __$$AuthorValueCopyWithImpl<$Res>
    extends _$ModelUnionCopyWithImpl<$Res, _$AuthorValue>
    implements _$$AuthorValueCopyWith<$Res> {
  __$$AuthorValueCopyWithImpl(
      _$AuthorValue _value, $Res Function(_$AuthorValue) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$AuthorValue(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Author,
    ));
  }
}

/// @nodoc

class _$AuthorValue implements AuthorValue {
  const _$AuthorValue(this.value);

  @override
  final Author value;

  @override
  String toString() {
    return 'ModelUnion.author(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorValue &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorValueCopyWith<_$AuthorValue> get copyWith =>
      __$$AuthorValueCopyWithImpl<_$AuthorValue>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Book value) book,
    required TResult Function(Author value) author,
    required TResult Function(Series value) series,
    required TResult Function(Collection value) collection,
  }) {
    return author(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Book value)? book,
    TResult? Function(Author value)? author,
    TResult? Function(Series value)? series,
    TResult? Function(Collection value)? collection,
  }) {
    return author?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Book value)? book,
    TResult Function(Author value)? author,
    TResult Function(Series value)? series,
    TResult Function(Collection value)? collection,
    required TResult orElse(),
  }) {
    if (author != null) {
      return author(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BookValue value) book,
    required TResult Function(AuthorValue value) author,
    required TResult Function(SeriesValue value) series,
    required TResult Function(CollectionValue value) collection,
  }) {
    return author(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BookValue value)? book,
    TResult? Function(AuthorValue value)? author,
    TResult? Function(SeriesValue value)? series,
    TResult? Function(CollectionValue value)? collection,
  }) {
    return author?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookValue value)? book,
    TResult Function(AuthorValue value)? author,
    TResult Function(SeriesValue value)? series,
    TResult Function(CollectionValue value)? collection,
    required TResult orElse(),
  }) {
    if (author != null) {
      return author(this);
    }
    return orElse();
  }
}

abstract class AuthorValue implements ModelUnion {
  const factory AuthorValue(final Author value) = _$AuthorValue;

  @override
  Author get value;
  @JsonKey(ignore: true)
  _$$AuthorValueCopyWith<_$AuthorValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SeriesValueCopyWith<$Res> {
  factory _$$SeriesValueCopyWith(
          _$SeriesValue value, $Res Function(_$SeriesValue) then) =
      __$$SeriesValueCopyWithImpl<$Res>;
  @useResult
  $Res call({Series value});
}

/// @nodoc
class __$$SeriesValueCopyWithImpl<$Res>
    extends _$ModelUnionCopyWithImpl<$Res, _$SeriesValue>
    implements _$$SeriesValueCopyWith<$Res> {
  __$$SeriesValueCopyWithImpl(
      _$SeriesValue _value, $Res Function(_$SeriesValue) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$SeriesValue(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Series,
    ));
  }
}

/// @nodoc

class _$SeriesValue implements SeriesValue {
  const _$SeriesValue(this.value);

  @override
  final Series value;

  @override
  String toString() {
    return 'ModelUnion.series(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeriesValue &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SeriesValueCopyWith<_$SeriesValue> get copyWith =>
      __$$SeriesValueCopyWithImpl<_$SeriesValue>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Book value) book,
    required TResult Function(Author value) author,
    required TResult Function(Series value) series,
    required TResult Function(Collection value) collection,
  }) {
    return series(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Book value)? book,
    TResult? Function(Author value)? author,
    TResult? Function(Series value)? series,
    TResult? Function(Collection value)? collection,
  }) {
    return series?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Book value)? book,
    TResult Function(Author value)? author,
    TResult Function(Series value)? series,
    TResult Function(Collection value)? collection,
    required TResult orElse(),
  }) {
    if (series != null) {
      return series(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BookValue value) book,
    required TResult Function(AuthorValue value) author,
    required TResult Function(SeriesValue value) series,
    required TResult Function(CollectionValue value) collection,
  }) {
    return series(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BookValue value)? book,
    TResult? Function(AuthorValue value)? author,
    TResult? Function(SeriesValue value)? series,
    TResult? Function(CollectionValue value)? collection,
  }) {
    return series?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookValue value)? book,
    TResult Function(AuthorValue value)? author,
    TResult Function(SeriesValue value)? series,
    TResult Function(CollectionValue value)? collection,
    required TResult orElse(),
  }) {
    if (series != null) {
      return series(this);
    }
    return orElse();
  }
}

abstract class SeriesValue implements ModelUnion {
  const factory SeriesValue(final Series value) = _$SeriesValue;

  @override
  Series get value;
  @JsonKey(ignore: true)
  _$$SeriesValueCopyWith<_$SeriesValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CollectionValueCopyWith<$Res> {
  factory _$$CollectionValueCopyWith(
          _$CollectionValue value, $Res Function(_$CollectionValue) then) =
      __$$CollectionValueCopyWithImpl<$Res>;
  @useResult
  $Res call({Collection value});
}

/// @nodoc
class __$$CollectionValueCopyWithImpl<$Res>
    extends _$ModelUnionCopyWithImpl<$Res, _$CollectionValue>
    implements _$$CollectionValueCopyWith<$Res> {
  __$$CollectionValueCopyWithImpl(
      _$CollectionValue _value, $Res Function(_$CollectionValue) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$CollectionValue(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Collection,
    ));
  }
}

/// @nodoc

class _$CollectionValue implements CollectionValue {
  const _$CollectionValue(this.value);

  @override
  final Collection value;

  @override
  String toString() {
    return 'ModelUnion.collection(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionValue &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionValueCopyWith<_$CollectionValue> get copyWith =>
      __$$CollectionValueCopyWithImpl<_$CollectionValue>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Book value) book,
    required TResult Function(Author value) author,
    required TResult Function(Series value) series,
    required TResult Function(Collection value) collection,
  }) {
    return collection(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Book value)? book,
    TResult? Function(Author value)? author,
    TResult? Function(Series value)? series,
    TResult? Function(Collection value)? collection,
  }) {
    return collection?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Book value)? book,
    TResult Function(Author value)? author,
    TResult Function(Series value)? series,
    TResult Function(Collection value)? collection,
    required TResult orElse(),
  }) {
    if (collection != null) {
      return collection(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BookValue value) book,
    required TResult Function(AuthorValue value) author,
    required TResult Function(SeriesValue value) series,
    required TResult Function(CollectionValue value) collection,
  }) {
    return collection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BookValue value)? book,
    TResult? Function(AuthorValue value)? author,
    TResult? Function(SeriesValue value)? series,
    TResult? Function(CollectionValue value)? collection,
  }) {
    return collection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookValue value)? book,
    TResult Function(AuthorValue value)? author,
    TResult Function(SeriesValue value)? series,
    TResult Function(CollectionValue value)? collection,
    required TResult orElse(),
  }) {
    if (collection != null) {
      return collection(this);
    }
    return orElse();
  }
}

abstract class CollectionValue implements ModelUnion {
  const factory CollectionValue(final Collection value) = _$CollectionValue;

  @override
  Collection get value;
  @JsonKey(ignore: true)
  _$$CollectionValueCopyWith<_$CollectionValue> get copyWith =>
      throw _privateConstructorUsedError;
}
