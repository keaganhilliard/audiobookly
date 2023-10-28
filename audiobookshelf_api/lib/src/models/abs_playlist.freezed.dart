// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'abs_playlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AbsPlaylist _$AbsPlaylistFromJson(Map<String, dynamic> json) {
  return _AbsPlaylist.fromJson(json);
}

/// @nodoc
mixin _$AbsPlaylist {
  String get id => throw _privateConstructorUsedError;
  String get libraryId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get coverPath => throw _privateConstructorUsedError;
  List<Item> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AbsPlaylistCopyWith<AbsPlaylist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AbsPlaylistCopyWith<$Res> {
  factory $AbsPlaylistCopyWith(
          AbsPlaylist value, $Res Function(AbsPlaylist) then) =
      _$AbsPlaylistCopyWithImpl<$Res, AbsPlaylist>;
  @useResult
  $Res call(
      {String id,
      String libraryId,
      String userId,
      String name,
      String? description,
      String? coverPath,
      List<Item> items});
}

/// @nodoc
class _$AbsPlaylistCopyWithImpl<$Res, $Val extends AbsPlaylist>
    implements $AbsPlaylistCopyWith<$Res> {
  _$AbsPlaylistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? libraryId = null,
    Object? userId = null,
    Object? name = null,
    Object? description = freezed,
    Object? coverPath = freezed,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      libraryId: null == libraryId
          ? _value.libraryId
          : libraryId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      coverPath: freezed == coverPath
          ? _value.coverPath
          : coverPath // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AbsPlaylistImplCopyWith<$Res>
    implements $AbsPlaylistCopyWith<$Res> {
  factory _$$AbsPlaylistImplCopyWith(
          _$AbsPlaylistImpl value, $Res Function(_$AbsPlaylistImpl) then) =
      __$$AbsPlaylistImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String libraryId,
      String userId,
      String name,
      String? description,
      String? coverPath,
      List<Item> items});
}

/// @nodoc
class __$$AbsPlaylistImplCopyWithImpl<$Res>
    extends _$AbsPlaylistCopyWithImpl<$Res, _$AbsPlaylistImpl>
    implements _$$AbsPlaylistImplCopyWith<$Res> {
  __$$AbsPlaylistImplCopyWithImpl(
      _$AbsPlaylistImpl _value, $Res Function(_$AbsPlaylistImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? libraryId = null,
    Object? userId = null,
    Object? name = null,
    Object? description = freezed,
    Object? coverPath = freezed,
    Object? items = null,
  }) {
    return _then(_$AbsPlaylistImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      libraryId: null == libraryId
          ? _value.libraryId
          : libraryId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      coverPath: freezed == coverPath
          ? _value.coverPath
          : coverPath // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AbsPlaylistImpl implements _AbsPlaylist {
  const _$AbsPlaylistImpl(
      {required this.id,
      required this.libraryId,
      required this.userId,
      required this.name,
      this.description,
      this.coverPath,
      required final List<Item> items})
      : _items = items;

  factory _$AbsPlaylistImpl.fromJson(Map<String, dynamic> json) =>
      _$$AbsPlaylistImplFromJson(json);

  @override
  final String id;
  @override
  final String libraryId;
  @override
  final String userId;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? coverPath;
  final List<Item> _items;
  @override
  List<Item> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'AbsPlaylist(id: $id, libraryId: $libraryId, userId: $userId, name: $name, description: $description, coverPath: $coverPath, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AbsPlaylistImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.libraryId, libraryId) ||
                other.libraryId == libraryId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.coverPath, coverPath) ||
                other.coverPath == coverPath) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, libraryId, userId, name,
      description, coverPath, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AbsPlaylistImplCopyWith<_$AbsPlaylistImpl> get copyWith =>
      __$$AbsPlaylistImplCopyWithImpl<_$AbsPlaylistImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AbsPlaylistImplToJson(
      this,
    );
  }
}

abstract class _AbsPlaylist implements AbsPlaylist {
  const factory _AbsPlaylist(
      {required final String id,
      required final String libraryId,
      required final String userId,
      required final String name,
      final String? description,
      final String? coverPath,
      required final List<Item> items}) = _$AbsPlaylistImpl;

  factory _AbsPlaylist.fromJson(Map<String, dynamic> json) =
      _$AbsPlaylistImpl.fromJson;

  @override
  String get id;
  @override
  String get libraryId;
  @override
  String get userId;
  @override
  String get name;
  @override
  String? get description;
  @override
  String? get coverPath;
  @override
  List<Item> get items;
  @override
  @JsonKey(ignore: true)
  _$$AbsPlaylistImplCopyWith<_$AbsPlaylistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  String? get libraryItemId => throw _privateConstructorUsedError;
  String? get episodeId => throw _privateConstructorUsedError;
  AbsAudiobook get libraryItem => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call(
      {String? libraryItemId, String? episodeId, AbsAudiobook libraryItem});

  $AbsAudiobookCopyWith<$Res> get libraryItem;
}

/// @nodoc
class _$ItemCopyWithImpl<$Res, $Val extends Item>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? libraryItemId = freezed,
    Object? episodeId = freezed,
    Object? libraryItem = null,
  }) {
    return _then(_value.copyWith(
      libraryItemId: freezed == libraryItemId
          ? _value.libraryItemId
          : libraryItemId // ignore: cast_nullable_to_non_nullable
              as String?,
      episodeId: freezed == episodeId
          ? _value.episodeId
          : episodeId // ignore: cast_nullable_to_non_nullable
              as String?,
      libraryItem: null == libraryItem
          ? _value.libraryItem
          : libraryItem // ignore: cast_nullable_to_non_nullable
              as AbsAudiobook,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AbsAudiobookCopyWith<$Res> get libraryItem {
    return $AbsAudiobookCopyWith<$Res>(_value.libraryItem, (value) {
      return _then(_value.copyWith(libraryItem: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ItemImplCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$ItemImplCopyWith(
          _$ItemImpl value, $Res Function(_$ItemImpl) then) =
      __$$ItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? libraryItemId, String? episodeId, AbsAudiobook libraryItem});

  @override
  $AbsAudiobookCopyWith<$Res> get libraryItem;
}

/// @nodoc
class __$$ItemImplCopyWithImpl<$Res>
    extends _$ItemCopyWithImpl<$Res, _$ItemImpl>
    implements _$$ItemImplCopyWith<$Res> {
  __$$ItemImplCopyWithImpl(_$ItemImpl _value, $Res Function(_$ItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? libraryItemId = freezed,
    Object? episodeId = freezed,
    Object? libraryItem = null,
  }) {
    return _then(_$ItemImpl(
      libraryItemId: freezed == libraryItemId
          ? _value.libraryItemId
          : libraryItemId // ignore: cast_nullable_to_non_nullable
              as String?,
      episodeId: freezed == episodeId
          ? _value.episodeId
          : episodeId // ignore: cast_nullable_to_non_nullable
              as String?,
      libraryItem: null == libraryItem
          ? _value.libraryItem
          : libraryItem // ignore: cast_nullable_to_non_nullable
              as AbsAudiobook,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemImpl implements _Item {
  const _$ItemImpl(
      {this.libraryItemId, this.episodeId, required this.libraryItem});

  factory _$ItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemImplFromJson(json);

  @override
  final String? libraryItemId;
  @override
  final String? episodeId;
  @override
  final AbsAudiobook libraryItem;

  @override
  String toString() {
    return 'Item(libraryItemId: $libraryItemId, episodeId: $episodeId, libraryItem: $libraryItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemImpl &&
            (identical(other.libraryItemId, libraryItemId) ||
                other.libraryItemId == libraryItemId) &&
            (identical(other.episodeId, episodeId) ||
                other.episodeId == episodeId) &&
            (identical(other.libraryItem, libraryItem) ||
                other.libraryItem == libraryItem));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, libraryItemId, episodeId, libraryItem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      __$$ItemImplCopyWithImpl<_$ItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemImplToJson(
      this,
    );
  }
}

abstract class _Item implements Item {
  const factory _Item(
      {final String? libraryItemId,
      final String? episodeId,
      required final AbsAudiobook libraryItem}) = _$ItemImpl;

  factory _Item.fromJson(Map<String, dynamic> json) = _$ItemImpl.fromJson;

  @override
  String? get libraryItemId;
  @override
  String? get episodeId;
  @override
  AbsAudiobook get libraryItem;
  @override
  @JsonKey(ignore: true)
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
