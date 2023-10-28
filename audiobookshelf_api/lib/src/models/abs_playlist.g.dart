// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abs_playlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AbsPlaylistImpl _$$AbsPlaylistImplFromJson(Map<String, dynamic> json) =>
    _$AbsPlaylistImpl(
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

Map<String, dynamic> _$$AbsPlaylistImplToJson(_$AbsPlaylistImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'libraryId': instance.libraryId,
      'userId': instance.userId,
      'name': instance.name,
      'description': instance.description,
      'coverPath': instance.coverPath,
      'items': instance.items,
    };

_$ItemImpl _$$ItemImplFromJson(Map<String, dynamic> json) => _$ItemImpl(
      libraryItemId: json['libraryItemId'] as String?,
      episodeId: json['episodeId'] as String?,
      libraryItem:
          AbsAudiobook.fromJson(json['libraryItem'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ItemImplToJson(_$ItemImpl instance) =>
    <String, dynamic>{
      'libraryItemId': instance.libraryItemId,
      'episodeId': instance.episodeId,
      'libraryItem': instance.libraryItem,
    };
