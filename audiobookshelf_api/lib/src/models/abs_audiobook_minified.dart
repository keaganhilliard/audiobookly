import 'package:freezed_annotation/freezed_annotation.dart';

part 'abs_audiobook_minified.freezed.dart';
part 'abs_audiobook_minified.g.dart';

@freezed
class AbsAudiobookMinified with _$AbsAudiobookMinified {
  const factory AbsAudiobookMinified({
    required String id,
    String? ino,
    String? libraryId,
    String? folderId,
    String? path,
    String? relPath,
    bool? isFile,
    int? mtimeMs,
    int? ctimeMs,
    int? birthtimeMs,
    int? addedAt,
    int? updatedAt,
    bool? isMissing,
    bool? isInvalid,
    String? mediaType,
    MinifiedMedia? media,
    int? numFiles,
    int? size,
  }) = _AbsAudiobookMinified;

  factory AbsAudiobookMinified.fromJson(Map<String, dynamic> json) =>
      _$AbsAudiobookMinifiedFromJson(json);
}

@freezed
class MinifiedMedia with _$MinifiedMedia {
  const factory MinifiedMedia({
    Metadata? metadata,
    String? coverPath,
    List<String>? tags,
    int? numTracks,
    int? numAudioFiles,
    int? numChapters,
    int? numMissingParts,
    int? numInvalidAudioFiles,
    double? duration,
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
