// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_book.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, invalid_use_of_protected_member

extension GetIsarBookCollection on Isar {
  IsarCollection<IsarBook> get isarBooks {
    return getCollection('IsarBook');
  }
}

final IsarBookSchema = CollectionSchema(
  name: 'IsarBook',
  schema:
      '{"name":"IsarBook","properties":[{"name":"id","type":"String"},{"name":"title","type":"String"},{"name":"author","type":"String"},{"name":"narrator","type":"String"},{"name":"description","type":"String"},{"name":"artPath","type":"String"},{"name":"duration","type":"Long"},{"name":"lastPlayedPosition","type":"Long"},{"name":"downloadRequested","type":"Byte"},{"name":"downloadCompleted","type":"Byte"},{"name":"downloadFailed","type":"Byte"},{"name":"read","type":"Byte"},{"name":"lastUpdate","type":"Long"}],"indexes":[],"links":[]}',
  adapter: const _IsarBookAdapter(),
  idName: 'isarId',
  propertyIds: {
    'id': 0,
    'title': 1,
    'author': 2,
    'narrator': 3,
    'description': 4,
    'artPath': 5,
    'duration': 6,
    'lastPlayedPosition': 7,
    'downloadRequested': 8,
    'downloadCompleted': 9,
    'downloadFailed': 10,
    'read': 11,
    'lastUpdate': 12
  },
  indexIds: {},
  indexTypes: {},
  linkIds: {},
  backlinkIds: {},
  linkedCollections: [],
  getId: (obj) => obj.isarId,
  version: 0,
);

class _IsarBookAdapter extends IsarTypeAdapter<IsarBook> {
  const _IsarBookAdapter();

  static const _DurationConverter = DurationConverter();

  @override
  int serialize(IsarCollection<IsarBook> collection, RawObject rawObj,
      IsarBook object, List<int> offsets,
      [int? existingBufferSize]) {
    rawObj.id = object.isarId ?? Isar.minId;
    var dynamicSize = 0;
    final value0 = object.id;
    final _id = BinaryWriter.utf8Encoder.convert(value0);
    dynamicSize += _id.length;
    final value1 = object.title;
    final _title = BinaryWriter.utf8Encoder.convert(value1);
    dynamicSize += _title.length;
    final value2 = object.author;
    final _author = BinaryWriter.utf8Encoder.convert(value2);
    dynamicSize += _author.length;
    final value3 = object.narrator;
    final _narrator = BinaryWriter.utf8Encoder.convert(value3);
    dynamicSize += _narrator.length;
    final value4 = object.description;
    final _description = BinaryWriter.utf8Encoder.convert(value4);
    dynamicSize += _description.length;
    final value5 = object.artPath;
    final _artPath = BinaryWriter.utf8Encoder.convert(value5);
    dynamicSize += _artPath.length;
    final value6 = _IsarBookAdapter._DurationConverter.toIsar(object.duration);
    final _duration = value6;
    final value7 =
        _IsarBookAdapter._DurationConverter.toIsar(object.lastPlayedPosition);
    final _lastPlayedPosition = value7;
    final value8 = object.downloadRequested;
    final _downloadRequested = value8;
    final value9 = object.downloadCompleted;
    final _downloadCompleted = value9;
    final value10 = object.downloadFailed;
    final _downloadFailed = value10;
    final value11 = object.read;
    final _read = value11;
    final value12 = object.lastUpdate;
    final _lastUpdate = value12;
    final size = dynamicSize + 86;

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
    final writer = BinaryWriter(buffer, 86);
    writer.writeBytes(offsets[0], _id);
    writer.writeBytes(offsets[1], _title);
    writer.writeBytes(offsets[2], _author);
    writer.writeBytes(offsets[3], _narrator);
    writer.writeBytes(offsets[4], _description);
    writer.writeBytes(offsets[5], _artPath);
    writer.writeLong(offsets[6], _duration);
    writer.writeLong(offsets[7], _lastPlayedPosition);
    writer.writeBool(offsets[8], _downloadRequested);
    writer.writeBool(offsets[9], _downloadCompleted);
    writer.writeBool(offsets[10], _downloadFailed);
    writer.writeBool(offsets[11], _read);
    writer.writeDateTime(offsets[12], _lastUpdate);
    return bufferSize;
  }

  @override
  IsarBook deserialize(IsarCollection<IsarBook> collection, int id,
      BinaryReader reader, List<int> offsets) {
    final object = IsarBook(
      id,
      reader.readString(offsets[0]),
      reader.readString(offsets[1]),
      reader.readString(offsets[2]),
      reader.readString(offsets[3]),
      reader.readString(offsets[4]),
      reader.readString(offsets[5]),
      _IsarBookAdapter._DurationConverter.fromIsar(reader.readLong(offsets[6])),
      _IsarBookAdapter._DurationConverter.fromIsar(reader.readLong(offsets[7])),
      reader.readBool(offsets[8]),
      reader.readBool(offsets[9]),
      reader.readBool(offsets[10]),
      reader.readBool(offsets[11]),
      reader.readDateTimeOrNull(offsets[12]),
    );
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
        return (reader.readString(offset)) as P;
      case 3:
        return (reader.readString(offset)) as P;
      case 4:
        return (reader.readString(offset)) as P;
      case 5:
        return (reader.readString(offset)) as P;
      case 6:
        return (_IsarBookAdapter._DurationConverter.fromIsar(
            reader.readLong(offset))) as P;
      case 7:
        return (_IsarBookAdapter._DurationConverter.fromIsar(
            reader.readLong(offset))) as P;
      case 8:
        return (reader.readBool(offset)) as P;
      case 9:
        return (reader.readBool(offset)) as P;
      case 10:
        return (reader.readBool(offset)) as P;
      case 11:
        return (reader.readBool(offset)) as P;
      case 12:
        return (reader.readDateTimeOrNull(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }
}

extension IsarBookQueryWhereSort on QueryBuilder<IsarBook, IsarBook, QWhere> {
  QueryBuilder<IsarBook, IsarBook, QAfterWhere> anyIsarId() {
    return addWhereClause(WhereClause(indexName: '_id'));
  }
}

extension IsarBookQueryWhere on QueryBuilder<IsarBook, IsarBook, QWhereClause> {
  QueryBuilder<IsarBook, IsarBook, QAfterWhereClause> isarIdEqualTo(
      int? isarId) {
    return addWhereClause(WhereClause(
      indexName: '_id',
      lower: [isarId],
      includeLower: true,
      upper: [isarId],
      includeUpper: true,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterWhereClause> isarIdNotEqualTo(
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

  QueryBuilder<IsarBook, IsarBook, QAfterWhereClause> isarIdIsNull() {
    return addWhereClause(WhereClause(
      indexName: '_id',
      upper: [null],
      includeUpper: true,
      lower: [null],
      includeLower: true,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterWhereClause> isarIdIsNotNull() {
    return addWhereClause(WhereClause(
      indexName: '_id',
      lower: [null],
      includeLower: false,
    ));
  }
}

extension IsarBookQueryFilter
    on QueryBuilder<IsarBook, IsarBook, QFilterCondition> {
  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> isarIdIsNull() {
    return addFilterCondition(FilterCondition(
      type: ConditionType.isNull,
      property: 'isarId',
      value: null,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> isarIdEqualTo(
    int? value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'isarId',
      value: value,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> isarIdGreaterThan(
    int? value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      property: 'isarId',
      value: value,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> isarIdLessThan(
    int? value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      property: 'isarId',
      value: value,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> isarIdBetween(
    int? lower,
    int? upper,
  ) {
    return addFilterCondition(FilterCondition.between(
      property: 'isarId',
      lower: lower,
      upper: upper,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> idEqualTo(
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

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> idBetween(
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

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> idStartsWith(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.startsWith,
      property: 'id',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> idEndsWith(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.endsWith,
      property: 'id',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.contains,
      property: 'id',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.matches,
      property: 'id',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> titleEqualTo(
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

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> titleGreaterThan(
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

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> titleLessThan(
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

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> titleBetween(
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

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> titleStartsWith(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.startsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> titleEndsWith(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.endsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.contains,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.matches,
      property: 'title',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> authorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'author',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> authorGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      property: 'author',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> authorLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      property: 'author',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> authorBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition.between(
      property: 'author',
      lower: lower,
      upper: upper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> authorStartsWith(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.startsWith,
      property: 'author',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> authorEndsWith(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.endsWith,
      property: 'author',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> authorContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.contains,
      property: 'author',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> authorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.matches,
      property: 'author',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> narratorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'narrator',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> narratorGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      property: 'narrator',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> narratorLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      property: 'narrator',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> narratorBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition.between(
      property: 'narrator',
      lower: lower,
      upper: upper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> narratorStartsWith(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.startsWith,
      property: 'narrator',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> narratorEndsWith(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.endsWith,
      property: 'narrator',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> narratorContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.contains,
      property: 'narrator',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> narratorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.matches,
      property: 'narrator',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
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
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> descriptionLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> descriptionBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition.between(
      property: 'description',
      lower: lower,
      upper: upper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> descriptionStartsWith(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.startsWith,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> descriptionEndsWith(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.endsWith,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.contains,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.matches,
      property: 'description',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> artPathEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'artPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> artPathGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      property: 'artPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> artPathLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      property: 'artPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> artPathBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition.between(
      property: 'artPath',
      lower: lower,
      upper: upper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> artPathStartsWith(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.startsWith,
      property: 'artPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> artPathEndsWith(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.endsWith,
      property: 'artPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> artPathContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.contains,
      property: 'artPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> artPathMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.matches,
      property: 'artPath',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> durationEqualTo(
    Duration value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'duration',
      value: _IsarBookAdapter._DurationConverter.toIsar(value),
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> durationGreaterThan(
    Duration value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      property: 'duration',
      value: _IsarBookAdapter._DurationConverter.toIsar(value),
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> durationLessThan(
    Duration value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      property: 'duration',
      value: _IsarBookAdapter._DurationConverter.toIsar(value),
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> durationBetween(
    Duration lower,
    Duration upper,
  ) {
    return addFilterCondition(FilterCondition.between(
      property: 'duration',
      lower: _IsarBookAdapter._DurationConverter.toIsar(lower),
      upper: _IsarBookAdapter._DurationConverter.toIsar(upper),
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition>
      lastPlayedPositionEqualTo(
    Duration value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'lastPlayedPosition',
      value: _IsarBookAdapter._DurationConverter.toIsar(value),
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition>
      lastPlayedPositionGreaterThan(
    Duration value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      property: 'lastPlayedPosition',
      value: _IsarBookAdapter._DurationConverter.toIsar(value),
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition>
      lastPlayedPositionLessThan(
    Duration value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      property: 'lastPlayedPosition',
      value: _IsarBookAdapter._DurationConverter.toIsar(value),
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition>
      lastPlayedPositionBetween(
    Duration lower,
    Duration upper,
  ) {
    return addFilterCondition(FilterCondition.between(
      property: 'lastPlayedPosition',
      lower: _IsarBookAdapter._DurationConverter.toIsar(lower),
      upper: _IsarBookAdapter._DurationConverter.toIsar(upper),
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition>
      downloadRequestedEqualTo(
    bool value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'downloadRequested',
      value: value,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition>
      downloadCompletedEqualTo(
    bool value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'downloadCompleted',
      value: value,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> downloadFailedEqualTo(
    bool value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'downloadFailed',
      value: value,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> readEqualTo(
    bool value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'read',
      value: value,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> lastUpdateIsNull() {
    return addFilterCondition(FilterCondition(
      type: ConditionType.isNull,
      property: 'lastUpdate',
      value: null,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> lastUpdateEqualTo(
    DateTime? value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'lastUpdate',
      value: value,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> lastUpdateGreaterThan(
    DateTime? value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      property: 'lastUpdate',
      value: value,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> lastUpdateLessThan(
    DateTime? value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      property: 'lastUpdate',
      value: value,
    ));
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> lastUpdateBetween(
    DateTime? lower,
    DateTime? upper,
  ) {
    return addFilterCondition(FilterCondition.between(
      property: 'lastUpdate',
      lower: lower,
      upper: upper,
    ));
  }
}

extension IsarBookQueryWhereSortBy
    on QueryBuilder<IsarBook, IsarBook, QSortBy> {
  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByIsarId() {
    return addSortByInternal('isarId', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByIsarIdDesc() {
    return addSortByInternal('isarId', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByAuthor() {
    return addSortByInternal('author', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByAuthorDesc() {
    return addSortByInternal('author', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByNarrator() {
    return addSortByInternal('narrator', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByNarratorDesc() {
    return addSortByInternal('narrator', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByDescription() {
    return addSortByInternal('description', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByDescriptionDesc() {
    return addSortByInternal('description', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByArtPath() {
    return addSortByInternal('artPath', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByArtPathDesc() {
    return addSortByInternal('artPath', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByDuration() {
    return addSortByInternal('duration', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByDurationDesc() {
    return addSortByInternal('duration', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByLastPlayedPosition() {
    return addSortByInternal('lastPlayedPosition', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy>
      sortByLastPlayedPositionDesc() {
    return addSortByInternal('lastPlayedPosition', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByDownloadRequested() {
    return addSortByInternal('downloadRequested', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByDownloadRequestedDesc() {
    return addSortByInternal('downloadRequested', Sort.desc);
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

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByRead() {
    return addSortByInternal('read', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByReadDesc() {
    return addSortByInternal('read', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByLastUpdate() {
    return addSortByInternal('lastUpdate', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByLastUpdateDesc() {
    return addSortByInternal('lastUpdate', Sort.desc);
  }
}

extension IsarBookQueryWhereSortThenBy
    on QueryBuilder<IsarBook, IsarBook, QSortThenBy> {
  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByIsarId() {
    return addSortByInternal('isarId', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByIsarIdDesc() {
    return addSortByInternal('isarId', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByAuthor() {
    return addSortByInternal('author', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByAuthorDesc() {
    return addSortByInternal('author', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByNarrator() {
    return addSortByInternal('narrator', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByNarratorDesc() {
    return addSortByInternal('narrator', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByDescription() {
    return addSortByInternal('description', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByDescriptionDesc() {
    return addSortByInternal('description', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByArtPath() {
    return addSortByInternal('artPath', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByArtPathDesc() {
    return addSortByInternal('artPath', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByDuration() {
    return addSortByInternal('duration', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByDurationDesc() {
    return addSortByInternal('duration', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByLastPlayedPosition() {
    return addSortByInternal('lastPlayedPosition', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy>
      thenByLastPlayedPositionDesc() {
    return addSortByInternal('lastPlayedPosition', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByDownloadRequested() {
    return addSortByInternal('downloadRequested', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByDownloadRequestedDesc() {
    return addSortByInternal('downloadRequested', Sort.desc);
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

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByRead() {
    return addSortByInternal('read', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByReadDesc() {
    return addSortByInternal('read', Sort.desc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByLastUpdate() {
    return addSortByInternal('lastUpdate', Sort.asc);
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByLastUpdateDesc() {
    return addSortByInternal('lastUpdate', Sort.desc);
  }
}

extension IsarBookQueryWhereDistinct
    on QueryBuilder<IsarBook, IsarBook, QDistinct> {
  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByIsarId() {
    return addDistinctByInternal('isarId');
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('id', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('title', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByAuthor(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('author', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByNarrator(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('narrator', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('description', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByArtPath(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('artPath', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByDuration() {
    return addDistinctByInternal('duration');
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByLastPlayedPosition() {
    return addDistinctByInternal('lastPlayedPosition');
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByDownloadRequested() {
    return addDistinctByInternal('downloadRequested');
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByDownloadCompleted() {
    return addDistinctByInternal('downloadCompleted');
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByDownloadFailed() {
    return addDistinctByInternal('downloadFailed');
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByRead() {
    return addDistinctByInternal('read');
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByLastUpdate() {
    return addDistinctByInternal('lastUpdate');
  }
}

extension IsarBookQueryProperty
    on QueryBuilder<IsarBook, IsarBook, QQueryProperty> {
  QueryBuilder<IsarBook, int?, QQueryOperations> isarIdProperty() {
    return addPropertyName('isarId');
  }

  QueryBuilder<IsarBook, String, QQueryOperations> idProperty() {
    return addPropertyName('id');
  }

  QueryBuilder<IsarBook, String, QQueryOperations> titleProperty() {
    return addPropertyName('title');
  }

  QueryBuilder<IsarBook, String, QQueryOperations> authorProperty() {
    return addPropertyName('author');
  }

  QueryBuilder<IsarBook, String, QQueryOperations> narratorProperty() {
    return addPropertyName('narrator');
  }

  QueryBuilder<IsarBook, String, QQueryOperations> descriptionProperty() {
    return addPropertyName('description');
  }

  QueryBuilder<IsarBook, String, QQueryOperations> artPathProperty() {
    return addPropertyName('artPath');
  }

  QueryBuilder<IsarBook, Duration, QQueryOperations> durationProperty() {
    return addPropertyName('duration');
  }

  QueryBuilder<IsarBook, Duration, QQueryOperations>
      lastPlayedPositionProperty() {
    return addPropertyName('lastPlayedPosition');
  }

  QueryBuilder<IsarBook, bool, QQueryOperations> downloadRequestedProperty() {
    return addPropertyName('downloadRequested');
  }

  QueryBuilder<IsarBook, bool, QQueryOperations> downloadCompletedProperty() {
    return addPropertyName('downloadCompleted');
  }

  QueryBuilder<IsarBook, bool, QQueryOperations> downloadFailedProperty() {
    return addPropertyName('downloadFailed');
  }

  QueryBuilder<IsarBook, bool, QQueryOperations> readProperty() {
    return addPropertyName('read');
  }

  QueryBuilder<IsarBook, DateTime?, QQueryOperations> lastUpdateProperty() {
    return addPropertyName('lastUpdate');
  }
}
