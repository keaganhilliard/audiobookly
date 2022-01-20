// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_chapter.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, invalid_use_of_protected_member

extension GetIsarChapterCollection on Isar {
  IsarCollection<IsarChapter> get isarChapters {
    return getCollection('IsarChapter');
  }
}

final IsarChapterSchema = CollectionSchema(
  name: 'IsarChapter',
  schema:
      '{"name":"IsarChapter","properties":[{"name":"end","type":"Double"},{"name":"id","type":"String"},{"name":"start","type":"Double"},{"name":"title","type":"String"},{"name":"bookId","type":"String"}],"indexes":[],"links":[]}',
  adapter: const _IsarChapterAdapter(),
  idName: 'isarId',
  propertyIds: {'end': 0, 'id': 1, 'start': 2, 'title': 3, 'bookId': 4},
  indexIds: {},
  indexTypes: {},
  linkIds: {},
  backlinkIds: {},
  linkedCollections: [],
  getId: (obj) => obj.isarId,
  version: 0,
);

class _IsarChapterAdapter extends IsarTypeAdapter<IsarChapter> {
  const _IsarChapterAdapter();

  @override
  int serialize(IsarCollection<IsarChapter> collection, RawObject rawObj,
      IsarChapter object, List<int> offsets,
      [int? existingBufferSize]) {
    rawObj.id = object.isarId ?? Isar.minId;
    var dynamicSize = 0;
    final value0 = object.end;
    final _end = value0;
    final value1 = object.id;
    final _id = BinaryWriter.utf8Encoder.convert(value1);
    dynamicSize += _id.length;
    final value2 = object.start;
    final _start = value2;
    final value3 = object.title;
    final _title = BinaryWriter.utf8Encoder.convert(value3);
    dynamicSize += _title.length;
    final value4 = object.bookId;
    final _bookId = BinaryWriter.utf8Encoder.convert(value4);
    dynamicSize += _bookId.length;
    final size = dynamicSize + 50;

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
    final writer = BinaryWriter(buffer, 50);
    writer.writeDouble(offsets[0], _end);
    writer.writeBytes(offsets[1], _id);
    writer.writeDouble(offsets[2], _start);
    writer.writeBytes(offsets[3], _title);
    writer.writeBytes(offsets[4], _bookId);
    return bufferSize;
  }

  @override
  IsarChapter deserialize(IsarCollection<IsarChapter> collection, int id,
      BinaryReader reader, List<int> offsets) {
    final object = IsarChapter(
      end: reader.readDouble(offsets[0]),
      id: reader.readString(offsets[1]),
      start: reader.readDouble(offsets[2]),
      title: reader.readString(offsets[3]),
      bookId: reader.readString(offsets[4]),
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
        return (reader.readDouble(offset)) as P;
      case 1:
        return (reader.readString(offset)) as P;
      case 2:
        return (reader.readDouble(offset)) as P;
      case 3:
        return (reader.readString(offset)) as P;
      case 4:
        return (reader.readString(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }
}

extension IsarChapterQueryWhereSort
    on QueryBuilder<IsarChapter, IsarChapter, QWhere> {
  QueryBuilder<IsarChapter, IsarChapter, QAfterWhere> anyIsarId() {
    return addWhereClause(WhereClause(indexName: '_id'));
  }
}

extension IsarChapterQueryWhere
    on QueryBuilder<IsarChapter, IsarChapter, QWhereClause> {
  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause> isarIdEqualTo(
      int? isarId) {
    return addWhereClause(WhereClause(
      indexName: '_id',
      lower: [isarId],
      includeLower: true,
      upper: [isarId],
      includeUpper: true,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause> isarIdNotEqualTo(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause> isarIdIsNull() {
    return addWhereClause(WhereClause(
      indexName: '_id',
      upper: [null],
      includeUpper: true,
      lower: [null],
      includeLower: true,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause> isarIdIsNotNull() {
    return addWhereClause(WhereClause(
      indexName: '_id',
      lower: [null],
      includeLower: false,
    ));
  }
}

extension IsarChapterQueryFilter
    on QueryBuilder<IsarChapter, IsarChapter, QFilterCondition> {
  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> isarIdIsNull() {
    return addFilterCondition(FilterCondition(
      type: ConditionType.isNull,
      property: 'isarId',
      value: null,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> isarIdEqualTo(
    int? value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'isarId',
      value: value,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
      isarIdGreaterThan(
    int? value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      property: 'isarId',
      value: value,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> isarIdLessThan(
    int? value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      property: 'isarId',
      value: value,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> isarIdBetween(
    int? lower,
    int? upper,
  ) {
    return addFilterCondition(FilterCondition.between(
      property: 'isarId',
      lower: lower,
      upper: upper,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> endGreaterThan(
    double value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      property: 'end',
      value: value,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> endLessThan(
    double value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      property: 'end',
      value: value,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> endBetween(
    double lower,
    double upper,
  ) {
    return addFilterCondition(FilterCondition.between(
      property: 'end',
      lower: lower,
      upper: upper,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> idEqualTo(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> idBetween(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> idStartsWith(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.startsWith,
      property: 'id',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> idEndsWith(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.endsWith,
      property: 'id',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.contains,
      property: 'id',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.matches,
      property: 'id',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
      startGreaterThan(
    double value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      property: 'start',
      value: value,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> startLessThan(
    double value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      property: 'start',
      value: value,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> startBetween(
    double lower,
    double upper,
  ) {
    return addFilterCondition(FilterCondition.between(
      property: 'start',
      lower: lower,
      upper: upper,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> titleEqualTo(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
      titleGreaterThan(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> titleLessThan(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> titleBetween(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> titleStartsWith(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.startsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> titleEndsWith(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.endsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.contains,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.matches,
      property: 'title',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> bookIdEqualTo(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
      bookIdGreaterThan(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> bookIdLessThan(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> bookIdBetween(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
      bookIdStartsWith(String value, {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.startsWith,
      property: 'bookId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> bookIdEndsWith(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.endsWith,
      property: 'bookId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> bookIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.contains,
      property: 'bookId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> bookIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.matches,
      property: 'bookId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension IsarChapterQueryWhereSortBy
    on QueryBuilder<IsarChapter, IsarChapter, QSortBy> {
  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> sortByIsarId() {
    return addSortByInternal('isarId', Sort.asc);
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> sortByIsarIdDesc() {
    return addSortByInternal('isarId', Sort.desc);
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> sortByEnd() {
    return addSortByInternal('end', Sort.asc);
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> sortByEndDesc() {
    return addSortByInternal('end', Sort.desc);
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> sortByStart() {
    return addSortByInternal('start', Sort.asc);
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> sortByStartDesc() {
    return addSortByInternal('start', Sort.desc);
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> sortByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> sortByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> sortByBookId() {
    return addSortByInternal('bookId', Sort.asc);
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> sortByBookIdDesc() {
    return addSortByInternal('bookId', Sort.desc);
  }
}

extension IsarChapterQueryWhereSortThenBy
    on QueryBuilder<IsarChapter, IsarChapter, QSortThenBy> {
  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> thenByIsarId() {
    return addSortByInternal('isarId', Sort.asc);
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> thenByIsarIdDesc() {
    return addSortByInternal('isarId', Sort.desc);
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> thenByEnd() {
    return addSortByInternal('end', Sort.asc);
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> thenByEndDesc() {
    return addSortByInternal('end', Sort.desc);
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> thenByStart() {
    return addSortByInternal('start', Sort.asc);
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> thenByStartDesc() {
    return addSortByInternal('start', Sort.desc);
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> thenByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> thenByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> thenByBookId() {
    return addSortByInternal('bookId', Sort.asc);
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> thenByBookIdDesc() {
    return addSortByInternal('bookId', Sort.desc);
  }
}

extension IsarChapterQueryWhereDistinct
    on QueryBuilder<IsarChapter, IsarChapter, QDistinct> {
  QueryBuilder<IsarChapter, IsarChapter, QDistinct> distinctByIsarId() {
    return addDistinctByInternal('isarId');
  }

  QueryBuilder<IsarChapter, IsarChapter, QDistinct> distinctByEnd() {
    return addDistinctByInternal('end');
  }

  QueryBuilder<IsarChapter, IsarChapter, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('id', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarChapter, IsarChapter, QDistinct> distinctByStart() {
    return addDistinctByInternal('start');
  }

  QueryBuilder<IsarChapter, IsarChapter, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('title', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarChapter, IsarChapter, QDistinct> distinctByBookId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('bookId', caseSensitive: caseSensitive);
  }
}

extension IsarChapterQueryProperty
    on QueryBuilder<IsarChapter, IsarChapter, QQueryProperty> {
  QueryBuilder<IsarChapter, int?, QQueryOperations> isarIdProperty() {
    return addPropertyName('isarId');
  }

  QueryBuilder<IsarChapter, double, QQueryOperations> endProperty() {
    return addPropertyName('end');
  }

  QueryBuilder<IsarChapter, String, QQueryOperations> idProperty() {
    return addPropertyName('id');
  }

  QueryBuilder<IsarChapter, double, QQueryOperations> startProperty() {
    return addPropertyName('start');
  }

  QueryBuilder<IsarChapter, String, QQueryOperations> titleProperty() {
    return addPropertyName('title');
  }

  QueryBuilder<IsarChapter, String, QQueryOperations> bookIdProperty() {
    return addPropertyName('bookId');
  }
}
