// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_book.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable, no_leading_underscores_for_local_identifiers

extension GetIsarBookCollection on Isar {
  IsarCollection<IsarBook> get isarBooks => getCollection();
}

const IsarBookSchema = CollectionSchema(
  name: 'IsarBook',
  schema:
      '{"name":"IsarBook","idName":"isarId","properties":[{"name":"artPath","type":"String"},{"name":"author","type":"String"},{"name":"description","type":"String"},{"name":"downloadCompleted","type":"Bool"},{"name":"downloadFailed","type":"Bool"},{"name":"downloadRequested","type":"Bool"},{"name":"downloadStatus","type":"Long"},{"name":"duration","type":"Long"},{"name":"id","type":"String"},{"name":"lastPlayedPosition","type":"Long"},{"name":"lastUpdate","type":"Long"},{"name":"narrator","type":"String"},{"name":"read","type":"Bool"},{"name":"title","type":"String"}],"indexes":[],"links":[]}',
  idName: 'isarId',
  propertyIds: {
    'artPath': 0,
    'author': 1,
    'description': 2,
    'downloadCompleted': 3,
    'downloadFailed': 4,
    'downloadRequested': 5,
    'downloadStatus': 6,
    'duration': 7,
    'id': 8,
    'lastPlayedPosition': 9,
    'lastUpdate': 10,
    'narrator': 11,
    'read': 12,
    'title': 13
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _isarBookGetId,
  setId: _isarBookSetId,
  getLinks: _isarBookGetLinks,
  attachLinks: _isarBookAttachLinks,
  serializeNative: _isarBookSerializeNative,
  deserializeNative: _isarBookDeserializeNative,
  deserializePropNative: _isarBookDeserializePropNative,
  serializeWeb: _isarBookSerializeWeb,
  deserializeWeb: _isarBookDeserializeWeb,
  deserializePropWeb: _isarBookDeserializePropWeb,
  version: 4,
);

int? _isarBookGetId(IsarBook object) {
  if (object.isarId == Isar.autoIncrement) {
    return null;
  } else {
    return object.isarId;
  }
}

void _isarBookSetId(IsarBook object, int id) {
  object.isarId = id;
}

List<IsarLinkBase> _isarBookGetLinks(IsarBook object) {
  return [];
}

const _isarBookDownloadStatusConverter = DownloadStatusConverter();
const _isarBookDurationConverter = DurationConverter();
const _isarBookDateTimeConverter = DateTimeConverter();

void _isarBookSerializeNative(
    IsarCollection<IsarBook> collection,
    IsarCObject cObj,
    IsarBook object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.artPath;
  final _artPath = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_artPath.length) as int;
  final value1 = object.author;
  final _author = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_author.length) as int;
  final value2 = object.description;
  final _description = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_description.length) as int;
  final value3 = object.downloadCompleted;
  final _downloadCompleted = value3;
  final value4 = object.downloadFailed;
  final _downloadFailed = value4;
  final value5 = object.downloadRequested;
  final _downloadRequested = value5;
  final value6 = _isarBookDownloadStatusConverter.toIsar(object.downloadStatus);
  final _downloadStatus = value6;
  final value7 = _isarBookDurationConverter.toIsar(object.duration);
  final _duration = value7;
  final value8 = object.id;
  final _id = IsarBinaryWriter.utf8Encoder.convert(value8);
  dynamicSize += (_id.length) as int;
  final value9 = _isarBookDurationConverter.toIsar(object.lastPlayedPosition);
  final _lastPlayedPosition = value9;
  final value10 = _isarBookDateTimeConverter.toIsar(object.lastUpdate);
  final _lastUpdate = value10;
  final value11 = object.narrator;
  final _narrator = IsarBinaryWriter.utf8Encoder.convert(value11);
  dynamicSize += (_narrator.length) as int;
  final value12 = object.read;
  final _read = value12;
  final value13 = object.title;
  final _title = IsarBinaryWriter.utf8Encoder.convert(value13);
  dynamicSize += (_title.length) as int;
  final size = staticSize + dynamicSize;

  cObj.buffer = alloc(size);
  cObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _artPath);
  writer.writeBytes(offsets[1], _author);
  writer.writeBytes(offsets[2], _description);
  writer.writeBool(offsets[3], _downloadCompleted);
  writer.writeBool(offsets[4], _downloadFailed);
  writer.writeBool(offsets[5], _downloadRequested);
  writer.writeLong(offsets[6], _downloadStatus);
  writer.writeLong(offsets[7], _duration);
  writer.writeBytes(offsets[8], _id);
  writer.writeLong(offsets[9], _lastPlayedPosition);
  writer.writeLong(offsets[10], _lastUpdate);
  writer.writeBytes(offsets[11], _narrator);
  writer.writeBool(offsets[12], _read);
  writer.writeBytes(offsets[13], _title);
}

IsarBook _isarBookDeserializeNative(IsarCollection<IsarBook> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = IsarBook(
    id,
    reader.readString(offsets[8]),
    reader.readString(offsets[13]),
    reader.readString(offsets[1]),
    reader.readString(offsets[11]),
    reader.readString(offsets[2]),
    reader.readString(offsets[0]),
    _isarBookDurationConverter.fromIsar(reader.readLong(offsets[7])),
    _isarBookDurationConverter.fromIsar(reader.readLong(offsets[9])),
    reader.readBool(offsets[5]),
    reader.readBool(offsets[3]),
    reader.readBool(offsets[4]),
    reader.readBool(offsets[12]),
    _isarBookDateTimeConverter.fromIsar(reader.readLongOrNull(offsets[10])),
    _isarBookDownloadStatusConverter.fromIsar(reader.readLong(offsets[6])),
  );
  return object;
}

P _isarBookDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (_isarBookDownloadStatusConverter
          .fromIsar(reader.readLong(offset))) as P;
    case 7:
      return (_isarBookDurationConverter.fromIsar(reader.readLong(offset)))
          as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (_isarBookDurationConverter.fromIsar(reader.readLong(offset)))
          as P;
    case 10:
      return (_isarBookDateTimeConverter
          .fromIsar(reader.readLongOrNull(offset))) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _isarBookSerializeWeb(
    IsarCollection<IsarBook> collection, IsarBook object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'artPath', object.artPath);
  IsarNative.jsObjectSet(jsObj, 'author', object.author);
  IsarNative.jsObjectSet(jsObj, 'description', object.description);
  IsarNative.jsObjectSet(jsObj, 'downloadCompleted', object.downloadCompleted);
  IsarNative.jsObjectSet(jsObj, 'downloadFailed', object.downloadFailed);
  IsarNative.jsObjectSet(jsObj, 'downloadRequested', object.downloadRequested);
  IsarNative.jsObjectSet(jsObj, 'downloadStatus',
      _isarBookDownloadStatusConverter.toIsar(object.downloadStatus));
  IsarNative.jsObjectSet(
      jsObj, 'duration', _isarBookDurationConverter.toIsar(object.duration));
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'isarId', object.isarId);
  IsarNative.jsObjectSet(jsObj, 'lastPlayedPosition',
      _isarBookDurationConverter.toIsar(object.lastPlayedPosition));
  IsarNative.jsObjectSet(jsObj, 'lastUpdate',
      _isarBookDateTimeConverter.toIsar(object.lastUpdate));
  IsarNative.jsObjectSet(jsObj, 'narrator', object.narrator);
  IsarNative.jsObjectSet(jsObj, 'read', object.read);
  IsarNative.jsObjectSet(jsObj, 'title', object.title);
  return jsObj;
}

IsarBook _isarBookDeserializeWeb(
    IsarCollection<IsarBook> collection, dynamic jsObj) {
  final object = IsarBook(
    IsarNative.jsObjectGet(jsObj, 'isarId'),
    IsarNative.jsObjectGet(jsObj, 'id') ?? '',
    IsarNative.jsObjectGet(jsObj, 'title') ?? '',
    IsarNative.jsObjectGet(jsObj, 'author') ?? '',
    IsarNative.jsObjectGet(jsObj, 'narrator') ?? '',
    IsarNative.jsObjectGet(jsObj, 'description') ?? '',
    IsarNative.jsObjectGet(jsObj, 'artPath') ?? '',
    _isarBookDurationConverter.fromIsar(
        IsarNative.jsObjectGet(jsObj, 'duration') ?? double.negativeInfinity),
    _isarBookDurationConverter.fromIsar(
        IsarNative.jsObjectGet(jsObj, 'lastPlayedPosition') ??
            double.negativeInfinity),
    IsarNative.jsObjectGet(jsObj, 'downloadRequested') ?? false,
    IsarNative.jsObjectGet(jsObj, 'downloadCompleted') ?? false,
    IsarNative.jsObjectGet(jsObj, 'downloadFailed') ?? false,
    IsarNative.jsObjectGet(jsObj, 'read') ?? false,
    _isarBookDateTimeConverter
        .fromIsar(IsarNative.jsObjectGet(jsObj, 'lastUpdate')),
    _isarBookDownloadStatusConverter.fromIsar(
        IsarNative.jsObjectGet(jsObj, 'downloadStatus') ??
            double.negativeInfinity),
  );
  return object;
}

P _isarBookDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'artPath':
      return (IsarNative.jsObjectGet(jsObj, 'artPath') ?? '') as P;
    case 'author':
      return (IsarNative.jsObjectGet(jsObj, 'author') ?? '') as P;
    case 'description':
      return (IsarNative.jsObjectGet(jsObj, 'description') ?? '') as P;
    case 'downloadCompleted':
      return (IsarNative.jsObjectGet(jsObj, 'downloadCompleted') ?? false) as P;
    case 'downloadFailed':
      return (IsarNative.jsObjectGet(jsObj, 'downloadFailed') ?? false) as P;
    case 'downloadRequested':
      return (IsarNative.jsObjectGet(jsObj, 'downloadRequested') ?? false) as P;
    case 'downloadStatus':
      return (_isarBookDownloadStatusConverter.fromIsar(
          IsarNative.jsObjectGet(jsObj, 'downloadStatus') ??
              double.negativeInfinity)) as P;
    case 'duration':
      return (_isarBookDurationConverter.fromIsar(
          IsarNative.jsObjectGet(jsObj, 'duration') ??
              double.negativeInfinity)) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? '') as P;
    case 'isarId':
      return (IsarNative.jsObjectGet(jsObj, 'isarId')) as P;
    case 'lastPlayedPosition':
      return (_isarBookDurationConverter.fromIsar(
          IsarNative.jsObjectGet(jsObj, 'lastPlayedPosition') ??
              double.negativeInfinity)) as P;
    case 'lastUpdate':
      return (_isarBookDateTimeConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'lastUpdate'))) as P;
    case 'narrator':
      return (IsarNative.jsObjectGet(jsObj, 'narrator') ?? '') as P;
    case 'read':
      return (IsarNative.jsObjectGet(jsObj, 'read') ?? false) as P;
    case 'title':
      return (IsarNative.jsObjectGet(jsObj, 'title') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _isarBookAttachLinks(IsarCollection col, int id, IsarBook object) {}

extension IsarBookQueryWhereSort on QueryBuilder<IsarBook, IsarBook, QWhere> {
  QueryBuilder<IsarBook, IsarBook, QAfterWhere> anyIsarId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension IsarBookQueryWhere on QueryBuilder<IsarBook, IsarBook, QWhereClause> {
  QueryBuilder<IsarBook, IsarBook, QAfterWhereClause> isarIdEqualTo(
      int isarId) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: isarId,
      includeLower: true,
      upper: isarId,
      includeUpper: true,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterWhereClause> isarIdNotEqualTo(
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

  QueryBuilder<IsarBook, IsarBook, QAfterWhereClause> isarIdGreaterThan(
      int isarId,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: isarId, includeLower: include),
    );
  }

  QueryBuilder<IsarBook, IsarBook, QAfterWhereClause> isarIdLessThan(int isarId,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: isarId, includeUpper: include),
    );
  }

  QueryBuilder<IsarBook, IsarBook, QAfterWhereClause> isarIdBetween(
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

extension IsarBookQueryFilter
    on QueryBuilder<IsarBook, IsarBook, QFilterCondition> {
  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> artPathEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'artPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> artPathGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'artPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> artPathLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'artPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> artPathBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'artPath',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> artPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'artPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> artPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'artPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> artPathContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'artPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> artPathMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'artPath',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> authorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'author',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> authorGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'author',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> authorLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'author',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> authorBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'author',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> authorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'author',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> authorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'author',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> authorContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'author',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> authorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'author',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> descriptionLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> descriptionBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'description',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'description',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition>
      downloadCompletedEqualTo(bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'downloadCompleted',
      value: value,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> downloadFailedEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'downloadFailed',
      value: value,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition>
      downloadRequestedEqualTo(bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'downloadRequested',
      value: value,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> downloadStatusEqualTo(
      DownloadStatus value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'downloadStatus',
      value: _isarBookDownloadStatusConverter.toIsar(value),
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition>
      downloadStatusGreaterThan(
    DownloadStatus value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'downloadStatus',
      value: _isarBookDownloadStatusConverter.toIsar(value),
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition>
      downloadStatusLessThan(
    DownloadStatus value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'downloadStatus',
      value: _isarBookDownloadStatusConverter.toIsar(value),
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> downloadStatusBetween(
    DownloadStatus lower,
    DownloadStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'downloadStatus',
      lower: _isarBookDownloadStatusConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _isarBookDownloadStatusConverter.toIsar(upper),
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> durationEqualTo(
      Duration value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'duration',
      value: _isarBookDurationConverter.toIsar(value),
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> durationGreaterThan(
    Duration value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'duration',
      value: _isarBookDurationConverter.toIsar(value),
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> durationLessThan(
    Duration value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'duration',
      value: _isarBookDurationConverter.toIsar(value),
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> durationBetween(
    Duration lower,
    Duration upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'duration',
      lower: _isarBookDurationConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _isarBookDurationConverter.toIsar(upper),
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> idEqualTo(
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

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> idBetween(
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

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> idStartsWith(
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

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> idEndsWith(
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

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'id',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'id',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> isarIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'isarId',
      value: null,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> isarIdEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'isarId',
      value: value,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> isarIdGreaterThan(
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

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> isarIdLessThan(
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

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> isarIdBetween(
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

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition>
      lastPlayedPositionEqualTo(Duration value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'lastPlayedPosition',
      value: _isarBookDurationConverter.toIsar(value),
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition>
      lastPlayedPositionGreaterThan(
    Duration value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'lastPlayedPosition',
      value: _isarBookDurationConverter.toIsar(value),
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition>
      lastPlayedPositionLessThan(
    Duration value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'lastPlayedPosition',
      value: _isarBookDurationConverter.toIsar(value),
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition>
      lastPlayedPositionBetween(
    Duration lower,
    Duration upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'lastPlayedPosition',
      lower: _isarBookDurationConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _isarBookDurationConverter.toIsar(upper),
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> lastUpdateIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'lastUpdate',
      value: null,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> lastUpdateEqualTo(
      DateTime? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'lastUpdate',
      value: _isarBookDateTimeConverter.toIsar(value),
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> lastUpdateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'lastUpdate',
      value: _isarBookDateTimeConverter.toIsar(value),
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> lastUpdateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'lastUpdate',
      value: _isarBookDateTimeConverter.toIsar(value),
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> lastUpdateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'lastUpdate',
      lower: _isarBookDateTimeConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _isarBookDateTimeConverter.toIsar(upper),
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> narratorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'narrator',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> narratorGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'narrator',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> narratorLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'narrator',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> narratorBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'narrator',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> narratorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'narrator',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> narratorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'narrator',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> narratorContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'narrator',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> narratorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'narrator',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> readEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'read',
      value: value,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> titleEqualTo(
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

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> titleGreaterThan(
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

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> titleLessThan(
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

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> titleBetween(
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

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> titleStartsWith(
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

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> titleEndsWith(
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

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> titleMatches(
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

extension IsarBookQueryLinks
    on QueryBuilder<IsarBook, IsarBook, QFilterCondition> {}

extension IsarBookQueryWhereSortBy
    on QueryBuilder<IsarBook, IsarBook, QSortBy> {
  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByArtPath() {
    return addSortByInternal('artPath', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByArtPathDesc() {
    return addSortByInternal('artPath', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByAuthor() {
    return addSortByInternal('author', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByAuthorDesc() {
    return addSortByInternal('author', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByDescription() {
    return addSortByInternal('description', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByDescriptionDesc() {
    return addSortByInternal('description', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByDownloadCompleted() {
    return addSortByInternal('downloadCompleted', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByDownloadCompletedDesc() {
    return addSortByInternal('downloadCompleted', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByDownloadFailed() {
    return addSortByInternal('downloadFailed', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByDownloadFailedDesc() {
    return addSortByInternal('downloadFailed', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByDownloadRequested() {
    return addSortByInternal('downloadRequested', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByDownloadRequestedDesc() {
    return addSortByInternal('downloadRequested', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByDownloadStatus() {
    return addSortByInternal('downloadStatus', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByDownloadStatusDesc() {
    return addSortByInternal('downloadStatus', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByDuration() {
    return addSortByInternal('duration', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByDurationDesc() {
    return addSortByInternal('duration', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByIsarId() {
    return addSortByInternal('isarId', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByIsarIdDesc() {
    return addSortByInternal('isarId', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByLastPlayedPosition() {
    return addSortByInternal('lastPlayedPosition', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy>
      sortByLastPlayedPositionDesc() {
    return addSortByInternal('lastPlayedPosition', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByLastUpdate() {
    return addSortByInternal('lastUpdate', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByLastUpdateDesc() {
    return addSortByInternal('lastUpdate', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByNarrator() {
    return addSortByInternal('narrator', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByNarratorDesc() {
    return addSortByInternal('narrator', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByRead() {
    return addSortByInternal('read', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByReadDesc() {
    return addSortByInternal('read', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }
}

extension IsarBookQueryWhereSortThenBy
    on QueryBuilder<IsarBook, IsarBook, QSortThenBy> {
  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByArtPath() {
    return addSortByInternal('artPath', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByArtPathDesc() {
    return addSortByInternal('artPath', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByAuthor() {
    return addSortByInternal('author', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByAuthorDesc() {
    return addSortByInternal('author', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByDescription() {
    return addSortByInternal('description', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByDescriptionDesc() {
    return addSortByInternal('description', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByDownloadCompleted() {
    return addSortByInternal('downloadCompleted', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByDownloadCompletedDesc() {
    return addSortByInternal('downloadCompleted', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByDownloadFailed() {
    return addSortByInternal('downloadFailed', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByDownloadFailedDesc() {
    return addSortByInternal('downloadFailed', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByDownloadRequested() {
    return addSortByInternal('downloadRequested', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByDownloadRequestedDesc() {
    return addSortByInternal('downloadRequested', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByDownloadStatus() {
    return addSortByInternal('downloadStatus', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByDownloadStatusDesc() {
    return addSortByInternal('downloadStatus', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByDuration() {
    return addSortByInternal('duration', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByDurationDesc() {
    return addSortByInternal('duration', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByIsarId() {
    return addSortByInternal('isarId', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByIsarIdDesc() {
    return addSortByInternal('isarId', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByLastPlayedPosition() {
    return addSortByInternal('lastPlayedPosition', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy>
      thenByLastPlayedPositionDesc() {
    return addSortByInternal('lastPlayedPosition', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByLastUpdate() {
    return addSortByInternal('lastUpdate', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByLastUpdateDesc() {
    return addSortByInternal('lastUpdate', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByNarrator() {
    return addSortByInternal('narrator', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByNarratorDesc() {
    return addSortByInternal('narrator', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByRead() {
    return addSortByInternal('read', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByReadDesc() {
    return addSortByInternal('read', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }
}

extension IsarBookQueryWhereDistinct
    on QueryBuilder<IsarBook, IsarBook, QDistinct> {
  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByArtPath(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('artPath', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByAuthor(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('author', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('description', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByDownloadCompleted() {
    return addDistinctByInternal('downloadCompleted');
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByDownloadFailed() {
    return addDistinctByInternal('downloadFailed');
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByDownloadRequested() {
    return addDistinctByInternal('downloadRequested');
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByDownloadStatus() {
    return addDistinctByInternal('downloadStatus');
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByDuration() {
    return addDistinctByInternal('duration');
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('id', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByIsarId() {
    return addDistinctByInternal('isarId');
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByLastPlayedPosition() {
    return addDistinctByInternal('lastPlayedPosition');
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByLastUpdate() {
    return addDistinctByInternal('lastUpdate');
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByNarrator(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('narrator', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByRead() {
    return addDistinctByInternal('read');
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('title', caseSensitive: caseSensitive);
  }
}

extension IsarBookQueryProperty
    on QueryBuilder<IsarBook, IsarBook, QQueryProperty> {
  QueryBuilder<IsarBook, String, QQueryOperations> artPathProperty() {
    return addPropertyNameInternal('artPath');
  }

  QueryBuilder<IsarBook, String, QQueryOperations> authorProperty() {
    return addPropertyNameInternal('author');
  }

  QueryBuilder<IsarBook, String, QQueryOperations> descriptionProperty() {
    return addPropertyNameInternal('description');
  }

  QueryBuilder<IsarBook, bool, QQueryOperations> downloadCompletedProperty() {
    return addPropertyNameInternal('downloadCompleted');
  }

  QueryBuilder<IsarBook, bool, QQueryOperations> downloadFailedProperty() {
    return addPropertyNameInternal('downloadFailed');
  }

  QueryBuilder<IsarBook, bool, QQueryOperations> downloadRequestedProperty() {
    return addPropertyNameInternal('downloadRequested');
  }

  QueryBuilder<IsarBook, DownloadStatus, QQueryOperations>
      downloadStatusProperty() {
    return addPropertyNameInternal('downloadStatus');
  }

  QueryBuilder<IsarBook, Duration, QQueryOperations> durationProperty() {
    return addPropertyNameInternal('duration');
  }

  QueryBuilder<IsarBook, String, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<IsarBook, int?, QQueryOperations> isarIdProperty() {
    return addPropertyNameInternal('isarId');
  }

  QueryBuilder<IsarBook, Duration, QQueryOperations>
      lastPlayedPositionProperty() {
    return addPropertyNameInternal('lastPlayedPosition');
  }

  QueryBuilder<IsarBook, DateTime?, QQueryOperations> lastUpdateProperty() {
    return addPropertyNameInternal('lastUpdate');
  }

  QueryBuilder<IsarBook, String, QQueryOperations> narratorProperty() {
    return addPropertyNameInternal('narrator');
  }

  QueryBuilder<IsarBook, bool, QQueryOperations> readProperty() {
    return addPropertyNameInternal('read');
  }

  QueryBuilder<IsarBook, String, QQueryOperations> titleProperty() {
    return addPropertyNameInternal('title');
  }
}
