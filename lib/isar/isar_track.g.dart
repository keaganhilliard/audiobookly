// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_track.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, avoid_js_rounded_ints, prefer_final_locals

extension GetIsarTrackCollection on Isar {
  IsarCollection<IsarTrack> get isarTracks => this.collection();
}

const IsarTrackSchema = CollectionSchema(
  name: r'IsarTrack',
  id: 4152992676124368771,
  properties: {
    r'bookId': PropertySchema(
      id: 0,
      name: r'bookId',
      type: IsarType.string,
    ),
    r'downloadPath': PropertySchema(
      id: 1,
      name: r'downloadPath',
      type: IsarType.string,
    ),
    r'downloadProgress': PropertySchema(
      id: 2,
      name: r'downloadProgress',
      type: IsarType.double,
    ),
    r'downloadTaskId': PropertySchema(
      id: 3,
      name: r'downloadTaskId',
      type: IsarType.string,
    ),
    r'downloadTaskStatus': PropertySchema(
      id: 4,
      name: r'downloadTaskStatus',
      type: IsarType.long,
    ),
    r'id': PropertySchema(
      id: 5,
      name: r'id',
      type: IsarType.string,
    ),
    r'isDownloaded': PropertySchema(
      id: 6,
      name: r'isDownloaded',
      type: IsarType.bool,
    ),
    r'isarDuration': PropertySchema(
      id: 7,
      name: r'isarDuration',
      type: IsarType.long,
    ),
    r'title': PropertySchema(
      id: 8,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _isarTrackEstimateSize,
  serializeNative: _isarTrackSerializeNative,
  deserializeNative: _isarTrackDeserializeNative,
  deserializePropNative: _isarTrackDeserializePropNative,
  serializeWeb: _isarTrackSerializeWeb,
  deserializeWeb: _isarTrackDeserializeWeb,
  deserializePropWeb: _isarTrackDeserializePropWeb,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _isarTrackGetId,
  getLinks: _isarTrackGetLinks,
  attach: _isarTrackAttach,
  version: 5,
);

int _isarTrackEstimateSize(
  IsarTrack object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.bookId.length * 3;
  bytesCount += 3 + object.downloadPath.length * 3;
  bytesCount += 3 + object.downloadTaskId.length * 3;
  bytesCount += 3 + object.id.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

int _isarTrackSerializeNative(
  IsarTrack object,
  IsarBinaryWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.bookId);
  writer.writeString(offsets[1], object.downloadPath);
  writer.writeDouble(offsets[2], object.downloadProgress);
  writer.writeString(offsets[3], object.downloadTaskId);
  writer.writeLong(offsets[4], object.downloadTaskStatus);
  writer.writeString(offsets[5], object.id);
  writer.writeBool(offsets[6], object.isDownloaded);
  writer.writeLong(offsets[7], object.isarDuration);
  writer.writeString(offsets[8], object.title);
  return writer.usedBytes;
}

IsarTrack _isarTrackDeserializeNative(
  int id,
  IsarBinaryReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarTrack(
    reader.readString(offsets[5]),
    reader.readString(offsets[8]),
    reader.readLong(offsets[7]),
    reader.readDouble(offsets[2]),
    reader.readBool(offsets[6]),
    reader.readString(offsets[1]),
    reader.readString(offsets[0]),
    reader.readString(offsets[3]),
    reader.readLong(offsets[4]),
    id,
  );
  return object;
}

P _isarTrackDeserializePropNative<P>(
  Id id,
  IsarBinaryReader reader,
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
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Object _isarTrackSerializeWeb(
    IsarCollection<IsarTrack> collection, IsarTrack object) {
  /*final jsObj = IsarNative.newJsObject();*/ throw UnimplementedError();
}

IsarTrack _isarTrackDeserializeWeb(
    IsarCollection<IsarTrack> collection, Object jsObj) {
  /*final object = IsarTrack(IsarNative.jsObjectGet(jsObj, r'id') ?? '',IsarNative.jsObjectGet(jsObj, r'title') ?? '',IsarNative.jsObjectGet(jsObj, r'isarDuration') ?? (double.negativeInfinity as int),IsarNative.jsObjectGet(jsObj, r'downloadProgress') ?? double.negativeInfinity,IsarNative.jsObjectGet(jsObj, r'isDownloaded') ?? false,IsarNative.jsObjectGet(jsObj, r'downloadPath') ?? '',IsarNative.jsObjectGet(jsObj, r'bookId') ?? '',IsarNative.jsObjectGet(jsObj, r'downloadTaskId') ?? '',IsarNative.jsObjectGet(jsObj, r'downloadTaskStatus') ?? (double.negativeInfinity as int),IsarNative.jsObjectGet(jsObj, r'isarId') ,);*/
  //return object;
  throw UnimplementedError();
}

P _isarTrackDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    default:
      throw IsarError('Illegal propertyName');
  }
}

int? _isarTrackGetId(IsarTrack object) {
  if (object.isarId == Isar.autoIncrement) {
    return null;
  } else {
    return object.isarId;
  }
}

List<IsarLinkBase<dynamic>> _isarTrackGetLinks(IsarTrack object) {
  return [];
}

void _isarTrackAttach(IsarCollection<dynamic> col, Id id, IsarTrack object) {
  object.isarId = id;
}

extension IsarTrackQueryWhereSort
    on QueryBuilder<IsarTrack, IsarTrack, QWhere> {
  QueryBuilder<IsarTrack, IsarTrack, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarTrackQueryWhere
    on QueryBuilder<IsarTrack, IsarTrack, QWhereClause> {
  QueryBuilder<IsarTrack, IsarTrack, QAfterWhereClause> isarIdEqualTo(
      int isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterWhereClause> isarIdNotEqualTo(
      int isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterWhereClause> isarIdGreaterThan(
      int isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterWhereClause> isarIdLessThan(
      int isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterWhereClause> isarIdBetween(
    int lowerIsarId,
    int upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarTrackQueryFilter
    on QueryBuilder<IsarTrack, IsarTrack, QFilterCondition> {
  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> bookIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> bookIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bookId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> bookIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bookId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> bookIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bookId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> bookIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bookId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> bookIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bookId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> bookIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bookId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> bookIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bookId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> downloadPathEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadPathGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'downloadPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadPathLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'downloadPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> downloadPathBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'downloadPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'downloadPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'downloadPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'downloadPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> downloadPathMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'downloadPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadProgressEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadProgress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadProgressGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'downloadProgress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadProgressLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'downloadProgress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadProgressBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'downloadProgress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadTaskIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadTaskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadTaskIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'downloadTaskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadTaskIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'downloadTaskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadTaskIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'downloadTaskId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadTaskIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'downloadTaskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadTaskIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'downloadTaskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadTaskIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'downloadTaskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadTaskIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'downloadTaskId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadTaskStatusEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadTaskStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadTaskStatusGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'downloadTaskStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadTaskStatusLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'downloadTaskStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      downloadTaskStatusBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'downloadTaskStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> isDownloadedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDownloaded',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> isarDurationEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
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

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition>
      isarDurationLessThan(
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

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> isarDurationBetween(
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

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> isarIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isarId',
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> isarIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query
          .copyWith(filterNot: !query.filterNot)
          .addFilterCondition(const FilterCondition.isNull(
            property: r'isarId',
          ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> isarIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> isarIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> isarIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> isarIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> titleEqualTo(
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

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> titleGreaterThan(
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

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> titleLessThan(
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

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> titleBetween(
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

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> titleStartsWith(
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

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> titleEndsWith(
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

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> titleContains(
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

  QueryBuilder<IsarTrack, IsarTrack, QAfterFilterCondition> titleMatches(
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
}

extension IsarTrackQueryObject
    on QueryBuilder<IsarTrack, IsarTrack, QFilterCondition> {}

extension IsarTrackQueryLinks
    on QueryBuilder<IsarTrack, IsarTrack, QFilterCondition> {}

extension IsarTrackQuerySortBy on QueryBuilder<IsarTrack, IsarTrack, QSortBy> {
  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByBookId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.asc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByBookIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.desc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByDownloadPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadPath', Sort.asc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByDownloadPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadPath', Sort.desc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByDownloadProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadProgress', Sort.asc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy>
      sortByDownloadProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadProgress', Sort.desc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByDownloadTaskId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadTaskId', Sort.asc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByDownloadTaskIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadTaskId', Sort.desc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByDownloadTaskStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadTaskStatus', Sort.asc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy>
      sortByDownloadTaskStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadTaskStatus', Sort.desc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByIsDownloaded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDownloaded', Sort.asc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByIsDownloadedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDownloaded', Sort.desc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByIsarDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarDuration', Sort.asc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByIsarDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarDuration', Sort.desc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension IsarTrackQuerySortThenBy
    on QueryBuilder<IsarTrack, IsarTrack, QSortThenBy> {
  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByBookId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.asc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByBookIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.desc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByDownloadPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadPath', Sort.asc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByDownloadPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadPath', Sort.desc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByDownloadProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadProgress', Sort.asc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy>
      thenByDownloadProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadProgress', Sort.desc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByDownloadTaskId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadTaskId', Sort.asc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByDownloadTaskIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadTaskId', Sort.desc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByDownloadTaskStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadTaskStatus', Sort.asc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy>
      thenByDownloadTaskStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadTaskStatus', Sort.desc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByIsDownloaded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDownloaded', Sort.asc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByIsDownloadedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDownloaded', Sort.desc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByIsarDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarDuration', Sort.asc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByIsarDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarDuration', Sort.desc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension IsarTrackQueryWhereDistinct
    on QueryBuilder<IsarTrack, IsarTrack, QDistinct> {
  QueryBuilder<IsarTrack, IsarTrack, QDistinct> distinctByBookId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QDistinct> distinctByDownloadPath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'downloadPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QDistinct> distinctByDownloadProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'downloadProgress');
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QDistinct> distinctByDownloadTaskId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'downloadTaskId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QDistinct> distinctByDownloadTaskStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'downloadTaskStatus');
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QDistinct> distinctByIsDownloaded() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDownloaded');
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QDistinct> distinctByIsarDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isarDuration');
    });
  }

  QueryBuilder<IsarTrack, IsarTrack, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension IsarTrackQueryProperty
    on QueryBuilder<IsarTrack, IsarTrack, QQueryProperty> {
  QueryBuilder<IsarTrack, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<IsarTrack, String, QQueryOperations> bookIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookId');
    });
  }

  QueryBuilder<IsarTrack, String, QQueryOperations> downloadPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'downloadPath');
    });
  }

  QueryBuilder<IsarTrack, double, QQueryOperations> downloadProgressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'downloadProgress');
    });
  }

  QueryBuilder<IsarTrack, String, QQueryOperations> downloadTaskIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'downloadTaskId');
    });
  }

  QueryBuilder<IsarTrack, int, QQueryOperations> downloadTaskStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'downloadTaskStatus');
    });
  }

  QueryBuilder<IsarTrack, String, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarTrack, bool, QQueryOperations> isDownloadedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDownloaded');
    });
  }

  QueryBuilder<IsarTrack, int, QQueryOperations> isarDurationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarDuration');
    });
  }

  QueryBuilder<IsarTrack, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}
