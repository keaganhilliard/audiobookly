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
abstract class _$$AbsItemResultsImplCopyWith<$Res>
    implements $AbsItemResultsCopyWith<$Res> {
  factory _$$AbsItemResultsImplCopyWith(_$AbsItemResultsImpl value,
          $Res Function(_$AbsItemResultsImpl) then) =
      __$$AbsItemResultsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AbsAudiobook> results});
}

/// @nodoc
class __$$AbsItemResultsImplCopyWithImpl<$Res>
    extends _$AbsItemResultsCopyWithImpl<$Res, _$AbsItemResultsImpl>
    implements _$$AbsItemResultsImplCopyWith<$Res> {
  __$$AbsItemResultsImplCopyWithImpl(
      _$AbsItemResultsImpl _value, $Res Function(_$AbsItemResultsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_$AbsItemResultsImpl(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<AbsAudiobook>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AbsItemResultsImpl implements _AbsItemResults {
  const _$AbsItemResultsImpl({required final List<AbsAudiobook> results})
      : _results = results;

  factory _$AbsItemResultsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AbsItemResultsImplFromJson(json);

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
            other is _$AbsItemResultsImpl &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AbsItemResultsImplCopyWith<_$AbsItemResultsImpl> get copyWith =>
      __$$AbsItemResultsImplCopyWithImpl<_$AbsItemResultsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AbsItemResultsImplToJson(
      this,
    );
  }
}

abstract class _AbsItemResults implements AbsItemResults {
  const factory _AbsItemResults({required final List<AbsAudiobook> results}) =
      _$AbsItemResultsImpl;

  factory _AbsItemResults.fromJson(Map<String, dynamic> json) =
      _$AbsItemResultsImpl.fromJson;

  @override
  List<AbsAudiobook> get results;
  @override
  @JsonKey(ignore: true)
  _$$AbsItemResultsImplCopyWith<_$AbsItemResultsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
