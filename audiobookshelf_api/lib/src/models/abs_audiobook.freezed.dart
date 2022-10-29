// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'abs_audiobook.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AbsAudiobook _$AbsAudiobookFromJson(Map<String, dynamic> json) {
  return _AbsAudiobook.fromJson(json);
}

/// @nodoc
mixin _$AbsAudiobook {
  String get id => throw _privateConstructorUsedError;
  String get ino => throw _privateConstructorUsedError;
  String get libraryId => throw _privateConstructorUsedError;
  String get folderId => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  String get relPath => throw _privateConstructorUsedError;
  bool get isFile => throw _privateConstructorUsedError;
  int? get mtimeMs => throw _privateConstructorUsedError;
  int? get ctimeMs => throw _privateConstructorUsedError;
  int? get birthtimeMs => throw _privateConstructorUsedError;
  int? get addedAt => throw _privateConstructorUsedError;
  int? get updatedAt => throw _privateConstructorUsedError;
  int? get lastScan => throw _privateConstructorUsedError;
  String? get scanVersion => throw _privateConstructorUsedError;
  bool get isMissing => throw _privateConstructorUsedError;
  bool get isInvalid => throw _privateConstructorUsedError;
  String get mediaType => throw _privateConstructorUsedError;
  Media get media => throw _privateConstructorUsedError;
  List<LibraryFile> get libraryFiles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AbsAudiobookCopyWith<AbsAudiobook> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AbsAudiobookCopyWith<$Res> {
  factory $AbsAudiobookCopyWith(
          AbsAudiobook value, $Res Function(AbsAudiobook) then) =
      _$AbsAudiobookCopyWithImpl<$Res, AbsAudiobook>;
  @useResult
  $Res call(
      {String id,
      String ino,
      String libraryId,
      String folderId,
      String path,
      String relPath,
      bool isFile,
      int? mtimeMs,
      int? ctimeMs,
      int? birthtimeMs,
      int? addedAt,
      int? updatedAt,
      int? lastScan,
      String? scanVersion,
      bool isMissing,
      bool isInvalid,
      String mediaType,
      Media media,
      List<LibraryFile> libraryFiles});

  $MediaCopyWith<$Res> get media;
}

/// @nodoc
class _$AbsAudiobookCopyWithImpl<$Res, $Val extends AbsAudiobook>
    implements $AbsAudiobookCopyWith<$Res> {
  _$AbsAudiobookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ino = null,
    Object? libraryId = null,
    Object? folderId = null,
    Object? path = null,
    Object? relPath = null,
    Object? isFile = null,
    Object? mtimeMs = freezed,
    Object? ctimeMs = freezed,
    Object? birthtimeMs = freezed,
    Object? addedAt = freezed,
    Object? updatedAt = freezed,
    Object? lastScan = freezed,
    Object? scanVersion = freezed,
    Object? isMissing = null,
    Object? isInvalid = null,
    Object? mediaType = null,
    Object? media = null,
    Object? libraryFiles = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ino: null == ino
          ? _value.ino
          : ino // ignore: cast_nullable_to_non_nullable
              as String,
      libraryId: null == libraryId
          ? _value.libraryId
          : libraryId // ignore: cast_nullable_to_non_nullable
              as String,
      folderId: null == folderId
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      relPath: null == relPath
          ? _value.relPath
          : relPath // ignore: cast_nullable_to_non_nullable
              as String,
      isFile: null == isFile
          ? _value.isFile
          : isFile // ignore: cast_nullable_to_non_nullable
              as bool,
      mtimeMs: freezed == mtimeMs
          ? _value.mtimeMs
          : mtimeMs // ignore: cast_nullable_to_non_nullable
              as int?,
      ctimeMs: freezed == ctimeMs
          ? _value.ctimeMs
          : ctimeMs // ignore: cast_nullable_to_non_nullable
              as int?,
      birthtimeMs: freezed == birthtimeMs
          ? _value.birthtimeMs
          : birthtimeMs // ignore: cast_nullable_to_non_nullable
              as int?,
      addedAt: freezed == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      lastScan: freezed == lastScan
          ? _value.lastScan
          : lastScan // ignore: cast_nullable_to_non_nullable
              as int?,
      scanVersion: freezed == scanVersion
          ? _value.scanVersion
          : scanVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      isMissing: null == isMissing
          ? _value.isMissing
          : isMissing // ignore: cast_nullable_to_non_nullable
              as bool,
      isInvalid: null == isInvalid
          ? _value.isInvalid
          : isInvalid // ignore: cast_nullable_to_non_nullable
              as bool,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
      media: null == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as Media,
      libraryFiles: null == libraryFiles
          ? _value.libraryFiles
          : libraryFiles // ignore: cast_nullable_to_non_nullable
              as List<LibraryFile>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MediaCopyWith<$Res> get media {
    return $MediaCopyWith<$Res>(_value.media, (value) {
      return _then(_value.copyWith(media: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AbsAudiobookCopyWith<$Res>
    implements $AbsAudiobookCopyWith<$Res> {
  factory _$$_AbsAudiobookCopyWith(
          _$_AbsAudiobook value, $Res Function(_$_AbsAudiobook) then) =
      __$$_AbsAudiobookCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String ino,
      String libraryId,
      String folderId,
      String path,
      String relPath,
      bool isFile,
      int? mtimeMs,
      int? ctimeMs,
      int? birthtimeMs,
      int? addedAt,
      int? updatedAt,
      int? lastScan,
      String? scanVersion,
      bool isMissing,
      bool isInvalid,
      String mediaType,
      Media media,
      List<LibraryFile> libraryFiles});

  @override
  $MediaCopyWith<$Res> get media;
}

/// @nodoc
class __$$_AbsAudiobookCopyWithImpl<$Res>
    extends _$AbsAudiobookCopyWithImpl<$Res, _$_AbsAudiobook>
    implements _$$_AbsAudiobookCopyWith<$Res> {
  __$$_AbsAudiobookCopyWithImpl(
      _$_AbsAudiobook _value, $Res Function(_$_AbsAudiobook) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ino = null,
    Object? libraryId = null,
    Object? folderId = null,
    Object? path = null,
    Object? relPath = null,
    Object? isFile = null,
    Object? mtimeMs = freezed,
    Object? ctimeMs = freezed,
    Object? birthtimeMs = freezed,
    Object? addedAt = freezed,
    Object? updatedAt = freezed,
    Object? lastScan = freezed,
    Object? scanVersion = freezed,
    Object? isMissing = null,
    Object? isInvalid = null,
    Object? mediaType = null,
    Object? media = null,
    Object? libraryFiles = null,
  }) {
    return _then(_$_AbsAudiobook(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ino: null == ino
          ? _value.ino
          : ino // ignore: cast_nullable_to_non_nullable
              as String,
      libraryId: null == libraryId
          ? _value.libraryId
          : libraryId // ignore: cast_nullable_to_non_nullable
              as String,
      folderId: null == folderId
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      relPath: null == relPath
          ? _value.relPath
          : relPath // ignore: cast_nullable_to_non_nullable
              as String,
      isFile: null == isFile
          ? _value.isFile
          : isFile // ignore: cast_nullable_to_non_nullable
              as bool,
      mtimeMs: freezed == mtimeMs
          ? _value.mtimeMs
          : mtimeMs // ignore: cast_nullable_to_non_nullable
              as int?,
      ctimeMs: freezed == ctimeMs
          ? _value.ctimeMs
          : ctimeMs // ignore: cast_nullable_to_non_nullable
              as int?,
      birthtimeMs: freezed == birthtimeMs
          ? _value.birthtimeMs
          : birthtimeMs // ignore: cast_nullable_to_non_nullable
              as int?,
      addedAt: freezed == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      lastScan: freezed == lastScan
          ? _value.lastScan
          : lastScan // ignore: cast_nullable_to_non_nullable
              as int?,
      scanVersion: freezed == scanVersion
          ? _value.scanVersion
          : scanVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      isMissing: null == isMissing
          ? _value.isMissing
          : isMissing // ignore: cast_nullable_to_non_nullable
              as bool,
      isInvalid: null == isInvalid
          ? _value.isInvalid
          : isInvalid // ignore: cast_nullable_to_non_nullable
              as bool,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
      media: null == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as Media,
      libraryFiles: null == libraryFiles
          ? _value._libraryFiles
          : libraryFiles // ignore: cast_nullable_to_non_nullable
              as List<LibraryFile>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AbsAudiobook implements _AbsAudiobook {
  const _$_AbsAudiobook(
      {required this.id,
      required this.ino,
      required this.libraryId,
      required this.folderId,
      required this.path,
      required this.relPath,
      required this.isFile,
      this.mtimeMs,
      this.ctimeMs,
      this.birthtimeMs,
      this.addedAt,
      this.updatedAt,
      this.lastScan,
      this.scanVersion,
      required this.isMissing,
      required this.isInvalid,
      required this.mediaType,
      required this.media,
      required final List<LibraryFile> libraryFiles})
      : _libraryFiles = libraryFiles;

  factory _$_AbsAudiobook.fromJson(Map<String, dynamic> json) =>
      _$$_AbsAudiobookFromJson(json);

  @override
  final String id;
  @override
  final String ino;
  @override
  final String libraryId;
  @override
  final String folderId;
  @override
  final String path;
  @override
  final String relPath;
  @override
  final bool isFile;
  @override
  final int? mtimeMs;
  @override
  final int? ctimeMs;
  @override
  final int? birthtimeMs;
  @override
  final int? addedAt;
  @override
  final int? updatedAt;
  @override
  final int? lastScan;
  @override
  final String? scanVersion;
  @override
  final bool isMissing;
  @override
  final bool isInvalid;
  @override
  final String mediaType;
  @override
  final Media media;
  final List<LibraryFile> _libraryFiles;
  @override
  List<LibraryFile> get libraryFiles {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_libraryFiles);
  }

  @override
  String toString() {
    return 'AbsAudiobook(id: $id, ino: $ino, libraryId: $libraryId, folderId: $folderId, path: $path, relPath: $relPath, isFile: $isFile, mtimeMs: $mtimeMs, ctimeMs: $ctimeMs, birthtimeMs: $birthtimeMs, addedAt: $addedAt, updatedAt: $updatedAt, lastScan: $lastScan, scanVersion: $scanVersion, isMissing: $isMissing, isInvalid: $isInvalid, mediaType: $mediaType, media: $media, libraryFiles: $libraryFiles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AbsAudiobook &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ino, ino) || other.ino == ino) &&
            (identical(other.libraryId, libraryId) ||
                other.libraryId == libraryId) &&
            (identical(other.folderId, folderId) ||
                other.folderId == folderId) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.relPath, relPath) || other.relPath == relPath) &&
            (identical(other.isFile, isFile) || other.isFile == isFile) &&
            (identical(other.mtimeMs, mtimeMs) || other.mtimeMs == mtimeMs) &&
            (identical(other.ctimeMs, ctimeMs) || other.ctimeMs == ctimeMs) &&
            (identical(other.birthtimeMs, birthtimeMs) ||
                other.birthtimeMs == birthtimeMs) &&
            (identical(other.addedAt, addedAt) || other.addedAt == addedAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.lastScan, lastScan) ||
                other.lastScan == lastScan) &&
            (identical(other.scanVersion, scanVersion) ||
                other.scanVersion == scanVersion) &&
            (identical(other.isMissing, isMissing) ||
                other.isMissing == isMissing) &&
            (identical(other.isInvalid, isInvalid) ||
                other.isInvalid == isInvalid) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.media, media) || other.media == media) &&
            const DeepCollectionEquality()
                .equals(other._libraryFiles, _libraryFiles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        ino,
        libraryId,
        folderId,
        path,
        relPath,
        isFile,
        mtimeMs,
        ctimeMs,
        birthtimeMs,
        addedAt,
        updatedAt,
        lastScan,
        scanVersion,
        isMissing,
        isInvalid,
        mediaType,
        media,
        const DeepCollectionEquality().hash(_libraryFiles)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AbsAudiobookCopyWith<_$_AbsAudiobook> get copyWith =>
      __$$_AbsAudiobookCopyWithImpl<_$_AbsAudiobook>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AbsAudiobookToJson(
      this,
    );
  }
}

abstract class _AbsAudiobook implements AbsAudiobook {
  const factory _AbsAudiobook(
      {required final String id,
      required final String ino,
      required final String libraryId,
      required final String folderId,
      required final String path,
      required final String relPath,
      required final bool isFile,
      final int? mtimeMs,
      final int? ctimeMs,
      final int? birthtimeMs,
      final int? addedAt,
      final int? updatedAt,
      final int? lastScan,
      final String? scanVersion,
      required final bool isMissing,
      required final bool isInvalid,
      required final String mediaType,
      required final Media media,
      required final List<LibraryFile> libraryFiles}) = _$_AbsAudiobook;

  factory _AbsAudiobook.fromJson(Map<String, dynamic> json) =
      _$_AbsAudiobook.fromJson;

  @override
  String get id;
  @override
  String get ino;
  @override
  String get libraryId;
  @override
  String get folderId;
  @override
  String get path;
  @override
  String get relPath;
  @override
  bool get isFile;
  @override
  int? get mtimeMs;
  @override
  int? get ctimeMs;
  @override
  int? get birthtimeMs;
  @override
  int? get addedAt;
  @override
  int? get updatedAt;
  @override
  int? get lastScan;
  @override
  String? get scanVersion;
  @override
  bool get isMissing;
  @override
  bool get isInvalid;
  @override
  String get mediaType;
  @override
  Media get media;
  @override
  List<LibraryFile> get libraryFiles;
  @override
  @JsonKey(ignore: true)
  _$$_AbsAudiobookCopyWith<_$_AbsAudiobook> get copyWith =>
      throw _privateConstructorUsedError;
}

LibraryFile _$LibraryFileFromJson(Map<String, dynamic> json) {
  return _LibraryFile.fromJson(json);
}

/// @nodoc
mixin _$LibraryFile {
  String get ino => throw _privateConstructorUsedError;
  LibraryFileMetadata get metadata => throw _privateConstructorUsedError;
  int get addedAt => throw _privateConstructorUsedError;
  int get updatedAt => throw _privateConstructorUsedError;
  String get fileType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LibraryFileCopyWith<LibraryFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibraryFileCopyWith<$Res> {
  factory $LibraryFileCopyWith(
          LibraryFile value, $Res Function(LibraryFile) then) =
      _$LibraryFileCopyWithImpl<$Res, LibraryFile>;
  @useResult
  $Res call(
      {String ino,
      LibraryFileMetadata metadata,
      int addedAt,
      int updatedAt,
      String fileType});

  $LibraryFileMetadataCopyWith<$Res> get metadata;
}

/// @nodoc
class _$LibraryFileCopyWithImpl<$Res, $Val extends LibraryFile>
    implements $LibraryFileCopyWith<$Res> {
  _$LibraryFileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ino = null,
    Object? metadata = null,
    Object? addedAt = null,
    Object? updatedAt = null,
    Object? fileType = null,
  }) {
    return _then(_value.copyWith(
      ino: null == ino
          ? _value.ino
          : ino // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as LibraryFileMetadata,
      addedAt: null == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      fileType: null == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LibraryFileMetadataCopyWith<$Res> get metadata {
    return $LibraryFileMetadataCopyWith<$Res>(_value.metadata, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LibraryFileCopyWith<$Res>
    implements $LibraryFileCopyWith<$Res> {
  factory _$$_LibraryFileCopyWith(
          _$_LibraryFile value, $Res Function(_$_LibraryFile) then) =
      __$$_LibraryFileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String ino,
      LibraryFileMetadata metadata,
      int addedAt,
      int updatedAt,
      String fileType});

  @override
  $LibraryFileMetadataCopyWith<$Res> get metadata;
}

/// @nodoc
class __$$_LibraryFileCopyWithImpl<$Res>
    extends _$LibraryFileCopyWithImpl<$Res, _$_LibraryFile>
    implements _$$_LibraryFileCopyWith<$Res> {
  __$$_LibraryFileCopyWithImpl(
      _$_LibraryFile _value, $Res Function(_$_LibraryFile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ino = null,
    Object? metadata = null,
    Object? addedAt = null,
    Object? updatedAt = null,
    Object? fileType = null,
  }) {
    return _then(_$_LibraryFile(
      ino: null == ino
          ? _value.ino
          : ino // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as LibraryFileMetadata,
      addedAt: null == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      fileType: null == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LibraryFile implements _LibraryFile {
  const _$_LibraryFile(
      {required this.ino,
      required this.metadata,
      required this.addedAt,
      required this.updatedAt,
      required this.fileType});

  factory _$_LibraryFile.fromJson(Map<String, dynamic> json) =>
      _$$_LibraryFileFromJson(json);

  @override
  final String ino;
  @override
  final LibraryFileMetadata metadata;
  @override
  final int addedAt;
  @override
  final int updatedAt;
  @override
  final String fileType;

  @override
  String toString() {
    return 'LibraryFile(ino: $ino, metadata: $metadata, addedAt: $addedAt, updatedAt: $updatedAt, fileType: $fileType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LibraryFile &&
            (identical(other.ino, ino) || other.ino == ino) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            (identical(other.addedAt, addedAt) || other.addedAt == addedAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, ino, metadata, addedAt, updatedAt, fileType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LibraryFileCopyWith<_$_LibraryFile> get copyWith =>
      __$$_LibraryFileCopyWithImpl<_$_LibraryFile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LibraryFileToJson(
      this,
    );
  }
}

abstract class _LibraryFile implements LibraryFile {
  const factory _LibraryFile(
      {required final String ino,
      required final LibraryFileMetadata metadata,
      required final int addedAt,
      required final int updatedAt,
      required final String fileType}) = _$_LibraryFile;

  factory _LibraryFile.fromJson(Map<String, dynamic> json) =
      _$_LibraryFile.fromJson;

  @override
  String get ino;
  @override
  LibraryFileMetadata get metadata;
  @override
  int get addedAt;
  @override
  int get updatedAt;
  @override
  String get fileType;
  @override
  @JsonKey(ignore: true)
  _$$_LibraryFileCopyWith<_$_LibraryFile> get copyWith =>
      throw _privateConstructorUsedError;
}

LibraryFileMetadata _$LibraryFileMetadataFromJson(Map<String, dynamic> json) {
  return _LibraryFileMetadata.fromJson(json);
}

/// @nodoc
mixin _$LibraryFileMetadata {
  String get filename => throw _privateConstructorUsedError;
  String get ext => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  String get relPath => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  int? get mtimeMs => throw _privateConstructorUsedError;
  int? get ctimeMs => throw _privateConstructorUsedError;
  int? get birthtimeMs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LibraryFileMetadataCopyWith<LibraryFileMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibraryFileMetadataCopyWith<$Res> {
  factory $LibraryFileMetadataCopyWith(
          LibraryFileMetadata value, $Res Function(LibraryFileMetadata) then) =
      _$LibraryFileMetadataCopyWithImpl<$Res, LibraryFileMetadata>;
  @useResult
  $Res call(
      {String filename,
      String ext,
      String path,
      String relPath,
      int size,
      int? mtimeMs,
      int? ctimeMs,
      int? birthtimeMs});
}

/// @nodoc
class _$LibraryFileMetadataCopyWithImpl<$Res, $Val extends LibraryFileMetadata>
    implements $LibraryFileMetadataCopyWith<$Res> {
  _$LibraryFileMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filename = null,
    Object? ext = null,
    Object? path = null,
    Object? relPath = null,
    Object? size = null,
    Object? mtimeMs = freezed,
    Object? ctimeMs = freezed,
    Object? birthtimeMs = freezed,
  }) {
    return _then(_value.copyWith(
      filename: null == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      ext: null == ext
          ? _value.ext
          : ext // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      relPath: null == relPath
          ? _value.relPath
          : relPath // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      mtimeMs: freezed == mtimeMs
          ? _value.mtimeMs
          : mtimeMs // ignore: cast_nullable_to_non_nullable
              as int?,
      ctimeMs: freezed == ctimeMs
          ? _value.ctimeMs
          : ctimeMs // ignore: cast_nullable_to_non_nullable
              as int?,
      birthtimeMs: freezed == birthtimeMs
          ? _value.birthtimeMs
          : birthtimeMs // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LibraryFileMetadataCopyWith<$Res>
    implements $LibraryFileMetadataCopyWith<$Res> {
  factory _$$_LibraryFileMetadataCopyWith(_$_LibraryFileMetadata value,
          $Res Function(_$_LibraryFileMetadata) then) =
      __$$_LibraryFileMetadataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String filename,
      String ext,
      String path,
      String relPath,
      int size,
      int? mtimeMs,
      int? ctimeMs,
      int? birthtimeMs});
}

/// @nodoc
class __$$_LibraryFileMetadataCopyWithImpl<$Res>
    extends _$LibraryFileMetadataCopyWithImpl<$Res, _$_LibraryFileMetadata>
    implements _$$_LibraryFileMetadataCopyWith<$Res> {
  __$$_LibraryFileMetadataCopyWithImpl(_$_LibraryFileMetadata _value,
      $Res Function(_$_LibraryFileMetadata) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filename = null,
    Object? ext = null,
    Object? path = null,
    Object? relPath = null,
    Object? size = null,
    Object? mtimeMs = freezed,
    Object? ctimeMs = freezed,
    Object? birthtimeMs = freezed,
  }) {
    return _then(_$_LibraryFileMetadata(
      filename: null == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      ext: null == ext
          ? _value.ext
          : ext // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      relPath: null == relPath
          ? _value.relPath
          : relPath // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      mtimeMs: freezed == mtimeMs
          ? _value.mtimeMs
          : mtimeMs // ignore: cast_nullable_to_non_nullable
              as int?,
      ctimeMs: freezed == ctimeMs
          ? _value.ctimeMs
          : ctimeMs // ignore: cast_nullable_to_non_nullable
              as int?,
      birthtimeMs: freezed == birthtimeMs
          ? _value.birthtimeMs
          : birthtimeMs // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LibraryFileMetadata implements _LibraryFileMetadata {
  const _$_LibraryFileMetadata(
      {required this.filename,
      required this.ext,
      required this.path,
      required this.relPath,
      required this.size,
      this.mtimeMs,
      this.ctimeMs,
      this.birthtimeMs});

  factory _$_LibraryFileMetadata.fromJson(Map<String, dynamic> json) =>
      _$$_LibraryFileMetadataFromJson(json);

  @override
  final String filename;
  @override
  final String ext;
  @override
  final String path;
  @override
  final String relPath;
  @override
  final int size;
  @override
  final int? mtimeMs;
  @override
  final int? ctimeMs;
  @override
  final int? birthtimeMs;

  @override
  String toString() {
    return 'LibraryFileMetadata(filename: $filename, ext: $ext, path: $path, relPath: $relPath, size: $size, mtimeMs: $mtimeMs, ctimeMs: $ctimeMs, birthtimeMs: $birthtimeMs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LibraryFileMetadata &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.ext, ext) || other.ext == ext) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.relPath, relPath) || other.relPath == relPath) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.mtimeMs, mtimeMs) || other.mtimeMs == mtimeMs) &&
            (identical(other.ctimeMs, ctimeMs) || other.ctimeMs == ctimeMs) &&
            (identical(other.birthtimeMs, birthtimeMs) ||
                other.birthtimeMs == birthtimeMs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, filename, ext, path, relPath,
      size, mtimeMs, ctimeMs, birthtimeMs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LibraryFileMetadataCopyWith<_$_LibraryFileMetadata> get copyWith =>
      __$$_LibraryFileMetadataCopyWithImpl<_$_LibraryFileMetadata>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LibraryFileMetadataToJson(
      this,
    );
  }
}

abstract class _LibraryFileMetadata implements LibraryFileMetadata {
  const factory _LibraryFileMetadata(
      {required final String filename,
      required final String ext,
      required final String path,
      required final String relPath,
      required final int size,
      final int? mtimeMs,
      final int? ctimeMs,
      final int? birthtimeMs}) = _$_LibraryFileMetadata;

  factory _LibraryFileMetadata.fromJson(Map<String, dynamic> json) =
      _$_LibraryFileMetadata.fromJson;

  @override
  String get filename;
  @override
  String get ext;
  @override
  String get path;
  @override
  String get relPath;
  @override
  int get size;
  @override
  int? get mtimeMs;
  @override
  int? get ctimeMs;
  @override
  int? get birthtimeMs;
  @override
  @JsonKey(ignore: true)
  _$$_LibraryFileMetadataCopyWith<_$_LibraryFileMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

Media _$MediaFromJson(Map<String, dynamic> json) {
  return _Media.fromJson(json);
}

/// @nodoc
mixin _$Media {
  String get libraryItemId => throw _privateConstructorUsedError;
  MediaMetadata get metadata => throw _privateConstructorUsedError;
  String? get coverPath => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  List<AudioFile>? get audioFiles => throw _privateConstructorUsedError;
  List<Chapter>? get chapters => throw _privateConstructorUsedError;
  List<dynamic>? get missingParts => throw _privateConstructorUsedError;
  dynamic get ebookFile => throw _privateConstructorUsedError;
  double? get duration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaCopyWith<Media> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaCopyWith<$Res> {
  factory $MediaCopyWith(Media value, $Res Function(Media) then) =
      _$MediaCopyWithImpl<$Res, Media>;
  @useResult
  $Res call(
      {String libraryItemId,
      MediaMetadata metadata,
      String? coverPath,
      List<String>? tags,
      List<AudioFile>? audioFiles,
      List<Chapter>? chapters,
      List<dynamic>? missingParts,
      dynamic ebookFile,
      double? duration});

  $MediaMetadataCopyWith<$Res> get metadata;
}

/// @nodoc
class _$MediaCopyWithImpl<$Res, $Val extends Media>
    implements $MediaCopyWith<$Res> {
  _$MediaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? libraryItemId = null,
    Object? metadata = null,
    Object? coverPath = freezed,
    Object? tags = freezed,
    Object? audioFiles = freezed,
    Object? chapters = freezed,
    Object? missingParts = freezed,
    Object? ebookFile = null,
    Object? duration = freezed,
  }) {
    return _then(_value.copyWith(
      libraryItemId: null == libraryItemId
          ? _value.libraryItemId
          : libraryItemId // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as MediaMetadata,
      coverPath: freezed == coverPath
          ? _value.coverPath
          : coverPath // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      audioFiles: freezed == audioFiles
          ? _value.audioFiles
          : audioFiles // ignore: cast_nullable_to_non_nullable
              as List<AudioFile>?,
      chapters: freezed == chapters
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<Chapter>?,
      missingParts: freezed == missingParts
          ? _value.missingParts
          : missingParts // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      ebookFile: null == ebookFile
          ? _value.ebookFile
          : ebookFile // ignore: cast_nullable_to_non_nullable
              as dynamic,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MediaMetadataCopyWith<$Res> get metadata {
    return $MediaMetadataCopyWith<$Res>(_value.metadata, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MediaCopyWith<$Res> implements $MediaCopyWith<$Res> {
  factory _$$_MediaCopyWith(_$_Media value, $Res Function(_$_Media) then) =
      __$$_MediaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String libraryItemId,
      MediaMetadata metadata,
      String? coverPath,
      List<String>? tags,
      List<AudioFile>? audioFiles,
      List<Chapter>? chapters,
      List<dynamic>? missingParts,
      dynamic ebookFile,
      double? duration});

  @override
  $MediaMetadataCopyWith<$Res> get metadata;
}

/// @nodoc
class __$$_MediaCopyWithImpl<$Res> extends _$MediaCopyWithImpl<$Res, _$_Media>
    implements _$$_MediaCopyWith<$Res> {
  __$$_MediaCopyWithImpl(_$_Media _value, $Res Function(_$_Media) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? libraryItemId = null,
    Object? metadata = null,
    Object? coverPath = freezed,
    Object? tags = freezed,
    Object? audioFiles = freezed,
    Object? chapters = freezed,
    Object? missingParts = freezed,
    Object? ebookFile = null,
    Object? duration = freezed,
  }) {
    return _then(_$_Media(
      libraryItemId: null == libraryItemId
          ? _value.libraryItemId
          : libraryItemId // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as MediaMetadata,
      coverPath: freezed == coverPath
          ? _value.coverPath
          : coverPath // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      audioFiles: freezed == audioFiles
          ? _value._audioFiles
          : audioFiles // ignore: cast_nullable_to_non_nullable
              as List<AudioFile>?,
      chapters: freezed == chapters
          ? _value._chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<Chapter>?,
      missingParts: freezed == missingParts
          ? _value._missingParts
          : missingParts // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      ebookFile: null == ebookFile
          ? _value.ebookFile
          : ebookFile // ignore: cast_nullable_to_non_nullable
              as dynamic,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Media implements _Media {
  const _$_Media(
      {required this.libraryItemId,
      required this.metadata,
      this.coverPath,
      final List<String>? tags,
      final List<AudioFile>? audioFiles,
      final List<Chapter>? chapters,
      final List<dynamic>? missingParts,
      this.ebookFile,
      this.duration})
      : _tags = tags,
        _audioFiles = audioFiles,
        _chapters = chapters,
        _missingParts = missingParts;

  factory _$_Media.fromJson(Map<String, dynamic> json) =>
      _$$_MediaFromJson(json);

  @override
  final String libraryItemId;
  @override
  final MediaMetadata metadata;
  @override
  final String? coverPath;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AudioFile>? _audioFiles;
  @override
  List<AudioFile>? get audioFiles {
    final value = _audioFiles;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Chapter>? _chapters;
  @override
  List<Chapter>? get chapters {
    final value = _chapters;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _missingParts;
  @override
  List<dynamic>? get missingParts {
    final value = _missingParts;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final dynamic ebookFile;
  @override
  final double? duration;

  @override
  String toString() {
    return 'Media(libraryItemId: $libraryItemId, metadata: $metadata, coverPath: $coverPath, tags: $tags, audioFiles: $audioFiles, chapters: $chapters, missingParts: $missingParts, ebookFile: $ebookFile, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Media &&
            (identical(other.libraryItemId, libraryItemId) ||
                other.libraryItemId == libraryItemId) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            (identical(other.coverPath, coverPath) ||
                other.coverPath == coverPath) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._audioFiles, _audioFiles) &&
            const DeepCollectionEquality().equals(other._chapters, _chapters) &&
            const DeepCollectionEquality()
                .equals(other._missingParts, _missingParts) &&
            const DeepCollectionEquality().equals(other.ebookFile, ebookFile) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      libraryItemId,
      metadata,
      coverPath,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_audioFiles),
      const DeepCollectionEquality().hash(_chapters),
      const DeepCollectionEquality().hash(_missingParts),
      const DeepCollectionEquality().hash(ebookFile),
      duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MediaCopyWith<_$_Media> get copyWith =>
      __$$_MediaCopyWithImpl<_$_Media>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MediaToJson(
      this,
    );
  }
}

abstract class _Media implements Media {
  const factory _Media(
      {required final String libraryItemId,
      required final MediaMetadata metadata,
      final String? coverPath,
      final List<String>? tags,
      final List<AudioFile>? audioFiles,
      final List<Chapter>? chapters,
      final List<dynamic>? missingParts,
      final dynamic ebookFile,
      final double? duration}) = _$_Media;

  factory _Media.fromJson(Map<String, dynamic> json) = _$_Media.fromJson;

  @override
  String get libraryItemId;
  @override
  MediaMetadata get metadata;
  @override
  String? get coverPath;
  @override
  List<String>? get tags;
  @override
  List<AudioFile>? get audioFiles;
  @override
  List<Chapter>? get chapters;
  @override
  List<dynamic>? get missingParts;
  @override
  dynamic get ebookFile;
  @override
  double? get duration;
  @override
  @JsonKey(ignore: true)
  _$$_MediaCopyWith<_$_Media> get copyWith =>
      throw _privateConstructorUsedError;
}

AudioFile _$AudioFileFromJson(Map<String, dynamic> json) {
  return _AudioFile.fromJson(json);
}

/// @nodoc
mixin _$AudioFile {
  int get index => throw _privateConstructorUsedError;
  String get ino => throw _privateConstructorUsedError;
  LibraryFileMetadata get metadata => throw _privateConstructorUsedError;
  int? get addedAt => throw _privateConstructorUsedError;
  int? get updatedAt => throw _privateConstructorUsedError;
  int? get trackNumFromMeta => throw _privateConstructorUsedError;
  dynamic get discNumFromMeta => throw _privateConstructorUsedError;
  dynamic get trackNumFromFilename => throw _privateConstructorUsedError;
  dynamic get discNumFromFilename => throw _privateConstructorUsedError;
  bool get manuallyVerified => throw _privateConstructorUsedError;
  bool get invalid => throw _privateConstructorUsedError;
  bool get exclude => throw _privateConstructorUsedError;
  dynamic get error => throw _privateConstructorUsedError;
  String? get format => throw _privateConstructorUsedError;
  double? get duration => throw _privateConstructorUsedError;
  int? get bitRate => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  String? get codec => throw _privateConstructorUsedError;
  String? get timeBase => throw _privateConstructorUsedError;
  int? get channels => throw _privateConstructorUsedError;
  String? get channelLayout => throw _privateConstructorUsedError;
  List<Chapter>? get chapters => throw _privateConstructorUsedError;
  dynamic get embeddedCoverArt => throw _privateConstructorUsedError;
  MetaTags get metaTags => throw _privateConstructorUsedError;
  String? get mimeType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AudioFileCopyWith<AudioFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioFileCopyWith<$Res> {
  factory $AudioFileCopyWith(AudioFile value, $Res Function(AudioFile) then) =
      _$AudioFileCopyWithImpl<$Res, AudioFile>;
  @useResult
  $Res call(
      {int index,
      String ino,
      LibraryFileMetadata metadata,
      int? addedAt,
      int? updatedAt,
      int? trackNumFromMeta,
      dynamic discNumFromMeta,
      dynamic trackNumFromFilename,
      dynamic discNumFromFilename,
      bool manuallyVerified,
      bool invalid,
      bool exclude,
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
      MetaTags metaTags,
      String? mimeType});

  $LibraryFileMetadataCopyWith<$Res> get metadata;
  $MetaTagsCopyWith<$Res> get metaTags;
}

/// @nodoc
class _$AudioFileCopyWithImpl<$Res, $Val extends AudioFile>
    implements $AudioFileCopyWith<$Res> {
  _$AudioFileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? ino = null,
    Object? metadata = null,
    Object? addedAt = freezed,
    Object? updatedAt = freezed,
    Object? trackNumFromMeta = freezed,
    Object? discNumFromMeta = null,
    Object? trackNumFromFilename = null,
    Object? discNumFromFilename = null,
    Object? manuallyVerified = null,
    Object? invalid = null,
    Object? exclude = null,
    Object? error = null,
    Object? format = freezed,
    Object? duration = freezed,
    Object? bitRate = freezed,
    Object? language = freezed,
    Object? codec = freezed,
    Object? timeBase = freezed,
    Object? channels = freezed,
    Object? channelLayout = freezed,
    Object? chapters = freezed,
    Object? embeddedCoverArt = null,
    Object? metaTags = null,
    Object? mimeType = freezed,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      ino: null == ino
          ? _value.ino
          : ino // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as LibraryFileMetadata,
      addedAt: freezed == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      trackNumFromMeta: freezed == trackNumFromMeta
          ? _value.trackNumFromMeta
          : trackNumFromMeta // ignore: cast_nullable_to_non_nullable
              as int?,
      discNumFromMeta: null == discNumFromMeta
          ? _value.discNumFromMeta
          : discNumFromMeta // ignore: cast_nullable_to_non_nullable
              as dynamic,
      trackNumFromFilename: null == trackNumFromFilename
          ? _value.trackNumFromFilename
          : trackNumFromFilename // ignore: cast_nullable_to_non_nullable
              as dynamic,
      discNumFromFilename: null == discNumFromFilename
          ? _value.discNumFromFilename
          : discNumFromFilename // ignore: cast_nullable_to_non_nullable
              as dynamic,
      manuallyVerified: null == manuallyVerified
          ? _value.manuallyVerified
          : manuallyVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      invalid: null == invalid
          ? _value.invalid
          : invalid // ignore: cast_nullable_to_non_nullable
              as bool,
      exclude: null == exclude
          ? _value.exclude
          : exclude // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      bitRate: freezed == bitRate
          ? _value.bitRate
          : bitRate // ignore: cast_nullable_to_non_nullable
              as int?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      codec: freezed == codec
          ? _value.codec
          : codec // ignore: cast_nullable_to_non_nullable
              as String?,
      timeBase: freezed == timeBase
          ? _value.timeBase
          : timeBase // ignore: cast_nullable_to_non_nullable
              as String?,
      channels: freezed == channels
          ? _value.channels
          : channels // ignore: cast_nullable_to_non_nullable
              as int?,
      channelLayout: freezed == channelLayout
          ? _value.channelLayout
          : channelLayout // ignore: cast_nullable_to_non_nullable
              as String?,
      chapters: freezed == chapters
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<Chapter>?,
      embeddedCoverArt: null == embeddedCoverArt
          ? _value.embeddedCoverArt
          : embeddedCoverArt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      metaTags: null == metaTags
          ? _value.metaTags
          : metaTags // ignore: cast_nullable_to_non_nullable
              as MetaTags,
      mimeType: freezed == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LibraryFileMetadataCopyWith<$Res> get metadata {
    return $LibraryFileMetadataCopyWith<$Res>(_value.metadata, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MetaTagsCopyWith<$Res> get metaTags {
    return $MetaTagsCopyWith<$Res>(_value.metaTags, (value) {
      return _then(_value.copyWith(metaTags: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AudioFileCopyWith<$Res> implements $AudioFileCopyWith<$Res> {
  factory _$$_AudioFileCopyWith(
          _$_AudioFile value, $Res Function(_$_AudioFile) then) =
      __$$_AudioFileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int index,
      String ino,
      LibraryFileMetadata metadata,
      int? addedAt,
      int? updatedAt,
      int? trackNumFromMeta,
      dynamic discNumFromMeta,
      dynamic trackNumFromFilename,
      dynamic discNumFromFilename,
      bool manuallyVerified,
      bool invalid,
      bool exclude,
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
      MetaTags metaTags,
      String? mimeType});

  @override
  $LibraryFileMetadataCopyWith<$Res> get metadata;
  @override
  $MetaTagsCopyWith<$Res> get metaTags;
}

/// @nodoc
class __$$_AudioFileCopyWithImpl<$Res>
    extends _$AudioFileCopyWithImpl<$Res, _$_AudioFile>
    implements _$$_AudioFileCopyWith<$Res> {
  __$$_AudioFileCopyWithImpl(
      _$_AudioFile _value, $Res Function(_$_AudioFile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? ino = null,
    Object? metadata = null,
    Object? addedAt = freezed,
    Object? updatedAt = freezed,
    Object? trackNumFromMeta = freezed,
    Object? discNumFromMeta = null,
    Object? trackNumFromFilename = null,
    Object? discNumFromFilename = null,
    Object? manuallyVerified = null,
    Object? invalid = null,
    Object? exclude = null,
    Object? error = null,
    Object? format = freezed,
    Object? duration = freezed,
    Object? bitRate = freezed,
    Object? language = freezed,
    Object? codec = freezed,
    Object? timeBase = freezed,
    Object? channels = freezed,
    Object? channelLayout = freezed,
    Object? chapters = freezed,
    Object? embeddedCoverArt = null,
    Object? metaTags = null,
    Object? mimeType = freezed,
  }) {
    return _then(_$_AudioFile(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      ino: null == ino
          ? _value.ino
          : ino // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as LibraryFileMetadata,
      addedAt: freezed == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      trackNumFromMeta: freezed == trackNumFromMeta
          ? _value.trackNumFromMeta
          : trackNumFromMeta // ignore: cast_nullable_to_non_nullable
              as int?,
      discNumFromMeta: null == discNumFromMeta
          ? _value.discNumFromMeta
          : discNumFromMeta // ignore: cast_nullable_to_non_nullable
              as dynamic,
      trackNumFromFilename: null == trackNumFromFilename
          ? _value.trackNumFromFilename
          : trackNumFromFilename // ignore: cast_nullable_to_non_nullable
              as dynamic,
      discNumFromFilename: null == discNumFromFilename
          ? _value.discNumFromFilename
          : discNumFromFilename // ignore: cast_nullable_to_non_nullable
              as dynamic,
      manuallyVerified: null == manuallyVerified
          ? _value.manuallyVerified
          : manuallyVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      invalid: null == invalid
          ? _value.invalid
          : invalid // ignore: cast_nullable_to_non_nullable
              as bool,
      exclude: null == exclude
          ? _value.exclude
          : exclude // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      bitRate: freezed == bitRate
          ? _value.bitRate
          : bitRate // ignore: cast_nullable_to_non_nullable
              as int?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      codec: freezed == codec
          ? _value.codec
          : codec // ignore: cast_nullable_to_non_nullable
              as String?,
      timeBase: freezed == timeBase
          ? _value.timeBase
          : timeBase // ignore: cast_nullable_to_non_nullable
              as String?,
      channels: freezed == channels
          ? _value.channels
          : channels // ignore: cast_nullable_to_non_nullable
              as int?,
      channelLayout: freezed == channelLayout
          ? _value.channelLayout
          : channelLayout // ignore: cast_nullable_to_non_nullable
              as String?,
      chapters: freezed == chapters
          ? _value._chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<Chapter>?,
      embeddedCoverArt: null == embeddedCoverArt
          ? _value.embeddedCoverArt
          : embeddedCoverArt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      metaTags: null == metaTags
          ? _value.metaTags
          : metaTags // ignore: cast_nullable_to_non_nullable
              as MetaTags,
      mimeType: freezed == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AudioFile implements _AudioFile {
  const _$_AudioFile(
      {required this.index,
      required this.ino,
      required this.metadata,
      this.addedAt,
      this.updatedAt,
      this.trackNumFromMeta,
      this.discNumFromMeta,
      this.trackNumFromFilename,
      this.discNumFromFilename,
      required this.manuallyVerified,
      required this.invalid,
      required this.exclude,
      this.error,
      this.format,
      this.duration,
      this.bitRate,
      this.language,
      this.codec,
      this.timeBase,
      this.channels,
      this.channelLayout,
      final List<Chapter>? chapters,
      this.embeddedCoverArt,
      required this.metaTags,
      this.mimeType})
      : _chapters = chapters;

  factory _$_AudioFile.fromJson(Map<String, dynamic> json) =>
      _$$_AudioFileFromJson(json);

  @override
  final int index;
  @override
  final String ino;
  @override
  final LibraryFileMetadata metadata;
  @override
  final int? addedAt;
  @override
  final int? updatedAt;
  @override
  final int? trackNumFromMeta;
  @override
  final dynamic discNumFromMeta;
  @override
  final dynamic trackNumFromFilename;
  @override
  final dynamic discNumFromFilename;
  @override
  final bool manuallyVerified;
  @override
  final bool invalid;
  @override
  final bool exclude;
  @override
  final dynamic error;
  @override
  final String? format;
  @override
  final double? duration;
  @override
  final int? bitRate;
  @override
  final String? language;
  @override
  final String? codec;
  @override
  final String? timeBase;
  @override
  final int? channels;
  @override
  final String? channelLayout;
  final List<Chapter>? _chapters;
  @override
  List<Chapter>? get chapters {
    final value = _chapters;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final dynamic embeddedCoverArt;
  @override
  final MetaTags metaTags;
  @override
  final String? mimeType;

  @override
  String toString() {
    return 'AudioFile(index: $index, ino: $ino, metadata: $metadata, addedAt: $addedAt, updatedAt: $updatedAt, trackNumFromMeta: $trackNumFromMeta, discNumFromMeta: $discNumFromMeta, trackNumFromFilename: $trackNumFromFilename, discNumFromFilename: $discNumFromFilename, manuallyVerified: $manuallyVerified, invalid: $invalid, exclude: $exclude, error: $error, format: $format, duration: $duration, bitRate: $bitRate, language: $language, codec: $codec, timeBase: $timeBase, channels: $channels, channelLayout: $channelLayout, chapters: $chapters, embeddedCoverArt: $embeddedCoverArt, metaTags: $metaTags, mimeType: $mimeType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AudioFile &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.ino, ino) || other.ino == ino) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            (identical(other.addedAt, addedAt) || other.addedAt == addedAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.trackNumFromMeta, trackNumFromMeta) ||
                other.trackNumFromMeta == trackNumFromMeta) &&
            const DeepCollectionEquality()
                .equals(other.discNumFromMeta, discNumFromMeta) &&
            const DeepCollectionEquality()
                .equals(other.trackNumFromFilename, trackNumFromFilename) &&
            const DeepCollectionEquality()
                .equals(other.discNumFromFilename, discNumFromFilename) &&
            (identical(other.manuallyVerified, manuallyVerified) ||
                other.manuallyVerified == manuallyVerified) &&
            (identical(other.invalid, invalid) || other.invalid == invalid) &&
            (identical(other.exclude, exclude) || other.exclude == exclude) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.bitRate, bitRate) || other.bitRate == bitRate) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.codec, codec) || other.codec == codec) &&
            (identical(other.timeBase, timeBase) ||
                other.timeBase == timeBase) &&
            (identical(other.channels, channels) ||
                other.channels == channels) &&
            (identical(other.channelLayout, channelLayout) ||
                other.channelLayout == channelLayout) &&
            const DeepCollectionEquality().equals(other._chapters, _chapters) &&
            const DeepCollectionEquality()
                .equals(other.embeddedCoverArt, embeddedCoverArt) &&
            (identical(other.metaTags, metaTags) ||
                other.metaTags == metaTags) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        index,
        ino,
        metadata,
        addedAt,
        updatedAt,
        trackNumFromMeta,
        const DeepCollectionEquality().hash(discNumFromMeta),
        const DeepCollectionEquality().hash(trackNumFromFilename),
        const DeepCollectionEquality().hash(discNumFromFilename),
        manuallyVerified,
        invalid,
        exclude,
        const DeepCollectionEquality().hash(error),
        format,
        duration,
        bitRate,
        language,
        codec,
        timeBase,
        channels,
        channelLayout,
        const DeepCollectionEquality().hash(_chapters),
        const DeepCollectionEquality().hash(embeddedCoverArt),
        metaTags,
        mimeType
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AudioFileCopyWith<_$_AudioFile> get copyWith =>
      __$$_AudioFileCopyWithImpl<_$_AudioFile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AudioFileToJson(
      this,
    );
  }
}

abstract class _AudioFile implements AudioFile {
  const factory _AudioFile(
      {required final int index,
      required final String ino,
      required final LibraryFileMetadata metadata,
      final int? addedAt,
      final int? updatedAt,
      final int? trackNumFromMeta,
      final dynamic discNumFromMeta,
      final dynamic trackNumFromFilename,
      final dynamic discNumFromFilename,
      required final bool manuallyVerified,
      required final bool invalid,
      required final bool exclude,
      final dynamic error,
      final String? format,
      final double? duration,
      final int? bitRate,
      final String? language,
      final String? codec,
      final String? timeBase,
      final int? channels,
      final String? channelLayout,
      final List<Chapter>? chapters,
      final dynamic embeddedCoverArt,
      required final MetaTags metaTags,
      final String? mimeType}) = _$_AudioFile;

  factory _AudioFile.fromJson(Map<String, dynamic> json) =
      _$_AudioFile.fromJson;

  @override
  int get index;
  @override
  String get ino;
  @override
  LibraryFileMetadata get metadata;
  @override
  int? get addedAt;
  @override
  int? get updatedAt;
  @override
  int? get trackNumFromMeta;
  @override
  dynamic get discNumFromMeta;
  @override
  dynamic get trackNumFromFilename;
  @override
  dynamic get discNumFromFilename;
  @override
  bool get manuallyVerified;
  @override
  bool get invalid;
  @override
  bool get exclude;
  @override
  dynamic get error;
  @override
  String? get format;
  @override
  double? get duration;
  @override
  int? get bitRate;
  @override
  String? get language;
  @override
  String? get codec;
  @override
  String? get timeBase;
  @override
  int? get channels;
  @override
  String? get channelLayout;
  @override
  List<Chapter>? get chapters;
  @override
  dynamic get embeddedCoverArt;
  @override
  MetaTags get metaTags;
  @override
  String? get mimeType;
  @override
  @JsonKey(ignore: true)
  _$$_AudioFileCopyWith<_$_AudioFile> get copyWith =>
      throw _privateConstructorUsedError;
}

Chapter _$ChapterFromJson(Map<String, dynamic> json) {
  return _Chapter.fromJson(json);
}

/// @nodoc
mixin _$Chapter {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _coerceStringToDouble)
  double get start => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _coerceStringToDouble)
  double get end => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChapterCopyWith<Chapter> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterCopyWith<$Res> {
  factory $ChapterCopyWith(Chapter value, $Res Function(Chapter) then) =
      _$ChapterCopyWithImpl<$Res, Chapter>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(fromJson: _coerceStringToDouble) double start,
      @JsonKey(fromJson: _coerceStringToDouble) double end,
      String title});
}

/// @nodoc
class _$ChapterCopyWithImpl<$Res, $Val extends Chapter>
    implements $ChapterCopyWith<$Res> {
  _$ChapterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? start = null,
    Object? end = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as double,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as double,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChapterCopyWith<$Res> implements $ChapterCopyWith<$Res> {
  factory _$$_ChapterCopyWith(
          _$_Chapter value, $Res Function(_$_Chapter) then) =
      __$$_ChapterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(fromJson: _coerceStringToDouble) double start,
      @JsonKey(fromJson: _coerceStringToDouble) double end,
      String title});
}

/// @nodoc
class __$$_ChapterCopyWithImpl<$Res>
    extends _$ChapterCopyWithImpl<$Res, _$_Chapter>
    implements _$$_ChapterCopyWith<$Res> {
  __$$_ChapterCopyWithImpl(_$_Chapter _value, $Res Function(_$_Chapter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? start = null,
    Object? end = null,
    Object? title = null,
  }) {
    return _then(_$_Chapter(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as double,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as double,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Chapter implements _Chapter {
  const _$_Chapter(
      {required this.id,
      @JsonKey(fromJson: _coerceStringToDouble) required this.start,
      @JsonKey(fromJson: _coerceStringToDouble) required this.end,
      required this.title});

  factory _$_Chapter.fromJson(Map<String, dynamic> json) =>
      _$$_ChapterFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(fromJson: _coerceStringToDouble)
  final double start;
  @override
  @JsonKey(fromJson: _coerceStringToDouble)
  final double end;
  @override
  final String title;

  @override
  String toString() {
    return 'Chapter(id: $id, start: $start, end: $end, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Chapter &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, start, end, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChapterCopyWith<_$_Chapter> get copyWith =>
      __$$_ChapterCopyWithImpl<_$_Chapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChapterToJson(
      this,
    );
  }
}

abstract class _Chapter implements Chapter {
  const factory _Chapter(
      {required final int id,
      @JsonKey(fromJson: _coerceStringToDouble) required final double start,
      @JsonKey(fromJson: _coerceStringToDouble) required final double end,
      required final String title}) = _$_Chapter;

  factory _Chapter.fromJson(Map<String, dynamic> json) = _$_Chapter.fromJson;

  @override
  int get id;
  @override
  @JsonKey(fromJson: _coerceStringToDouble)
  double get start;
  @override
  @JsonKey(fromJson: _coerceStringToDouble)
  double get end;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_ChapterCopyWith<_$_Chapter> get copyWith =>
      throw _privateConstructorUsedError;
}

MetaTags _$MetaTagsFromJson(Map<String, dynamic> json) {
  return _MetaTags.fromJson(json);
}

/// @nodoc
mixin _$MetaTags {
  String? get tagAlbum => throw _privateConstructorUsedError;
  String? get tagArtist => throw _privateConstructorUsedError;
  String? get tagGenre => throw _privateConstructorUsedError;
  String? get tagTitle => throw _privateConstructorUsedError;
  String? get tagTrack => throw _privateConstructorUsedError;
  String? get tagAlbumArtist => throw _privateConstructorUsedError;
  String? get tagDate => throw _privateConstructorUsedError;
  String? get tagComposer => throw _privateConstructorUsedError;
  String? get tagDescription => throw _privateConstructorUsedError;
  String? get tagEncoder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetaTagsCopyWith<MetaTags> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaTagsCopyWith<$Res> {
  factory $MetaTagsCopyWith(MetaTags value, $Res Function(MetaTags) then) =
      _$MetaTagsCopyWithImpl<$Res, MetaTags>;
  @useResult
  $Res call(
      {String? tagAlbum,
      String? tagArtist,
      String? tagGenre,
      String? tagTitle,
      String? tagTrack,
      String? tagAlbumArtist,
      String? tagDate,
      String? tagComposer,
      String? tagDescription,
      String? tagEncoder});
}

/// @nodoc
class _$MetaTagsCopyWithImpl<$Res, $Val extends MetaTags>
    implements $MetaTagsCopyWith<$Res> {
  _$MetaTagsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tagAlbum = freezed,
    Object? tagArtist = freezed,
    Object? tagGenre = freezed,
    Object? tagTitle = freezed,
    Object? tagTrack = freezed,
    Object? tagAlbumArtist = freezed,
    Object? tagDate = freezed,
    Object? tagComposer = freezed,
    Object? tagDescription = freezed,
    Object? tagEncoder = freezed,
  }) {
    return _then(_value.copyWith(
      tagAlbum: freezed == tagAlbum
          ? _value.tagAlbum
          : tagAlbum // ignore: cast_nullable_to_non_nullable
              as String?,
      tagArtist: freezed == tagArtist
          ? _value.tagArtist
          : tagArtist // ignore: cast_nullable_to_non_nullable
              as String?,
      tagGenre: freezed == tagGenre
          ? _value.tagGenre
          : tagGenre // ignore: cast_nullable_to_non_nullable
              as String?,
      tagTitle: freezed == tagTitle
          ? _value.tagTitle
          : tagTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      tagTrack: freezed == tagTrack
          ? _value.tagTrack
          : tagTrack // ignore: cast_nullable_to_non_nullable
              as String?,
      tagAlbumArtist: freezed == tagAlbumArtist
          ? _value.tagAlbumArtist
          : tagAlbumArtist // ignore: cast_nullable_to_non_nullable
              as String?,
      tagDate: freezed == tagDate
          ? _value.tagDate
          : tagDate // ignore: cast_nullable_to_non_nullable
              as String?,
      tagComposer: freezed == tagComposer
          ? _value.tagComposer
          : tagComposer // ignore: cast_nullable_to_non_nullable
              as String?,
      tagDescription: freezed == tagDescription
          ? _value.tagDescription
          : tagDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      tagEncoder: freezed == tagEncoder
          ? _value.tagEncoder
          : tagEncoder // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MetaTagsCopyWith<$Res> implements $MetaTagsCopyWith<$Res> {
  factory _$$_MetaTagsCopyWith(
          _$_MetaTags value, $Res Function(_$_MetaTags) then) =
      __$$_MetaTagsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? tagAlbum,
      String? tagArtist,
      String? tagGenre,
      String? tagTitle,
      String? tagTrack,
      String? tagAlbumArtist,
      String? tagDate,
      String? tagComposer,
      String? tagDescription,
      String? tagEncoder});
}

/// @nodoc
class __$$_MetaTagsCopyWithImpl<$Res>
    extends _$MetaTagsCopyWithImpl<$Res, _$_MetaTags>
    implements _$$_MetaTagsCopyWith<$Res> {
  __$$_MetaTagsCopyWithImpl(
      _$_MetaTags _value, $Res Function(_$_MetaTags) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tagAlbum = freezed,
    Object? tagArtist = freezed,
    Object? tagGenre = freezed,
    Object? tagTitle = freezed,
    Object? tagTrack = freezed,
    Object? tagAlbumArtist = freezed,
    Object? tagDate = freezed,
    Object? tagComposer = freezed,
    Object? tagDescription = freezed,
    Object? tagEncoder = freezed,
  }) {
    return _then(_$_MetaTags(
      tagAlbum: freezed == tagAlbum
          ? _value.tagAlbum
          : tagAlbum // ignore: cast_nullable_to_non_nullable
              as String?,
      tagArtist: freezed == tagArtist
          ? _value.tagArtist
          : tagArtist // ignore: cast_nullable_to_non_nullable
              as String?,
      tagGenre: freezed == tagGenre
          ? _value.tagGenre
          : tagGenre // ignore: cast_nullable_to_non_nullable
              as String?,
      tagTitle: freezed == tagTitle
          ? _value.tagTitle
          : tagTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      tagTrack: freezed == tagTrack
          ? _value.tagTrack
          : tagTrack // ignore: cast_nullable_to_non_nullable
              as String?,
      tagAlbumArtist: freezed == tagAlbumArtist
          ? _value.tagAlbumArtist
          : tagAlbumArtist // ignore: cast_nullable_to_non_nullable
              as String?,
      tagDate: freezed == tagDate
          ? _value.tagDate
          : tagDate // ignore: cast_nullable_to_non_nullable
              as String?,
      tagComposer: freezed == tagComposer
          ? _value.tagComposer
          : tagComposer // ignore: cast_nullable_to_non_nullable
              as String?,
      tagDescription: freezed == tagDescription
          ? _value.tagDescription
          : tagDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      tagEncoder: freezed == tagEncoder
          ? _value.tagEncoder
          : tagEncoder // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MetaTags implements _MetaTags {
  const _$_MetaTags(
      {this.tagAlbum,
      this.tagArtist,
      this.tagGenre,
      this.tagTitle,
      this.tagTrack,
      this.tagAlbumArtist,
      this.tagDate,
      this.tagComposer,
      this.tagDescription,
      this.tagEncoder});

  factory _$_MetaTags.fromJson(Map<String, dynamic> json) =>
      _$$_MetaTagsFromJson(json);

  @override
  final String? tagAlbum;
  @override
  final String? tagArtist;
  @override
  final String? tagGenre;
  @override
  final String? tagTitle;
  @override
  final String? tagTrack;
  @override
  final String? tagAlbumArtist;
  @override
  final String? tagDate;
  @override
  final String? tagComposer;
  @override
  final String? tagDescription;
  @override
  final String? tagEncoder;

  @override
  String toString() {
    return 'MetaTags(tagAlbum: $tagAlbum, tagArtist: $tagArtist, tagGenre: $tagGenre, tagTitle: $tagTitle, tagTrack: $tagTrack, tagAlbumArtist: $tagAlbumArtist, tagDate: $tagDate, tagComposer: $tagComposer, tagDescription: $tagDescription, tagEncoder: $tagEncoder)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MetaTags &&
            (identical(other.tagAlbum, tagAlbum) ||
                other.tagAlbum == tagAlbum) &&
            (identical(other.tagArtist, tagArtist) ||
                other.tagArtist == tagArtist) &&
            (identical(other.tagGenre, tagGenre) ||
                other.tagGenre == tagGenre) &&
            (identical(other.tagTitle, tagTitle) ||
                other.tagTitle == tagTitle) &&
            (identical(other.tagTrack, tagTrack) ||
                other.tagTrack == tagTrack) &&
            (identical(other.tagAlbumArtist, tagAlbumArtist) ||
                other.tagAlbumArtist == tagAlbumArtist) &&
            (identical(other.tagDate, tagDate) || other.tagDate == tagDate) &&
            (identical(other.tagComposer, tagComposer) ||
                other.tagComposer == tagComposer) &&
            (identical(other.tagDescription, tagDescription) ||
                other.tagDescription == tagDescription) &&
            (identical(other.tagEncoder, tagEncoder) ||
                other.tagEncoder == tagEncoder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      tagAlbum,
      tagArtist,
      tagGenre,
      tagTitle,
      tagTrack,
      tagAlbumArtist,
      tagDate,
      tagComposer,
      tagDescription,
      tagEncoder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MetaTagsCopyWith<_$_MetaTags> get copyWith =>
      __$$_MetaTagsCopyWithImpl<_$_MetaTags>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MetaTagsToJson(
      this,
    );
  }
}

abstract class _MetaTags implements MetaTags {
  const factory _MetaTags(
      {final String? tagAlbum,
      final String? tagArtist,
      final String? tagGenre,
      final String? tagTitle,
      final String? tagTrack,
      final String? tagAlbumArtist,
      final String? tagDate,
      final String? tagComposer,
      final String? tagDescription,
      final String? tagEncoder}) = _$_MetaTags;

  factory _MetaTags.fromJson(Map<String, dynamic> json) = _$_MetaTags.fromJson;

  @override
  String? get tagAlbum;
  @override
  String? get tagArtist;
  @override
  String? get tagGenre;
  @override
  String? get tagTitle;
  @override
  String? get tagTrack;
  @override
  String? get tagAlbumArtist;
  @override
  String? get tagDate;
  @override
  String? get tagComposer;
  @override
  String? get tagDescription;
  @override
  String? get tagEncoder;
  @override
  @JsonKey(ignore: true)
  _$$_MetaTagsCopyWith<_$_MetaTags> get copyWith =>
      throw _privateConstructorUsedError;
}

MediaMetadata _$MediaMetadataFromJson(Map<String, dynamic> json) {
  return _MediaMetadata.fromJson(json);
}

/// @nodoc
mixin _$MediaMetadata {
  String? get title => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  List<Author>? get authors => throw _privateConstructorUsedError;
  List<String>? get narrators => throw _privateConstructorUsedError;
  List<Series>? get series => throw _privateConstructorUsedError;
  List<String>? get genres => throw _privateConstructorUsedError;
  String? get publishedYear => throw _privateConstructorUsedError;
  int? get publishedDate => throw _privateConstructorUsedError;
  String? get publisher => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get isbn => throw _privateConstructorUsedError;
  String? get asin => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  bool? get explicit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaMetadataCopyWith<MediaMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaMetadataCopyWith<$Res> {
  factory $MediaMetadataCopyWith(
          MediaMetadata value, $Res Function(MediaMetadata) then) =
      _$MediaMetadataCopyWithImpl<$Res, MediaMetadata>;
  @useResult
  $Res call(
      {String? title,
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
      bool? explicit});
}

/// @nodoc
class _$MediaMetadataCopyWithImpl<$Res, $Val extends MediaMetadata>
    implements $MediaMetadataCopyWith<$Res> {
  _$MediaMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? authors = freezed,
    Object? narrators = freezed,
    Object? series = freezed,
    Object? genres = freezed,
    Object? publishedYear = freezed,
    Object? publishedDate = freezed,
    Object? publisher = freezed,
    Object? description = freezed,
    Object? isbn = freezed,
    Object? asin = freezed,
    Object? language = freezed,
    Object? explicit = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      authors: freezed == authors
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<Author>?,
      narrators: freezed == narrators
          ? _value.narrators
          : narrators // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      series: freezed == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as List<Series>?,
      genres: freezed == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      publishedYear: freezed == publishedYear
          ? _value.publishedYear
          : publishedYear // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedDate: freezed == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as int?,
      publisher: freezed == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isbn: freezed == isbn
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String?,
      asin: freezed == asin
          ? _value.asin
          : asin // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      explicit: freezed == explicit
          ? _value.explicit
          : explicit // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MediaMetadataCopyWith<$Res>
    implements $MediaMetadataCopyWith<$Res> {
  factory _$$_MediaMetadataCopyWith(
          _$_MediaMetadata value, $Res Function(_$_MediaMetadata) then) =
      __$$_MediaMetadataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
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
      bool? explicit});
}

/// @nodoc
class __$$_MediaMetadataCopyWithImpl<$Res>
    extends _$MediaMetadataCopyWithImpl<$Res, _$_MediaMetadata>
    implements _$$_MediaMetadataCopyWith<$Res> {
  __$$_MediaMetadataCopyWithImpl(
      _$_MediaMetadata _value, $Res Function(_$_MediaMetadata) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? authors = freezed,
    Object? narrators = freezed,
    Object? series = freezed,
    Object? genres = freezed,
    Object? publishedYear = freezed,
    Object? publishedDate = freezed,
    Object? publisher = freezed,
    Object? description = freezed,
    Object? isbn = freezed,
    Object? asin = freezed,
    Object? language = freezed,
    Object? explicit = freezed,
  }) {
    return _then(_$_MediaMetadata(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      authors: freezed == authors
          ? _value._authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<Author>?,
      narrators: freezed == narrators
          ? _value._narrators
          : narrators // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      series: freezed == series
          ? _value._series
          : series // ignore: cast_nullable_to_non_nullable
              as List<Series>?,
      genres: freezed == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      publishedYear: freezed == publishedYear
          ? _value.publishedYear
          : publishedYear // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedDate: freezed == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as int?,
      publisher: freezed == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isbn: freezed == isbn
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String?,
      asin: freezed == asin
          ? _value.asin
          : asin // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      explicit: freezed == explicit
          ? _value.explicit
          : explicit // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MediaMetadata implements _MediaMetadata {
  const _$_MediaMetadata(
      {this.title,
      this.subtitle,
      final List<Author>? authors,
      final List<String>? narrators,
      final List<Series>? series,
      final List<String>? genres,
      this.publishedYear,
      this.publishedDate,
      this.publisher,
      this.description,
      this.isbn,
      this.asin,
      this.language,
      this.explicit})
      : _authors = authors,
        _narrators = narrators,
        _series = series,
        _genres = genres;

  factory _$_MediaMetadata.fromJson(Map<String, dynamic> json) =>
      _$$_MediaMetadataFromJson(json);

  @override
  final String? title;
  @override
  final String? subtitle;
  final List<Author>? _authors;
  @override
  List<Author>? get authors {
    final value = _authors;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _narrators;
  @override
  List<String>? get narrators {
    final value = _narrators;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Series>? _series;
  @override
  List<Series>? get series {
    final value = _series;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _genres;
  @override
  List<String>? get genres {
    final value = _genres;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? publishedYear;
  @override
  final int? publishedDate;
  @override
  final String? publisher;
  @override
  final String? description;
  @override
  final String? isbn;
  @override
  final String? asin;
  @override
  final String? language;
  @override
  final bool? explicit;

  @override
  String toString() {
    return 'MediaMetadata(title: $title, subtitle: $subtitle, authors: $authors, narrators: $narrators, series: $series, genres: $genres, publishedYear: $publishedYear, publishedDate: $publishedDate, publisher: $publisher, description: $description, isbn: $isbn, asin: $asin, language: $language, explicit: $explicit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MediaMetadata &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            const DeepCollectionEquality().equals(other._authors, _authors) &&
            const DeepCollectionEquality()
                .equals(other._narrators, _narrators) &&
            const DeepCollectionEquality().equals(other._series, _series) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            (identical(other.publishedYear, publishedYear) ||
                other.publishedYear == publishedYear) &&
            (identical(other.publishedDate, publishedDate) ||
                other.publishedDate == publishedDate) &&
            (identical(other.publisher, publisher) ||
                other.publisher == publisher) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isbn, isbn) || other.isbn == isbn) &&
            (identical(other.asin, asin) || other.asin == asin) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.explicit, explicit) ||
                other.explicit == explicit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      subtitle,
      const DeepCollectionEquality().hash(_authors),
      const DeepCollectionEquality().hash(_narrators),
      const DeepCollectionEquality().hash(_series),
      const DeepCollectionEquality().hash(_genres),
      publishedYear,
      publishedDate,
      publisher,
      description,
      isbn,
      asin,
      language,
      explicit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MediaMetadataCopyWith<_$_MediaMetadata> get copyWith =>
      __$$_MediaMetadataCopyWithImpl<_$_MediaMetadata>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MediaMetadataToJson(
      this,
    );
  }
}

abstract class _MediaMetadata implements MediaMetadata {
  const factory _MediaMetadata(
      {final String? title,
      final String? subtitle,
      final List<Author>? authors,
      final List<String>? narrators,
      final List<Series>? series,
      final List<String>? genres,
      final String? publishedYear,
      final int? publishedDate,
      final String? publisher,
      final String? description,
      final String? isbn,
      final String? asin,
      final String? language,
      final bool? explicit}) = _$_MediaMetadata;

  factory _MediaMetadata.fromJson(Map<String, dynamic> json) =
      _$_MediaMetadata.fromJson;

  @override
  String? get title;
  @override
  String? get subtitle;
  @override
  List<Author>? get authors;
  @override
  List<String>? get narrators;
  @override
  List<Series>? get series;
  @override
  List<String>? get genres;
  @override
  String? get publishedYear;
  @override
  int? get publishedDate;
  @override
  String? get publisher;
  @override
  String? get description;
  @override
  String? get isbn;
  @override
  String? get asin;
  @override
  String? get language;
  @override
  bool? get explicit;
  @override
  @JsonKey(ignore: true)
  _$$_MediaMetadataCopyWith<_$_MediaMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

Author _$AuthorFromJson(Map<String, dynamic> json) {
  return _Author.fromJson(json);
}

/// @nodoc
mixin _$Author {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int? get updatedAt => throw _privateConstructorUsedError;
  String? get imagePath => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get asin => throw _privateConstructorUsedError;
  int? get numBooks => throw _privateConstructorUsedError;
  int? get addedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthorCopyWith<Author> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorCopyWith<$Res> {
  factory $AuthorCopyWith(Author value, $Res Function(Author) then) =
      _$AuthorCopyWithImpl<$Res, Author>;
  @useResult
  $Res call(
      {String id,
      String name,
      int? updatedAt,
      String? imagePath,
      String? description,
      String? asin,
      int? numBooks,
      int? addedAt});
}

/// @nodoc
class _$AuthorCopyWithImpl<$Res, $Val extends Author>
    implements $AuthorCopyWith<$Res> {
  _$AuthorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? updatedAt = freezed,
    Object? imagePath = freezed,
    Object? description = freezed,
    Object? asin = freezed,
    Object? numBooks = freezed,
    Object? addedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      asin: freezed == asin
          ? _value.asin
          : asin // ignore: cast_nullable_to_non_nullable
              as String?,
      numBooks: freezed == numBooks
          ? _value.numBooks
          : numBooks // ignore: cast_nullable_to_non_nullable
              as int?,
      addedAt: freezed == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthorCopyWith<$Res> implements $AuthorCopyWith<$Res> {
  factory _$$_AuthorCopyWith(_$_Author value, $Res Function(_$_Author) then) =
      __$$_AuthorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      int? updatedAt,
      String? imagePath,
      String? description,
      String? asin,
      int? numBooks,
      int? addedAt});
}

/// @nodoc
class __$$_AuthorCopyWithImpl<$Res>
    extends _$AuthorCopyWithImpl<$Res, _$_Author>
    implements _$$_AuthorCopyWith<$Res> {
  __$$_AuthorCopyWithImpl(_$_Author _value, $Res Function(_$_Author) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? updatedAt = freezed,
    Object? imagePath = freezed,
    Object? description = freezed,
    Object? asin = freezed,
    Object? numBooks = freezed,
    Object? addedAt = freezed,
  }) {
    return _then(_$_Author(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      asin: freezed == asin
          ? _value.asin
          : asin // ignore: cast_nullable_to_non_nullable
              as String?,
      numBooks: freezed == numBooks
          ? _value.numBooks
          : numBooks // ignore: cast_nullable_to_non_nullable
              as int?,
      addedAt: freezed == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Author implements _Author {
  const _$_Author(
      {required this.id,
      required this.name,
      this.updatedAt,
      this.imagePath,
      this.description,
      this.asin,
      this.numBooks,
      this.addedAt});

  factory _$_Author.fromJson(Map<String, dynamic> json) =>
      _$$_AuthorFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int? updatedAt;
  @override
  final String? imagePath;
  @override
  final String? description;
  @override
  final String? asin;
  @override
  final int? numBooks;
  @override
  final int? addedAt;

  @override
  String toString() {
    return 'Author(id: $id, name: $name, updatedAt: $updatedAt, imagePath: $imagePath, description: $description, asin: $asin, numBooks: $numBooks, addedAt: $addedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Author &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.asin, asin) || other.asin == asin) &&
            (identical(other.numBooks, numBooks) ||
                other.numBooks == numBooks) &&
            (identical(other.addedAt, addedAt) || other.addedAt == addedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, updatedAt, imagePath,
      description, asin, numBooks, addedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthorCopyWith<_$_Author> get copyWith =>
      __$$_AuthorCopyWithImpl<_$_Author>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthorToJson(
      this,
    );
  }
}

abstract class _Author implements Author {
  const factory _Author(
      {required final String id,
      required final String name,
      final int? updatedAt,
      final String? imagePath,
      final String? description,
      final String? asin,
      final int? numBooks,
      final int? addedAt}) = _$_Author;

  factory _Author.fromJson(Map<String, dynamic> json) = _$_Author.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int? get updatedAt;
  @override
  String? get imagePath;
  @override
  String? get description;
  @override
  String? get asin;
  @override
  int? get numBooks;
  @override
  int? get addedAt;
  @override
  @JsonKey(ignore: true)
  _$$_AuthorCopyWith<_$_Author> get copyWith =>
      throw _privateConstructorUsedError;
}

Series _$SeriesFromJson(Map<String, dynamic> json) {
  return _Series.fromJson(json);
}

/// @nodoc
mixin _$Series {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get sequence => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SeriesCopyWith<Series> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeriesCopyWith<$Res> {
  factory $SeriesCopyWith(Series value, $Res Function(Series) then) =
      _$SeriesCopyWithImpl<$Res, Series>;
  @useResult
  $Res call({String id, String name, String? sequence});
}

/// @nodoc
class _$SeriesCopyWithImpl<$Res, $Val extends Series>
    implements $SeriesCopyWith<$Res> {
  _$SeriesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? sequence = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sequence: freezed == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SeriesCopyWith<$Res> implements $SeriesCopyWith<$Res> {
  factory _$$_SeriesCopyWith(_$_Series value, $Res Function(_$_Series) then) =
      __$$_SeriesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String? sequence});
}

/// @nodoc
class __$$_SeriesCopyWithImpl<$Res>
    extends _$SeriesCopyWithImpl<$Res, _$_Series>
    implements _$$_SeriesCopyWith<$Res> {
  __$$_SeriesCopyWithImpl(_$_Series _value, $Res Function(_$_Series) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? sequence = freezed,
  }) {
    return _then(_$_Series(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sequence: freezed == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Series implements _Series {
  const _$_Series({required this.id, required this.name, this.sequence});

  factory _$_Series.fromJson(Map<String, dynamic> json) =>
      _$$_SeriesFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? sequence;

  @override
  String toString() {
    return 'Series(id: $id, name: $name, sequence: $sequence)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Series &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, sequence);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SeriesCopyWith<_$_Series> get copyWith =>
      __$$_SeriesCopyWithImpl<_$_Series>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SeriesToJson(
      this,
    );
  }
}

abstract class _Series implements Series {
  const factory _Series(
      {required final String id,
      required final String name,
      final String? sequence}) = _$_Series;

  factory _Series.fromJson(Map<String, dynamic> json) = _$_Series.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get sequence;
  @override
  @JsonKey(ignore: true)
  _$$_SeriesCopyWith<_$_Series> get copyWith =>
      throw _privateConstructorUsedError;
}
