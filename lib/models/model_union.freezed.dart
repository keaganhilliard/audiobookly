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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$BookValueImplCopyWith<$Res> {
  factory _$$BookValueImplCopyWith(
          _$BookValueImpl value, $Res Function(_$BookValueImpl) then) =
      __$$BookValueImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Book value});
}

/// @nodoc
class __$$BookValueImplCopyWithImpl<$Res>
    extends _$ModelUnionCopyWithImpl<$Res, _$BookValueImpl>
    implements _$$BookValueImplCopyWith<$Res> {
  __$$BookValueImplCopyWithImpl(
      _$BookValueImpl _value, $Res Function(_$BookValueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$BookValueImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Book,
    ));
  }
}

/// @nodoc

class _$BookValueImpl implements BookValue {
  const _$BookValueImpl(this.value);

  @override
  final Book value;

  @override
  String toString() {
    return 'ModelUnion.book(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookValueImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookValueImplCopyWith<_$BookValueImpl> get copyWith =>
      __$$BookValueImplCopyWithImpl<_$BookValueImpl>(this, _$identity);

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
  const factory BookValue(final Book value) = _$BookValueImpl;

  @override
  Book get value;
  @JsonKey(ignore: true)
  _$$BookValueImplCopyWith<_$BookValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthorValueImplCopyWith<$Res> {
  factory _$$AuthorValueImplCopyWith(
          _$AuthorValueImpl value, $Res Function(_$AuthorValueImpl) then) =
      __$$AuthorValueImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Author value});
}

/// @nodoc
class __$$AuthorValueImplCopyWithImpl<$Res>
    extends _$ModelUnionCopyWithImpl<$Res, _$AuthorValueImpl>
    implements _$$AuthorValueImplCopyWith<$Res> {
  __$$AuthorValueImplCopyWithImpl(
      _$AuthorValueImpl _value, $Res Function(_$AuthorValueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$AuthorValueImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Author,
    ));
  }
}

/// @nodoc

class _$AuthorValueImpl implements AuthorValue {
  const _$AuthorValueImpl(this.value);

  @override
  final Author value;

  @override
  String toString() {
    return 'ModelUnion.author(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorValueImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorValueImplCopyWith<_$AuthorValueImpl> get copyWith =>
      __$$AuthorValueImplCopyWithImpl<_$AuthorValueImpl>(this, _$identity);

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
  const factory AuthorValue(final Author value) = _$AuthorValueImpl;

  @override
  Author get value;
  @JsonKey(ignore: true)
  _$$AuthorValueImplCopyWith<_$AuthorValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SeriesValueImplCopyWith<$Res> {
  factory _$$SeriesValueImplCopyWith(
          _$SeriesValueImpl value, $Res Function(_$SeriesValueImpl) then) =
      __$$SeriesValueImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Series value});
}

/// @nodoc
class __$$SeriesValueImplCopyWithImpl<$Res>
    extends _$ModelUnionCopyWithImpl<$Res, _$SeriesValueImpl>
    implements _$$SeriesValueImplCopyWith<$Res> {
  __$$SeriesValueImplCopyWithImpl(
      _$SeriesValueImpl _value, $Res Function(_$SeriesValueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$SeriesValueImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Series,
    ));
  }
}

/// @nodoc

class _$SeriesValueImpl implements SeriesValue {
  const _$SeriesValueImpl(this.value);

  @override
  final Series value;

  @override
  String toString() {
    return 'ModelUnion.series(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeriesValueImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SeriesValueImplCopyWith<_$SeriesValueImpl> get copyWith =>
      __$$SeriesValueImplCopyWithImpl<_$SeriesValueImpl>(this, _$identity);

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
  const factory SeriesValue(final Series value) = _$SeriesValueImpl;

  @override
  Series get value;
  @JsonKey(ignore: true)
  _$$SeriesValueImplCopyWith<_$SeriesValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CollectionValueImplCopyWith<$Res> {
  factory _$$CollectionValueImplCopyWith(_$CollectionValueImpl value,
          $Res Function(_$CollectionValueImpl) then) =
      __$$CollectionValueImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Collection value});
}

/// @nodoc
class __$$CollectionValueImplCopyWithImpl<$Res>
    extends _$ModelUnionCopyWithImpl<$Res, _$CollectionValueImpl>
    implements _$$CollectionValueImplCopyWith<$Res> {
  __$$CollectionValueImplCopyWithImpl(
      _$CollectionValueImpl _value, $Res Function(_$CollectionValueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$CollectionValueImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Collection,
    ));
  }
}

/// @nodoc

class _$CollectionValueImpl implements CollectionValue {
  const _$CollectionValueImpl(this.value);

  @override
  final Collection value;

  @override
  String toString() {
    return 'ModelUnion.collection(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionValueImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionValueImplCopyWith<_$CollectionValueImpl> get copyWith =>
      __$$CollectionValueImplCopyWithImpl<_$CollectionValueImpl>(
          this, _$identity);

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
  const factory CollectionValue(final Collection value) = _$CollectionValueImpl;

  @override
  Collection get value;
  @JsonKey(ignore: true)
  _$$CollectionValueImplCopyWith<_$CollectionValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
