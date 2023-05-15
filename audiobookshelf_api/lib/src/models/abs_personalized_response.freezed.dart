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
  String get category => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String label, String labelStringKey,
            String type, List<AbsAudiobookMinified> entities, String category)
        book,
    required TResult Function(String id, String label, String labelStringKey,
            String type, List<Author> entities, String category)
        authors,
    required TResult Function(String id, String label, String labelStringKey,
            String type, List<Map<String, dynamic>> entities, String category)
        unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String label, String labelStringKey,
            String type, List<AbsAudiobookMinified> entities, String category)?
        book,
    TResult? Function(String id, String label, String labelStringKey,
            String type, List<Author> entities, String category)?
        authors,
    TResult? Function(String id, String label, String labelStringKey,
            String type, List<Map<String, dynamic>> entities, String category)?
        unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String label, String labelStringKey,
            String type, List<AbsAudiobookMinified> entities, String category)?
        book,
    TResult Function(String id, String label, String labelStringKey,
            String type, List<Author> entities, String category)?
        authors,
    TResult Function(String id, String label, String labelStringKey,
            String type, List<Map<String, dynamic>> entities, String category)?
        unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AbsPersonalizedResponseBook value) book,
    required TResult Function(AbsPersonalizedResponseAuthor value) authors,
    required TResult Function(AbsPersonalizedResponseUnknown value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AbsPersonalizedResponseBook value)? book,
    TResult? Function(AbsPersonalizedResponseAuthor value)? authors,
    TResult? Function(AbsPersonalizedResponseUnknown value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AbsPersonalizedResponseBook value)? book,
    TResult Function(AbsPersonalizedResponseAuthor value)? authors,
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
  $Res call(
      {String id,
      String label,
      String labelStringKey,
      String type,
      String category});
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
    Object? category = null,
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
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AbsPersonalizedResponseBookCopyWith<$Res>
    implements $AbsPersonalizedResponseCopyWith<$Res> {
  factory _$$AbsPersonalizedResponseBookCopyWith(
          _$AbsPersonalizedResponseBook value,
          $Res Function(_$AbsPersonalizedResponseBook) then) =
      __$$AbsPersonalizedResponseBookCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String label,
      String labelStringKey,
      String type,
      List<AbsAudiobookMinified> entities,
      String category});
}

/// @nodoc
class __$$AbsPersonalizedResponseBookCopyWithImpl<$Res>
    extends _$AbsPersonalizedResponseCopyWithImpl<$Res,
        _$AbsPersonalizedResponseBook>
    implements _$$AbsPersonalizedResponseBookCopyWith<$Res> {
  __$$AbsPersonalizedResponseBookCopyWithImpl(
      _$AbsPersonalizedResponseBook _value,
      $Res Function(_$AbsPersonalizedResponseBook) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? labelStringKey = null,
    Object? type = null,
    Object? entities = null,
    Object? category = null,
  }) {
    return _then(_$AbsPersonalizedResponseBook(
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
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AbsPersonalizedResponseBook implements AbsPersonalizedResponseBook {
  const _$AbsPersonalizedResponseBook(
      {required this.id,
      required this.label,
      required this.labelStringKey,
      required this.type,
      required final List<AbsAudiobookMinified> entities,
      required this.category})
      : _entities = entities;

  factory _$AbsPersonalizedResponseBook.fromJson(Map<String, dynamic> json) =>
      _$$AbsPersonalizedResponseBookFromJson(json);

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
  final String category;

  @override
  String toString() {
    return 'AbsPersonalizedResponse.book(id: $id, label: $label, labelStringKey: $labelStringKey, type: $type, entities: $entities, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AbsPersonalizedResponseBook &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.labelStringKey, labelStringKey) ||
                other.labelStringKey == labelStringKey) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._entities, _entities) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, label, labelStringKey, type,
      const DeepCollectionEquality().hash(_entities), category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AbsPersonalizedResponseBookCopyWith<_$AbsPersonalizedResponseBook>
      get copyWith => __$$AbsPersonalizedResponseBookCopyWithImpl<
          _$AbsPersonalizedResponseBook>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String label, String labelStringKey,
            String type, List<AbsAudiobookMinified> entities, String category)
        book,
    required TResult Function(String id, String label, String labelStringKey,
            String type, List<Author> entities, String category)
        authors,
    required TResult Function(String id, String label, String labelStringKey,
            String type, List<Map<String, dynamic>> entities, String category)
        unknown,
  }) {
    return book(id, label, labelStringKey, type, entities, category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String label, String labelStringKey,
            String type, List<AbsAudiobookMinified> entities, String category)?
        book,
    TResult? Function(String id, String label, String labelStringKey,
            String type, List<Author> entities, String category)?
        authors,
    TResult? Function(String id, String label, String labelStringKey,
            String type, List<Map<String, dynamic>> entities, String category)?
        unknown,
  }) {
    return book?.call(id, label, labelStringKey, type, entities, category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String label, String labelStringKey,
            String type, List<AbsAudiobookMinified> entities, String category)?
        book,
    TResult Function(String id, String label, String labelStringKey,
            String type, List<Author> entities, String category)?
        authors,
    TResult Function(String id, String label, String labelStringKey,
            String type, List<Map<String, dynamic>> entities, String category)?
        unknown,
    required TResult orElse(),
  }) {
    if (book != null) {
      return book(id, label, labelStringKey, type, entities, category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AbsPersonalizedResponseBook value) book,
    required TResult Function(AbsPersonalizedResponseAuthor value) authors,
    required TResult Function(AbsPersonalizedResponseUnknown value) unknown,
  }) {
    return book(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AbsPersonalizedResponseBook value)? book,
    TResult? Function(AbsPersonalizedResponseAuthor value)? authors,
    TResult? Function(AbsPersonalizedResponseUnknown value)? unknown,
  }) {
    return book?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AbsPersonalizedResponseBook value)? book,
    TResult Function(AbsPersonalizedResponseAuthor value)? authors,
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
    return _$$AbsPersonalizedResponseBookToJson(
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
      required final List<AbsAudiobookMinified> entities,
      required final String category}) = _$AbsPersonalizedResponseBook;

  factory AbsPersonalizedResponseBook.fromJson(Map<String, dynamic> json) =
      _$AbsPersonalizedResponseBook.fromJson;

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
  String get category;
  @override
  @JsonKey(ignore: true)
  _$$AbsPersonalizedResponseBookCopyWith<_$AbsPersonalizedResponseBook>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AbsPersonalizedResponseAuthorCopyWith<$Res>
    implements $AbsPersonalizedResponseCopyWith<$Res> {
  factory _$$AbsPersonalizedResponseAuthorCopyWith(
          _$AbsPersonalizedResponseAuthor value,
          $Res Function(_$AbsPersonalizedResponseAuthor) then) =
      __$$AbsPersonalizedResponseAuthorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String label,
      String labelStringKey,
      String type,
      List<Author> entities,
      String category});
}

/// @nodoc
class __$$AbsPersonalizedResponseAuthorCopyWithImpl<$Res>
    extends _$AbsPersonalizedResponseCopyWithImpl<$Res,
        _$AbsPersonalizedResponseAuthor>
    implements _$$AbsPersonalizedResponseAuthorCopyWith<$Res> {
  __$$AbsPersonalizedResponseAuthorCopyWithImpl(
      _$AbsPersonalizedResponseAuthor _value,
      $Res Function(_$AbsPersonalizedResponseAuthor) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? labelStringKey = null,
    Object? type = null,
    Object? entities = null,
    Object? category = null,
  }) {
    return _then(_$AbsPersonalizedResponseAuthor(
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
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AbsPersonalizedResponseAuthor implements AbsPersonalizedResponseAuthor {
  const _$AbsPersonalizedResponseAuthor(
      {required this.id,
      required this.label,
      required this.labelStringKey,
      required this.type,
      required final List<Author> entities,
      required this.category})
      : _entities = entities;

  factory _$AbsPersonalizedResponseAuthor.fromJson(Map<String, dynamic> json) =>
      _$$AbsPersonalizedResponseAuthorFromJson(json);

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
  final String category;

  @override
  String toString() {
    return 'AbsPersonalizedResponse.authors(id: $id, label: $label, labelStringKey: $labelStringKey, type: $type, entities: $entities, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AbsPersonalizedResponseAuthor &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.labelStringKey, labelStringKey) ||
                other.labelStringKey == labelStringKey) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._entities, _entities) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, label, labelStringKey, type,
      const DeepCollectionEquality().hash(_entities), category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AbsPersonalizedResponseAuthorCopyWith<_$AbsPersonalizedResponseAuthor>
      get copyWith => __$$AbsPersonalizedResponseAuthorCopyWithImpl<
          _$AbsPersonalizedResponseAuthor>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String label, String labelStringKey,
            String type, List<AbsAudiobookMinified> entities, String category)
        book,
    required TResult Function(String id, String label, String labelStringKey,
            String type, List<Author> entities, String category)
        authors,
    required TResult Function(String id, String label, String labelStringKey,
            String type, List<Map<String, dynamic>> entities, String category)
        unknown,
  }) {
    return authors(id, label, labelStringKey, type, entities, category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String label, String labelStringKey,
            String type, List<AbsAudiobookMinified> entities, String category)?
        book,
    TResult? Function(String id, String label, String labelStringKey,
            String type, List<Author> entities, String category)?
        authors,
    TResult? Function(String id, String label, String labelStringKey,
            String type, List<Map<String, dynamic>> entities, String category)?
        unknown,
  }) {
    return authors?.call(id, label, labelStringKey, type, entities, category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String label, String labelStringKey,
            String type, List<AbsAudiobookMinified> entities, String category)?
        book,
    TResult Function(String id, String label, String labelStringKey,
            String type, List<Author> entities, String category)?
        authors,
    TResult Function(String id, String label, String labelStringKey,
            String type, List<Map<String, dynamic>> entities, String category)?
        unknown,
    required TResult orElse(),
  }) {
    if (authors != null) {
      return authors(id, label, labelStringKey, type, entities, category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AbsPersonalizedResponseBook value) book,
    required TResult Function(AbsPersonalizedResponseAuthor value) authors,
    required TResult Function(AbsPersonalizedResponseUnknown value) unknown,
  }) {
    return authors(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AbsPersonalizedResponseBook value)? book,
    TResult? Function(AbsPersonalizedResponseAuthor value)? authors,
    TResult? Function(AbsPersonalizedResponseUnknown value)? unknown,
  }) {
    return authors?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AbsPersonalizedResponseBook value)? book,
    TResult Function(AbsPersonalizedResponseAuthor value)? authors,
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
    return _$$AbsPersonalizedResponseAuthorToJson(
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
      required final List<Author> entities,
      required final String category}) = _$AbsPersonalizedResponseAuthor;

  factory AbsPersonalizedResponseAuthor.fromJson(Map<String, dynamic> json) =
      _$AbsPersonalizedResponseAuthor.fromJson;

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
  String get category;
  @override
  @JsonKey(ignore: true)
  _$$AbsPersonalizedResponseAuthorCopyWith<_$AbsPersonalizedResponseAuthor>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AbsPersonalizedResponseUnknownCopyWith<$Res>
    implements $AbsPersonalizedResponseCopyWith<$Res> {
  factory _$$AbsPersonalizedResponseUnknownCopyWith(
          _$AbsPersonalizedResponseUnknown value,
          $Res Function(_$AbsPersonalizedResponseUnknown) then) =
      __$$AbsPersonalizedResponseUnknownCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String label,
      String labelStringKey,
      String type,
      List<Map<String, dynamic>> entities,
      String category});
}

/// @nodoc
class __$$AbsPersonalizedResponseUnknownCopyWithImpl<$Res>
    extends _$AbsPersonalizedResponseCopyWithImpl<$Res,
        _$AbsPersonalizedResponseUnknown>
    implements _$$AbsPersonalizedResponseUnknownCopyWith<$Res> {
  __$$AbsPersonalizedResponseUnknownCopyWithImpl(
      _$AbsPersonalizedResponseUnknown _value,
      $Res Function(_$AbsPersonalizedResponseUnknown) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? labelStringKey = null,
    Object? type = null,
    Object? entities = null,
    Object? category = null,
  }) {
    return _then(_$AbsPersonalizedResponseUnknown(
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
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AbsPersonalizedResponseUnknown
    implements AbsPersonalizedResponseUnknown {
  const _$AbsPersonalizedResponseUnknown(
      {required this.id,
      required this.label,
      required this.labelStringKey,
      required this.type,
      required final List<Map<String, dynamic>> entities,
      required this.category})
      : _entities = entities;

  factory _$AbsPersonalizedResponseUnknown.fromJson(
          Map<String, dynamic> json) =>
      _$$AbsPersonalizedResponseUnknownFromJson(json);

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
  final String category;

  @override
  String toString() {
    return 'AbsPersonalizedResponse.unknown(id: $id, label: $label, labelStringKey: $labelStringKey, type: $type, entities: $entities, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AbsPersonalizedResponseUnknown &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.labelStringKey, labelStringKey) ||
                other.labelStringKey == labelStringKey) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._entities, _entities) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, label, labelStringKey, type,
      const DeepCollectionEquality().hash(_entities), category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AbsPersonalizedResponseUnknownCopyWith<_$AbsPersonalizedResponseUnknown>
      get copyWith => __$$AbsPersonalizedResponseUnknownCopyWithImpl<
          _$AbsPersonalizedResponseUnknown>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String label, String labelStringKey,
            String type, List<AbsAudiobookMinified> entities, String category)
        book,
    required TResult Function(String id, String label, String labelStringKey,
            String type, List<Author> entities, String category)
        authors,
    required TResult Function(String id, String label, String labelStringKey,
            String type, List<Map<String, dynamic>> entities, String category)
        unknown,
  }) {
    return unknown(id, label, labelStringKey, type, entities, category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String label, String labelStringKey,
            String type, List<AbsAudiobookMinified> entities, String category)?
        book,
    TResult? Function(String id, String label, String labelStringKey,
            String type, List<Author> entities, String category)?
        authors,
    TResult? Function(String id, String label, String labelStringKey,
            String type, List<Map<String, dynamic>> entities, String category)?
        unknown,
  }) {
    return unknown?.call(id, label, labelStringKey, type, entities, category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String label, String labelStringKey,
            String type, List<AbsAudiobookMinified> entities, String category)?
        book,
    TResult Function(String id, String label, String labelStringKey,
            String type, List<Author> entities, String category)?
        authors,
    TResult Function(String id, String label, String labelStringKey,
            String type, List<Map<String, dynamic>> entities, String category)?
        unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(id, label, labelStringKey, type, entities, category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AbsPersonalizedResponseBook value) book,
    required TResult Function(AbsPersonalizedResponseAuthor value) authors,
    required TResult Function(AbsPersonalizedResponseUnknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AbsPersonalizedResponseBook value)? book,
    TResult? Function(AbsPersonalizedResponseAuthor value)? authors,
    TResult? Function(AbsPersonalizedResponseUnknown value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AbsPersonalizedResponseBook value)? book,
    TResult Function(AbsPersonalizedResponseAuthor value)? authors,
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
    return _$$AbsPersonalizedResponseUnknownToJson(
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
      required final List<Map<String, dynamic>> entities,
      required final String category}) = _$AbsPersonalizedResponseUnknown;

  factory AbsPersonalizedResponseUnknown.fromJson(Map<String, dynamic> json) =
      _$AbsPersonalizedResponseUnknown.fromJson;

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
  String get category;
  @override
  @JsonKey(ignore: true)
  _$$AbsPersonalizedResponseUnknownCopyWith<_$AbsPersonalizedResponseUnknown>
      get copyWith => throw _privateConstructorUsedError;
}
