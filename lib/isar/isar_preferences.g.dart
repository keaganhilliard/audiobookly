// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_preferences.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetIsarPreferencesCollection on Isar {
  IsarCollection<IsarPreferences> get isarPreferences => this.collection();
}

const IsarPreferencesSchema = CollectionSchema(
  name: r'IsarPreferences',
  id: -2673629058184405757,
  properties: {
    r'baseUrl': PropertySchema(
      id: 0,
      name: r'baseUrl',
      type: IsarType.string,
    ),
    r'fastForwardInterval': PropertySchema(
      id: 1,
      name: r'fastForwardInterval',
      type: IsarType.double,
    ),
    r'libraryId': PropertySchema(
      id: 2,
      name: r'libraryId',
      type: IsarType.string,
    ),
    r'libraryLabel': PropertySchema(
      id: 3,
      name: r'libraryLabel',
      type: IsarType.string,
    ),
    r'playbackSpeed': PropertySchema(
      id: 4,
      name: r'playbackSpeed',
      type: IsarType.double,
    ),
    r'rewindInterval': PropertySchema(
      id: 5,
      name: r'rewindInterval',
      type: IsarType.double,
    ),
    r'serverId': PropertySchema(
      id: 6,
      name: r'serverId',
      type: IsarType.string,
    ),
    r'serverType': PropertySchema(
      id: 7,
      name: r'serverType',
      type: IsarType.byte,
      enumMap: _IsarPreferencesserverTypeEnumValueMap,
    ),
    r'useChapterProgressBar': PropertySchema(
      id: 8,
      name: r'useChapterProgressBar',
      type: IsarType.bool,
    ),
    r'userId': PropertySchema(
      id: 9,
      name: r'userId',
      type: IsarType.string,
    ),
    r'userToken': PropertySchema(
      id: 10,
      name: r'userToken',
      type: IsarType.string,
    ),
    r'username': PropertySchema(
      id: 11,
      name: r'username',
      type: IsarType.string,
    )
  },
  estimateSize: _isarPreferencesEstimateSize,
  serialize: _isarPreferencesSerialize,
  deserialize: _isarPreferencesDeserialize,
  deserializeProp: _isarPreferencesDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _isarPreferencesGetId,
  getLinks: _isarPreferencesGetLinks,
  attach: _isarPreferencesAttach,
  version: '3.0.2',
);

int _isarPreferencesEstimateSize(
  IsarPreferences object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.baseUrl.length * 3;
  bytesCount += 3 + object.libraryId.length * 3;
  bytesCount += 3 + object.libraryLabel.length * 3;
  bytesCount += 3 + object.serverId.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  bytesCount += 3 + object.userToken.length * 3;
  bytesCount += 3 + object.username.length * 3;
  return bytesCount;
}

void _isarPreferencesSerialize(
  IsarPreferences object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.baseUrl);
  writer.writeDouble(offsets[1], object.fastForwardInterval);
  writer.writeString(offsets[2], object.libraryId);
  writer.writeString(offsets[3], object.libraryLabel);
  writer.writeDouble(offsets[4], object.playbackSpeed);
  writer.writeDouble(offsets[5], object.rewindInterval);
  writer.writeString(offsets[6], object.serverId);
  writer.writeByte(offsets[7], object.serverType.index);
  writer.writeBool(offsets[8], object.useChapterProgressBar);
  writer.writeString(offsets[9], object.userId);
  writer.writeString(offsets[10], object.userToken);
  writer.writeString(offsets[11], object.username);
}

IsarPreferences _isarPreferencesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarPreferences(
    baseUrl: reader.readStringOrNull(offsets[0]) ?? '',
    fastForwardInterval: reader.readDoubleOrNull(offsets[1]) ?? 30,
    id: id,
    libraryId: reader.readStringOrNull(offsets[2]) ?? '',
    libraryLabel: reader.readStringOrNull(offsets[3]) ?? '',
    playbackSpeed: reader.readDoubleOrNull(offsets[4]) ?? 1,
    rewindInterval: reader.readDoubleOrNull(offsets[5]) ?? 15,
    serverId: reader.readStringOrNull(offsets[6]) ?? '',
    serverType: _IsarPreferencesserverTypeValueEnumMap[
            reader.readByteOrNull(offsets[7])] ??
        ServerType.unknown,
    useChapterProgressBar: reader.readBoolOrNull(offsets[8]) ?? false,
    userId: reader.readStringOrNull(offsets[9]) ?? '',
    userToken: reader.readStringOrNull(offsets[10]) ?? '',
    username: reader.readStringOrNull(offsets[11]) ?? '',
  );
  return object;
}

P _isarPreferencesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 1:
      return (reader.readDoubleOrNull(offset) ?? 30) as P;
    case 2:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 3:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 4:
      return (reader.readDoubleOrNull(offset) ?? 1) as P;
    case 5:
      return (reader.readDoubleOrNull(offset) ?? 15) as P;
    case 6:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 7:
      return (_IsarPreferencesserverTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          ServerType.unknown) as P;
    case 8:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 9:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 10:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 11:
      return (reader.readStringOrNull(offset) ?? '') as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _IsarPreferencesserverTypeEnumValueMap = {
  'plex': 0,
  'emby': 1,
  'audiobookshelf': 2,
  'unknown': 3,
};
const _IsarPreferencesserverTypeValueEnumMap = {
  0: ServerType.plex,
  1: ServerType.emby,
  2: ServerType.audiobookshelf,
  3: ServerType.unknown,
};

Id _isarPreferencesGetId(IsarPreferences object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarPreferencesGetLinks(IsarPreferences object) {
  return [];
}

void _isarPreferencesAttach(
    IsarCollection<dynamic> col, Id id, IsarPreferences object) {
  object.id = id;
}

extension IsarPreferencesQueryWhereSort
    on QueryBuilder<IsarPreferences, IsarPreferences, QWhere> {
  QueryBuilder<IsarPreferences, IsarPreferences, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarPreferencesQueryWhere
    on QueryBuilder<IsarPreferences, IsarPreferences, QWhereClause> {
  QueryBuilder<IsarPreferences, IsarPreferences, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterWhereClause> idBetween(
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
}

extension IsarPreferencesQueryFilter
    on QueryBuilder<IsarPreferences, IsarPreferences, QFilterCondition> {
  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      baseUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      baseUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'baseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      baseUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'baseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      baseUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'baseUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      baseUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'baseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      baseUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'baseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      baseUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'baseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      baseUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'baseUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      baseUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baseUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      baseUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'baseUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      fastForwardIntervalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fastForwardInterval',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      fastForwardIntervalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fastForwardInterval',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      fastForwardIntervalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fastForwardInterval',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      fastForwardIntervalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fastForwardInterval',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      libraryIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'libraryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      libraryIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'libraryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      libraryIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'libraryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      libraryIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'libraryId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      libraryIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'libraryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      libraryIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'libraryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      libraryIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'libraryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      libraryIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'libraryId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      libraryIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'libraryId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      libraryIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'libraryId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      libraryLabelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'libraryLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      libraryLabelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'libraryLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      libraryLabelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'libraryLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      libraryLabelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'libraryLabel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      libraryLabelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'libraryLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      libraryLabelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'libraryLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      libraryLabelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'libraryLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      libraryLabelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'libraryLabel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      libraryLabelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'libraryLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      libraryLabelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'libraryLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      playbackSpeedEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playbackSpeed',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      playbackSpeedGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'playbackSpeed',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      playbackSpeedLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'playbackSpeed',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      playbackSpeedBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'playbackSpeed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      rewindIntervalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rewindInterval',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      rewindIntervalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rewindInterval',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      rewindIntervalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rewindInterval',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      rewindIntervalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rewindInterval',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      serverIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      serverIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      serverIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      serverIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serverId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      serverIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'serverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      serverIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'serverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      serverIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'serverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      serverIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'serverId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      serverIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serverId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      serverIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'serverId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      serverTypeEqualTo(ServerType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serverType',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      serverTypeGreaterThan(
    ServerType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serverType',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      serverTypeLessThan(
    ServerType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serverType',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      serverTypeBetween(
    ServerType lower,
    ServerType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serverType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      useChapterProgressBarEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'useChapterProgressBar',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      userIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      userIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      userIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      userIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      userIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      userIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      userTokenEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      userTokenGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      userTokenLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      userTokenBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userToken',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      userTokenStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      userTokenEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      userTokenContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      userTokenMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userToken',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      userTokenIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userToken',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      userTokenIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userToken',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      usernameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'username',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      usernameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'username',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      usernameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'username',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      usernameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'username',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      usernameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'username',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      usernameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'username',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      usernameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'username',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      usernameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'username',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      usernameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'username',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterFilterCondition>
      usernameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'username',
        value: '',
      ));
    });
  }
}

extension IsarPreferencesQueryObject
    on QueryBuilder<IsarPreferences, IsarPreferences, QFilterCondition> {}

extension IsarPreferencesQueryLinks
    on QueryBuilder<IsarPreferences, IsarPreferences, QFilterCondition> {}

extension IsarPreferencesQuerySortBy
    on QueryBuilder<IsarPreferences, IsarPreferences, QSortBy> {
  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy> sortByBaseUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseUrl', Sort.asc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      sortByBaseUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseUrl', Sort.desc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      sortByFastForwardInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fastForwardInterval', Sort.asc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      sortByFastForwardIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fastForwardInterval', Sort.desc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      sortByLibraryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'libraryId', Sort.asc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      sortByLibraryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'libraryId', Sort.desc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      sortByLibraryLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'libraryLabel', Sort.asc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      sortByLibraryLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'libraryLabel', Sort.desc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      sortByPlaybackSpeed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playbackSpeed', Sort.asc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      sortByPlaybackSpeedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playbackSpeed', Sort.desc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      sortByRewindInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rewindInterval', Sort.asc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      sortByRewindIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rewindInterval', Sort.desc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      sortByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      sortByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      sortByServerType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverType', Sort.asc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      sortByServerTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverType', Sort.desc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      sortByUseChapterProgressBar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'useChapterProgressBar', Sort.asc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      sortByUseChapterProgressBarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'useChapterProgressBar', Sort.desc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      sortByUserToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userToken', Sort.asc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      sortByUserTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userToken', Sort.desc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      sortByUsername() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'username', Sort.asc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      sortByUsernameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'username', Sort.desc);
    });
  }
}

extension IsarPreferencesQuerySortThenBy
    on QueryBuilder<IsarPreferences, IsarPreferences, QSortThenBy> {
  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy> thenByBaseUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseUrl', Sort.asc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      thenByBaseUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseUrl', Sort.desc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      thenByFastForwardInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fastForwardInterval', Sort.asc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      thenByFastForwardIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fastForwardInterval', Sort.desc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      thenByLibraryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'libraryId', Sort.asc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      thenByLibraryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'libraryId', Sort.desc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      thenByLibraryLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'libraryLabel', Sort.asc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      thenByLibraryLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'libraryLabel', Sort.desc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      thenByPlaybackSpeed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playbackSpeed', Sort.asc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      thenByPlaybackSpeedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playbackSpeed', Sort.desc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      thenByRewindInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rewindInterval', Sort.asc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      thenByRewindIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rewindInterval', Sort.desc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      thenByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      thenByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      thenByServerType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverType', Sort.asc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      thenByServerTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverType', Sort.desc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      thenByUseChapterProgressBar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'useChapterProgressBar', Sort.asc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      thenByUseChapterProgressBarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'useChapterProgressBar', Sort.desc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      thenByUserToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userToken', Sort.asc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      thenByUserTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userToken', Sort.desc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      thenByUsername() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'username', Sort.asc);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QAfterSortBy>
      thenByUsernameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'username', Sort.desc);
    });
  }
}

extension IsarPreferencesQueryWhereDistinct
    on QueryBuilder<IsarPreferences, IsarPreferences, QDistinct> {
  QueryBuilder<IsarPreferences, IsarPreferences, QDistinct> distinctByBaseUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'baseUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QDistinct>
      distinctByFastForwardInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fastForwardInterval');
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QDistinct> distinctByLibraryId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'libraryId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QDistinct>
      distinctByLibraryLabel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'libraryLabel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QDistinct>
      distinctByPlaybackSpeed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'playbackSpeed');
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QDistinct>
      distinctByRewindInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rewindInterval');
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QDistinct> distinctByServerId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QDistinct>
      distinctByServerType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverType');
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QDistinct>
      distinctByUseChapterProgressBar() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'useChapterProgressBar');
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QDistinct> distinctByUserToken(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userToken', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarPreferences, IsarPreferences, QDistinct> distinctByUsername(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'username', caseSensitive: caseSensitive);
    });
  }
}

extension IsarPreferencesQueryProperty
    on QueryBuilder<IsarPreferences, IsarPreferences, QQueryProperty> {
  QueryBuilder<IsarPreferences, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarPreferences, String, QQueryOperations> baseUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'baseUrl');
    });
  }

  QueryBuilder<IsarPreferences, double, QQueryOperations>
      fastForwardIntervalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fastForwardInterval');
    });
  }

  QueryBuilder<IsarPreferences, String, QQueryOperations> libraryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'libraryId');
    });
  }

  QueryBuilder<IsarPreferences, String, QQueryOperations>
      libraryLabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'libraryLabel');
    });
  }

  QueryBuilder<IsarPreferences, double, QQueryOperations>
      playbackSpeedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'playbackSpeed');
    });
  }

  QueryBuilder<IsarPreferences, double, QQueryOperations>
      rewindIntervalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rewindInterval');
    });
  }

  QueryBuilder<IsarPreferences, String, QQueryOperations> serverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverId');
    });
  }

  QueryBuilder<IsarPreferences, ServerType, QQueryOperations>
      serverTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverType');
    });
  }

  QueryBuilder<IsarPreferences, bool, QQueryOperations>
      useChapterProgressBarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'useChapterProgressBar');
    });
  }

  QueryBuilder<IsarPreferences, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<IsarPreferences, String, QQueryOperations> userTokenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userToken');
    });
  }

  QueryBuilder<IsarPreferences, String, QQueryOperations> usernameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'username');
    });
  }
}
