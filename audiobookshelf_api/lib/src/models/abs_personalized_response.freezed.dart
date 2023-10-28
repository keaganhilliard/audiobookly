// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'abs_personalized_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AbsPersonalizedResponse _$AbsPersonalizedResponseFromJson(
    Map<String, dynamic> json) {
  switch (json['type']) {
    case 'book':
      return AbsPersonalizedResponseBook.fromJson(json);
    case 'authors':
      return AbsPersonalizedResponseAuthor.fromJson(json);
    case 'series':
      return AbsPersonalizedResponseSeries.fromJson(json);

    default:
      return AbsPersonalizedResponseUnknown.fromJson(json);
  }
}

/// @nodoc
mixin _$AbsPersonalizedResponse {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get labelStringKey => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  List<Object> get entities => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String label, String labelStringKey,
            String type, List<AbsAudiobookMinified> entities)
        book,
    required TResult Function(String id, String label, String labelStringKey,
            String type, List<Author> entities)
        authors,
    required TResult Function(String id, String label, String labelStringKey,
            String type, List<AbsSeries> entities)
        series,
    required TResult Function(String id, String label, String labelStringKey,
            String type, List<Map<String, dynamic>> entities)
        unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String label, String labelStringKey,
            String type, List<AbsAudiobookMinified> entities)?
        book,
    TResult? Function(String id, String label, String labelStringKey,
            String type, List<Author> entities)?
        authors,
    TResult? Function(String id, String label, String labelStringKey,
            String type, List<AbsSeries> entities)?
        series,
    TResult? Function(String id, String label, String labelStringKey,
            String type, List<Map<String, dynamic>> entities)?
        unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String label, String labelStringKey,
            String type, List<AbsAudiobookMinified> entities)?
        book,
    TResult Function(String id, String label, String labelStringKey,
            String type, List<Author> entities)?
        authors,
    TResult Function(String id, String label, String labelStringKey,
            String type, List<AbsSeries> entities)?
        series,
    TResult Function(String id, String label, String labelStringKey,
            String type, List<Map<String, dynamic>> entities)?
        unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AbsPersonalizedResponseBook value) book,
    required TResult Function(AbsPersonalizedResponseAuthor value) authors,
    required TResult Function(AbsPersonalizedResponseSeries value) series,
    required TResult Function(AbsPersonalizedResponseUnknown value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AbsPersonalizedResponseBook value)? book,
    TResult? Function(AbsPersonalizedResponseAuthor value)? authors,
    TResult? Function(AbsPersonalizedResponseSeries value)? series,
    TResult? Function(AbsPersonalizedResponseUnknown value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AbsPersonalizedResponseBook value)? book,
    TResult Function(AbsPersonalizedResponseAuthor value)? authors,
    TResult Function(AbsPersonalizedResponseSeries value)? series,
    TResult Function(AbsPersonalizedResponseUnknown value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AbsPersonalizedResponseCopyWith<AbsPersonalizedResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AbsPersonalizedResponseCopyWith<$Res> {
  factory $AbsPersonalizedResponseCopyWith(AbsPersonalizedResponse value,
          $Res Function(AbsPersonalizedResponse) then) =
      _$AbsPersonalizedResponseCopyWithImpl<$Res, AbsPersonalizedResponse>;
  @useResult
  $Res call({String id, String label, String labelStringKey, String type});
}

/// @nodoc
class _$AbsPersonalizedResponseCopyWithImpl<$Res,
        $Val extends AbsPersonalizedResponse>
    implements $AbsPersonalizedResponseCopyWith<$Res> {
  _$AbsPersonalizedResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? labelStringKey = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      labelStringKey: null == labelStringKey
          ? _value.labelStringKey
          : labelStringKey // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AbsPersonalizedResponseBookImplCopyWith<$Res>
    implements $AbsPersonalizedResponseCopyWith<$Res> {
  factory _$$AbsPersonalizedResponseBookImplCopyWith(
          _$AbsPersonalizedResponseBookImpl value,
          $Res Function(_$AbsPersonalizedResponseBookImpl) then) =
      __$$AbsPersonalizedResponseBookImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String label,
      String labelStringKey,
      String type,
      List<AbsAudiobookMinified> entities});
}

/// @nodoc
class __$$AbsPersonalizedResponseBookImplCopyWithImpl<$Res>
    extends _$AbsPersonalizedResponseCopyWithImpl<$Res,
        _$AbsPersonalizedResponseBookImpl>
    implements _$$AbsPersonalizedResponseBookImplCopyWith<$Res> {
  __$$AbsPersonalizedResponseBookImplCopyWithImpl(
      _$AbsPersonalizedResponseBookImpl _value,
      $Res Function(_$AbsPersonalizedResponseBookImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? labelStringKey = null,
    Object? type = null,
    Object? entities = null,
  }) {
    return _then(_$AbsPersonalizedResponseBookImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      labelStringKey: null == labelStringKey
          ? _value.labelStringKey
          : labelStringKey // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      entities: null == entities
          ? _value._entities
          : entities // ignore: cast_nullable_to_non_nullable
              as List<AbsAudiobookMinified>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AbsPersonalizedResponseBookImpl implements AbsPersonalizedResponseBook {
  const _$AbsPersonalizedResponseBookImpl(
      {required this.id,
      required this.label,
      required this.labelStringKey,
      required this.type,
      required final List<AbsAudiobookMinified> entities})
      : _entities = entities;

  factory _$AbsPersonalizedResponseBookImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AbsPersonalizedResponseBookImplFromJson(json);

  @override
  final String id;
  @override
  final String label;
  @override
  final String labelStringKey;
  @override
  final String type;
  final List<AbsAudiobookMinified> _entities;
  @override
  List<AbsAudiobookMinified> get entities {
    if (_entities is EqualUnmodifiableListView) return _entities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entities);
  }

  @override
  String toString() {
    return 'AbsPersonalizedResponse.book(id: $id, label: $label, labelStringKey: $labelStringKey, type: $type, entities: $entities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AbsPersonalizedResponseBookImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.labelStringKey, labelStringKey) ||
                other.labelStringKey == labelStringKey) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._entities, _entities));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, label, labelStringKey, type,
      const DeepCollectionEquality().hash(_entities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AbsPersonalizedResponseBookImplCopyWith<_$AbsPersonalizedResponseBookImpl>
      get copyWith => __$$AbsPersonalizedResponseBookImplCopyWithImpl<
          _$AbsPersonalizedResponseBookImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String label, String labelStringKey,
            String type, List<AbsAudiobookMinified> entities)
        book,
    required TResult Function(String id, String label, String labelStringKey,
            String type, List<Author> entities)
        authors,
    required TResult Function(String id, String label, String labelStringKey,
            String type, List<AbsSeries> entities)
        series,
    required TResult Function(String id, String label, String labelStringKey,
            String type, List<Map<String, dynamic>> entities)
        unknown,
  }) {
    return book(id, label, labelStringKey, type, entities);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String label, String labelStringKey,
            String type, List<AbsAudiobookMinified> entities)?
        book,
    TResult? Function(String id, String label, String labelStringKey,
            String type, List<Author> entities)?
        authors,
    TResult? Function(String id, String label, String labelStringKey,
            String type, List<AbsSeries> entities)?
        series,
    TResult? Function(String id, String label, String labelStringKey,
            String type, List<Map<String, dynamic>> entities)?
        unknown,
  }) {
    return book?.call(id, label, labelStringKey, type, entities);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String label, String labelStringKey,
            String type, List<AbsAudiobookMinified> entities)?
        book,
    TResult Function(String id, String label, String labelStringKey,
            String type, List<Author> entities)?
        authors,
    TResult Function(String id, String label, String labelStringKey,
            String type, List<AbsSeries> entities)?
        series,
    TResult Function(String id, String label, String labelStringKey,
            String type, List<Map<String, dynamic>> entities)?
        unknown,
    required TResult orElse(),
  }) {
    if (book != null) {
      return book(id, label, labelStringKey, type, entities);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AbsPersonalizedResponseBook value) book,
    required TResult Function(AbsPersonalizedResponseAuthor value) authors,
    required TResult Function(AbsPersonalizedResponseSeries value) series,
    required TResult Function(AbsPersonalizedResponseUnknown value) unknown,
  }) {
    return book(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AbsPersonalizedResponseBook value)? book,
    TResult? Function(AbsPersonalizedResponseAuthor value)? authors,
    TResult? Function(AbsPersonalizedResponseSeries value)? series,
    TResult? Function(AbsPersonalizedResponseUnknown value)? unknown,
  }) {
    return book?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AbsPersonalizedResponseBook value)? book,
    TResult Function(AbsPersonalizedResponseAuthor value)? authors,
    TResult Function(AbsPersonalizedResponseSeries value)? series,
    TResult Function(AbsPersonalizedResponseUnknown value)? unknown,
    required TResult orElse(),
  }) {
    if (book != null) {
      return book(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AbsPersonalizedResponseBookImplToJson(
      this,
    );
  }
}

abstract class AbsPersonalizedResponseBook implements AbsPersonalizedResponse {
  const factory AbsPersonalizedResponseBook(
          {required final String id,
          required final String label,
          required final String labelStringKey,
          required final String type,
          required final List<AbsAudiobookMinified> entities}) =
      _$AbsPersonalizedResponseBookImpl;

  factory AbsPersonalizedResponseBook.fromJson(Map<String, dynamic> json) =
      _$AbsPersonalizedResponseBookImpl.fromJson;

  @override
  String get id;
  @override
  String get label;
  @override
  String get labelStringKey;
  @override
  String get type;
  @override
  List<AbsAudiobookMinified> get entities;
  @override
  @JsonKey(ignore: true)
  _$$AbsPersonalizedResponseBookImplCopyWith<_$AbsPersonalizedResponseBookImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AbsPersonalizedResponseAuthorImplCopyWith<$Res>
    implements $AbsPersonalizedResponseCopyWith<$Res> {
  factory _$$AbsPersonalizedResponseAuthorImplCopyWith(
          _$AbsPersonalizedResponseAuthorImpl value,
          $Res Function(_$AbsPersonalizedResponseAuthorImpl) then) =
      __$$AbsPersonalizedResponseAuthorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String label,
      String labelStringKey,
      String type,
      List<Author> entities});
}

/// @nodoc
class __$$AbsPersonalizedResponseAuthorImplCopyWithImpl<$Res>
    extends _$AbsPersonalizedResponseCopyWithImpl<$Res,
        _$AbsPersonalizedResponseAuthorImpl>
    implements _$$AbsPersonalizedResponseAuthorImplCopyWith<$Res> {
  __$$AbsPersonalizedResponseAuthorImplCopyWithImpl(
      _$AbsPersonalizedResponseAuthorImpl _value,
      $Res Function(_$AbsPersonalizedResponseAuthorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? labelStringKey = null,
    Object? type = null,
    Object? entities = null,
  }) {
    return _then(_$AbsPersonalizedResponseAuthorImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      labelStringKey: null == labelStringKey
          ? _value.labelStringKey
          : labelStringKey // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      entities: null == entities
          ? _value._entities
          : entities // ignore: cast_nullable_to_non_nullable
              as List<Author>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AbsPersonalizedResponseAuthorImpl
    implements AbsPersonalizedResponseAuthor {
  const _$AbsPersonalizedResponseAuthorImpl(
      {required this.id,
      required this.label,
      required this.labelStringKey,
      required this.type,
      required final List<Author> entities})
      : _entities = entities;

  factory _$AbsPersonalizedResponseAuthorImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AbsPersonalizedResponseAuthorImplFromJson(json);

  @override
  final String id;
  @override
  final String label;
  @override
  final String labelStringKey;
  @override
  final String type;
  final List<Author> _entities;
  @override
  List<Author> get entities {
    if (_entities is EqualUnmodifiableListView) return _entities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entities);
  }

  @override
  String toString() {
    return 'AbsPersonalizedResponse.authors(id: $id, label: $label, labelStringKey: $labelStringKey, type: $type, entities: $entities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AbsPersonalizedResponseAuthorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.labelStringKey, labelStringKey) ||
                other.labelStringKey == labelStringKey) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._entities, _entities));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, label, labelStringKey, type,
      const DeepCollectionEquality().hash(_entities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AbsPersonalizedResponseAuthorImplCopyWith<
          _$AbsPersonalizedResponseAuthorImpl>
      get copyWith => __$$AbsPersonalizedResponseAuthorImplCopyWithImpl<
          _$AbsPersonalizedResponseAuthorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String label, String labelStringKey,
            String type, List<AbsAudiobookMinified> entities)
        book,
    required TResult Function(String id, String label, String labelStringKey,
            String type, List<Author> entities)
        authors,
    required TResult Function(String id, String label, String labelStringKey,
            String type, List<AbsSeries> entities)
        series,
    required TResult Function(String id, String label, String labelStringKey,
            String type, List<Map<String, dynamic>> entities)
        unknown,
  }) {
    return authors(id, label, labelStringKey, type, entities);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String label, String labelStringKey,
            String type, List<AbsAudiobookMinified> entities)?
        book,
    TResult? Function(String id, String label, String labelStringKey,
            String type, List<Author> entities)?
        authors,
    TResult? Function(String id, String label, String labelStringKey,
            String type, List<AbsSeries> entities)?
        series,
    TResult? Function(String id, String label, String labelStringKey,
            String type, List<Map<String, dynamic>> entities)?
        unknown,
  }) {
    return authors?.call(id, label, labelStringKey, type, entities);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String label, String labelStringKey,
            String type, List<AbsAudiobookMinified> entities)?
        book,
    TResult Function(String id, String label, String labelStringKey,
            String type, List<Author> entities)?
        authors,
    TResult Function(String id, String label, String labelStringKey,
            String type, List<AbsSeries> entities)?
        series,
    TResult Function(String id, String label, String labelStringKey,
            String type, List<Map<String, dynamic>> entities)?
        unknown,
    required TResult orElse(),
  }) {
    if (authors != null) {
      return authors(id, label, labelStringKey, type, entities);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AbsPersonalizedResponseBook value) book,
    required TResult Function(AbsPersonalizedResponseAuthor value) authors,
    required TResult Function(AbsPersonalizedResponseSeries value) series,
    required TResult Function(AbsPersonalizedResponseUnknown value) unknown,
  }) {
    return authors(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AbsPersonalizedResponseBook value)? book,
    TResult? Function(AbsPersonalizedResponseAuthor value)? authors,
    TResult? Function(AbsPersonalizedResponseSeries value)? series,
    TResult? Function(AbsPersonalizedResponseUnknown value)? unknown,
  }) {
    return authors?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AbsPersonalizedResponseBook value)? book,
    TResult Function(AbsPersonalizedResponseAuthor value)? authors,
    TResult Function(AbsPersonalizedResponseSeries value)? series,
    TResult Function(AbsPersonalizedResponseUnknown value)? unknown,
    required TResult orElse(),
  }) {
    if (authors != null) {
      return authors(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AbsPersonalizedResponseAuthorImplToJson(
      this,
    );
  }
}

abstract class AbsPersonalizedResponseAuthor
    implements AbsPersonalizedResponse {
  const factory AbsPersonalizedResponseAuthor(
          {required final String id,
          required final String label,
          required final String labelStringKey,
          required final String type,
          required final List<Author> entities}) =
      _$AbsPersonalizedResponseAuthorImpl;

  factory AbsPersonalizedResponseAuthor.fromJson(Map<String, dynamic> json) =
      _$AbsPersonalizedResponseAuthorImpl.fromJson;

  @override
  String get id;
  @override
  String get label;
  @override
  String get labelStringKey;
  @override
  String get type;
  @override
  List<Author> get entities;
  @override
  @JsonKey(ignore: true)
  _$$AbsPersonalizedResponseAuthorImplCopyWith<
          _$AbsPersonalizedResponseAuthorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AbsPersonalizedResponseSeriesImplCopyWith<$Res>
    implements $AbsPersonalizedResponseCopyWith<$Res> {
  factory _$$AbsPersonalizedResponseSeriesImplCopyWith(
          _$AbsPersonalizedResponseSeriesImpl value,
          $Res Function(_$AbsPersonalizedResponseSeriesImpl) then) =
      __$$AbsPersonalizedResponseSeriesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String label,
      String labelStringKey,
      String type,
      List<AbsSeries> entities});
}

/// @nodoc
class __$$AbsPersonalizedResponseSeriesImplCopyWithImpl<$Res>
    extends _$AbsPersonalizedResponseCopyWithImpl<$Res,
        _$AbsPersonalizedResponseSeriesImpl>
    implements _$$AbsPersonalizedResponseSeriesImplCopyWith<$Res> {
  __$$AbsPersonalizedResponseSeriesImplCopyWithImpl(
      _$AbsPersonalizedResponseSeriesImpl _value,
      $Res Function(_$AbsPersonalizedResponseSeriesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? labelStringKey = null,
    Object? type = null,
    Object? entities = null,
  }) {
    return _then(_$AbsPersonalizedResponseSeriesImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      labelStringKey: null == labelStringKey
          ? _value.labelStringKey
          : labelStringKey // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      entities: null == entities
          ? _value._entities
          : entities // ignore: cast_nullable_to_non_nullable
              as List<AbsSeries>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AbsPersonalizedResponseSeriesImpl
    implements AbsPersonalizedResponseSeries {
  const _$AbsPersonalizedResponseSeriesImpl(
      {required this.id,
      required this.label,
      required this.labelStringKey,
      required this.type,
      required final List<AbsSeries> entities})
      : _entities = entities;

  factory _$AbsPersonalizedResponseSeriesImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AbsPersonalizedResponseSeriesImplFromJson(json);

  @override
  final String id;
  @override
  final String label;
  @override
  final String labelStringKey;
  @override
  final String type;
  final List<AbsSeries> _entities;
  @override
  List<AbsSeries> get entities {
    if (_entities is EqualUnmodifiableListView) return _entities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entities);
  }

  @override
  String toString() {
    return 'AbsPersonalizedResponse.series(id: $id, label: $label, labelStringKey: $labelStringKey, type: $type, entities: $entities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AbsPersonalizedResponseSeriesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.labelStringKey, labelStringKey) ||
                other.labelStringKey == labelStringKey) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._entities, _entities));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, label, labelStringKey, type,
      const DeepCollectionEquality().hash(_entities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AbsPersonalizedResponseSeriesImplCopyWith<
          _$AbsPersonalizedResponseSeriesImpl>
      get copyWith => __$$AbsPersonalizedResponseSeriesImplCopyWithImpl<
          _$AbsPersonalizedResponseSeriesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String label, String labelStringKey,
            String type, List<AbsAudiobookMinified> entities)
        book,
    required TResult Function(String id, String label, String labelStringKey,
            String type, List<Author> entities)
        authors,
    required TResult Function(String id, String label, String labelStringKey,
            String type, List<AbsSeries> entities)
        series,
    required TResult Function(String id, String label, String labelStringKey,
            String type, List<Map<String, dynamic>> entities)
        unknown,
  }) {
    return series(id, label, labelStringKey, type, entities);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String label, String labelStringKey,
            String type, List<AbsAudiobookMinified> entities)?
        book,
    TResult? Function(String id, String label, String labelStringKey,
            String type, List<Author> entities)?
        authors,
    TResult? Function(String id, String label, String labelStringKey,
            String type, List<AbsSeries> entities)?
        series,
    TResult? Function(String id, String label, String labelStringKey,
            String type, List<Map<String, dynamic>> entities)?
        unknown,
  }) {
    return series?.call(id, label, labelStringKey, type, entities);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String label, String labelStringKey,
            String type, List<AbsAudiobookMinified> entities)?
        book,
    TResult Function(String id, String label, String labelStringKey,
            String type, List<Author> entities)?
        authors,
    TResult Function(String id, String label, String labelStringKey,
            String type, List<AbsSeries> entities)?
        series,
    TResult Function(String id, String label, String labelStringKey,
            String type, List<Map<String, dynamic>> entities)?
        unknown,
    required TResult orElse(),
  }) {
    if (series != null) {
      return series(id, label, labelStringKey, type, entities);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AbsPersonalizedResponseBook value) book,
    required TResult Function(AbsPersonalizedResponseAuthor value) authors,
    required TResult Function(AbsPersonalizedResponseSeries value) series,
    required TResult Function(AbsPersonalizedResponseUnknown value) unknown,
  }) {
    return series(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AbsPersonalizedResponseBook value)? book,
    TResult? Function(AbsPersonalizedResponseAuthor value)? authors,
    TResult? Function(AbsPersonalizedResponseSeries value)? series,
    TResult? Function(AbsPersonalizedResponseUnknown value)? unknown,
  }) {
    return series?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AbsPersonalizedResponseBook value)? book,
    TResult Function(AbsPersonalizedResponseAuthor value)? authors,
    TResult Function(AbsPersonalizedResponseSeries value)? series,
    TResult Function(AbsPersonalizedResponseUnknown value)? unknown,
    required TResult orElse(),
  }) {
    if (series != null) {
      return series(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AbsPersonalizedResponseSeriesImplToJson(
      this,
    );
  }
}

abstract class AbsPersonalizedResponseSeries
    implements AbsPersonalizedResponse {
  const factory AbsPersonalizedResponseSeries(
          {required final String id,
          required final String label,
          required final String labelStringKey,
          required final String type,
          required final List<AbsSeries> entities}) =
      _$AbsPersonalizedResponseSeriesImpl;

  factory AbsPersonalizedResponseSeries.fromJson(Map<String, dynamic> json) =
      _$AbsPersonalizedResponseSeriesImpl.fromJson;

  @override
  String get id;
  @override
  String get label;
  @override
  String get labelStringKey;
  @override
  String get type;
  @override
  List<AbsSeries> get entities;
  @override
  @JsonKey(ignore: true)
  _$$AbsPersonalizedResponseSeriesImplCopyWith<
          _$AbsPersonalizedResponseSeriesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AbsPersonalizedResponseUnknownImplCopyWith<$Res>
    implements $AbsPersonalizedResponseCopyWith<$Res> {
  factory _$$AbsPersonalizedResponseUnknownImplCopyWith(
          _$AbsPersonalizedResponseUnknownImpl value,
          $Res Function(_$AbsPersonalizedResponseUnknownImpl) then) =
      __$$AbsPersonalizedResponseUnknownImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String label,
      String labelStringKey,
      String type,
      List<Map<String, dynamic>> entities});
}

/// @nodoc
class __$$AbsPersonalizedResponseUnknownImplCopyWithImpl<$Res>
    extends _$AbsPersonalizedResponseCopyWithImpl<$Res,
        _$AbsPersonalizedResponseUnknownImpl>
    implements _$$AbsPersonalizedResponseUnknownImplCopyWith<$Res> {
  __$$AbsPersonalizedResponseUnknownImplCopyWithImpl(
      _$AbsPersonalizedResponseUnknownImpl _value,
      $Res Function(_$AbsPersonalizedResponseUnknownImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? labelStringKey = null,
    Object? type = null,
    Object? entities = null,
  }) {
    return _then(_$AbsPersonalizedResponseUnknownImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      labelStringKey: null == labelStringKey
          ? _value.labelStringKey
          : labelStringKey // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      entities: null == entities
          ? _value._entities
          : entities // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AbsPersonalizedResponseUnknownImpl
    implements AbsPersonalizedResponseUnknown {
  const _$AbsPersonalizedResponseUnknownImpl(
      {required this.id,
      required this.label,
      required this.labelStringKey,
      required this.type,
      required final List<Map<String, dynamic>> entities})
      : _entities = entities;

  factory _$AbsPersonalizedResponseUnknownImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AbsPersonalizedResponseUnknownImplFromJson(json);

  @override
  final String id;
  @override
  final String label;
  @override
  final String labelStringKey;
  @override
  final String type;
  final List<Map<String, dynamic>> _entities;
  @override
  List<Map<String, dynamic>> get entities {
    if (_entities is EqualUnmodifiableListView) return _entities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entities);
  }

  @override
  String toString() {
    return 'AbsPersonalizedResponse.unknown(id: $id, label: $label, labelStringKey: $labelStringKey, type: $type, entities: $entities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AbsPersonalizedResponseUnknownImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.labelStringKey, labelStringKey) ||
                other.labelStringKey == labelStringKey) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._entities, _entities));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, label, labelStringKey, type,
      const DeepCollectionEquality().hash(_entities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AbsPersonalizedResponseUnknownImplCopyWith<
          _$AbsPersonalizedResponseUnknownImpl>
      get copyWith => __$$AbsPersonalizedResponseUnknownImplCopyWithImpl<
          _$AbsPersonalizedResponseUnknownImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String label, String labelStringKey,
            String type, List<AbsAudiobookMinified> entities)
        book,
    required TResult Function(String id, String label, String labelStringKey,
            String type, List<Author> entities)
        authors,
    required TResult Function(String id, String label, String labelStringKey,
            String type, List<AbsSeries> entities)
        series,
    required TResult Function(String id, String label, String labelStringKey,
            String type, List<Map<String, dynamic>> entities)
        unknown,
  }) {
    return unknown(id, label, labelStringKey, type, entities);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String label, String labelStringKey,
            String type, List<AbsAudiobookMinified> entities)?
        book,
    TResult? Function(String id, String label, String labelStringKey,
            String type, List<Author> entities)?
        authors,
    TResult? Function(String id, String label, String labelStringKey,
            String type, List<AbsSeries> entities)?
        series,
    TResult? Function(String id, String label, String labelStringKey,
            String type, List<Map<String, dynamic>> entities)?
        unknown,
  }) {
    return unknown?.call(id, label, labelStringKey, type, entities);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String label, String labelStringKey,
            String type, List<AbsAudiobookMinified> entities)?
        book,
    TResult Function(String id, String label, String labelStringKey,
            String type, List<Author> entities)?
        authors,
    TResult Function(String id, String label, String labelStringKey,
            String type, List<AbsSeries> entities)?
        series,
    TResult Function(String id, String label, String labelStringKey,
            String type, List<Map<String, dynamic>> entities)?
        unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(id, label, labelStringKey, type, entities);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AbsPersonalizedResponseBook value) book,
    required TResult Function(AbsPersonalizedResponseAuthor value) authors,
    required TResult Function(AbsPersonalizedResponseSeries value) series,
    required TResult Function(AbsPersonalizedResponseUnknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AbsPersonalizedResponseBook value)? book,
    TResult? Function(AbsPersonalizedResponseAuthor value)? authors,
    TResult? Function(AbsPersonalizedResponseSeries value)? series,
    TResult? Function(AbsPersonalizedResponseUnknown value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AbsPersonalizedResponseBook value)? book,
    TResult Function(AbsPersonalizedResponseAuthor value)? authors,
    TResult Function(AbsPersonalizedResponseSeries value)? series,
    TResult Function(AbsPersonalizedResponseUnknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AbsPersonalizedResponseUnknownImplToJson(
      this,
    );
  }
}

abstract class AbsPersonalizedResponseUnknown
    implements AbsPersonalizedResponse {
  const factory AbsPersonalizedResponseUnknown(
          {required final String id,
          required final String label,
          required final String labelStringKey,
          required final String type,
          required final List<Map<String, dynamic>> entities}) =
      _$AbsPersonalizedResponseUnknownImpl;

  factory AbsPersonalizedResponseUnknown.fromJson(Map<String, dynamic> json) =
      _$AbsPersonalizedResponseUnknownImpl.fromJson;

  @override
  String get id;
  @override
  String get label;
  @override
  String get labelStringKey;
  @override
  String get type;
  @override
  List<Map<String, dynamic>> get entities;
  @override
  @JsonKey(ignore: true)
  _$$AbsPersonalizedResponseUnknownImplCopyWith<
          _$AbsPersonalizedResponseUnknownImpl>
      get copyWith => throw _privateConstructorUsedError;
}
