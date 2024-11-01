// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abs_audiobook.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AbsAudiobookImpl _$$AbsAudiobookImplFromJson(Map<String, dynamic> json) =>
    _$AbsAudiobookImpl(
      id: json['id'] as String,
      ino: json['ino'] as String,
      libraryId: json['libraryId'] as String,
      folderId: json['folderId'] as String,
      path: json['path'] as String,
      relPath: json['relPath'] as String,
      isFile: json['isFile'] as bool,
      mtimeMs: (json['mtimeMs'] as num?)?.toInt(),
      ctimeMs: (json['ctimeMs'] as num?)?.toInt(),
      birthtimeMs: (json['birthtimeMs'] as num?)?.toInt(),
      addedAt: (json['addedAt'] as num?)?.toInt(),
      updatedAt: (json['updatedAt'] as num?)?.toInt(),
      lastScan: (json['lastScan'] as num?)?.toInt(),
      scanVersion: json['scanVersion'] as String?,
      isMissing: json['isMissing'] as bool,
      isInvalid: json['isInvalid'] as bool,
      mediaType: json['mediaType'] as String,
      media: Media.fromJson(json['media'] as Map<String, dynamic>),
      libraryFiles: (json['libraryFiles'] as List<dynamic>?)
          ?.map((e) => LibraryFile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AbsAudiobookImplToJson(_$AbsAudiobookImpl instance) =>
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
      'lastScan': instance.lastScan,
      'scanVersion': instance.scanVersion,
      'isMissing': instance.isMissing,
      'isInvalid': instance.isInvalid,
      'mediaType': instance.mediaType,
      'media': instance.media,
      'libraryFiles': instance.libraryFiles,
    };

_$LibraryFileImpl _$$LibraryFileImplFromJson(Map<String, dynamic> json) =>
    _$LibraryFileImpl(
      ino: json['ino'] as String,
      metadata: LibraryFileMetadata.fromJson(
          json['metadata'] as Map<String, dynamic>),
      addedAt: (json['addedAt'] as num).toInt(),
      updatedAt: (json['updatedAt'] as num).toInt(),
      fileType: json['fileType'] as String,
    );

Map<String, dynamic> _$$LibraryFileImplToJson(_$LibraryFileImpl instance) =>
    <String, dynamic>{
      'ino': instance.ino,
      'metadata': instance.metadata,
      'addedAt': instance.addedAt,
      'updatedAt': instance.updatedAt,
      'fileType': instance.fileType,
    };

_$LibraryFileMetadataImpl _$$LibraryFileMetadataImplFromJson(
        Map<String, dynamic> json) =>
    _$LibraryFileMetadataImpl(
      filename: json['filename'] as String,
      ext: json['ext'] as String,
      path: json['path'] as String,
      relPath: json['relPath'] as String,
      size: (json['size'] as num).toInt(),
      mtimeMs: (json['mtimeMs'] as num?)?.toInt(),
      ctimeMs: (json['ctimeMs'] as num?)?.toInt(),
      birthtimeMs: (json['birthtimeMs'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$LibraryFileMetadataImplToJson(
        _$LibraryFileMetadataImpl instance) =>
    <String, dynamic>{
      'filename': instance.filename,
      'ext': instance.ext,
      'path': instance.path,
      'relPath': instance.relPath,
      'size': instance.size,
      'mtimeMs': instance.mtimeMs,
      'ctimeMs': instance.ctimeMs,
      'birthtimeMs': instance.birthtimeMs,
    };

_$MediaImpl _$$MediaImplFromJson(Map<String, dynamic> json) => _$MediaImpl(
      id: json['id'] as String,
      metadata:
          MediaMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
      coverPath: json['coverPath'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      audioFiles: (json['audioFiles'] as List<dynamic>?)
          ?.map((e) => AudioFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      chapters: (json['chapters'] as List<dynamic>?)
          ?.map((e) => Chapter.fromJson(e as Map<String, dynamic>))
          .toList(),
      missingParts: json['missingParts'] as List<dynamic>?,
      ebookFile: json['ebookFile'],
      duration: (json['duration'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$MediaImplToJson(_$MediaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'metadata': instance.metadata,
      'coverPath': instance.coverPath,
      'tags': instance.tags,
      'audioFiles': instance.audioFiles,
      'chapters': instance.chapters,
      'missingParts': instance.missingParts,
      'ebookFile': instance.ebookFile,
      'duration': instance.duration,
    };

_$AudioFileImpl _$$AudioFileImplFromJson(Map<String, dynamic> json) =>
    _$AudioFileImpl(
      index: (json['index'] as num).toInt(),
      ino: json['ino'] as String,
      metadata: LibraryFileMetadata.fromJson(
          json['metadata'] as Map<String, dynamic>),
      addedAt: (json['addedAt'] as num?)?.toInt(),
      updatedAt: (json['updatedAt'] as num?)?.toInt(),
      trackNumFromMeta: (json['trackNumFromMeta'] as num?)?.toInt(),
      discNumFromMeta: json['discNumFromMeta'],
      trackNumFromFilename: json['trackNumFromFilename'],
      discNumFromFilename: json['discNumFromFilename'],
      manuallyVerified: json['manuallyVerified'] as bool?,
      invalid: json['invalid'] as bool?,
      exclude: json['exclude'] as bool?,
      error: json['error'],
      format: json['format'] as String?,
      duration: (json['duration'] as num?)?.toDouble(),
      bitRate: (json['bitRate'] as num?)?.toInt(),
      language: json['language'] as String?,
      codec: json['codec'] as String?,
      timeBase: json['timeBase'] as String?,
      channels: (json['channels'] as num?)?.toInt(),
      channelLayout: json['channelLayout'] as String?,
      chapters: (json['chapters'] as List<dynamic>?)
          ?.map((e) => Chapter.fromJson(e as Map<String, dynamic>))
          .toList(),
      embeddedCoverArt: json['embeddedCoverArt'],
      metaTags: MetaTags.fromJson(json['metaTags'] as Map<String, dynamic>),
      mimeType: json['mimeType'] as String?,
    );

Map<String, dynamic> _$$AudioFileImplToJson(_$AudioFileImpl instance) =>
    <String, dynamic>{
      'index': instance.index,
      'ino': instance.ino,
      'metadata': instance.metadata,
      'addedAt': instance.addedAt,
      'updatedAt': instance.updatedAt,
      'trackNumFromMeta': instance.trackNumFromMeta,
      'discNumFromMeta': instance.discNumFromMeta,
      'trackNumFromFilename': instance.trackNumFromFilename,
      'discNumFromFilename': instance.discNumFromFilename,
      'manuallyVerified': instance.manuallyVerified,
      'invalid': instance.invalid,
      'exclude': instance.exclude,
      'error': instance.error,
      'format': instance.format,
      'duration': instance.duration,
      'bitRate': instance.bitRate,
      'language': instance.language,
      'codec': instance.codec,
      'timeBase': instance.timeBase,
      'channels': instance.channels,
      'channelLayout': instance.channelLayout,
      'chapters': instance.chapters,
      'embeddedCoverArt': instance.embeddedCoverArt,
      'metaTags': instance.metaTags,
      'mimeType': instance.mimeType,
    };

_$ChapterImpl _$$ChapterImplFromJson(Map<String, dynamic> json) =>
    _$ChapterImpl(
      id: (json['id'] as num).toInt(),
      start: _coerceStringToDouble(json['start']),
      end: _coerceStringToDouble(json['end']),
      title: json['title'] as String,
    );

Map<String, dynamic> _$$ChapterImplToJson(_$ChapterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start': instance.start,
      'end': instance.end,
      'title': instance.title,
    };

_$MetaTagsImpl _$$MetaTagsImplFromJson(Map<String, dynamic> json) =>
    _$MetaTagsImpl(
      tagAlbum: json['tagAlbum'] as String?,
      tagArtist: json['tagArtist'] as String?,
      tagGenre: json['tagGenre'] as String?,
      tagTitle: json['tagTitle'] as String?,
      tagTrack: json['tagTrack'] as String?,
      tagAlbumArtist: json['tagAlbumArtist'] as String?,
      tagDate: json['tagDate'] as String?,
      tagComposer: json['tagComposer'] as String?,
      tagDescription: json['tagDescription'] as String?,
      tagEncoder: json['tagEncoder'] as String?,
    );

Map<String, dynamic> _$$MetaTagsImplToJson(_$MetaTagsImpl instance) =>
    <String, dynamic>{
      'tagAlbum': instance.tagAlbum,
      'tagArtist': instance.tagArtist,
      'tagGenre': instance.tagGenre,
      'tagTitle': instance.tagTitle,
      'tagTrack': instance.tagTrack,
      'tagAlbumArtist': instance.tagAlbumArtist,
      'tagDate': instance.tagDate,
      'tagComposer': instance.tagComposer,
      'tagDescription': instance.tagDescription,
      'tagEncoder': instance.tagEncoder,
    };

_$MediaMetadataImpl _$$MediaMetadataImplFromJson(Map<String, dynamic> json) =>
    _$MediaMetadataImpl(
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      authors: (json['authors'] as List<dynamic>?)
          ?.map((e) => AbsAuthor.fromJson(e as Map<String, dynamic>))
          .toList(),
      narrators: (json['narrators'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      series: _coerceToList(json['series']),
      seriesName: json['seriesName'] as String?,
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      publishedYear: json['publishedYear'] as String?,
      publishedDate: (json['publishedDate'] as num?)?.toInt(),
      publisher: json['publisher'] as String?,
      description: json['description'] as String?,
      isbn: json['isbn'] as String?,
      asin: json['asin'] as String?,
      language: json['language'] as String?,
      explicit: json['explicit'] as bool?,
    );

Map<String, dynamic> _$$MediaMetadataImplToJson(_$MediaMetadataImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'authors': instance.authors,
      'narrators': instance.narrators,
      'series': instance.series,
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

_$SeriesImpl _$$SeriesImplFromJson(Map<String, dynamic> json) => _$SeriesImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      sequence: json['sequence'] as String?,
    );

Map<String, dynamic> _$$SeriesImplToJson(_$SeriesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sequence': instance.sequence,
    };
