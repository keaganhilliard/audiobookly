// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'abs_item_results.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AbsItemResults _$AbsItemResultsFromJson(Map<String, dynamic> json) {
  return _AbsItemResults.fromJson(json);
}

/// @nodoc
mixin _$AbsItemResults {
  List<AbsAudiobook> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AbsItemResultsCopyWith<AbsItemResults> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AbsItemResultsCopyWith<$Res> {
  factory $AbsItemResultsCopyWith(
          AbsItemResults value, $Res Function(AbsItemResults) then) =
      _$AbsItemResultsCopyWithImpl<$Res, AbsItemResults>;
  @useResult
  $Res call({List<AbsAudiobook> results});
}

/// @nodoc
class _$AbsItemResultsCopyWithImpl<$Res, $Val extends AbsItemResults>
    implements $AbsItemResultsCopyWith<$Res> {
  _$AbsItemResultsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<AbsAudiobook>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AbsItemResultsCopyWith<$Res>
    implements $AbsItemResultsCopyWith<$Res> {
  factory _$$_AbsItemResultsCopyWith(
          _$_AbsItemResults value, $Res Function(_$_AbsItemResults) then) =
      __$$_AbsItemResultsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AbsAudiobook> results});
}

/// @nodoc
class __$$_AbsItemResultsCopyWithImpl<$Res>
    extends _$AbsItemResultsCopyWithImpl<$Res, _$_AbsItemResults>
    implements _$$_AbsItemResultsCopyWith<$Res> {
  __$$_AbsItemResultsCopyWithImpl(
      _$_AbsItemResults _value, $Res Function(_$_AbsItemResults) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_$_AbsItemResults(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<AbsAudiobook>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AbsItemResults implements _AbsItemResults {
  const _$_AbsItemResults({required final List<AbsAudiobook> results})
      : _results = results;

  factory _$_AbsItemResults.fromJson(Map<String, dynamic> json) =>
      _$$_AbsItemResultsFromJson(json);

  final List<AbsAudiobook> _results;
  @override
  List<AbsAudiobook> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'AbsItemResults(results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AbsItemResults &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AbsItemResultsCopyWith<_$_AbsItemResults> get copyWith =>
      __$$_AbsItemResultsCopyWithImpl<_$_AbsItemResults>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AbsItemResultsToJson(
      this,
    );
  }
}

abstract class _AbsItemResults implements AbsItemResults {
  const factory _AbsItemResults({required final List<AbsAudiobook> results}) =
      _$_AbsItemResults;

  factory _AbsItemResults.fromJson(Map<String, dynamic> json) =
      _$_AbsItemResults.fromJson;

  @override
  List<AbsAudiobook> get results;
  @override
  @JsonKey(ignore: true)
  _$$_AbsItemResultsCopyWith<_$_AbsItemResults> get copyWith =>
      throw _privateConstructorUsedError;
}
