// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abs_audiobook.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AbsAudiobook _$$_AbsAudiobookFromJson(Map<String, dynamic> json) =>
    _$_AbsAudiobook(
      id: json['id'] as String,
      ino: json['ino'] as String,
      libraryId: json['libraryId'] as String,
      folderId: json['folderId'] as String,
      path: json['path'] as String,
      relPath: json['relPath'] as String,
      isFile: json['isFile'] as bool,
      mtimeMs: json['mtimeMs'] as int?,
      ctimeMs: json['ctimeMs'] as int?,
      birthtimeMs: json['birthtimeMs'] as int?,
      addedAt: json['addedAt'] as int?,
      updatedAt: json['updatedAt'] as int?,
      lastScan: json['lastScan'] as int?,
      scanVersion: json['scanVersion'] as String?,
      isMissing: json['isMissing'] as bool,
      isInvalid: json['isInvalid'] as bool,
      mediaType: json['mediaType'] as String,
      media: Media.fromJson(json['media'] as Map<String, dynamic>),
      libraryFiles: (json['libraryFiles'] as List<dynamic>)
          .map((e) => LibraryFile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AbsAudiobookToJson(_$_AbsAudiobook instance) =>
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

_$_LibraryFile _$$_LibraryFileFromJson(Map<String, dynamic> json) =>
    _$_LibraryFile(
      ino: json['ino'] as String,
      metadata: LibraryFileMetadata.fromJson(
          json['metadata'] as Map<String, dynamic>),
      addedAt: json['addedAt'] as int,
      updatedAt: json['updatedAt'] as int,
      fileType: json['fileType'] as String,
    );

Map<String, dynamic> _$$_LibraryFileToJson(_$_LibraryFile instance) =>
    <String, dynamic>{
      'ino': instance.ino,
      'metadata': instance.metadata,
      'addedAt': instance.addedAt,
      'updatedAt': instance.updatedAt,
      'fileType': instance.fileType,
    };

_$_LibraryFileMetadata _$$_LibraryFileMetadataFromJson(
        Map<String, dynamic> json) =>
    _$_LibraryFileMetadata(
      filename: json['filename'] as String,
      ext: json['ext'] as String,
      path: json['path'] as String,
      relPath: json['relPath'] as String,
      size: json['size'] as int,
      mtimeMs: json['mtimeMs'] as int?,
      ctimeMs: json['ctimeMs'] as int?,
      birthtimeMs: json['birthtimeMs'] as int?,
    );

Map<String, dynamic> _$$_LibraryFileMetadataToJson(
        _$_LibraryFileMetadata instance) =>
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

_$_Media _$$_MediaFromJson(Map<String, dynamic> json) => _$_Media(
      libraryItemId: json['libraryItemId'] as String,
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

Map<String, dynamic> _$$_MediaToJson(_$_Media instance) => <String, dynamic>{
      'libraryItemId': instance.libraryItemId,
      'metadata': instance.metadata,
      'coverPath': instance.coverPath,
      'tags': instance.tags,
      'audioFiles': instance.audioFiles,
      'chapters': instance.chapters,
      'missingParts': instance.missingParts,
      'ebookFile': instance.ebookFile,
      'duration': instance.duration,
    };

_$_AudioFile _$$_AudioFileFromJson(Map<String, dynamic> json) => _$_AudioFile(
      index: json['index'] as int,
      ino: json['ino'] as String,
      metadata: LibraryFileMetadata.fromJson(
          json['metadata'] as Map<String, dynamic>),
      addedAt: json['addedAt'] as int?,
      updatedAt: json['updatedAt'] as int?,
      trackNumFromMeta: json['trackNumFromMeta'] as int?,
      discNumFromMeta: json['discNumFromMeta'],
      trackNumFromFilename: json['trackNumFromFilename'],
      discNumFromFilename: json['discNumFromFilename'],
      manuallyVerified: json['manuallyVerified'] as bool,
      invalid: json['invalid'] as bool,
      exclude: json['exclude'] as bool,
      error: json['error'],
      format: json['format'] as String?,
      duration: (json['duration'] as num?)?.toDouble(),
      bitRate: json['bitRate'] as int?,
      language: json['language'] as String?,
      codec: json['codec'] as String?,
      timeBase: json['timeBase'] as String?,
      channels: json['channels'] as int?,
      channelLayout: json['channelLayout'] as String?,
      chapters: (json['chapters'] as List<dynamic>?)
          ?.map((e) => Chapter.fromJson(e as Map<String, dynamic>))
          .toList(),
      embeddedCoverArt: json['embeddedCoverArt'],
      metaTags: MetaTags.fromJson(json['metaTags'] as Map<String, dynamic>),
      mimeType: json['mimeType'] as String?,
    );

Map<String, dynamic> _$$_AudioFileToJson(_$_AudioFile instance) =>
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

_$_Chapter _$$_ChapterFromJson(Map<String, dynamic> json) => _$_Chapter(
      id: json['id'] as int,
      start: _coerceStringToDouble(json['start']),
      end: _coerceStringToDouble(json['end']),
      title: json['title'] as String,
    );

Map<String, dynamic> _$$_ChapterToJson(_$_Chapter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start': instance.start,
      'end': instance.end,
      'title': instance.title,
    };

_$_MetaTags _$$_MetaTagsFromJson(Map<String, dynamic> json) => _$_MetaTags(
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

Map<String, dynamic> _$$_MetaTagsToJson(_$_MetaTags instance) =>
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

_$_MediaMetadata _$$_MediaMetadataFromJson(Map<String, dynamic> json) =>
    _$_MediaMetadata(
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      authors: (json['authors'] as List<dynamic>?)
          ?.map((e) => Author.fromJson(e as Map<String, dynamic>))
          .toList(),
      narrators: (json['narrators'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      series: (json['series'] as List<dynamic>?)
          ?.map((e) => Series.fromJson(e as Map<String, dynamic>))
          .toList(),
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      publishedYear: json['publishedYear'] as String?,
      publishedDate: json['publishedDate'] as int?,
      publisher: json['publisher'] as String?,
      description: json['description'] as String?,
      isbn: json['isbn'] as String?,
      asin: json['asin'] as String?,
      language: json['language'] as String?,
      explicit: json['explicit'] as bool?,
    );

Map<String, dynamic> _$$_MediaMetadataToJson(_$_MediaMetadata instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'authors': instance.authors,
      'narrators': instance.narrators,
      'series': instance.series,
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

_$_Author _$$_AuthorFromJson(Map<String, dynamic> json) => _$_Author(
      id: json['id'] as String,
      name: json['name'] as String,
      updatedAt: json['updatedAt'] as int?,
      imagePath: json['imagePath'] as String?,
      description: json['description'] as String?,
      asin: json['asin'] as String?,
      numBooks: json['numBooks'] as int?,
      addedAt: json['addedAt'] as int?,
    );

Map<String, dynamic> _$$_AuthorToJson(_$_Author instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'updatedAt': instance.updatedAt,
      'imagePath': instance.imagePath,
      'description': instance.description,
      'asin': instance.asin,
      'numBooks': instance.numBooks,
      'addedAt': instance.addedAt,
    };

_$_Series _$$_SeriesFromJson(Map<String, dynamic> json) => _$_Series(
      id: json['id'] as String,
      name: json['name'] as String,
      sequence: json['sequence'] as String?,
    );

Map<String, dynamic> _$$_SeriesToJson(_$_Series instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sequence': instance.sequence,
    };
