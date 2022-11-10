// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'abs_series.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AbsSeries _$AbsSeriesFromJson(Map<String, dynamic> json) {
  return _AbsSeries.fromJson(json);
}

/// @nodoc
mixin _$AbsSeries {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get nameIgnorePrefix => throw _privateConstructorUsedError;
  String get nameIgnorePrefixSort => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  List<AbsAudiobook> get books => throw _privateConstructorUsedError;
  int get addedAt => throw _privateConstructorUsedError;
  double get totalDuration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      String nameIgnorePrefix,
      String nameIgnorePrefixSort,
      String type,
      List<AbsAudiobook> books,
      int addedAt,
      double totalDuration});
}

/// @nodoc
class _$AbsSeriesCopyWithImpl<$Res, $Val extends AbsSeries>
    implements $AbsSeriesCopyWith<$Res> {
  _$AbsSeriesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? nameIgnorePrefix = null,
    Object? nameIgnorePrefixSort = null,
    Object? type = null,
    Object? books = null,
    Object? addedAt = null,
    Object? totalDuration = null,
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
      nameIgnorePrefix: null == nameIgnorePrefix
          ? _value.nameIgnorePrefix
          : nameIgnorePrefix // ignore: cast_nullable_to_non_nullable
              as String,
      nameIgnorePrefixSort: null == nameIgnorePrefixSort
          ? _value.nameIgnorePrefixSort
          : nameIgnorePrefixSort // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      books: null == books
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<AbsAudiobook>,
      addedAt: null == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as int,
      totalDuration: null == totalDuration
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AbsSeriesCopyWith<$Res> implements $AbsSeriesCopyWith<$Res> {
  factory _$$_AbsSeriesCopyWith(
          _$_AbsSeries value, $Res Function(_$_AbsSeries) then) =
      __$$_AbsSeriesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String nameIgnorePrefix,
      String nameIgnorePrefixSort,
      String type,
      List<AbsAudiobook> books,
      int addedAt,
      double totalDuration});
}

/// @nodoc
class __$$_AbsSeriesCopyWithImpl<$Res>
    extends _$AbsSeriesCopyWithImpl<$Res, _$_AbsSeries>
    implements _$$_AbsSeriesCopyWith<$Res> {
  __$$_AbsSeriesCopyWithImpl(
      _$_AbsSeries _value, $Res Function(_$_AbsSeries) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? nameIgnorePrefix = null,
    Object? nameIgnorePrefixSort = null,
    Object? type = null,
    Object? books = null,
    Object? addedAt = null,
    Object? totalDuration = null,
  }) {
    return _then(_$_AbsSeries(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nameIgnorePrefix: null == nameIgnorePrefix
          ? _value.nameIgnorePrefix
          : nameIgnorePrefix // ignore: cast_nullable_to_non_nullable
              as String,
      nameIgnorePrefixSort: null == nameIgnorePrefixSort
          ? _value.nameIgnorePrefixSort
          : nameIgnorePrefixSort // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      books: null == books
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<AbsAudiobook>,
      addedAt: null == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as int,
      totalDuration: null == totalDuration
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AbsSeries implements _AbsSeries {
  const _$_AbsSeries(
      {required this.id,
      required this.name,
      required this.nameIgnorePrefix,
      required this.nameIgnorePrefixSort,
      required this.type,
      required final List<AbsAudiobook> books,
      required this.addedAt,
      required this.totalDuration})
      : _books = books;

  factory _$_AbsSeries.fromJson(Map<String, dynamic> json) =>
      _$$_AbsSeriesFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String nameIgnorePrefix;
  @override
  final String nameIgnorePrefixSort;
  @override
  final String type;
  final List<AbsAudiobook> _books;
  @override
  List<AbsAudiobook> get books {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_books);
  }

  @override
  final int addedAt;
  @override
  final double totalDuration;

  @override
  String toString() {
    return 'AbsSeries(id: $id, name: $name, nameIgnorePrefix: $nameIgnorePrefix, nameIgnorePrefixSort: $nameIgnorePrefixSort, type: $type, books: $books, addedAt: $addedAt, totalDuration: $totalDuration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AbsSeries &&
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

  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AbsSeriesCopyWith<_$_AbsSeries> get copyWith =>
      __$$_AbsSeriesCopyWithImpl<_$_AbsSeries>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AbsSeriesToJson(
      this,
    );
  }
}

abstract class _AbsSeries implements AbsSeries {
  const factory _AbsSeries(
      {required final String id,
      required final String name,
      required final String nameIgnorePrefix,
      required final String nameIgnorePrefixSort,
      required final String type,
      required final List<AbsAudiobook> books,
      required final int addedAt,
      required final double totalDuration}) = _$_AbsSeries;

  factory _AbsSeries.fromJson(Map<String, dynamic> json) =
      _$_AbsSeries.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get nameIgnorePrefix;
  @override
  String get nameIgnorePrefixSort;
  @override
  String get type;
  @override
  List<AbsAudiobook> get books;
  @override
  int get addedAt;
  @override
  double get totalDuration;
  @override
  @JsonKey(ignore: true)
  _$$_AbsSeriesCopyWith<_$_AbsSeries> get copyWith =>
      throw _privateConstructorUsedError;
}
