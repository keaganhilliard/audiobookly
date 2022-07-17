// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'abs_play_item_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AbsPlayItemRequest _$AbsPlayItemRequestFromJson(Map<String, dynamic> json) {
  return _AbsPlayItemRequest.fromJson(json);
}

/// @nodoc
mixin _$AbsPlayItemRequest {
  String get mediaPlayer => throw _privateConstructorUsedError;
  bool get forceDirectPlay => throw _privateConstructorUsedError;
  bool get forceTranscode => throw _privateConstructorUsedError;
  DeviceInfo get deviceInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AbsPlayItemRequestCopyWith<AbsPlayItemRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AbsPlayItemRequestCopyWith<$Res> {
  factory $AbsPlayItemRequestCopyWith(
          AbsPlayItemRequest value, $Res Function(AbsPlayItemRequest) then) =
      _$AbsPlayItemRequestCopyWithImpl<$Res>;
  $Res call(
      {String mediaPlayer,
      bool forceDirectPlay,
      bool forceTranscode,
      DeviceInfo deviceInfo});

  $DeviceInfoCopyWith<$Res> get deviceInfo;
}

/// @nodoc
class _$AbsPlayItemRequestCopyWithImpl<$Res>
    implements $AbsPlayItemRequestCopyWith<$Res> {
  _$AbsPlayItemRequestCopyWithImpl(this._value, this._then);

  final AbsPlayItemRequest _value;
  // ignore: unused_field
  final $Res Function(AbsPlayItemRequest) _then;

  @override
  $Res call({
    Object? mediaPlayer = freezed,
    Object? forceDirectPlay = freezed,
    Object? forceTranscode = freezed,
    Object? deviceInfo = freezed,
  }) {
    return _then(_value.copyWith(
      mediaPlayer: mediaPlayer == freezed
          ? _value.mediaPlayer
          : mediaPlayer // ignore: cast_nullable_to_non_nullable
              as String,
      forceDirectPlay: forceDirectPlay == freezed
          ? _value.forceDirectPlay
          : forceDirectPlay // ignore: cast_nullable_to_non_nullable
              as bool,
      forceTranscode: forceTranscode == freezed
          ? _value.forceTranscode
          : forceTranscode // ignore: cast_nullable_to_non_nullable
              as bool,
      deviceInfo: deviceInfo == freezed
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as DeviceInfo,
    ));
  }

  @override
  $DeviceInfoCopyWith<$Res> get deviceInfo {
    return $DeviceInfoCopyWith<$Res>(_value.deviceInfo, (value) {
      return _then(_value.copyWith(deviceInfo: value));
    });
  }
}

/// @nodoc
abstract class _$$_AbsPlayItemRequestCopyWith<$Res>
    implements $AbsPlayItemRequestCopyWith<$Res> {
  factory _$$_AbsPlayItemRequestCopyWith(_$_AbsPlayItemRequest value,
          $Res Function(_$_AbsPlayItemRequest) then) =
      __$$_AbsPlayItemRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {String mediaPlayer,
      bool forceDirectPlay,
      bool forceTranscode,
      DeviceInfo deviceInfo});

  @override
  $DeviceInfoCopyWith<$Res> get deviceInfo;
}

/// @nodoc
class __$$_AbsPlayItemRequestCopyWithImpl<$Res>
    extends _$AbsPlayItemRequestCopyWithImpl<$Res>
    implements _$$_AbsPlayItemRequestCopyWith<$Res> {
  __$$_AbsPlayItemRequestCopyWithImpl(
      _$_AbsPlayItemRequest _value, $Res Function(_$_AbsPlayItemRequest) _then)
      : super(_value, (v) => _then(v as _$_AbsPlayItemRequest));

  @override
  _$_AbsPlayItemRequest get _value => super._value as _$_AbsPlayItemRequest;

  @override
  $Res call({
    Object? mediaPlayer = freezed,
    Object? forceDirectPlay = freezed,
    Object? forceTranscode = freezed,
    Object? deviceInfo = freezed,
  }) {
    return _then(_$_AbsPlayItemRequest(
      mediaPlayer: mediaPlayer == freezed
          ? _value.mediaPlayer
          : mediaPlayer // ignore: cast_nullable_to_non_nullable
              as String,
      forceDirectPlay: forceDirectPlay == freezed
          ? _value.forceDirectPlay
          : forceDirectPlay // ignore: cast_nullable_to_non_nullable
              as bool,
      forceTranscode: forceTranscode == freezed
          ? _value.forceTranscode
          : forceTranscode // ignore: cast_nullable_to_non_nullable
              as bool,
      deviceInfo: deviceInfo == freezed
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as DeviceInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AbsPlayItemRequest implements _AbsPlayItemRequest {
  const _$_AbsPlayItemRequest(
      {required this.mediaPlayer,
      required this.forceDirectPlay,
      required this.forceTranscode,
      required this.deviceInfo});

  factory _$_AbsPlayItemRequest.fromJson(Map<String, dynamic> json) =>
      _$$_AbsPlayItemRequestFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AbsPlayItemRequest &&
            const DeepCollectionEquality()
                .equals(other.mediaPlayer, mediaPlayer) &&
            const DeepCollectionEquality()
                .equals(other.forceDirectPlay, forceDirectPlay) &&
            const DeepCollectionEquality()
                .equals(other.forceTranscode, forceTranscode) &&
            const DeepCollectionEquality()
                .equals(other.deviceInfo, deviceInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(mediaPlayer),
      const DeepCollectionEquality().hash(forceDirectPlay),
      const DeepCollectionEquality().hash(forceTranscode),
      const DeepCollectionEquality().hash(deviceInfo));

  @JsonKey(ignore: true)
  @override
  _$$_AbsPlayItemRequestCopyWith<_$_AbsPlayItemRequest> get copyWith =>
      __$$_AbsPlayItemRequestCopyWithImpl<_$_AbsPlayItemRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AbsPlayItemRequestToJson(this);
  }
}

abstract class _AbsPlayItemRequest implements AbsPlayItemRequest {
  const factory _AbsPlayItemRequest(
      {required final String mediaPlayer,
      required final bool forceDirectPlay,
      required final bool forceTranscode,
      required final DeviceInfo deviceInfo}) = _$_AbsPlayItemRequest;

  factory _AbsPlayItemRequest.fromJson(Map<String, dynamic> json) =
      _$_AbsPlayItemRequest.fromJson;

  @override
  String get mediaPlayer => throw _privateConstructorUsedError;
  @override
  bool get forceDirectPlay => throw _privateConstructorUsedError;
  @override
  bool get forceTranscode => throw _privateConstructorUsedError;
  @override
  DeviceInfo get deviceInfo => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AbsPlayItemRequestCopyWith<_$_AbsPlayItemRequest> get copyWith =>
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceInfoCopyWith<DeviceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceInfoCopyWith<$Res> {
  factory $DeviceInfoCopyWith(
          DeviceInfo value, $Res Function(DeviceInfo) then) =
      _$DeviceInfoCopyWithImpl<$Res>;
  $Res call(
      {String manufacturer,
      String model,
      String brand,
      String sdkVersion,
      String clientVersion});
}

/// @nodoc
class _$DeviceInfoCopyWithImpl<$Res> implements $DeviceInfoCopyWith<$Res> {
  _$DeviceInfoCopyWithImpl(this._value, this._then);

  final DeviceInfo _value;
  // ignore: unused_field
  final $Res Function(DeviceInfo) _then;

  @override
  $Res call({
    Object? manufacturer = freezed,
    Object? model = freezed,
    Object? brand = freezed,
    Object? sdkVersion = freezed,
    Object? clientVersion = freezed,
  }) {
    return _then(_value.copyWith(
      manufacturer: manufacturer == freezed
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String,
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      brand: brand == freezed
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      sdkVersion: sdkVersion == freezed
          ? _value.sdkVersion
          : sdkVersion // ignore: cast_nullable_to_non_nullable
              as String,
      clientVersion: clientVersion == freezed
          ? _value.clientVersion
          : clientVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_DeviceInfoCopyWith<$Res>
    implements $DeviceInfoCopyWith<$Res> {
  factory _$$_DeviceInfoCopyWith(
          _$_DeviceInfo value, $Res Function(_$_DeviceInfo) then) =
      __$$_DeviceInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String manufacturer,
      String model,
      String brand,
      String sdkVersion,
      String clientVersion});
}

/// @nodoc
class __$$_DeviceInfoCopyWithImpl<$Res> extends _$DeviceInfoCopyWithImpl<$Res>
    implements _$$_DeviceInfoCopyWith<$Res> {
  __$$_DeviceInfoCopyWithImpl(
      _$_DeviceInfo _value, $Res Function(_$_DeviceInfo) _then)
      : super(_value, (v) => _then(v as _$_DeviceInfo));

  @override
  _$_DeviceInfo get _value => super._value as _$_DeviceInfo;

  @override
  $Res call({
    Object? manufacturer = freezed,
    Object? model = freezed,
    Object? brand = freezed,
    Object? sdkVersion = freezed,
    Object? clientVersion = freezed,
  }) {
    return _then(_$_DeviceInfo(
      manufacturer: manufacturer == freezed
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String,
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      brand: brand == freezed
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      sdkVersion: sdkVersion == freezed
          ? _value.sdkVersion
          : sdkVersion // ignore: cast_nullable_to_non_nullable
              as String,
      clientVersion: clientVersion == freezed
          ? _value.clientVersion
          : clientVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeviceInfo implements _DeviceInfo {
  const _$_DeviceInfo(
      {required this.manufacturer,
      required this.model,
      required this.brand,
      required this.sdkVersion,
      required this.clientVersion});

  factory _$_DeviceInfo.fromJson(Map<String, dynamic> json) =>
      _$$_DeviceInfoFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeviceInfo &&
            const DeepCollectionEquality()
                .equals(other.manufacturer, manufacturer) &&
            const DeepCollectionEquality().equals(other.model, model) &&
            const DeepCollectionEquality().equals(other.brand, brand) &&
            const DeepCollectionEquality()
                .equals(other.sdkVersion, sdkVersion) &&
            const DeepCollectionEquality()
                .equals(other.clientVersion, clientVersion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(manufacturer),
      const DeepCollectionEquality().hash(model),
      const DeepCollectionEquality().hash(brand),
      const DeepCollectionEquality().hash(sdkVersion),
      const DeepCollectionEquality().hash(clientVersion));

  @JsonKey(ignore: true)
  @override
  _$$_DeviceInfoCopyWith<_$_DeviceInfo> get copyWith =>
      __$$_DeviceInfoCopyWithImpl<_$_DeviceInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeviceInfoToJson(this);
  }
}

abstract class _DeviceInfo implements DeviceInfo {
  const factory _DeviceInfo(
      {required final String manufacturer,
      required final String model,
      required final String brand,
      required final String sdkVersion,
      required final String clientVersion}) = _$_DeviceInfo;

  factory _DeviceInfo.fromJson(Map<String, dynamic> json) =
      _$_DeviceInfo.fromJson;

  @override
  String get manufacturer => throw _privateConstructorUsedError;
  @override
  String get model => throw _privateConstructorUsedError;
  @override
  String get brand => throw _privateConstructorUsedError;
  @override
  String get sdkVersion => throw _privateConstructorUsedError;
  @override
  String get clientVersion => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DeviceInfoCopyWith<_$_DeviceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
