// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_track.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, invalid_use_of_protected_member

extension GetIsarTrackCollection on Isar {
  IsarCollection<IsarTrack> get isarTracks {
    return getCollection('IsarTrack');
  }
}

final IsarTrackSchema = CollectionSchema(
  name: 'IsarTrack',
  schema:
      '{"name":"IsarTrack","properties":[{"name":"id","type":"String"},{"name":"title","type":"String"},{"name":"duration","type":"Long"},{"name":"downloadProgress","type":"Double"},{"name":"isDownloaded","type":"Byte"},{"name":"downloadPath","type":"String"},{"name":"bookId","type":"String"},{"name":"downloadTaskId","type":"String"},{"name":"downloadTaskStatus","type":"Long"}],"indexes":[],"links":[]}',
  adapter: const _IsarTrackAdapter(),
  idName: 'isarId',
  propertyIds: {
    'id': 0,
    'title': 1,
    'duration': 2,
    'downloadProgress': 3,
    'isDownloaded': 4,
    'downloadPath': 5,
    'bookId': 6,
    'downloadTaskId': 7,
    'downloadTaskStatus': 8
  },
  indexIds: {},
  indexTypes: {},
  linkIds: {},
  backlinkIds: {},
  linkedCollections: [],
  getId: (obj) => obj.isarId,
  version: 0,
);

class _IsarTrackAdapter extends IsarTypeAdapter<IsarTrack> {
  const _IsarTrackAdapter();

  static const _DurationConverter = DurationConverter();

  @override
  int serialize(IsarCollection<IsarTrack> collection, RawObject rawObj,
      IsarTrack object, List<int> offsets,
      [int? existingBufferSize]) {
    rawObj.id = object.isarId ?? Isar.minId;
    var dynamicSize = 0;
    final value0 = object.id;
    final _id = BinaryWriter.utf8Encoder.convert(value0);
    dynamicSize += _id.length;
    final value1 = object.title;
    final _title = BinaryWriter.utf8Encoder.convert(value1);
    dynamicSize += _title.length;
    final value2 = _IsarTrackAdapter._DurationConverter.toIsar(object.duration);
    final _duration = value2;
    final value3 = object.downloadProgress;
    final _downloadProgress = value3;
    final value4 = object.isDownloaded;
    final _isDownloaded = value4;
    final value5 = object.downloadPath;
    final _downloadPath = BinaryWriter.utf8Encoder.convert(value5);
    dynamicSize += _downloadPath.length;
    final value6 = object.bookId;
    final _bookId = BinaryWriter.utf8Encoder.convert(value6);
    dynamicSize += _bookId.length;
    final value7 = object.downloadTaskId;
    final _downloadTaskId = BinaryWriter.utf8Encoder.convert(value7);
    dynamicSize += _downloadTaskId.length;
    final value8 = object.downloadTaskStatus;
    final _downloadTaskStatus = value8;
    final size = dynamicSize + 75;

    late int bufferSize;
    if (existingBufferSize != null) {
      if (existingBufferSize < size) {
        malloc.free(rawObj.buffer);
        rawObj.buffer = malloc(size);
        bufferSize = size;
      } else {
        bufferSize = existingBufferSize;
      }
    } else {
      rawObj.buffer = malloc(size);
      bufferSize = size;
    }
    rawObj.buffer_length = size;
    final buffer = rawObj.buffer.asTypedList(size);
    final writer = BinaryWriter(buffer, 75);
    writer.writeBytes(offsets[0], _id);
    writer.writeBytes(offsets[1], _title);
    writer.writeLong(offsets[2], _duration);
    writer.writeDouble(offsets[3], _downloadProgress);
    writer.writeBool(offsets[4], _isDownloaded);
    writer.writeBytes(offsets[5], _downloadPath);
    writer.writeBytes(offsets[6], _bookId);
    writer.writeBytes(offsets[7], _downloadTaskId);
    writer.writeLong(offsets[8], _downloadTaskStatus);
    return bufferSize;
  }

  @override
  IsarTrack deserialize(IsarCollection<IsarTrack> collection, int id,
      BinaryReader reader, List<int> offsets) {
    final object = IsarTrack(
      reader.readString(offsets[0]),
      reader.readString(offsets[1]),
      _IsarTrackAdapter._DurationConverter.fromIsar(
          reader.readLong(offsets[2])),
      reader.readDouble(offsets[3]),
      reader.readBool(offsets[4]),
      reader.readString(offsets[5]),
      reader.readString(offsets[6]),
      reader.readString(offsets[7]),
      reader.readLong(offsets[8]),
    );
    object.isarId = id;
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, BinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (reader.readString(offset)) as P;
      case 1:
        return (reader.readString(offset)) as P;
      case 2:
        return (_IsarTrackAdapter._DurationConverter.fromIsar(
            reader.readLong(offset))) as P;
      case 3:
        return (reader.readDouble(offset)) as P;
      case 4:
        return (reader.readBool(offset)) as P;
      case 5:
        return (reader.readString(offset)) as P;
      case 6:
        return (reader.readString(offset)) as P;
      case 7:
        return (reader.readString(offset)) as P;
      case 8:
        return (reader.readLong(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }
}

extension IsarTrackQueryWhereSort
    on QueryBuilder<IsarTrack, IsarTrack, QWhere> {
  QueryBuilder<IsarTrack, IsarTrack, QAfterWhere> anyIsarId() {
    return addWhereClause(WhereClause(indexName: '_id'));
  }
}

extension IsarTrackQueryWhere
    on QueryBuilder<IsarTrack, IsarTrack, QWhereClause> {
  QueryBuilder<IsarTrack, IsarTrack, QAfterWhereClause> isarIdEqualTo(
      int? isarId) {
    return addWhereClause(WhereClause(
      indexName: '_id',
      lower: [isarId],
      includeLower: true,
      upper: [isarId],
      includeUpper: true,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterWhereClause> isarIdNotEqualTo(
      int? isarId) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClause(WhereClause(
        indexName: '_id',
        upper: [isarId],
        includeUpper: false,
      )).addWhereClause(WhereClause(
        indexName: '_id',
        lower: [isarId],
        includeLower: false,
      ));
    } else {
      return addWhereClause(WhereClause(
        indexName: '_id',
        lower: [isarId],
        includeLower: false,
      )).addWhereClause(WhereClause(
        indexName: '_id',
        upper: [isarId],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterWhereClause> isarIdIsNull() {
    return addWhereClause(WhereClause(
      indexName: '_id',
      upper: [null],
      includeUpper: true,
      lower: [null],
      includeLower: true,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterWhereClause> isarIdIsNotNull() {
    return addWhereClause(WhereClause(
      indexName: '_id',
      lower: [null],
      includeLower: false,
    ));
  }
}

extension IsarTrackQueryFilter
    on QueryBuilder<IsarTrack, IsarTrack, QFilterCondition> {
  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> isarIdIsNull() {
    return addFilterCondition(FilterCondition(
      type: ConditionType.isNull,
      property: 'isarId',
      value: null,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> isarIdEqualTo(
    int? value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'isarId',
      value: value,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> isarIdGreaterThan(
    int? value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      property: 'isarId',
      value: value,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> isarIdLessThan(
    int? value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      property: 'isarId',
      value: value,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> isarIdBetween(
    int? lower,
    int? upper,
  ) {
    return addFilterCondition(FilterCondition.between(
      property: 'isarId',
      lower: lower,
      upper: upper,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      property: 'id',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> idLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      property: 'id',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition.between(
      property: 'id',
      lower: lower,
      upper: upper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> idStartsWith(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.startsWith,
      property: 'id',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> idEndsWith(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.endsWith,
      property: 'id',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.contains,
      property: 'id',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.matches,
      property: 'id',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> titleLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition.between(
      property: 'title',
      lower: lower,
      upper: upper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> titleStartsWith(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.startsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> titleEndsWith(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.endsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.contains,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.matches,
      property: 'title',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> durationEqualTo(
    Duration value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'duration',
      value: _IsarTrackAdapter._DurationConverter.toIsar(value),
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> durationGreaterThan(
    Duration value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      property: 'duration',
      value: _IsarTrackAdapter._DurationConverter.toIsar(value),
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> durationLessThan(
    Duration value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      property: 'duration',
      value: _IsarTrackAdapter._DurationConverter.toIsar(value),
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> durationBetween(
    Duration lower,
    Duration upper,
  ) {
    return addFilterCondition(FilterCondition.between(
      property: 'duration',
      lower: _IsarTrackAdapter._DurationConverter.toIsar(lower),
      upper: _IsarTrackAdapter._DurationConverter.toIsar(upper),
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadProgressGreaterThan(
    double value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      property: 'downloadProgress',
      value: value,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadProgressLessThan(
    double value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      property: 'downloadProgress',
      value: value,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadProgressBetween(
    double lower,
    double upper,
  ) {
    return addFilterCondition(FilterCondition.between(
      property: 'downloadProgress',
      lower: lower,
      upper: upper,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> isDownloadedEqualTo(
    bool value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'isDownloaded',
      value: value,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> downloadPathEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'downloadPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadPathGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      property: 'downloadPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadPathLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      property: 'downloadPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> downloadPathBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition.between(
      property: 'downloadPath',
      lower: lower,
      upper: upper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadPathStartsWith(String value, {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.startsWith,
      property: 'downloadPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadPathEndsWith(String value, {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.endsWith,
      property: 'downloadPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadPathContains(String value, {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.contains,
      property: 'downloadPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> downloadPathMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.matches,
      property: 'downloadPath',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> bookIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'bookId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> bookIdGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      property: 'bookId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> bookIdLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      property: 'bookId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> bookIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition.between(
      property: 'bookId',
      lower: lower,
      upper: upper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> bookIdStartsWith(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.startsWith,
      property: 'bookId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> bookIdEndsWith(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.endsWith,
      property: 'bookId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> bookIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.contains,
      property: 'bookId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> bookIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.matches,
      property: 'bookId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadTaskIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'downloadTaskId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadTaskIdGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      property: 'downloadTaskId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadTaskIdLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      property: 'downloadTaskId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadTaskIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition.between(
      property: 'downloadTaskId',
      lower: lower,
      upper: upper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadTaskIdStartsWith(String value, {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.startsWith,
      property: 'downloadTaskId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadTaskIdEndsWith(String value, {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.endsWith,
      property: 'downloadTaskId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadTaskIdContains(String value, {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.contains,
      property: 'downloadTaskId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadTaskIdMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.matches,
      property: 'downloadTaskId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadTaskStatusEqualTo(
    int value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'downloadTaskStatus',
      value: value,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadTaskStatusGreaterThan(
    int value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      property: 'downloadTaskStatus',
      value: value,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadTaskStatusLessThan(
    int value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      property: 'downloadTaskStatus',
      value: value,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadTaskStatusBetween(
    int lower,
    int upper,
  ) {
    return addFilterCondition(FilterCondition.between(
      property: 'downloadTaskStatus',
      lower: lower,
      upper: upper,
    ));
  }
}

extension IsarTrackQueryWhereSortBy
    on QueryBuilder<IsarTrack, IsarTrack, QSortBy> {
  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByIsarId() {
    return addSortByInternal('isarId', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByIsarIdDesc() {
    return addSortByInternal('isarId', Sort.desc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByDuration() {
    return addSortByInternal('duration', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByDurationDesc() {
    return addSortByInternal('duration', Sort.desc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByDownloadProgress() {
    return addSortByInternal('downloadProgress', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy>
      sortByDownloadProgressDesc() {
    return addSortByInternal('downloadProgress', Sort.desc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByIsDownloaded() {
    return addSortByInternal('isDownloaded', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByIsDownloadedDesc() {
    return addSortByInternal('isDownloaded', Sort.desc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByDownloadPath() {
    return addSortByInternal('downloadPath', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByDownloadPathDesc() {
    return addSortByInternal('downloadPath', Sort.desc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByBookId() {
    return addSortByInternal('bookId', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByBookIdDesc() {
    return addSortByInternal('bookId', Sort.desc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByDownloadTaskId() {
    return addSortByInternal('downloadTaskId', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByDownloadTaskIdDesc() {
    return addSortByInternal('downloadTaskId', Sort.desc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByDownloadTaskStatus() {
    return addSortByInternal('downloadTaskStatus', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy>
      sortByDownloadTaskStatusDesc() {
    return addSortByInternal('downloadTaskStatus', Sort.desc);
  }
}

extension IsarTrackQueryWhereSortThenBy
    on QueryBuilder<IsarTrack, IsarTrack, QSortThenBy> {
  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByIsarId() {
    return addSortByInternal('isarId', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByIsarIdDesc() {
    return addSortByInternal('isarId', Sort.desc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByDuration() {
    return addSortByInternal('duration', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByDurationDesc() {
    return addSortByInternal('duration', Sort.desc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByDownloadProgress() {
    return addSortByInternal('downloadProgress', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy>
      thenByDownloadProgressDesc() {
    return addSortByInternal('downloadProgress', Sort.desc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByIsDownloaded() {
    return addSortByInternal('isDownloaded', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByIsDownloadedDesc() {
    return addSortByInternal('isDownloaded', Sort.desc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByDownloadPath() {
    return addSortByInternal('downloadPath', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByDownloadPathDesc() {
    return addSortByInternal('downloadPath', Sort.desc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByBookId() {
    return addSortByInternal('bookId', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByBookIdDesc() {
    return addSortByInternal('bookId', Sort.desc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByDownloadTaskId() {
    return addSortByInternal('downloadTaskId', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByDownloadTaskIdDesc() {
    return addSortByInternal('downloadTaskId', Sort.desc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByDownloadTaskStatus() {
    return addSortByInternal('downloadTaskStatus', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy>
      thenByDownloadTaskStatusDesc() {
    return addSortByInternal('downloadTaskStatus', Sort.desc);
  }
}

extension IsarTrackQueryWhereDistinct
    on QueryBuilder<IsarTrack, IsarTrack, QDistinct> {
  QueryBuilder<IsarTrack, IsarTrack, QDistinct> distinctByIsarId() {
    return addDistinctByInternal('isarId');
  }

  QueryBuilder<IsarTrack, IsarTrack, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('id', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarTrack, IsarTrack, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('title', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarTrack, IsarTrack, QDistinct> distinctByDuration() {
    return addDistinctByInternal('duration');
  }

  QueryBuilder<IsarTrack, IsarTrack, QDistinct> distinctByDownloadProgress() {
    return addDistinctByInternal('downloadProgress');
  }

  QueryBuilder<IsarTrack, IsarTrack, QDistinct> distinctByIsDownloaded() {
    return addDistinctByInternal('isDownloaded');
  }

  QueryBuilder<IsarTrack, IsarTrack, QDistinct> distinctByDownloadPath(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('downloadPath', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarTrack, IsarTrack, QDistinct> distinctByBookId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('bookId', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarTrack, IsarTrack, QDistinct> distinctByDownloadTaskId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('downloadTaskId',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarTrack, IsarTrack, QDistinct> distinctByDownloadTaskStatus() {
    return addDistinctByInternal('downloadTaskStatus');
  }
}

extension IsarTrackQueryProperty
    on QueryBuilder<IsarTrack, IsarTrack, QQueryProperty> {
  QueryBuilder<IsarTrack, int?, QQueryOperations> isarIdProperty() {
    return addPropertyName('isarId');
  }

  QueryBuilder<IsarTrack, String, QQueryOperations> idProperty() {
    return addPropertyName('id');
  }

  QueryBuilder<IsarTrack, String, QQueryOperations> titleProperty() {
    return addPropertyName('title');
  }

  QueryBuilder<IsarTrack, Duration, QQueryOperations> durationProperty() {
    return addPropertyName('duration');
  }

  QueryBuilder<IsarTrack, double, QQueryOperations> downloadProgressProperty() {
    return addPropertyName('downloadProgress');
  }

  QueryBuilder<IsarTrack, bool, QQueryOperations> isDownloadedProperty() {
    return addPropertyName('isDownloaded');
  }

  QueryBuilder<IsarTrack, String, QQueryOperations> downloadPathProperty() {
    return addPropertyName('downloadPath');
  }

  QueryBuilder<IsarTrack, String, QQueryOperations> bookIdProperty() {
    return addPropertyName('bookId');
  }

  QueryBuilder<IsarTrack, String, QQueryOperations> downloadTaskIdProperty() {
    return addPropertyName('downloadTaskId');
  }

  QueryBuilder<IsarTrack, int, QQueryOperations> downloadTaskStatusProperty() {
    return addPropertyName('downloadTaskStatus');
  }
}
