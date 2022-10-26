// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'abs_media_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AbsMediaProgress _$AbsMediaProgressFromJson(Map<String, dynamic> json) {
  return _AbsMediaProgress.fromJson(json);
}

/// @nodoc
mixin _$AbsMediaProgress {
  int get timeListened => throw _privateConstructorUsedError;
  double get duration => throw _privateConstructorUsedError;
  double get currentTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
abstract class _$$_AbsMediaProgressCopyWith<$Res>
    implements $AbsMediaProgressCopyWith<$Res> {
  factory _$$_AbsMediaProgressCopyWith(
          _$_AbsMediaProgress value, $Res Function(_$_AbsMediaProgress) then) =
      __$$_AbsMediaProgressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int timeListened, double duration, double currentTime});
}

/// @nodoc
class __$$_AbsMediaProgressCopyWithImpl<$Res>
    extends _$AbsMediaProgressCopyWithImpl<$Res, _$_AbsMediaProgress>
    implements _$$_AbsMediaProgressCopyWith<$Res> {
  __$$_AbsMediaProgressCopyWithImpl(
      _$_AbsMediaProgress _value, $Res Function(_$_AbsMediaProgress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeListened = null,
    Object? duration = null,
    Object? currentTime = null,
  }) {
    return _then(_$_AbsMediaProgress(
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
class _$_AbsMediaProgress implements _AbsMediaProgress {
  const _$_AbsMediaProgress(
      {required this.timeListened,
      required this.duration,
      required this.currentTime});

  factory _$_AbsMediaProgress.fromJson(Map<String, dynamic> json) =>
      _$$_AbsMediaProgressFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AbsMediaProgress &&
            (identical(other.timeListened, timeListened) ||
                other.timeListened == timeListened) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.currentTime, currentTime) ||
                other.currentTime == currentTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, timeListened, duration, currentTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AbsMediaProgressCopyWith<_$_AbsMediaProgress> get copyWith =>
      __$$_AbsMediaProgressCopyWithImpl<_$_AbsMediaProgress>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AbsMediaProgressToJson(
      this,
    );
  }
}

abstract class _AbsMediaProgress implements AbsMediaProgress {
  const factory _AbsMediaProgress(
      {required final int timeListened,
      required final double duration,
      required final double currentTime}) = _$_AbsMediaProgress;

  factory _AbsMediaProgress.fromJson(Map<String, dynamic> json) =
      _$_AbsMediaProgress.fromJson;

  @override
  int get timeListened;
  @override
  double get duration;
  @override
  double get currentTime;
  @override
  @JsonKey(ignore: true)
  _$$_AbsMediaProgressCopyWith<_$_AbsMediaProgress> get copyWith =>
      throw _privateConstructorUsedError;
}
