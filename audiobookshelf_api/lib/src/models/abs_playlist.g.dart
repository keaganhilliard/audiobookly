// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abs_playlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AbsPlaylist _$$_AbsPlaylistFromJson(Map<String, dynamic> json) =>
    _$_AbsPlaylist(
      id: json['id'] as String,
      libraryId: json['libraryId'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      coverPath: json['coverPath'] as String?,
      items: (json['items'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AbsPlaylistToJson(_$_AbsPlaylist instance) =>
    <String, dynamic>{
      'id': instance.id,
      'libraryId': instance.libraryId,
      'userId': instance.userId,
      'name': instance.name,
      'description': instance.description,
      'coverPath': instance.coverPath,
      'items': instance.items,
    };

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      libraryItemId: json['libraryItemId'] as String?,
      episodeId: json['episodeId'] as String?,
      libraryItem:
          AbsAudiobook.fromJson(json['libraryItem'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'libraryItemId': instance.libraryItemId,
      'episodeId': instance.episodeId,
      'libraryItem': instance.libraryItem,
    };
