// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abs_audiobook_minified.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AbsAudiobookMinified _$$_AbsAudiobookMinifiedFromJson(
        Map<String, dynamic> json) =>
    _$_AbsAudiobookMinified(
      id: json['id'] as String,
      ino: json['ino'] as String,
      libraryId: json['libraryId'] as String,
      folderId: json['folderId'] as String,
      path: json['path'] as String,
      relPath: json['relPath'] as String,
      isFile: json['isFile'] as bool,
      mtimeMs: json['mtimeMs'] as int,
      ctimeMs: json['ctimeMs'] as int,
      birthtimeMs: json['birthtimeMs'] as int,
      addedAt: json['addedAt'] as int,
      updatedAt: json['updatedAt'] as int,
      isMissing: json['isMissing'] as bool,
      isInvalid: json['isInvalid'] as bool,
      mediaType: json['mediaType'] as String,
      media: MinifiedMedia.fromJson(json['media'] as Map<String, dynamic>),
      numFiles: json['numFiles'] as int,
      size: json['size'] as int?,
    );

Map<String, dynamic> _$$_AbsAudiobookMinifiedToJson(
        _$_AbsAudiobookMinified instance) =>
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

_$_Media _$$_MediaFromJson(Map<String, dynamic> json) => _$_Media(
      metadata: Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      coverPath: json['coverPath'] as String?,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      numTracks: json['numTracks'] as int,
      numAudioFiles: json['numAudioFiles'] as int,
      numChapters: json['numChapters'] as int,
      numMissingParts: json['numMissingParts'] as int,
      numInvalidAudioFiles: json['numInvalidAudioFiles'] as int,
      duration: (json['duration'] as num).toDouble(),
      size: json['size'] as int?,
      ebookFormat: json['ebookFormat'] as String?,
    );

Map<String, dynamic> _$$_MediaToJson(_$_Media instance) => <String, dynamic>{
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

_$_Metadata _$$_MetadataFromJson(Map<String, dynamic> json) => _$_Metadata(
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

Map<String, dynamic> _$$_MetadataToJson(_$_Metadata instance) =>
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
