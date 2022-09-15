// // To parse this JSON data, do
// //
// //     final absSearchResponse = absSearchResponseFromJson(jsonString);

// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'dart:convert';

// part 'abs_search_response.freezed.dart';
// part 'abs_search_response.g.dart';

// AbsSearchResponse absSearchResponseFromJson(String str) =>
//     AbsSearchResponse.fromJson(json.decode(str));

// String absSearchResponseToJson(AbsSearchResponse data) =>
//     json.encode(data.toJson());

// @freezed
// abstract class AbsSearchResponse with _$AbsSearchResponse {
//   const factory AbsSearchResponse({
//     List<AbsSearchResponseBook> book,
//     List<Tag> tags,
//     List<AbsSearchResponseAuthor> authors,
//     List<AbsSearchResponseSeries> series,
//   }) = _AbsSearchResponse;

//   factory AbsSearchResponse.fromJson(Map<String, dynamic> json) =>
//       _$AbsSearchResponseFromJson(json);
// }

// @freezed
// abstract class AbsSearchResponseAuthor with _$AbsSearchResponseAuthor {
//   const factory AbsSearchResponseAuthor({
//     AuthorId id,
//     String asin,
//     AuthorNameEnum name,
//     String description,
//     String imagePath,
//     String relImagePath,
//     int addedAt,
//     int numBooks,
//   }) = _AbsSearchResponseAuthor;

//   factory AbsSearchResponseAuthor.fromJson(Map<String, dynamic> json) =>
//       _$AbsSearchResponseAuthorFromJson(json);
// }

// enum AuthorId {
//   AUT_LWDNYLTHSR2_KCLCZAZ,
//   AUT_2_YV8_GPNXGO0_M8445_AQ,
//   AUT_28_XAHQUWF9_QCPTHUCJ
// }

// final authorIdValues = EnumValues({
//   "aut_28xahquwf9qcpthucj": AuthorId.AUT_28_XAHQUWF9_QCPTHUCJ,
//   "aut_2yv8gpnxgo0m8445aq": AuthorId.AUT_2_YV8_GPNXGO0_M8445_AQ,
//   "aut_lwdnylthsr2kclczaz": AuthorId.AUT_LWDNYLTHSR2_KCLCZAZ
// });

// enum AuthorNameEnum { RAINBOW_ROWELL, ROBIN_HOBB, DREW_HAYES }

// final authorNameEnumValues = EnumValues({
//   "Drew Hayes": AuthorNameEnum.DREW_HAYES,
//   "Rainbow Rowell": AuthorNameEnum.RAINBOW_ROWELL,
//   "Robin Hobb": AuthorNameEnum.ROBIN_HOBB
// });

// @freezed
// abstract class AbsSearchResponseBook with _$AbsSearchResponseBook {
//   const factory AbsSearchResponseBook({
//     LibraryItem libraryItem,
//     String matchKey,
//     String matchText,
//   }) = _AbsSearchResponseBook;

//   factory AbsSearchResponseBook.fromJson(Map<String, dynamic> json) =>
//       _$AbsSearchResponseBookFromJson(json);
// }

// @freezed
// abstract class LibraryItem with _$LibraryItem {
//   const factory LibraryItem({
//     String id,
//     String ino,
//     String libraryId,
//     String folderId,
//     String path,
//     String relPath,
//     bool isFile,
//     int mtimeMs,
//     int ctimeMs,
//     int birthtimeMs,
//     int addedAt,
//     int updatedAt,
//     int lastScan,
//     String scanVersion,
//     bool isMissing,
//     bool isInvalid,
//     String mediaType,
//     LibraryItemMedia media,
//     List<LibraryFile> libraryFiles,
//     int size,
//   }) = _LibraryItem;

//   factory LibraryItem.fromJson(Map<String, dynamic> json) =>
//       _$LibraryItemFromJson(json);
// }

// @freezed
// abstract class LibraryFile with _$LibraryFile {
//   const factory LibraryFile({
//     String ino,
//     LibraryFileMetadata metadata,
//     int addedAt,
//     int updatedAt,
//     FileType fileType,
//   }) = _LibraryFile;

//   factory LibraryFile.fromJson(Map<String, dynamic> json) =>
//       _$LibraryFileFromJson(json);
// }

// enum FileType { AUDIO, UNKNOWN, IMAGE, TEXT }

// final fileTypeValues = EnumValues({
//   "audio": FileType.AUDIO,
//   "image": FileType.IMAGE,
//   "text": FileType.TEXT,
//   "unknown": FileType.UNKNOWN
// });

// @freezed
// abstract class LibraryFileMetadata with _$LibraryFileMetadata {
//   const factory LibraryFileMetadata({
//     String filename,
//     Ext ext,
//     String path,
//     String relPath,
//     int size,
//     int mtimeMs,
//     int ctimeMs,
//     int birthtimeMs,
//   }) = _LibraryFileMetadata;

//   factory LibraryFileMetadata.fromJson(Map<String, dynamic> json) =>
//       _$LibraryFileMetadataFromJson(json);
// }

// enum Ext { M4_A, M3_U, PAR2, NZB, JPG, TXT }

// final extValues = EnumValues({
//   ".jpg": Ext.JPG,
//   ".m3u": Ext.M3_U,
//   ".m4a": Ext.M4_A,
//   ".nzb": Ext.NZB,
//   ".par2": Ext.PAR2,
//   ".txt": Ext.TXT
// });

// @freezed
// abstract class LibraryItemMedia with _$LibraryItemMedia {
//   const factory LibraryItemMedia({
//     String libraryItemId,
//     PurpleMetadata metadata,
//     String coverPath,
//     List<String> tags,
//     List<AudioFile> audioFiles,
//     List<Chapter> chapters,
//     double duration,
//     int size,
//     List<Track> tracks,
//     List<dynamic> missingParts,
//     dynamic ebookFile,
//   }) = _LibraryItemMedia;

//   factory LibraryItemMedia.fromJson(Map<String, dynamic> json) =>
//       _$LibraryItemMediaFromJson(json);
// }

// @freezed
// abstract class AudioFile with _$AudioFile {
//   const factory AudioFile({
//     int index,
//     String ino,
//     LibraryFileMetadata metadata,
//     int addedAt,
//     int updatedAt,
//     int trackNumFromMeta,
//     int trackNumFromFilename,
//     dynamic discNumFromFilename,
//     bool manuallyVerified,
//     bool invalid,
//     bool exclude,
//     dynamic error,
//     Format format,
//     double duration,
//     int bitRate,
//     Language language,
//     Codec codec,
//     TimeBase timeBase,
//     int channels,
//     ChannelLayout channelLayout,
//     List<Chapter> chapters,
//     EmbeddedCoverArt embeddedCoverArt,
//     MetaTags metaTags,
//     MimeType mimeType,
//   }) = _AudioFile;

//   factory AudioFile.fromJson(Map<String, dynamic> json) =>
//       _$AudioFileFromJson(json);
// }

// enum ChannelLayout { STEREO, MONO }

// final channelLayoutValues =
//     EnumValues({"mono": ChannelLayout.MONO, "stereo": ChannelLayout.STEREO});

// @freezed
// abstract class Chapter with _$Chapter {
//   const factory Chapter({
//     int id,
//     double start,
//     double end,
//     String title,
//   }) = _Chapter;

//   factory Chapter.fromJson(Map<String, dynamic> json) =>
//       _$ChapterFromJson(json);
// }

// enum Codec { AAC }

// final codecValues = EnumValues({"aac": Codec.AAC});

// enum EmbeddedCoverArt { MJPEG }

// final embeddedCoverArtValues = EnumValues({"mjpeg": EmbeddedCoverArt.MJPEG});

// enum Format { QUICK_TIME_MOV }

// final formatValues = EnumValues({"QuickTime / MOV": Format.QUICK_TIME_MOV});

// enum Language { UND }

// final languageValues = EnumValues({"und": Language.UND});

// @freezed
// abstract class MetaTags with _$MetaTags {
//   const factory MetaTags({
//     Title tagAlbum,
//     TagArtist tagArtist,
//     TagGenre tagGenre,
//     String tagTitle,
//     String tagTrack,
//     String tagDate,
//     NarratorName tagComposer,
//     String tagComment,
//     String tagDescription,
//     TagEncoder tagEncoder,
//     TagSeries tagSeries,
//     String tagSeriesPart,
//     TagSubtitle tagSubtitle,
//   }) = _MetaTags;

//   factory MetaTags.fromJson(Map<String, dynamic> json) =>
//       _$MetaTagsFromJson(json);
// }

// enum Title {
//   ANY_WAY_THE_WIND_BLOWS,
//   DRAGON_HAVEN,
//   DRAGON_KEEPER,
//   WAYWARD_SON,
//   CARRY_ON,
//   BLOOD_OF_DRAGONS,
//   CITY_OF_DRAGONS,
//   SUPER_POWEREDS_YEAR_1
// }

// final titleValues = EnumValues({
//   "Any Way the Wind Blows": Title.ANY_WAY_THE_WIND_BLOWS,
//   "Blood of Dragons": Title.BLOOD_OF_DRAGONS,
//   "Carry On": Title.CARRY_ON,
//   "City of Dragons": Title.CITY_OF_DRAGONS,
//   "Dragon Haven": Title.DRAGON_HAVEN,
//   "Dragon Keeper": Title.DRAGON_KEEPER,
//   "Super Powereds: Year 1": Title.SUPER_POWEREDS_YEAR_1,
//   "Wayward Son": Title.WAYWARD_SON
// });

// enum TagArtist {
//   RAINBOW_ROWELL_EUAN_MORTON,
//   ROBIN_HOBB_ANNE_FLOSNIK,
//   DREW_HAYES_KYLE_MC_CARLEY
// }

// final tagArtistValues = EnumValues({
//   "Drew Hayes; Kyle McCarley": TagArtist.DREW_HAYES_KYLE_MC_CARLEY,
//   "Rainbow Rowell; Euan Morton": TagArtist.RAINBOW_ROWELL_EUAN_MORTON,
//   "Robin Hobb; Anne Flosnik": TagArtist.ROBIN_HOBB_ANNE_FLOSNIK
// });

// enum NarratorName { EUAN_MORTON, ANNE_FLOSNIK, KYLE_MC_CARLEY }

// final narratorNameValues = EnumValues({
//   "Anne Flosnik": NarratorName.ANNE_FLOSNIK,
//   "Euan Morton": NarratorName.EUAN_MORTON,
//   "Kyle McCarley": NarratorName.KYLE_MC_CARLEY
// });

// enum TagEncoder { LAVF58_29100, LAVF58_67100, LAVF58_45100 }

// final tagEncoderValues = EnumValues({
//   "Lavf58.29.100": TagEncoder.LAVF58_29100,
//   "Lavf58.45.100": TagEncoder.LAVF58_45100,
//   "Lavf58.67.100": TagEncoder.LAVF58_67100
// });

// enum TagGenre {
//   TEEN_LITERATURE_FICTION,
//   SCIENCE_FICTION_FANTASY_FANTASY,
//   LITERATURE_FICTION_CLASSICS,
//   TEEN_YOUNG_ADULT_ROMANCE,
//   LITERATURE_FICTION_ACTION_ADVENTURE
// }

// final tagGenreValues = EnumValues({
//   "Literature & Fiction/Action & Adventure":
//       TagGenre.LITERATURE_FICTION_ACTION_ADVENTURE,
//   "Literature & Fiction/Classics": TagGenre.LITERATURE_FICTION_CLASSICS,
//   "Science Fiction & Fantasy/Fantasy": TagGenre.SCIENCE_FICTION_FANTASY_FANTASY,
//   "Teen/Literature & Fiction": TagGenre.TEEN_LITERATURE_FICTION,
//   "Teen & Young Adult/Romance": TagGenre.TEEN_YOUNG_ADULT_ROMANCE
// });

// enum TagSeries { SIMON_SNOW_TRILOGY, SIMON_SNOW, SUPER_POWEREDS }

// final tagSeriesValues = EnumValues({
//   "Simon Snow": TagSeries.SIMON_SNOW,
//   "Simon Snow Trilogy": TagSeries.SIMON_SNOW_TRILOGY,
//   "Super Powereds": TagSeries.SUPER_POWEREDS
// });

// enum TagSubtitle { SUPER_POWEREDS_BOOK_1 }

// final tagSubtitleValues =
//     EnumValues({"Super Powereds, Book 1": TagSubtitle.SUPER_POWEREDS_BOOK_1});

// enum MimeType { AUDIO_MPEG }

// final mimeTypeValues = EnumValues({"audio/mpeg": MimeType.AUDIO_MPEG});

// enum TimeBase { THE_144100, THE_124000, THE_122050 }

// final timeBaseValues = EnumValues({
//   "1/22050": TimeBase.THE_122050,
//   "1/24000": TimeBase.THE_124000,
//   "1/44100": TimeBase.THE_144100
// });

// @freezed
// abstract class PurpleMetadata with _$PurpleMetadata {
//   const factory PurpleMetadata({
//     Title title,
//     Title titleIgnorePrefix,
//     String subtitle,
//     List<MetadataAuthor> authors,
//     List<NarratorName> narrators,
//     List<MetadataSeries> series,
//     List<String> genres,
//     String publishedYear,
//     dynamic publishedDate,
//     String publisher,
//     String description,
//     dynamic isbn,
//     String asin,
//     dynamic language,
//     bool explicit,
//     AuthorNameEnum authorName,
//     String authorNameLf,
//     NarratorName narratorName,
//     String seriesName,
//   }) = _PurpleMetadata;

//   factory PurpleMetadata.fromJson(Map<String, dynamic> json) =>
//       _$PurpleMetadataFromJson(json);
// }

// @freezed
// abstract class MetadataAuthor with _$MetadataAuthor {
//   const factory MetadataAuthor({
//     AuthorId id,
//     AuthorNameEnum name,
//   }) = _MetadataAuthor;

//   factory MetadataAuthor.fromJson(Map<String, dynamic> json) =>
//       _$MetadataAuthorFromJson(json);
// }

// @freezed
// abstract class MetadataSeries with _$MetadataSeries {
//   const factory MetadataSeries({
//     SeriesId id,
//     SeriesName name,
//     String sequence,
//   }) = _MetadataSeries;

//   factory MetadataSeries.fromJson(Map<String, dynamic> json) =>
//       _$MetadataSeriesFromJson(json);
// }

// enum SeriesId {
//   SER_LAGUSJG4_BNXYO4_XSSC,
//   SER_O1_NS7_EKYZGL6_P4_FY5_S,
//   SER_6_DICQC4_XEK28_M1_HIZ6
// }

// final seriesIdValues = EnumValues({
//   "ser_6dicqc4xek28m1hiz6": SeriesId.SER_6_DICQC4_XEK28_M1_HIZ6,
//   "ser_lagusjg4bnxyo4xssc": SeriesId.SER_LAGUSJG4_BNXYO4_XSSC,
//   "ser_o1ns7ekyzgl6p4fy5s": SeriesId.SER_O1_NS7_EKYZGL6_P4_FY5_S
// });

// enum SeriesName { SIMON_SNOW_TRILOGY, THE_RAIN_WILD_CHRONICLES, SUPER_POWEREDS }

// final seriesNameValues = EnumValues({
//   "Simon Snow Trilogy": SeriesName.SIMON_SNOW_TRILOGY,
//   "Super Powereds": SeriesName.SUPER_POWEREDS,
//   "The Rain Wild Chronicles": SeriesName.THE_RAIN_WILD_CHRONICLES
// });

// @freezed
// abstract class Track with _$Track {
//   const factory Track({
//     int index,
//     double startOffset,
//     double duration,
//     String title,
//     String contentUrl,
//     MimeType mimeType,
//     LibraryFileMetadata metadata,
//   }) = _Track;

//   factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
// }

// @freezed
// abstract class AbsSearchResponseSeries with _$AbsSearchResponseSeries {
//   const factory AbsSearchResponseSeries({
//     SeriesSeries series,
//     List<SeriesBook> books,
//   }) = _AbsSearchResponseSeries;

//   factory AbsSearchResponseSeries.fromJson(Map<String, dynamic> json) =>
//       _$AbsSearchResponseSeriesFromJson(json);
// }

// @freezed
// abstract class SeriesBook with _$SeriesBook {
//   const factory SeriesBook({
//     String id,
//     String ino,
//     String libraryId,
//     String folderId,
//     String path,
//     String relPath,
//     bool isFile,
//     int mtimeMs,
//     int ctimeMs,
//     int birthtimeMs,
//     int addedAt,
//     int updatedAt,
//     int lastScan,
//     String scanVersion,
//     bool isMissing,
//     bool isInvalid,
//     String mediaType,
//     BookMedia media,
//     List<LibraryFile> libraryFiles,
//   }) = _SeriesBook;

//   factory SeriesBook.fromJson(Map<String, dynamic> json) =>
//       _$SeriesBookFromJson(json);
// }

// @freezed
// abstract class BookMedia with _$BookMedia {
//   const factory BookMedia({
//     String libraryItemId,
//     FluffyMetadata metadata,
//     String coverPath,
//     List<String> tags,
//     List<AudioFile> audioFiles,
//     List<Chapter> chapters,
//     List<dynamic> missingParts,
//     dynamic ebookFile,
//   }) = _BookMedia;

//   factory BookMedia.fromJson(Map<String, dynamic> json) =>
//       _$BookMediaFromJson(json);
// }

// @freezed
// abstract class FluffyMetadata with _$FluffyMetadata {
//   const factory FluffyMetadata({
//     Title title,
//     String subtitle,
//     List<MetadataAuthor> authors,
//     List<NarratorName> narrators,
//     List<MetadataSeries> series,
//     List<String> genres,
//     String publishedYear,
//     dynamic publishedDate,
//     String publisher,
//     String description,
//     dynamic isbn,
//     String asin,
//     dynamic language,
//     bool explicit,
//   }) = _FluffyMetadata;

//   factory FluffyMetadata.fromJson(Map<String, dynamic> json) =>
//       _$FluffyMetadataFromJson(json);
// }

// @freezed
// abstract class SeriesSeries with _$SeriesSeries {
//   const factory SeriesSeries({
//     SeriesId id,
//     SeriesName name,
//     dynamic description,
//     int addedAt,
//     int updatedAt,
//   }) = _SeriesSeries;

//   factory SeriesSeries.fromJson(Map<String, dynamic> json) =>
//       _$SeriesSeriesFromJson(json);
// }

// @freezed
// abstract class Tag with _$Tag {
//   const factory Tag({
//     String name,
//     List<SeriesBook> books,
//   }) = _Tag;

//   factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
// }

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
