// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_track.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable, no_leading_underscores_for_local_identifiers

extension GetIsarTrackCollection on Isar {
  IsarCollection<IsarTrack> get isarTracks => getCollection();
}

const IsarTrackSchema = CollectionSchema(
  name: 'IsarTrack',
  schema:
      '{"name":"IsarTrack","idName":"isarId","properties":[{"name":"bookId","type":"String"},{"name":"downloadPath","type":"String"},{"name":"downloadProgress","type":"Double"},{"name":"downloadTaskId","type":"String"},{"name":"downloadTaskStatus","type":"Long"},{"name":"duration","type":"Long"},{"name":"id","type":"String"},{"name":"isDownloaded","type":"Bool"},{"name":"title","type":"String"}],"indexes":[],"links":[]}',
  idName: 'isarId',
  propertyIds: {
    'bookId': 0,
    'downloadPath': 1,
    'downloadProgress': 2,
    'downloadTaskId': 3,
    'downloadTaskStatus': 4,
    'duration': 5,
    'id': 6,
    'isDownloaded': 7,
    'title': 8
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _isarTrackGetId,
  setId: _isarTrackSetId,
  getLinks: _isarTrackGetLinks,
  attachLinks: _isarTrackAttachLinks,
  serializeNative: _isarTrackSerializeNative,
  deserializeNative: _isarTrackDeserializeNative,
  deserializePropNative: _isarTrackDeserializePropNative,
  serializeWeb: _isarTrackSerializeWeb,
  deserializeWeb: _isarTrackDeserializeWeb,
  deserializePropWeb: _isarTrackDeserializePropWeb,
  version: 4,
);

int? _isarTrackGetId(IsarTrack object) {
  if (object.isarId == Isar.autoIncrement) {
    return null;
  } else {
    return object.isarId;
  }
}

void _isarTrackSetId(IsarTrack object, int id) {
  object.isarId = id;
}

List<IsarLinkBase> _isarTrackGetLinks(IsarTrack object) {
  return [];
}

const _isarTrackDurationConverter = DurationConverter();

void _isarTrackSerializeNative(
    IsarCollection<IsarTrack> collection,
    IsarCObject cObj,
    IsarTrack object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.bookId;
  final _bookId = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_bookId.length) as int;
  final value1 = object.downloadPath;
  final _downloadPath = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_downloadPath.length) as int;
  final value2 = object.downloadProgress;
  final _downloadProgress = value2;
  final value3 = object.downloadTaskId;
  final _downloadTaskId = IsarBinaryWriter.utf8Encoder.convert(value3);
  dynamicSize += (_downloadTaskId.length) as int;
  final value4 = object.downloadTaskStatus;
  final _downloadTaskStatus = value4;
  final value5 = _isarTrackDurationConverter.toIsar(object.duration);
  final _duration = value5;
  final value6 = object.id;
  final _id = IsarBinaryWriter.utf8Encoder.convert(value6);
  dynamicSize += (_id.length) as int;
  final value7 = object.isDownloaded;
  final _isDownloaded = value7;
  final value8 = object.title;
  final _title = IsarBinaryWriter.utf8Encoder.convert(value8);
  dynamicSize += (_title.length) as int;
  final size = staticSize + dynamicSize;

  cObj.buffer = alloc(size);
  cObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _bookId);
  writer.writeBytes(offsets[1], _downloadPath);
  writer.writeDouble(offsets[2], _downloadProgress);
  writer.writeBytes(offsets[3], _downloadTaskId);
  writer.writeLong(offsets[4], _downloadTaskStatus);
  writer.writeLong(offsets[5], _duration);
  writer.writeBytes(offsets[6], _id);
  writer.writeBool(offsets[7], _isDownloaded);
  writer.writeBytes(offsets[8], _title);
}

IsarTrack _isarTrackDeserializeNative(IsarCollection<IsarTrack> collection,
    int id, IsarBinaryReader reader, List<int> offsets) {
  final object = IsarTrack(
    reader.readString(offsets[6]),
    reader.readString(offsets[8]),
    _isarTrackDurationConverter.fromIsar(reader.readLong(offsets[5])),
    reader.readDouble(offsets[2]),
    reader.readBool(offsets[7]),
    reader.readString(offsets[1]),
    reader.readString(offsets[0]),
    reader.readString(offsets[3]),
    reader.readLong(offsets[4]),
    id,
  );
  return object;
}

P _isarTrackDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (_isarTrackDurationConverter.fromIsar(reader.readLong(offset)))
          as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _isarTrackSerializeWeb(
    IsarCollection<IsarTrack> collection, IsarTrack object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'bookId', object.bookId);
  IsarNative.jsObjectSet(jsObj, 'downloadPath', object.downloadPath);
  IsarNative.jsObjectSet(jsObj, 'downloadProgress', object.downloadProgress);
  IsarNative.jsObjectSet(jsObj, 'downloadTaskId', object.downloadTaskId);
  IsarNative.jsObjectSet(
      jsObj, 'downloadTaskStatus', object.downloadTaskStatus);
  IsarNative.jsObjectSet(
      jsObj, 'duration', _isarTrackDurationConverter.toIsar(object.duration));
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'isDownloaded', object.isDownloaded);
  IsarNative.jsObjectSet(jsObj, 'isarId', object.isarId);
  IsarNative.jsObjectSet(jsObj, 'title', object.title);
  return jsObj;
}

IsarTrack _isarTrackDeserializeWeb(
    IsarCollection<IsarTrack> collection, dynamic jsObj) {
  final object = IsarTrack(
    IsarNative.jsObjectGet(jsObj, 'id') ?? '',
    IsarNative.jsObjectGet(jsObj, 'title') ?? '',
    _isarTrackDurationConverter.fromIsar(
        IsarNative.jsObjectGet(jsObj, 'duration') ?? double.negativeInfinity),
    IsarNative.jsObjectGet(jsObj, 'downloadProgress') ??
        double.negativeInfinity,
    IsarNative.jsObjectGet(jsObj, 'isDownloaded') ?? false,
    IsarNative.jsObjectGet(jsObj, 'downloadPath') ?? '',
    IsarNative.jsObjectGet(jsObj, 'bookId') ?? '',
    IsarNative.jsObjectGet(jsObj, 'downloadTaskId') ?? '',
    IsarNative.jsObjectGet(jsObj, 'downloadTaskStatus') ??
        double.negativeInfinity,
    IsarNative.jsObjectGet(jsObj, 'isarId'),
  );
  return object;
}

P _isarTrackDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'bookId':
      return (IsarNative.jsObjectGet(jsObj, 'bookId') ?? '') as P;
    case 'downloadPath':
      return (IsarNative.jsObjectGet(jsObj, 'downloadPath') ?? '') as P;
    case 'downloadProgress':
      return (IsarNative.jsObjectGet(jsObj, 'downloadProgress') ??
          double.negativeInfinity) as P;
    case 'downloadTaskId':
      return (IsarNative.jsObjectGet(jsObj, 'downloadTaskId') ?? '') as P;
    case 'downloadTaskStatus':
      return (IsarNative.jsObjectGet(jsObj, 'downloadTaskStatus') ??
          double.negativeInfinity) as P;
    case 'duration':
      return (_isarTrackDurationConverter.fromIsar(
          IsarNative.jsObjectGet(jsObj, 'duration') ??
              double.negativeInfinity)) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? '') as P;
    case 'isDownloaded':
      return (IsarNative.jsObjectGet(jsObj, 'isDownloaded') ?? false) as P;
    case 'isarId':
      return (IsarNative.jsObjectGet(jsObj, 'isarId')) as P;
    case 'title':
      return (IsarNative.jsObjectGet(jsObj, 'title') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _isarTrackAttachLinks(IsarCollection col, int id, IsarTrack object) {}

extension IsarTrackQueryWhereSort
    on QueryBuilder<IsarTrack, IsarTrack, QWhere> {
  QueryBuilder<IsarTrack, IsarTrack, QAfterWhere> anyIsarId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension IsarTrackQueryWhere
    on QueryBuilder<IsarTrack, IsarTrack, QWhereClause> {
  QueryBuilder<IsarTrack, IsarTrack, QAfterWhereClause> isarIdEqualTo(
      int isarId) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: isarId,
      includeLower: true,
      upper: isarId,
      includeUpper: true,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterWhereClause> isarIdNotEqualTo(
      int isarId) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: isarId, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: isarId, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: isarId, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: isarId, includeUpper: false),
      );
    }
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterWhereClause> isarIdGreaterThan(
      int isarId,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: isarId, includeLower: include),
    );
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterWhereClause> isarIdLessThan(
      int isarId,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: isarId, includeUpper: include),
    );
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterWhereClause> isarIdBetween(
    int lowerIsarId,
    int upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerIsarId,
      includeLower: includeLower,
      upper: upperIsarId,
      includeUpper: includeUpper,
    ));
  }
}

extension IsarTrackQueryFilter
    on QueryBuilder<IsarTrack, IsarTrack, QFilterCondition> {
  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> bookIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'bookId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> bookIdGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'bookId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> bookIdLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'bookId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> bookIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'bookId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> bookIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'bookId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> bookIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'bookId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> bookIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'bookId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> bookIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'bookId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> downloadPathEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
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
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'downloadPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadPathLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'downloadPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> downloadPathBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'downloadPath',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'downloadPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'downloadPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadPathContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'downloadPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> downloadPathMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'downloadPath',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadProgressGreaterThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'downloadProgress',
      value: value,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadProgressLessThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'downloadProgress',
      value: value,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadProgressBetween(double lower, double upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'downloadProgress',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadTaskIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
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
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'downloadTaskId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadTaskIdLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
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
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'downloadTaskId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadTaskIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'downloadTaskId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadTaskIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'downloadTaskId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadTaskIdContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'downloadTaskId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadTaskIdMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'downloadTaskId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadTaskStatusEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'downloadTaskStatus',
      value: value,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadTaskStatusGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'downloadTaskStatus',
      value: value,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadTaskStatusLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'downloadTaskStatus',
      value: value,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadTaskStatusBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'downloadTaskStatus',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> durationEqualTo(
      Duration value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'duration',
      value: _isarTrackDurationConverter.toIsar(value),
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> durationGreaterThan(
    Duration value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'duration',
      value: _isarTrackDurationConverter.toIsar(value),
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> durationLessThan(
    Duration value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'duration',
      value: _isarTrackDurationConverter.toIsar(value),
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> durationBetween(
    Duration lower,
    Duration upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'duration',
      lower: _isarTrackDurationConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _isarTrackDurationConverter.toIsar(upper),
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> idLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'id',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'id',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'id',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'id',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> isDownloadedEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'isDownloaded',
      value: value,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> isarIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'isarId',
      value: null,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> isarIdEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'isarId',
      value: value,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> isarIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'isarId',
      value: value,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> isarIdLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'isarId',
      value: value,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> isarIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'isarId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> titleLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'title',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'title',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension IsarTrackQueryLinks
    on QueryBuilder<IsarTrack, IsarTrack, QFilterCondition> {}

extension IsarTrackQueryWhereSortBy
    on QueryBuilder<IsarTrack, IsarTrack, QSortBy> {
  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByBookId() {
    return addSortByInternal('bookId', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByBookIdDesc() {
    return addSortByInternal('bookId', Sort.desc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByDownloadPath() {
    return addSortByInternal('downloadPath', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByDownloadPathDesc() {
    return addSortByInternal('downloadPath', Sort.desc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByDownloadProgress() {
    return addSortByInternal('downloadProgress', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy>
      sortByDownloadProgressDesc() {
    return addSortByInternal('downloadProgress', Sort.desc);
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

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByDuration() {
    return addSortByInternal('duration', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByDurationDesc() {
    return addSortByInternal('duration', Sort.desc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByIsDownloaded() {
    return addSortByInternal('isDownloaded', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByIsDownloadedDesc() {
    return addSortByInternal('isDownloaded', Sort.desc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByIsarId() {
    return addSortByInternal('isarId', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByIsarIdDesc() {
    return addSortByInternal('isarId', Sort.desc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }
}

extension IsarTrackQueryWhereSortThenBy
    on QueryBuilder<IsarTrack, IsarTrack, QSortThenBy> {
  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByBookId() {
    return addSortByInternal('bookId', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByBookIdDesc() {
    return addSortByInternal('bookId', Sort.desc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByDownloadPath() {
    return addSortByInternal('downloadPath', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByDownloadPathDesc() {
    return addSortByInternal('downloadPath', Sort.desc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByDownloadProgress() {
    return addSortByInternal('downloadProgress', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy>
      thenByDownloadProgressDesc() {
    return addSortByInternal('downloadProgress', Sort.desc);
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

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByDuration() {
    return addSortByInternal('duration', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByDurationDesc() {
    return addSortByInternal('duration', Sort.desc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByIsDownloaded() {
    return addSortByInternal('isDownloaded', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByIsDownloadedDesc() {
    return addSortByInternal('isDownloaded', Sort.desc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByIsarId() {
    return addSortByInternal('isarId', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByIsarIdDesc() {
    return addSortByInternal('isarId', Sort.desc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }
}

extension IsarTrackQueryWhereDistinct
    on QueryBuilder<IsarTrack, IsarTrack, QDistinct> {
  QueryBuilder<IsarTrack, IsarTrack, QDistinct> distinctByBookId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('bookId', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarTrack, IsarTrack, QDistinct> distinctByDownloadPath(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('downloadPath', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarTrack, IsarTrack, QDistinct> distinctByDownloadProgress() {
    return addDistinctByInternal('downloadProgress');
  }

  QueryBuilder<IsarTrack, IsarTrack, QDistinct> distinctByDownloadTaskId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('downloadTaskId',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarTrack, IsarTrack, QDistinct> distinctByDownloadTaskStatus() {
    return addDistinctByInternal('downloadTaskStatus');
  }

  QueryBuilder<IsarTrack, IsarTrack, QDistinct> distinctByDuration() {
    return addDistinctByInternal('duration');
  }

  QueryBuilder<IsarTrack, IsarTrack, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('id', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarTrack, IsarTrack, QDistinct> distinctByIsDownloaded() {
    return addDistinctByInternal('isDownloaded');
  }

  QueryBuilder<IsarTrack, IsarTrack, QDistinct> distinctByIsarId() {
    return addDistinctByInternal('isarId');
  }

  QueryBuilder<IsarTrack, IsarTrack, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('title', caseSensitive: caseSensitive);
  }
}

extension IsarTrackQueryProperty
    on QueryBuilder<IsarTrack, IsarTrack, QQueryProperty> {
  QueryBuilder<IsarTrack, String, QQueryOperations> bookIdProperty() {
    return addPropertyNameInternal('bookId');
  }

  QueryBuilder<IsarTrack, String, QQueryOperations> downloadPathProperty() {
    return addPropertyNameInternal('downloadPath');
  }

  QueryBuilder<IsarTrack, double, QQueryOperations> downloadProgressProperty() {
    return addPropertyNameInternal('downloadProgress');
  }

  QueryBuilder<IsarTrack, String, QQueryOperations> downloadTaskIdProperty() {
    return addPropertyNameInternal('downloadTaskId');
  }

  QueryBuilder<IsarTrack, int, QQueryOperations> downloadTaskStatusProperty() {
    return addPropertyNameInternal('downloadTaskStatus');
  }

  QueryBuilder<IsarTrack, Duration, QQueryOperations> durationProperty() {
    return addPropertyNameInternal('duration');
  }

  QueryBuilder<IsarTrack, String, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<IsarTrack, bool, QQueryOperations> isDownloadedProperty() {
    return addPropertyNameInternal('isDownloaded');
  }

  QueryBuilder<IsarTrack, int?, QQueryOperations> isarIdProperty() {
    return addPropertyNameInternal('isarId');
  }

  QueryBuilder<IsarTrack, String, QQueryOperations> titleProperty() {
    return addPropertyNameInternal('title');
  }
}
