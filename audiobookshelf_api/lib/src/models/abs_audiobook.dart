import 'package:freezed_annotation/freezed_annotation.dart';

part 'abs_audiobook.freezed.dart';
part 'abs_audiobook.g.dart';

@freezed
class AbsAudiobook with _$AbsAudiobook {
  const factory AbsAudiobook({
    required String id,
    required String ino,
    required String libraryId,
    required String folderId,
    required String path,
    required String relPath,
    required bool isFile,
    int? mtimeMs,
    int? ctimeMs,
    int? birthtimeMs,
    int? addedAt,
    int? updatedAt,
    int? lastScan,
    String? scanVersion,
    required bool isMissing,
    required bool isInvalid,
    required String mediaType,
    required Media media,
    required List<LibraryFile> libraryFiles,
  }) = _AbsAudiobook;

  factory AbsAudiobook.fromJson(Map<String, dynamic> json) =>
      _$AbsAudiobookFromJson(json);
}

@freezed
class LibraryFile with _$LibraryFile {
  const factory LibraryFile({
    required String ino,
    required LibraryFileMetadata metadata,
    required int addedAt,
    required int updatedAt,
    required String fileType,
  }) = _LibraryFile;

  factory LibraryFile.fromJson(Map<String, dynamic> json) =>
      _$LibraryFileFromJson(json);
}

@freezed
class LibraryFileMetadata with _$LibraryFileMetadata {
  const factory LibraryFileMetadata({
    required String filename,
    required String ext,
    required String path,
    required String relPath,
    required int size,
    int? mtimeMs,
    int? ctimeMs,
    int? birthtimeMs,
  }) = _LibraryFileMetadata;

  factory LibraryFileMetadata.fromJson(Map<String, dynamic> json) =>
      _$LibraryFileMetadataFromJson(json);
}

@freezed
class Media with _$Media {
  const factory Media({
    required String libraryItemId,
    required MediaMetadata metadata,
    String? coverPath,
    List<String>? tags,
    List<AudioFile>? audioFiles,
    List<Chapter>? chapters,
    List<dynamic>? missingParts,
    dynamic ebookFile,
    double? duration,
  }) = _Media;

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
}

@freezed
class AudioFile with _$AudioFile {
  const factory AudioFile({
    required int index,
    required String ino,
    required LibraryFileMetadata metadata,
    int? addedAt,
    int? updatedAt,
    int? trackNumFromMeta,
    dynamic discNumFromMeta,
    dynamic trackNumFromFilename,
    dynamic discNumFromFilename,
    required bool manuallyVerified,
    required bool invalid,
    required bool exclude,
    dynamic error,
    String? format,
    double? duration,
    int? bitRate,
    String? language,
    String? codec,
    String? timeBase,
    int? channels,
    String? channelLayout,
    List<Chapter>? chapters,
    dynamic embeddedCoverArt,
    required MetaTags metaTags,
    String? mimeType,
  }) = _AudioFile;

  factory AudioFile.fromJson(Map<String, dynamic> json) =>
      _$AudioFileFromJson(json);
}

@freezed
class Chapter with _$Chapter {
  const factory Chapter({
    required int id,
    @JsonKey(fromJson: _coerceStringToDouble) required double start,
    @JsonKey(fromJson: _coerceStringToDouble) required double end,
    required String title,
  }) = _Chapter;

  factory Chapter.fromJson(Map<String, dynamic> json) =>
      _$ChapterFromJson(json);
}

double _coerceStringToDouble(dynamic shouldBeADouble) =>
    shouldBeADouble is String
        ? double.parse(shouldBeADouble)
        : shouldBeADouble.toDouble();

@freezed
class MetaTags with _$MetaTags {
  const factory MetaTags({
    String? tagAlbum,
    String? tagArtist,
    String? tagGenre,
    String? tagTitle,
    String? tagTrack,
    String? tagAlbumArtist,
    String? tagDate,
    String? tagComposer,
    String? tagDescription,
    String? tagEncoder,
  }) = _MetaTags;

  factory MetaTags.fromJson(Map<String, dynamic> json) =>
      _$MetaTagsFromJson(json);
}

@freezed
class MediaMetadata with _$MediaMetadata {
  const factory MediaMetadata({
    String? title,
    String? subtitle,
    List<Author>? authors,
    List<String>? narrators,
    List<Series>? series,
    List<String>? genres,
    String? publishedYear,
    int? publishedDate,
    String? publisher,
    String? description,
    String? isbn,
    String? asin,
    String? language,
    bool? explicit,
  }) = _MediaMetadata;

  factory MediaMetadata.fromJson(Map<String, dynamic> json) =>
      _$MediaMetadataFromJson(json);
}

@freezed
class Author with _$Author {
  const factory Author({
    required String id,
    required String name,
    int? updatedAt,
    String? imagePath,
    String? description,
    String? asin,
    int? numBooks,
    int? addedAt,
  }) = _Author;

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
}

@freezed
class Series with _$Series {
  const factory Series({
    required String id,
    required String name,
    String? sequence,
  }) = _Series;

  factory Series.fromJson(Map<String, dynamic> json) => _$SeriesFromJson(json);
}
