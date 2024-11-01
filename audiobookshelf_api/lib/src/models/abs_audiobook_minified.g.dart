// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abs_audiobook_minified.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AbsAudiobookMinifiedImpl _$$AbsAudiobookMinifiedImplFromJson(
        Map<String, dynamic> json) =>
    _$AbsAudiobookMinifiedImpl(
      id: json['id'] as String,
      ino: json['ino'] as String?,
      libraryId: json['libraryId'] as String?,
      folderId: json['folderId'] as String?,
      path: json['path'] as String?,
      relPath: json['relPath'] as String?,
      isFile: json['isFile'] as bool?,
      mtimeMs: (json['mtimeMs'] as num?)?.toInt(),
      ctimeMs: (json['ctimeMs'] as num?)?.toInt(),
      birthtimeMs: (json['birthtimeMs'] as num?)?.toInt(),
      addedAt: (json['addedAt'] as num?)?.toInt(),
      updatedAt: (json['updatedAt'] as num?)?.toInt(),
      isMissing: json['isMissing'] as bool?,
      isInvalid: json['isInvalid'] as bool?,
      mediaType: json['mediaType'] as String?,
      media: json['media'] == null
          ? null
          : MinifiedMedia.fromJson(json['media'] as Map<String, dynamic>),
      numFiles: (json['numFiles'] as num?)?.toInt(),
      size: (json['size'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AbsAudiobookMinifiedImplToJson(
        _$AbsAudiobookMinifiedImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ino': instance.ino,
      'libraryId': instance.libraryId,
      'folderId': instance.folderId,
      'path': instance.path,
      'relPath': instance.relPath,
      'isFile': instance.isFile,
      'mtimeMs': instance.mtimeMs,
      'ctimeMs': instance.ctimeMs,
      'birthtimeMs': instance.birthtimeMs,
      'addedAt': instance.addedAt,
      'updatedAt': instance.updatedAt,
      'isMissing': instance.isMissing,
      'isInvalid': instance.isInvalid,
      'mediaType': instance.mediaType,
      'media': instance.media,
      'numFiles': instance.numFiles,
      'size': instance.size,
    };

_$MediaImpl _$$MediaImplFromJson(Map<String, dynamic> json) => _$MediaImpl(
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      coverPath: json['coverPath'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      numTracks: (json['numTracks'] as num?)?.toInt(),
      numAudioFiles: (json['numAudioFiles'] as num?)?.toInt(),
      numChapters: (json['numChapters'] as num?)?.toInt(),
      numMissingParts: (json['numMissingParts'] as num?)?.toInt(),
      numInvalidAudioFiles: (json['numInvalidAudioFiles'] as num?)?.toInt(),
      duration: (json['duration'] as num?)?.toDouble(),
      size: (json['size'] as num?)?.toInt(),
      ebookFormat: json['ebookFormat'] as String?,
    );

Map<String, dynamic> _$$MediaImplToJson(_$MediaImpl instance) =>
    <String, dynamic>{
      'metadata': instance.metadata,
      'coverPath': instance.coverPath,
      'tags': instance.tags,
      'numTracks': instance.numTracks,
      'numAudioFiles': instance.numAudioFiles,
      'numChapters': instance.numChapters,
      'numMissingParts': instance.numMissingParts,
      'numInvalidAudioFiles': instance.numInvalidAudioFiles,
      'duration': instance.duration,
      'size': instance.size,
      'ebookFormat': instance.ebookFormat,
    };

_$MetadataImpl _$$MetadataImplFromJson(Map<String, dynamic> json) =>
    _$MetadataImpl(
      title: json['title'] as String?,
      titleIgnorePrefix: json['titleIgnorePrefix'] as String?,
      subtitle: json['subtitle'] as String?,
      authorName: json['authorName'] as String?,
      authorNameLf: json['authorNameLf'] as String?,
      narratorName: json['narratorName'] as String?,
      seriesName: json['seriesName'] as String?,
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      publishedYear: json['publishedYear'] as String?,
      publishedDate: json['publishedDate'] as String?,
      publisher: json['publisher'] as String?,
      description: json['description'] as String?,
      isbn: json['isbn'] as String?,
      asin: json['asin'] as String?,
      language: json['language'] as String?,
      explicit: json['explicit'] as bool?,
    );

Map<String, dynamic> _$$MetadataImplToJson(_$MetadataImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'titleIgnorePrefix': instance.titleIgnorePrefix,
      'subtitle': instance.subtitle,
      'authorName': instance.authorName,
      'authorNameLf': instance.authorNameLf,
      'narratorName': instance.narratorName,
      'seriesName': instance.seriesName,
      'genres': instance.genres,
      'publishedYear': instance.publishedYear,
      'publishedDate': instance.publishedDate,
      'publisher': instance.publisher,
      'description': instance.description,
      'isbn': instance.isbn,
      'asin': instance.asin,
      'language': instance.language,
      'explicit': instance.explicit,
    };
