import 'package:freezed_annotation/freezed_annotation.dart';

part 'abs_audiobook_minified.freezed.dart';
part 'abs_audiobook_minified.g.dart';

@freezed
class AbsAudiobookMinified with _$AbsAudiobookMinified {
  const factory AbsAudiobookMinified({
    required String id,
    required String ino,
    required String libraryId,
    required String folderId,
    required String path,
    required String relPath,
    required bool isFile,
    required int mtimeMs,
    required int ctimeMs,
    required int birthtimeMs,
    required int addedAt,
    required int updatedAt,
    required bool isMissing,
    required bool isInvalid,
    required String mediaType,
    required MinifiedMedia media,
    required int numFiles,
    int? size,
  }) = _AbsAudiobookMinified;

  factory AbsAudiobookMinified.fromJson(Map<String, dynamic> json) =>
      _$AbsAudiobookMinifiedFromJson(json);
}

@freezed
class MinifiedMedia with _$MinifiedMedia {
  const factory MinifiedMedia({
    required Metadata metadata,
    String? coverPath,
    required List<String> tags,
    required int numTracks,
    required int numAudioFiles,
    required int numChapters,
    required int numMissingParts,
    required int numInvalidAudioFiles,
    required double duration,
    int? size,
    String? ebookFormat,
  }) = _Media;

  factory MinifiedMedia.fromJson(Map<String, dynamic> json) =>
      _$MinifiedMediaFromJson(json);
}

@freezed
class Metadata with _$Metadata {
  const factory Metadata({
    String? title,
    String? titleIgnorePrefix,
    String? subtitle,
    String? authorName,
    String? authorNameLf,
    String? narratorName,
    String? seriesName,
    List<String>? genres,
    String? publishedYear,
    String? publishedDate,
    String? publisher,
    String? description,
    String? isbn,
    String? asin,
    String? language,
    bool? explicit,
  }) = _Metadata;

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);
}
