// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'abs_series.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AbsSeries _$AbsSeriesFromJson(Map<String, dynamic> json) {
  return _AbsSeries.fromJson(json);
}

/// @nodoc
mixin _$AbsSeries {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get nameIgnorePrefix => throw _privateConstructorUsedError;
  String? get nameIgnorePrefixSort => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  List<AbsAudiobookMinified> get books => throw _privateConstructorUsedError;
  int get addedAt => throw _privateConstructorUsedError;
  double? get totalDuration => throw _privateConstructorUsedError;

  /// Serializes this AbsSeries to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AbsSeries
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AbsSeriesCopyWith<AbsSeries> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AbsSeriesCopyWith<$Res> {
  factory $AbsSeriesCopyWith(AbsSeries value, $Res Function(AbsSeries) then) =
      _$AbsSeriesCopyWithImpl<$Res, AbsSeries>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? nameIgnorePrefix,
      String? nameIgnorePrefixSort,
      String? type,
      List<AbsAudiobookMinified> books,
      int addedAt,
      double? totalDuration});
}

/// @nodoc
class _$AbsSeriesCopyWithImpl<$Res, $Val extends AbsSeries>
    implements $AbsSeriesCopyWith<$Res> {
  _$AbsSeriesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AbsSeries
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? nameIgnorePrefix = freezed,
    Object? nameIgnorePrefixSort = freezed,
    Object? type = freezed,
    Object? books = null,
    Object? addedAt = null,
    Object? totalDuration = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nameIgnorePrefix: freezed == nameIgnorePrefix
          ? _value.nameIgnorePrefix
          : nameIgnorePrefix // ignore: cast_nullable_to_non_nullable
              as String?,
      nameIgnorePrefixSort: freezed == nameIgnorePrefixSort
          ? _value.nameIgnorePrefixSort
          : nameIgnorePrefixSort // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      books: null == books
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<AbsAudiobookMinified>,
      addedAt: null == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as int,
      totalDuration: freezed == totalDuration
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AbsSeriesImplCopyWith<$Res>
    implements $AbsSeriesCopyWith<$Res> {
  factory _$$AbsSeriesImplCopyWith(
          _$AbsSeriesImpl value, $Res Function(_$AbsSeriesImpl) then) =
      __$$AbsSeriesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? nameIgnorePrefix,
      String? nameIgnorePrefixSort,
      String? type,
      List<AbsAudiobookMinified> books,
      int addedAt,
      double? totalDuration});
}

/// @nodoc
class __$$AbsSeriesImplCopyWithImpl<$Res>
    extends _$AbsSeriesCopyWithImpl<$Res, _$AbsSeriesImpl>
    implements _$$AbsSeriesImplCopyWith<$Res> {
  __$$AbsSeriesImplCopyWithImpl(
      _$AbsSeriesImpl _value, $Res Function(_$AbsSeriesImpl) _then)
      : super(_value, _then);

  /// Create a copy of AbsSeries
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? nameIgnorePrefix = freezed,
    Object? nameIgnorePrefixSort = freezed,
    Object? type = freezed,
    Object? books = null,
    Object? addedAt = null,
    Object? totalDuration = freezed,
  }) {
    return _then(_$AbsSeriesImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nameIgnorePrefix: freezed == nameIgnorePrefix
          ? _value.nameIgnorePrefix
          : nameIgnorePrefix // ignore: cast_nullable_to_non_nullable
              as String?,
      nameIgnorePrefixSort: freezed == nameIgnorePrefixSort
          ? _value.nameIgnorePrefixSort
          : nameIgnorePrefixSort // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      books: null == books
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<AbsAudiobookMinified>,
      addedAt: null == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as int,
      totalDuration: freezed == totalDuration
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AbsSeriesImpl implements _AbsSeries {
  const _$AbsSeriesImpl(
      {required this.id,
      required this.name,
      this.nameIgnorePrefix,
      this.nameIgnorePrefixSort,
      this.type,
      required final List<AbsAudiobookMinified> books,
      required this.addedAt,
      this.totalDuration})
      : _books = books;

  factory _$AbsSeriesImpl.fromJson(Map<String, dynamic> json) =>
      _$$AbsSeriesImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? nameIgnorePrefix;
  @override
  final String? nameIgnorePrefixSort;
  @override
  final String? type;
  final List<AbsAudiobookMinified> _books;
  @override
  List<AbsAudiobookMinified> get books {
    if (_books is EqualUnmodifiableListView) return _books;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_books);
  }

  @override
  final int addedAt;
  @override
  final double? totalDuration;

  @override
  String toString() {
    return 'AbsSeries(id: $id, name: $name, nameIgnorePrefix: $nameIgnorePrefix, nameIgnorePrefixSort: $nameIgnorePrefixSort, type: $type, books: $books, addedAt: $addedAt, totalDuration: $totalDuration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AbsSeriesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameIgnorePrefix, nameIgnorePrefix) ||
                other.nameIgnorePrefix == nameIgnorePrefix) &&
            (identical(other.nameIgnorePrefixSort, nameIgnorePrefixSort) ||
                other.nameIgnorePrefixSort == nameIgnorePrefixSort) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._books, _books) &&
            (identical(other.addedAt, addedAt) || other.addedAt == addedAt) &&
            (identical(other.totalDuration, totalDuration) ||
                other.totalDuration == totalDuration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      nameIgnorePrefix,
      nameIgnorePrefixSort,
      type,
      const DeepCollectionEquality().hash(_books),
      addedAt,
      totalDuration);

  /// Create a copy of AbsSeries
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AbsSeriesImplCopyWith<_$AbsSeriesImpl> get copyWith =>
      __$$AbsSeriesImplCopyWithImpl<_$AbsSeriesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AbsSeriesImplToJson(
      this,
    );
  }
}

abstract class _AbsSeries implements AbsSeries {
  const factory _AbsSeries(
      {required final String id,
      required final String name,
      final String? nameIgnorePrefix,
      final String? nameIgnorePrefixSort,
      final String? type,
      required final List<AbsAudiobookMinified> books,
      required final int addedAt,
      final double? totalDuration}) = _$AbsSeriesImpl;

  factory _AbsSeries.fromJson(Map<String, dynamic> json) =
      _$AbsSeriesImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get nameIgnorePrefix;
  @override
  String? get nameIgnorePrefixSort;
  @override
  String? get type;
  @override
  List<AbsAudiobookMinified> get books;
  @override
  int get addedAt;
  @override
  double? get totalDuration;

  /// Create a copy of AbsSeries
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AbsSeriesImplCopyWith<_$AbsSeriesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
