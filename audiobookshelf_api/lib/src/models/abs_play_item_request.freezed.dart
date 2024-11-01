// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'abs_play_item_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AbsPlayItemRequest _$AbsPlayItemRequestFromJson(Map<String, dynamic> json) {
  return _AbsPlayItemRequest.fromJson(json);
}

/// @nodoc
mixin _$AbsPlayItemRequest {
  String get mediaPlayer => throw _privateConstructorUsedError;
  bool get forceDirectPlay => throw _privateConstructorUsedError;
  bool get forceTranscode => throw _privateConstructorUsedError;
  DeviceInfo get deviceInfo => throw _privateConstructorUsedError;

  /// Serializes this AbsPlayItemRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AbsPlayItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AbsPlayItemRequestCopyWith<AbsPlayItemRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AbsPlayItemRequestCopyWith<$Res> {
  factory $AbsPlayItemRequestCopyWith(
          AbsPlayItemRequest value, $Res Function(AbsPlayItemRequest) then) =
      _$AbsPlayItemRequestCopyWithImpl<$Res, AbsPlayItemRequest>;
  @useResult
  $Res call(
      {String mediaPlayer,
      bool forceDirectPlay,
      bool forceTranscode,
      DeviceInfo deviceInfo});

  $DeviceInfoCopyWith<$Res> get deviceInfo;
}

/// @nodoc
class _$AbsPlayItemRequestCopyWithImpl<$Res, $Val extends AbsPlayItemRequest>
    implements $AbsPlayItemRequestCopyWith<$Res> {
  _$AbsPlayItemRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AbsPlayItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaPlayer = null,
    Object? forceDirectPlay = null,
    Object? forceTranscode = null,
    Object? deviceInfo = null,
  }) {
    return _then(_value.copyWith(
      mediaPlayer: null == mediaPlayer
          ? _value.mediaPlayer
          : mediaPlayer // ignore: cast_nullable_to_non_nullable
              as String,
      forceDirectPlay: null == forceDirectPlay
          ? _value.forceDirectPlay
          : forceDirectPlay // ignore: cast_nullable_to_non_nullable
              as bool,
      forceTranscode: null == forceTranscode
          ? _value.forceTranscode
          : forceTranscode // ignore: cast_nullable_to_non_nullable
              as bool,
      deviceInfo: null == deviceInfo
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as DeviceInfo,
    ) as $Val);
  }

  /// Create a copy of AbsPlayItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceInfoCopyWith<$Res> get deviceInfo {
    return $DeviceInfoCopyWith<$Res>(_value.deviceInfo, (value) {
      return _then(_value.copyWith(deviceInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AbsPlayItemRequestImplCopyWith<$Res>
    implements $AbsPlayItemRequestCopyWith<$Res> {
  factory _$$AbsPlayItemRequestImplCopyWith(_$AbsPlayItemRequestImpl value,
          $Res Function(_$AbsPlayItemRequestImpl) then) =
      __$$AbsPlayItemRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String mediaPlayer,
      bool forceDirectPlay,
      bool forceTranscode,
      DeviceInfo deviceInfo});

  @override
  $DeviceInfoCopyWith<$Res> get deviceInfo;
}

/// @nodoc
class __$$AbsPlayItemRequestImplCopyWithImpl<$Res>
    extends _$AbsPlayItemRequestCopyWithImpl<$Res, _$AbsPlayItemRequestImpl>
    implements _$$AbsPlayItemRequestImplCopyWith<$Res> {
  __$$AbsPlayItemRequestImplCopyWithImpl(_$AbsPlayItemRequestImpl _value,
      $Res Function(_$AbsPlayItemRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of AbsPlayItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaPlayer = null,
    Object? forceDirectPlay = null,
    Object? forceTranscode = null,
    Object? deviceInfo = null,
  }) {
    return _then(_$AbsPlayItemRequestImpl(
      mediaPlayer: null == mediaPlayer
          ? _value.mediaPlayer
          : mediaPlayer // ignore: cast_nullable_to_non_nullable
              as String,
      forceDirectPlay: null == forceDirectPlay
          ? _value.forceDirectPlay
          : forceDirectPlay // ignore: cast_nullable_to_non_nullable
              as bool,
      forceTranscode: null == forceTranscode
          ? _value.forceTranscode
          : forceTranscode // ignore: cast_nullable_to_non_nullable
              as bool,
      deviceInfo: null == deviceInfo
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as DeviceInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AbsPlayItemRequestImpl implements _AbsPlayItemRequest {
  const _$AbsPlayItemRequestImpl(
      {required this.mediaPlayer,
      required this.forceDirectPlay,
      required this.forceTranscode,
      required this.deviceInfo});

  factory _$AbsPlayItemRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AbsPlayItemRequestImplFromJson(json);

  @override
  final String mediaPlayer;
  @override
  final bool forceDirectPlay;
  @override
  final bool forceTranscode;
  @override
  final DeviceInfo deviceInfo;

  @override
  String toString() {
    return 'AbsPlayItemRequest(mediaPlayer: $mediaPlayer, forceDirectPlay: $forceDirectPlay, forceTranscode: $forceTranscode, deviceInfo: $deviceInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AbsPlayItemRequestImpl &&
            (identical(other.mediaPlayer, mediaPlayer) ||
                other.mediaPlayer == mediaPlayer) &&
            (identical(other.forceDirectPlay, forceDirectPlay) ||
                other.forceDirectPlay == forceDirectPlay) &&
            (identical(other.forceTranscode, forceTranscode) ||
                other.forceTranscode == forceTranscode) &&
            (identical(other.deviceInfo, deviceInfo) ||
                other.deviceInfo == deviceInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, mediaPlayer, forceDirectPlay, forceTranscode, deviceInfo);

  /// Create a copy of AbsPlayItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AbsPlayItemRequestImplCopyWith<_$AbsPlayItemRequestImpl> get copyWith =>
      __$$AbsPlayItemRequestImplCopyWithImpl<_$AbsPlayItemRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AbsPlayItemRequestImplToJson(
      this,
    );
  }
}

abstract class _AbsPlayItemRequest implements AbsPlayItemRequest {
  const factory _AbsPlayItemRequest(
      {required final String mediaPlayer,
      required final bool forceDirectPlay,
      required final bool forceTranscode,
      required final DeviceInfo deviceInfo}) = _$AbsPlayItemRequestImpl;

  factory _AbsPlayItemRequest.fromJson(Map<String, dynamic> json) =
      _$AbsPlayItemRequestImpl.fromJson;

  @override
  String get mediaPlayer;
  @override
  bool get forceDirectPlay;
  @override
  bool get forceTranscode;
  @override
  DeviceInfo get deviceInfo;

  /// Create a copy of AbsPlayItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AbsPlayItemRequestImplCopyWith<_$AbsPlayItemRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeviceInfo _$DeviceInfoFromJson(Map<String, dynamic> json) {
  return _DeviceInfo.fromJson(json);
}

/// @nodoc
mixin _$DeviceInfo {
  String get manufacturer => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get sdkVersion => throw _privateConstructorUsedError;
  String get clientVersion => throw _privateConstructorUsedError;

  /// Serializes this DeviceInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeviceInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeviceInfoCopyWith<DeviceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceInfoCopyWith<$Res> {
  factory $DeviceInfoCopyWith(
          DeviceInfo value, $Res Function(DeviceInfo) then) =
      _$DeviceInfoCopyWithImpl<$Res, DeviceInfo>;
  @useResult
  $Res call(
      {String manufacturer,
      String model,
      String brand,
      String sdkVersion,
      String clientVersion});
}

/// @nodoc
class _$DeviceInfoCopyWithImpl<$Res, $Val extends DeviceInfo>
    implements $DeviceInfoCopyWith<$Res> {
  _$DeviceInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeviceInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? manufacturer = null,
    Object? model = null,
    Object? brand = null,
    Object? sdkVersion = null,
    Object? clientVersion = null,
  }) {
    return _then(_value.copyWith(
      manufacturer: null == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      sdkVersion: null == sdkVersion
          ? _value.sdkVersion
          : sdkVersion // ignore: cast_nullable_to_non_nullable
              as String,
      clientVersion: null == clientVersion
          ? _value.clientVersion
          : clientVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeviceInfoImplCopyWith<$Res>
    implements $DeviceInfoCopyWith<$Res> {
  factory _$$DeviceInfoImplCopyWith(
          _$DeviceInfoImpl value, $Res Function(_$DeviceInfoImpl) then) =
      __$$DeviceInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String manufacturer,
      String model,
      String brand,
      String sdkVersion,
      String clientVersion});
}

/// @nodoc
class __$$DeviceInfoImplCopyWithImpl<$Res>
    extends _$DeviceInfoCopyWithImpl<$Res, _$DeviceInfoImpl>
    implements _$$DeviceInfoImplCopyWith<$Res> {
  __$$DeviceInfoImplCopyWithImpl(
      _$DeviceInfoImpl _value, $Res Function(_$DeviceInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? manufacturer = null,
    Object? model = null,
    Object? brand = null,
    Object? sdkVersion = null,
    Object? clientVersion = null,
  }) {
    return _then(_$DeviceInfoImpl(
      manufacturer: null == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      sdkVersion: null == sdkVersion
          ? _value.sdkVersion
          : sdkVersion // ignore: cast_nullable_to_non_nullable
              as String,
      clientVersion: null == clientVersion
          ? _value.clientVersion
          : clientVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceInfoImpl implements _DeviceInfo {
  const _$DeviceInfoImpl(
      {required this.manufacturer,
      required this.model,
      required this.brand,
      required this.sdkVersion,
      required this.clientVersion});

  factory _$DeviceInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceInfoImplFromJson(json);

  @override
  final String manufacturer;
  @override
  final String model;
  @override
  final String brand;
  @override
  final String sdkVersion;
  @override
  final String clientVersion;

  @override
  String toString() {
    return 'DeviceInfo(manufacturer: $manufacturer, model: $model, brand: $brand, sdkVersion: $sdkVersion, clientVersion: $clientVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceInfoImpl &&
            (identical(other.manufacturer, manufacturer) ||
                other.manufacturer == manufacturer) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.sdkVersion, sdkVersion) ||
                other.sdkVersion == sdkVersion) &&
            (identical(other.clientVersion, clientVersion) ||
                other.clientVersion == clientVersion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, manufacturer, model, brand, sdkVersion, clientVersion);

  /// Create a copy of DeviceInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceInfoImplCopyWith<_$DeviceInfoImpl> get copyWith =>
      __$$DeviceInfoImplCopyWithImpl<_$DeviceInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceInfoImplToJson(
      this,
    );
  }
}

abstract class _DeviceInfo implements DeviceInfo {
  const factory _DeviceInfo(
      {required final String manufacturer,
      required final String model,
      required final String brand,
      required final String sdkVersion,
      required final String clientVersion}) = _$DeviceInfoImpl;

  factory _DeviceInfo.fromJson(Map<String, dynamic> json) =
      _$DeviceInfoImpl.fromJson;

  @override
  String get manufacturer;
  @override
  String get model;
  @override
  String get brand;
  @override
  String get sdkVersion;
  @override
  String get clientVersion;

  /// Create a copy of DeviceInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceInfoImplCopyWith<_$DeviceInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
