// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_character_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFavoriteCharacterEntityCollection on Isar {
  IsarCollection<FavoriteCharacterEntity> get favoriteCharacterEntitys =>
      this.collection();
}

const FavoriteCharacterEntitySchema = CollectionSchema(
  name: r'FavoriteCharacterEntity',
  id: -3724162234844717211,
  properties: {
    r'characterId': PropertySchema(
      id: 0,
      name: r'characterId',
      type: IsarType.long,
    ),
    r'episodeCount': PropertySchema(
      id: 1,
      name: r'episodeCount',
      type: IsarType.long,
    ),
    r'gender': PropertySchema(id: 2, name: r'gender', type: IsarType.string),
    r'image': PropertySchema(id: 3, name: r'image', type: IsarType.string),
    r'locationName': PropertySchema(
      id: 4,
      name: r'locationName',
      type: IsarType.string,
    ),
    r'name': PropertySchema(id: 5, name: r'name', type: IsarType.string),
    r'originName': PropertySchema(
      id: 6,
      name: r'originName',
      type: IsarType.string,
    ),
    r'species': PropertySchema(id: 7, name: r'species', type: IsarType.string),
    r'status': PropertySchema(id: 8, name: r'status', type: IsarType.string),
  },

  estimateSize: _favoriteCharacterEntityEstimateSize,
  serialize: _favoriteCharacterEntitySerialize,
  deserialize: _favoriteCharacterEntityDeserialize,
  deserializeProp: _favoriteCharacterEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'characterId': IndexSchema(
      id: 8442520835599207285,
      name: r'characterId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'characterId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _favoriteCharacterEntityGetId,
  getLinks: _favoriteCharacterEntityGetLinks,
  attach: _favoriteCharacterEntityAttach,
  version: '3.3.0',
);

int _favoriteCharacterEntityEstimateSize(
  FavoriteCharacterEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.gender.length * 3;
  bytesCount += 3 + object.image.length * 3;
  bytesCount += 3 + object.locationName.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.originName.length * 3;
  bytesCount += 3 + object.species.length * 3;
  bytesCount += 3 + object.status.length * 3;
  return bytesCount;
}

void _favoriteCharacterEntitySerialize(
  FavoriteCharacterEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.characterId);
  writer.writeLong(offsets[1], object.episodeCount);
  writer.writeString(offsets[2], object.gender);
  writer.writeString(offsets[3], object.image);
  writer.writeString(offsets[4], object.locationName);
  writer.writeString(offsets[5], object.name);
  writer.writeString(offsets[6], object.originName);
  writer.writeString(offsets[7], object.species);
  writer.writeString(offsets[8], object.status);
}

FavoriteCharacterEntity _favoriteCharacterEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FavoriteCharacterEntity();
  object.characterId = reader.readLong(offsets[0]);
  object.episodeCount = reader.readLong(offsets[1]);
  object.gender = reader.readString(offsets[2]);
  object.id = id;
  object.image = reader.readString(offsets[3]);
  object.locationName = reader.readString(offsets[4]);
  object.name = reader.readString(offsets[5]);
  object.originName = reader.readString(offsets[6]);
  object.species = reader.readString(offsets[7]);
  object.status = reader.readString(offsets[8]);
  return object;
}

P _favoriteCharacterEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _favoriteCharacterEntityGetId(FavoriteCharacterEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _favoriteCharacterEntityGetLinks(
  FavoriteCharacterEntity object,
) {
  return [];
}

void _favoriteCharacterEntityAttach(
  IsarCollection<dynamic> col,
  Id id,
  FavoriteCharacterEntity object,
) {
  object.id = id;
}

extension FavoriteCharacterEntityByIndex
    on IsarCollection<FavoriteCharacterEntity> {
  Future<FavoriteCharacterEntity?> getByCharacterId(int characterId) {
    return getByIndex(r'characterId', [characterId]);
  }

  FavoriteCharacterEntity? getByCharacterIdSync(int characterId) {
    return getByIndexSync(r'characterId', [characterId]);
  }

  Future<bool> deleteByCharacterId(int characterId) {
    return deleteByIndex(r'characterId', [characterId]);
  }

  bool deleteByCharacterIdSync(int characterId) {
    return deleteByIndexSync(r'characterId', [characterId]);
  }

  Future<List<FavoriteCharacterEntity?>> getAllByCharacterId(
    List<int> characterIdValues,
  ) {
    final values = characterIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'characterId', values);
  }

  List<FavoriteCharacterEntity?> getAllByCharacterIdSync(
    List<int> characterIdValues,
  ) {
    final values = characterIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'characterId', values);
  }

  Future<int> deleteAllByCharacterId(List<int> characterIdValues) {
    final values = characterIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'characterId', values);
  }

  int deleteAllByCharacterIdSync(List<int> characterIdValues) {
    final values = characterIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'characterId', values);
  }

  Future<Id> putByCharacterId(FavoriteCharacterEntity object) {
    return putByIndex(r'characterId', object);
  }

  Id putByCharacterIdSync(
    FavoriteCharacterEntity object, {
    bool saveLinks = true,
  }) {
    return putByIndexSync(r'characterId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCharacterId(List<FavoriteCharacterEntity> objects) {
    return putAllByIndex(r'characterId', objects);
  }

  List<Id> putAllByCharacterIdSync(
    List<FavoriteCharacterEntity> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'characterId', objects, saveLinks: saveLinks);
  }
}

extension FavoriteCharacterEntityQueryWhereSort
    on QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QWhere> {
  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterWhere>
  anyCharacterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'characterId'),
      );
    });
  }
}

extension FavoriteCharacterEntityQueryWhere
    on
        QueryBuilder<
          FavoriteCharacterEntity,
          FavoriteCharacterEntity,
          QWhereClause
        > {
  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterWhereClause
  >
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterWhereClause
  >
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

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterWhereClause
  >
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterWhereClause
  >
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterWhereClause
  >
  idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterWhereClause
  >
  characterIdEqualTo(int characterId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'characterId',
          value: [characterId],
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterWhereClause
  >
  characterIdNotEqualTo(int characterId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'characterId',
                lower: [],
                upper: [characterId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'characterId',
                lower: [characterId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'characterId',
                lower: [characterId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'characterId',
                lower: [],
                upper: [characterId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterWhereClause
  >
  characterIdGreaterThan(int characterId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'characterId',
          lower: [characterId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterWhereClause
  >
  characterIdLessThan(int characterId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'characterId',
          lower: [],
          upper: [characterId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterWhereClause
  >
  characterIdBetween(
    int lowerCharacterId,
    int upperCharacterId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'characterId',
          lower: [lowerCharacterId],
          includeLower: includeLower,
          upper: [upperCharacterId],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension FavoriteCharacterEntityQueryFilter
    on
        QueryBuilder<
          FavoriteCharacterEntity,
          FavoriteCharacterEntity,
          QFilterCondition
        > {
  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  characterIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'characterId', value: value),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  characterIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'characterId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  characterIdLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'characterId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  characterIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'characterId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  episodeCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'episodeCount', value: value),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  episodeCountGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'episodeCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  episodeCountLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'episodeCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  episodeCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'episodeCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  genderEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'gender',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  genderGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'gender',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  genderLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'gender',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  genderBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'gender',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  genderStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'gender',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  genderEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'gender',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  genderContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'gender',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  genderMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'gender',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  genderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'gender', value: ''),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  genderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'gender', value: ''),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  imageEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'image',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  imageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'image',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  imageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'image',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  imageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'image',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  imageStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'image',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  imageEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'image',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  imageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'image',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  imageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'image',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  imageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'image', value: ''),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  imageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'image', value: ''),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  locationNameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'locationName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  locationNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'locationName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  locationNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'locationName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  locationNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'locationName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  locationNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'locationName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  locationNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'locationName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  locationNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'locationName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  locationNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'locationName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  locationNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'locationName', value: ''),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  locationNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'locationName', value: ''),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  nameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'name',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  nameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  nameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'name',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  originNameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'originName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  originNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'originName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  originNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'originName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  originNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'originName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  originNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'originName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  originNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'originName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  originNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'originName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  originNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'originName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  originNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'originName', value: ''),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  originNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'originName', value: ''),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  speciesEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'species',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  speciesGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'species',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  speciesLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'species',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  speciesBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'species',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  speciesStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'species',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  speciesEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'species',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  speciesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'species',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  speciesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'species',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  speciesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'species', value: ''),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  speciesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'species', value: ''),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  statusEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  statusGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  statusLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  statusBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'status',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  statusStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  statusEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'status',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'status', value: ''),
      );
    });
  }

  QueryBuilder<
    FavoriteCharacterEntity,
    FavoriteCharacterEntity,
    QAfterFilterCondition
  >
  statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'status', value: ''),
      );
    });
  }
}

extension FavoriteCharacterEntityQueryObject
    on
        QueryBuilder<
          FavoriteCharacterEntity,
          FavoriteCharacterEntity,
          QFilterCondition
        > {}

extension FavoriteCharacterEntityQueryLinks
    on
        QueryBuilder<
          FavoriteCharacterEntity,
          FavoriteCharacterEntity,
          QFilterCondition
        > {}

extension FavoriteCharacterEntityQuerySortBy
    on QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QSortBy> {
  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  sortByCharacterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characterId', Sort.asc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  sortByCharacterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characterId', Sort.desc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  sortByEpisodeCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'episodeCount', Sort.asc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  sortByEpisodeCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'episodeCount', Sort.desc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  sortByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  sortByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  sortByImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.asc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  sortByImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.desc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  sortByLocationName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationName', Sort.asc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  sortByLocationNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationName', Sort.desc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  sortByOriginName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originName', Sort.asc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  sortByOriginNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originName', Sort.desc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  sortBySpecies() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'species', Sort.asc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  sortBySpeciesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'species', Sort.desc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension FavoriteCharacterEntityQuerySortThenBy
    on
        QueryBuilder<
          FavoriteCharacterEntity,
          FavoriteCharacterEntity,
          QSortThenBy
        > {
  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  thenByCharacterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characterId', Sort.asc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  thenByCharacterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characterId', Sort.desc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  thenByEpisodeCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'episodeCount', Sort.asc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  thenByEpisodeCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'episodeCount', Sort.desc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  thenByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  thenByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  thenByImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.asc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  thenByImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.desc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  thenByLocationName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationName', Sort.asc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  thenByLocationNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationName', Sort.desc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  thenByOriginName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originName', Sort.asc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  thenByOriginNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originName', Sort.desc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  thenBySpecies() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'species', Sort.asc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  thenBySpeciesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'species', Sort.desc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QAfterSortBy>
  thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension FavoriteCharacterEntityQueryWhereDistinct
    on
        QueryBuilder<
          FavoriteCharacterEntity,
          FavoriteCharacterEntity,
          QDistinct
        > {
  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QDistinct>
  distinctByCharacterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'characterId');
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QDistinct>
  distinctByEpisodeCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'episodeCount');
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QDistinct>
  distinctByGender({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gender', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QDistinct>
  distinctByImage({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'image', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QDistinct>
  distinctByLocationName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locationName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QDistinct>
  distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QDistinct>
  distinctByOriginName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'originName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QDistinct>
  distinctBySpecies({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'species', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FavoriteCharacterEntity, FavoriteCharacterEntity, QDistinct>
  distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }
}

extension FavoriteCharacterEntityQueryProperty
    on
        QueryBuilder<
          FavoriteCharacterEntity,
          FavoriteCharacterEntity,
          QQueryProperty
        > {
  QueryBuilder<FavoriteCharacterEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FavoriteCharacterEntity, int, QQueryOperations>
  characterIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'characterId');
    });
  }

  QueryBuilder<FavoriteCharacterEntity, int, QQueryOperations>
  episodeCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'episodeCount');
    });
  }

  QueryBuilder<FavoriteCharacterEntity, String, QQueryOperations>
  genderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gender');
    });
  }

  QueryBuilder<FavoriteCharacterEntity, String, QQueryOperations>
  imageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'image');
    });
  }

  QueryBuilder<FavoriteCharacterEntity, String, QQueryOperations>
  locationNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locationName');
    });
  }

  QueryBuilder<FavoriteCharacterEntity, String, QQueryOperations>
  nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<FavoriteCharacterEntity, String, QQueryOperations>
  originNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'originName');
    });
  }

  QueryBuilder<FavoriteCharacterEntity, String, QQueryOperations>
  speciesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'species');
    });
  }

  QueryBuilder<FavoriteCharacterEntity, String, QQueryOperations>
  statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }
}
