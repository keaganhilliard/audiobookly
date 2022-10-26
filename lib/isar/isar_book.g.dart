// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_book.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetIsarBookCollection on Isar {
  IsarCollection<IsarBook> get isarBooks => this.collection();
}

const IsarBookSchema = CollectionSchema(
  name: r'IsarBook',
  id: 4437945546968760961,
  properties: {
    r'artPath': PropertySchema(
      id: 0,
      name: r'artPath',
      type: IsarType.string,
    ),
    r'author': PropertySchema(
      id: 1,
      name: r'author',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 2,
      name: r'description',
      type: IsarType.string,
    ),
    r'downloadStatus': PropertySchema(
      id: 3,
      name: r'downloadStatus',
      type: IsarType.byte,
      enumMap: _IsarBookdownloadStatusEnumValueMap,
    ),
    r'exId': PropertySchema(
      id: 4,
      name: r'exId',
      type: IsarType.string,
    ),
    r'isarDuration': PropertySchema(
      id: 5,
      name: r'isarDuration',
      type: IsarType.long,
    ),
    r'isarLastPlayedPosition': PropertySchema(
      id: 6,
      name: r'isarLastPlayedPosition',
      type: IsarType.long,
    ),
    r'isarLastUpdate': PropertySchema(
      id: 7,
      name: r'isarLastUpdate',
      type: IsarType.long,
    ),
    r'narrator': PropertySchema(
      id: 8,
      name: r'narrator',
      type: IsarType.string,
    ),
    r'read': PropertySchema(
      id: 9,
      name: r'read',
      type: IsarType.bool,
    ),
    r'title': PropertySchema(
      id: 10,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _isarBookEstimateSize,
  serialize: _isarBookSerialize,
  deserialize: _isarBookDeserialize,
  deserializeProp: _isarBookDeserializeProp,
  idName: r'id',
  indexes: {
    r'exId': IndexSchema(
      id: 2382449665185005046,
      name: r'exId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'exId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _isarBookGetId,
  getLinks: _isarBookGetLinks,
  attach: _isarBookAttach,
  version: '3.0.2',
);

int _isarBookEstimateSize(
  IsarBook object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.artPath.length * 3;
  bytesCount += 3 + object.author.length * 3;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.exId.length * 3;
  bytesCount += 3 + object.narrator.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _isarBookSerialize(
  IsarBook object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.artPath);
  writer.writeString(offsets[1], object.author);
  writer.writeString(offsets[2], object.description);
  writer.writeByte(offsets[3], object.downloadStatus.index);
  writer.writeString(offsets[4], object.exId);
  writer.writeLong(offsets[5], object.isarDuration);
  writer.writeLong(offsets[6], object.isarLastPlayedPosition);
  writer.writeLong(offsets[7], object.isarLastUpdate);
  writer.writeString(offsets[8], object.narrator);
  writer.writeBool(offsets[9], object.read);
  writer.writeString(offsets[10], object.title);
}

IsarBook _isarBookDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarBook(
    reader.readString(offsets[4]),
    reader.readString(offsets[10]),
    reader.readString(offsets[1]),
    reader.readString(offsets[8]),
    reader.readString(offsets[2]),
    reader.readString(offsets[0]),
    reader.readLong(offsets[5]),
    reader.readLong(offsets[6]),
    reader.readBool(offsets[9]),
    reader.readLongOrNull(offsets[7]),
    _IsarBookdownloadStatusValueEnumMap[reader.readByteOrNull(offsets[3])] ??
        DownloadStatus.none,
  );
  return object;
}

P _isarBookDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (_IsarBookdownloadStatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          DownloadStatus.none) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _IsarBookdownloadStatusEnumValueMap = {
  'none': 0,
  'downloading': 1,
  'failed': 2,
  'succeeded': 3,
};
const _IsarBookdownloadStatusValueEnumMap = {
  0: DownloadStatus.none,
  1: DownloadStatus.downloading,
  2: DownloadStatus.failed,
  3: DownloadStatus.succeeded,
};

Id _isarBookGetId(IsarBook object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarBookGetLinks(IsarBook object) {
  return [];
}

void _isarBookAttach(IsarCollection<dynamic> col, Id id, IsarBook object) {}

extension IsarBookByIndex on IsarCollection<IsarBook> {
  Future<IsarBook?> getByExId(String exId) {
    return getByIndex(r'exId', [exId]);
  }

  IsarBook? getByExIdSync(String exId) {
    return getByIndexSync(r'exId', [exId]);
  }

  Future<bool> deleteByExId(String exId) {
    return deleteByIndex(r'exId', [exId]);
  }

  bool deleteByExIdSync(String exId) {
    return deleteByIndexSync(r'exId', [exId]);
  }

  Future<List<IsarBook?>> getAllByExId(List<String> exIdValues) {
    final values = exIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'exId', values);
  }

  List<IsarBook?> getAllByExIdSync(List<String> exIdValues) {
    final values = exIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'exId', values);
  }

  Future<int> deleteAllByExId(List<String> exIdValues) {
    final values = exIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'exId', values);
  }

  int deleteAllByExIdSync(List<String> exIdValues) {
    final values = exIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'exId', values);
  }

  Future<Id> putByExId(IsarBook object) {
    return putByIndex(r'exId', object);
  }

  Id putByExIdSync(IsarBook object, {bool saveLinks = true}) {
    return putByIndexSync(r'exId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByExId(List<IsarBook> objects) {
    return putAllByIndex(r'exId', objects);
  }

  List<Id> putAllByExIdSync(List<IsarBook> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'exId', objects, saveLinks: saveLinks);
  }
}

extension IsarBookQueryWhereSort on QueryBuilder<IsarBook, IsarBook, QWhere> {
  QueryBuilder<IsarBook, IsarBook, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarBookQueryWhere on QueryBuilder<IsarBook, IsarBook, QWhereClause> {
  QueryBuilder<IsarBook, IsarBook, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterWhereClause> exIdEqualTo(String exId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'exId',
        value: [exId],
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterWhereClause> exIdNotEqualTo(
      String exId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'exId',
              lower: [],
              upper: [exId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'exId',
              lower: [exId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'exId',
              lower: [exId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'exId',
              lower: [],
              upper: [exId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension IsarBookQueryFilter
    on QueryBuilder<IsarBook, IsarBook, QFilterCondition> {
  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> artPathEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'artPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> artPathGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'artPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> artPathLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'artPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> artPathBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'artPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> artPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'artPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> artPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'artPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> artPathContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'artPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> artPathMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'artPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> artPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'artPath',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> artPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'artPath',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> authorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> authorGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> authorLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> authorBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'author',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> authorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> authorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> authorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> authorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'author',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> authorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'author',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> authorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'author',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> downloadStatusEqualTo(
      DownloadStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition>
      downloadStatusGreaterThan(
    DownloadStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'downloadStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition>
      downloadStatusLessThan(
    DownloadStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'downloadStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> downloadStatusBetween(
    DownloadStatus lower,
    DownloadStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'downloadStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> exIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> exIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'exId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> exIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'exId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> exIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'exId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> exIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'exId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> exIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'exId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> exIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'exId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> exIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'exId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> exIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> exIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'exId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> isarDurationEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition>
      isarDurationGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> isarDurationLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> isarDurationBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarDuration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition>
      isarLastPlayedPositionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarLastPlayedPosition',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition>
      isarLastPlayedPositionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarLastPlayedPosition',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition>
      isarLastPlayedPositionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarLastPlayedPosition',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition>
      isarLastPlayedPositionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarLastPlayedPosition',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition>
      isarLastUpdateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isarLastUpdate',
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition>
      isarLastUpdateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isarLastUpdate',
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> isarLastUpdateEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarLastUpdate',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition>
      isarLastUpdateGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarLastUpdate',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition>
      isarLastUpdateLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarLastUpdate',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> isarLastUpdateBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarLastUpdate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> narratorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'narrator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> narratorGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'narrator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> narratorLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'narrator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> narratorBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'narrator',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> narratorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'narrator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> narratorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'narrator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> narratorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'narrator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> narratorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'narrator',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> narratorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'narrator',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> narratorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'narrator',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> readEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'read',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension IsarBookQueryObject
    on QueryBuilder<IsarBook, IsarBook, QFilterCondition> {}

extension IsarBookQueryLinks
    on QueryBuilder<IsarBook, IsarBook, QFilterCondition> {}

extension IsarBookQuerySortBy on QueryBuilder<IsarBook, IsarBook, QSortBy> {
  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByArtPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artPath', Sort.asc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByArtPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artPath', Sort.desc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByAuthor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.asc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByAuthorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.desc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByDownloadStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadStatus', Sort.asc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByDownloadStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadStatus', Sort.desc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByExId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exId', Sort.asc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByExIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exId', Sort.desc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByIsarDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarDuration', Sort.asc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByIsarDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarDuration', Sort.desc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy>
      sortByIsarLastPlayedPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarLastPlayedPosition', Sort.asc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy>
      sortByIsarLastPlayedPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarLastPlayedPosition', Sort.desc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByIsarLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarLastUpdate', Sort.asc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByIsarLastUpdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarLastUpdate', Sort.desc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByNarrator() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'narrator', Sort.asc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByNarratorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'narrator', Sort.desc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByRead() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'read', Sort.asc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByReadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'read', Sort.desc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension IsarBookQuerySortThenBy
    on QueryBuilder<IsarBook, IsarBook, QSortThenBy> {
  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByArtPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artPath', Sort.asc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByArtPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artPath', Sort.desc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByAuthor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.asc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByAuthorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.desc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByDownloadStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadStatus', Sort.asc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByDownloadStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadStatus', Sort.desc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByExId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exId', Sort.asc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByExIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exId', Sort.desc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByIsarDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarDuration', Sort.asc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByIsarDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarDuration', Sort.desc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy>
      thenByIsarLastPlayedPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarLastPlayedPosition', Sort.asc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy>
      thenByIsarLastPlayedPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarLastPlayedPosition', Sort.desc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByIsarLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarLastUpdate', Sort.asc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByIsarLastUpdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarLastUpdate', Sort.desc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByNarrator() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'narrator', Sort.asc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByNarratorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'narrator', Sort.desc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByRead() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'read', Sort.asc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByReadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'read', Sort.desc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension IsarBookQueryWhereDistinct
    on QueryBuilder<IsarBook, IsarBook, QDistinct> {
  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByArtPath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'artPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByAuthor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'author', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByDownloadStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'downloadStatus');
    });
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByExId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByIsarDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isarDuration');
    });
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct>
      distinctByIsarLastPlayedPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isarLastPlayedPosition');
    });
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByIsarLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isarLastUpdate');
    });
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByNarrator(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'narrator', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByRead() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'read');
    });
  }

  QueryBuilder<IsarBook, IsarBook, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension IsarBookQueryProperty
    on QueryBuilder<IsarBook, IsarBook, QQueryProperty> {
  QueryBuilder<IsarBook, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarBook, String, QQueryOperations> artPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'artPath');
    });
  }

  QueryBuilder<IsarBook, String, QQueryOperations> authorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'author');
    });
  }

  QueryBuilder<IsarBook, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<IsarBook, DownloadStatus, QQueryOperations>
      downloadStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'downloadStatus');
    });
  }

  QueryBuilder<IsarBook, String, QQueryOperations> exIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exId');
    });
  }

  QueryBuilder<IsarBook, int, QQueryOperations> isarDurationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarDuration');
    });
  }

  QueryBuilder<IsarBook, int, QQueryOperations>
      isarLastPlayedPositionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarLastPlayedPosition');
    });
  }

  QueryBuilder<IsarBook, int?, QQueryOperations> isarLastUpdateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarLastUpdate');
    });
  }

  QueryBuilder<IsarBook, String, QQueryOperations> narratorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'narrator');
    });
  }

  QueryBuilder<IsarBook, bool, QQueryOperations> readProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'read');
    });
  }

  QueryBuilder<IsarBook, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}
