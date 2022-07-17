// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_chapter.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable, no_leading_underscores_for_local_identifiers

extension GetIsarChapterCollection on Isar {
  IsarCollection<IsarChapter> get isarChapters => getCollection();
}

const IsarChapterSchema = CollectionSchema(
  name: 'IsarChapter',
  schema:
      '{"name":"IsarChapter","idName":"isarId","properties":[{"name":"bookId","type":"String"},{"name":"end","type":"Double"},{"name":"id","type":"String"},{"name":"start","type":"Double"},{"name":"title","type":"String"}],"indexes":[],"links":[]}',
  idName: 'isarId',
  propertyIds: {'bookId': 0, 'end': 1, 'id': 2, 'start': 3, 'title': 4},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _isarChapterGetId,
  setId: _isarChapterSetId,
  getLinks: _isarChapterGetLinks,
  attachLinks: _isarChapterAttachLinks,
  serializeNative: _isarChapterSerializeNative,
  deserializeNative: _isarChapterDeserializeNative,
  deserializePropNative: _isarChapterDeserializePropNative,
  serializeWeb: _isarChapterSerializeWeb,
  deserializeWeb: _isarChapterDeserializeWeb,
  deserializePropWeb: _isarChapterDeserializePropWeb,
  version: 4,
);

int? _isarChapterGetId(IsarChapter object) {
  if (object.isarId == Isar.autoIncrement) {
    return null;
  } else {
    return object.isarId;
  }
}

void _isarChapterSetId(IsarChapter object, int id) {
  object.isarId = id;
}

List<IsarLinkBase> _isarChapterGetLinks(IsarChapter object) {
  return [];
}

void _isarChapterSerializeNative(
    IsarCollection<IsarChapter> collection,
    IsarCObject cObj,
    IsarChapter object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.bookId;
  final _bookId = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_bookId.length) as int;
  final value1 = object.end;
  final _end = value1;
  final value2 = object.id;
  final _id = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_id.length) as int;
  final value3 = object.start;
  final _start = value3;
  final value4 = object.title;
  final _title = IsarBinaryWriter.utf8Encoder.convert(value4);
  dynamicSize += (_title.length) as int;
  final size = staticSize + dynamicSize;

  cObj.buffer = alloc(size);
  cObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _bookId);
  writer.writeDouble(offsets[1], _end);
  writer.writeBytes(offsets[2], _id);
  writer.writeDouble(offsets[3], _start);
  writer.writeBytes(offsets[4], _title);
}

IsarChapter _isarChapterDeserializeNative(
    IsarCollection<IsarChapter> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = IsarChapter(
    bookId: reader.readString(offsets[0]),
    end: reader.readDouble(offsets[1]),
    id: reader.readString(offsets[2]),
    start: reader.readDouble(offsets[3]),
    title: reader.readString(offsets[4]),
  );
  object.isarId = id;
  return object;
}

P _isarChapterDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _isarChapterSerializeWeb(
    IsarCollection<IsarChapter> collection, IsarChapter object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'bookId', object.bookId);
  IsarNative.jsObjectSet(jsObj, 'end', object.end);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'isarId', object.isarId);
  IsarNative.jsObjectSet(jsObj, 'start', object.start);
  IsarNative.jsObjectSet(jsObj, 'title', object.title);
  return jsObj;
}

IsarChapter _isarChapterDeserializeWeb(
    IsarCollection<IsarChapter> collection, dynamic jsObj) {
  final object = IsarChapter(
    bookId: IsarNative.jsObjectGet(jsObj, 'bookId') ?? '',
    end: IsarNative.jsObjectGet(jsObj, 'end') ?? double.negativeInfinity,
    id: IsarNative.jsObjectGet(jsObj, 'id') ?? '',
    start: IsarNative.jsObjectGet(jsObj, 'start') ?? double.negativeInfinity,
    title: IsarNative.jsObjectGet(jsObj, 'title') ?? '',
  );
  object.isarId = IsarNative.jsObjectGet(jsObj, 'isarId');
  return object;
}

P _isarChapterDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'bookId':
      return (IsarNative.jsObjectGet(jsObj, 'bookId') ?? '') as P;
    case 'end':
      return (IsarNative.jsObjectGet(jsObj, 'end') ?? double.negativeInfinity)
          as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? '') as P;
    case 'isarId':
      return (IsarNative.jsObjectGet(jsObj, 'isarId')) as P;
    case 'start':
      return (IsarNative.jsObjectGet(jsObj, 'start') ?? double.negativeInfinity)
          as P;
    case 'title':
      return (IsarNative.jsObjectGet(jsObj, 'title') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _isarChapterAttachLinks(IsarCollection col, int id, IsarChapter object) {}

extension IsarChapterQueryWhereSort
    on QueryBuilder<IsarChapter, IsarChapter, QWhere> {
  QueryBuilder<IsarChapter, IsarChapter, QAfterWhere> anyIsarId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension IsarChapterQueryWhere
    on QueryBuilder<IsarChapter, IsarChapter, QWhereClause> {
  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause> isarIdEqualTo(
      int isarId) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: isarId,
      includeLower: true,
      upper: isarId,
      includeUpper: true,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause> isarIdNotEqualTo(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause> isarIdGreaterThan(
      int isarId,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: isarId, includeLower: include),
    );
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause> isarIdLessThan(
      int isarId,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: isarId, includeUpper: include),
    );
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause> isarIdBetween(
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

extension IsarChapterQueryFilter
    on QueryBuilder<IsarChapter, IsarChapter, QFilterCondition> {
  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> bookIdEqualTo(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
      bookIdGreaterThan(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> bookIdLessThan(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> bookIdBetween(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
      bookIdStartsWith(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> bookIdEndsWith(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> bookIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'bookId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> bookIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'bookId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> endGreaterThan(
      double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'end',
      value: value,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> endLessThan(
      double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'end',
      value: value,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> endBetween(
      double lower, double upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'end',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> idEqualTo(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> idBetween(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> idStartsWith(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> idEndsWith(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'id',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'id',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> isarIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'isarId',
      value: null,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> isarIdEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'isarId',
      value: value,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
      isarIdGreaterThan(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> isarIdLessThan(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> isarIdBetween(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
      startGreaterThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'start',
      value: value,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> startLessThan(
      double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'start',
      value: value,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> startBetween(
      double lower, double upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'start',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> titleEqualTo(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
      titleGreaterThan(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> titleLessThan(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> titleBetween(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> titleStartsWith(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> titleEndsWith(
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> titleMatches(
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

extension IsarChapterQueryLinks
    on QueryBuilder<IsarChapter, IsarChapter, QFilterCondition> {}

extension IsarChapterQueryWhereSortBy
    on QueryBuilder<IsarChapter, IsarChapter, QSortBy> {
  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> sortByBookId() {
    return addSortByInternal('bookId', Sort.asc);
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> sortByBookIdDesc() {
    return addSortByInternal('bookId', Sort.desc);
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> sortByIsarId() {
    return addSortByInternal('isarId', Sort.asc);
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> sortByIsarIdDesc() {
    return addSortByInternal('isarId', Sort.desc);
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
}

extension IsarChapterQueryWhereSortThenBy
    on QueryBuilder<IsarChapter, IsarChapter, QSortThenBy> {
  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> thenByBookId() {
    return addSortByInternal('bookId', Sort.asc);
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> thenByBookIdDesc() {
    return addSortByInternal('bookId', Sort.desc);
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

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> thenByIsarId() {
    return addSortByInternal('isarId', Sort.asc);
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> thenByIsarIdDesc() {
    return addSortByInternal('isarId', Sort.desc);
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
}

extension IsarChapterQueryWhereDistinct
    on QueryBuilder<IsarChapter, IsarChapter, QDistinct> {
  QueryBuilder<IsarChapter, IsarChapter, QDistinct> distinctByBookId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('bookId', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarChapter, IsarChapter, QDistinct> distinctByEnd() {
    return addDistinctByInternal('end');
  }

  QueryBuilder<IsarChapter, IsarChapter, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('id', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarChapter, IsarChapter, QDistinct> distinctByIsarId() {
    return addDistinctByInternal('isarId');
  }

  QueryBuilder<IsarChapter, IsarChapter, QDistinct> distinctByStart() {
    return addDistinctByInternal('start');
  }

  QueryBuilder<IsarChapter, IsarChapter, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('title', caseSensitive: caseSensitive);
  }
}

extension IsarChapterQueryProperty
    on QueryBuilder<IsarChapter, IsarChapter, QQueryProperty> {
  QueryBuilder<IsarChapter, String, QQueryOperations> bookIdProperty() {
    return addPropertyNameInternal('bookId');
  }

  QueryBuilder<IsarChapter, double, QQueryOperations> endProperty() {
    return addPropertyNameInternal('end');
  }

  QueryBuilder<IsarChapter, String, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<IsarChapter, int?, QQueryOperations> isarIdProperty() {
    return addPropertyNameInternal('isarId');
  }

  QueryBuilder<IsarChapter, double, QQueryOperations> startProperty() {
    return addPropertyNameInternal('start');
  }

  QueryBuilder<IsarChapter, String, QQueryOperations> titleProperty() {
    return addPropertyNameInternal('title');
  }
}
