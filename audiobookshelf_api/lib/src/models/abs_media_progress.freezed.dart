// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'abs_media_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AbsMediaProgress _$AbsMediaProgressFromJson(Map<String, dynamic> json) {
  return _AbsMediaProgress.fromJson(json);
}

/// @nodoc
mixin _$AbsMediaProgress {
  int get timeListened => throw _privateConstructorUsedError;
  double get duration => throw _privateConstructorUsedError;
  double get currentTime => throw _privateConstructorUsedError;

  /// Serializes this AbsMediaProgress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AbsMediaProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AbsMediaProgressCopyWith<AbsMediaProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AbsMediaProgressCopyWith<$Res> {
  factory $AbsMediaProgressCopyWith(
          AbsMediaProgress value, $Res Function(AbsMediaProgress) then) =
      _$AbsMediaProgressCopyWithImpl<$Res, AbsMediaProgress>;
  @useResult
  $Res call({int timeListened, double duration, double currentTime});
}

/// @nodoc
class _$AbsMediaProgressCopyWithImpl<$Res, $Val extends AbsMediaProgress>
    implements $AbsMediaProgressCopyWith<$Res> {
  _$AbsMediaProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AbsMediaProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeListened = null,
    Object? duration = null,
    Object? currentTime = null,
  }) {
    return _then(_value.copyWith(
      timeListened: null == timeListened
          ? _value.timeListened
          : timeListened // ignore: cast_nullable_to_non_nullable
              as int,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double,
      currentTime: null == currentTime
          ? _value.currentTime
          : currentTime // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AbsMediaProgressImplCopyWith<$Res>
    implements $AbsMediaProgressCopyWith<$Res> {
  factory _$$AbsMediaProgressImplCopyWith(_$AbsMediaProgressImpl value,
          $Res Function(_$AbsMediaProgressImpl) then) =
      __$$AbsMediaProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int timeListened, double duration, double currentTime});
}

/// @nodoc
class __$$AbsMediaProgressImplCopyWithImpl<$Res>
    extends _$AbsMediaProgressCopyWithImpl<$Res, _$AbsMediaProgressImpl>
    implements _$$AbsMediaProgressImplCopyWith<$Res> {
  __$$AbsMediaProgressImplCopyWithImpl(_$AbsMediaProgressImpl _value,
      $Res Function(_$AbsMediaProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of AbsMediaProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeListened = null,
    Object? duration = null,
    Object? currentTime = null,
  }) {
    return _then(_$AbsMediaProgressImpl(
      timeListened: null == timeListened
          ? _value.timeListened
          : timeListened // ignore: cast_nullable_to_non_nullable
              as int,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double,
      currentTime: null == currentTime
          ? _value.currentTime
          : currentTime // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AbsMediaProgressImpl implements _AbsMediaProgress {
  const _$AbsMediaProgressImpl(
      {required this.timeListened,
      required this.duration,
      required this.currentTime});

  factory _$AbsMediaProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$AbsMediaProgressImplFromJson(json);

  @override
  final int timeListened;
  @override
  final double duration;
  @override
  final double currentTime;

  @override
  String toString() {
    return 'AbsMediaProgress(timeListened: $timeListened, duration: $duration, currentTime: $currentTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AbsMediaProgressImpl &&
            (identical(other.timeListened, timeListened) ||
                other.timeListened == timeListened) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.currentTime, currentTime) ||
                other.currentTime == currentTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, timeListened, duration, currentTime);

  /// Create a copy of AbsMediaProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AbsMediaProgressImplCopyWith<_$AbsMediaProgressImpl> get copyWith =>
      __$$AbsMediaProgressImplCopyWithImpl<_$AbsMediaProgressImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AbsMediaProgressImplToJson(
      this,
    );
  }
}

abstract class _AbsMediaProgress implements AbsMediaProgress {
  const factory _AbsMediaProgress(
      {required final int timeListened,
      required final double duration,
      required final double currentTime}) = _$AbsMediaProgressImpl;

  factory _AbsMediaProgress.fromJson(Map<String, dynamic> json) =
      _$AbsMediaProgressImpl.fromJson;

  @override
  int get timeListened;
  @override
  double get duration;
  @override
  double get currentTime;

  /// Create a copy of AbsMediaProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AbsMediaProgressImplCopyWith<_$AbsMediaProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
