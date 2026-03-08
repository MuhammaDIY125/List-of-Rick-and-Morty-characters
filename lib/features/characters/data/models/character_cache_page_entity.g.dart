// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_cache_page_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCharacterCachePageEntityCollection on Isar {
  IsarCollection<CharacterCachePageEntity> get characterCachePageEntitys =>
      this.collection();
}

const CharacterCachePageEntitySchema = CollectionSchema(
  name: r'CharacterCachePageEntity',
  id: 8775549879059992131,
  properties: {
    r'page': PropertySchema(id: 0, name: r'page', type: IsarType.long),
    r'payload': PropertySchema(id: 1, name: r'payload', type: IsarType.string),
  },

  estimateSize: _characterCachePageEntityEstimateSize,
  serialize: _characterCachePageEntitySerialize,
  deserialize: _characterCachePageEntityDeserialize,
  deserializeProp: _characterCachePageEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'page': IndexSchema(
      id: -1004952015509011454,
      name: r'page',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'page',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _characterCachePageEntityGetId,
  getLinks: _characterCachePageEntityGetLinks,
  attach: _characterCachePageEntityAttach,
  version: '3.3.0',
);

int _characterCachePageEntityEstimateSize(
  CharacterCachePageEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.payload.length * 3;
  return bytesCount;
}

void _characterCachePageEntitySerialize(
  CharacterCachePageEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.page);
  writer.writeString(offsets[1], object.payload);
}

CharacterCachePageEntity _characterCachePageEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CharacterCachePageEntity();
  object.id = id;
  object.page = reader.readLong(offsets[0]);
  object.payload = reader.readString(offsets[1]);
  return object;
}

P _characterCachePageEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _characterCachePageEntityGetId(CharacterCachePageEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _characterCachePageEntityGetLinks(
  CharacterCachePageEntity object,
) {
  return [];
}

void _characterCachePageEntityAttach(
  IsarCollection<dynamic> col,
  Id id,
  CharacterCachePageEntity object,
) {
  object.id = id;
}

extension CharacterCachePageEntityByIndex
    on IsarCollection<CharacterCachePageEntity> {
  Future<CharacterCachePageEntity?> getByPage(int page) {
    return getByIndex(r'page', [page]);
  }

  CharacterCachePageEntity? getByPageSync(int page) {
    return getByIndexSync(r'page', [page]);
  }

  Future<bool> deleteByPage(int page) {
    return deleteByIndex(r'page', [page]);
  }

  bool deleteByPageSync(int page) {
    return deleteByIndexSync(r'page', [page]);
  }

  Future<List<CharacterCachePageEntity?>> getAllByPage(List<int> pageValues) {
    final values = pageValues.map((e) => [e]).toList();
    return getAllByIndex(r'page', values);
  }

  List<CharacterCachePageEntity?> getAllByPageSync(List<int> pageValues) {
    final values = pageValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'page', values);
  }

  Future<int> deleteAllByPage(List<int> pageValues) {
    final values = pageValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'page', values);
  }

  int deleteAllByPageSync(List<int> pageValues) {
    final values = pageValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'page', values);
  }

  Future<Id> putByPage(CharacterCachePageEntity object) {
    return putByIndex(r'page', object);
  }

  Id putByPageSync(CharacterCachePageEntity object, {bool saveLinks = true}) {
    return putByIndexSync(r'page', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByPage(List<CharacterCachePageEntity> objects) {
    return putAllByIndex(r'page', objects);
  }

  List<Id> putAllByPageSync(
    List<CharacterCachePageEntity> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'page', objects, saveLinks: saveLinks);
  }
}

extension CharacterCachePageEntityQueryWhereSort
    on
        QueryBuilder<
          CharacterCachePageEntity,
          CharacterCachePageEntity,
          QWhere
        > {
  QueryBuilder<CharacterCachePageEntity, CharacterCachePageEntity, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<CharacterCachePageEntity, CharacterCachePageEntity, QAfterWhere>
  anyPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'page'),
      );
    });
  }
}

extension CharacterCachePageEntityQueryWhere
    on
        QueryBuilder<
          CharacterCachePageEntity,
          CharacterCachePageEntity,
          QWhereClause
        > {
  QueryBuilder<
    CharacterCachePageEntity,
    CharacterCachePageEntity,
    QAfterWhereClause
  >
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<
    CharacterCachePageEntity,
    CharacterCachePageEntity,
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
    CharacterCachePageEntity,
    CharacterCachePageEntity,
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
    CharacterCachePageEntity,
    CharacterCachePageEntity,
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
    CharacterCachePageEntity,
    CharacterCachePageEntity,
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
    CharacterCachePageEntity,
    CharacterCachePageEntity,
    QAfterWhereClause
  >
  pageEqualTo(int page) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'page', value: [page]),
      );
    });
  }

  QueryBuilder<
    CharacterCachePageEntity,
    CharacterCachePageEntity,
    QAfterWhereClause
  >
  pageNotEqualTo(int page) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'page',
                lower: [],
                upper: [page],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'page',
                lower: [page],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'page',
                lower: [page],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'page',
                lower: [],
                upper: [page],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<
    CharacterCachePageEntity,
    CharacterCachePageEntity,
    QAfterWhereClause
  >
  pageGreaterThan(int page, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'page',
          lower: [page],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<
    CharacterCachePageEntity,
    CharacterCachePageEntity,
    QAfterWhereClause
  >
  pageLessThan(int page, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'page',
          lower: [],
          upper: [page],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<
    CharacterCachePageEntity,
    CharacterCachePageEntity,
    QAfterWhereClause
  >
  pageBetween(
    int lowerPage,
    int upperPage, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'page',
          lower: [lowerPage],
          includeLower: includeLower,
          upper: [upperPage],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension CharacterCachePageEntityQueryFilter
    on
        QueryBuilder<
          CharacterCachePageEntity,
          CharacterCachePageEntity,
          QFilterCondition
        > {
  QueryBuilder<
    CharacterCachePageEntity,
    CharacterCachePageEntity,
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
    CharacterCachePageEntity,
    CharacterCachePageEntity,
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
    CharacterCachePageEntity,
    CharacterCachePageEntity,
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
    CharacterCachePageEntity,
    CharacterCachePageEntity,
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
    CharacterCachePageEntity,
    CharacterCachePageEntity,
    QAfterFilterCondition
  >
  pageEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'page', value: value),
      );
    });
  }

  QueryBuilder<
    CharacterCachePageEntity,
    CharacterCachePageEntity,
    QAfterFilterCondition
  >
  pageGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'page',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    CharacterCachePageEntity,
    CharacterCachePageEntity,
    QAfterFilterCondition
  >
  pageLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'page',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    CharacterCachePageEntity,
    CharacterCachePageEntity,
    QAfterFilterCondition
  >
  pageBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'page',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    CharacterCachePageEntity,
    CharacterCachePageEntity,
    QAfterFilterCondition
  >
  payloadEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'payload',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    CharacterCachePageEntity,
    CharacterCachePageEntity,
    QAfterFilterCondition
  >
  payloadGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'payload',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    CharacterCachePageEntity,
    CharacterCachePageEntity,
    QAfterFilterCondition
  >
  payloadLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'payload',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    CharacterCachePageEntity,
    CharacterCachePageEntity,
    QAfterFilterCondition
  >
  payloadBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'payload',
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
    CharacterCachePageEntity,
    CharacterCachePageEntity,
    QAfterFilterCondition
  >
  payloadStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'payload',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    CharacterCachePageEntity,
    CharacterCachePageEntity,
    QAfterFilterCondition
  >
  payloadEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'payload',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    CharacterCachePageEntity,
    CharacterCachePageEntity,
    QAfterFilterCondition
  >
  payloadContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'payload',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    CharacterCachePageEntity,
    CharacterCachePageEntity,
    QAfterFilterCondition
  >
  payloadMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'payload',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    CharacterCachePageEntity,
    CharacterCachePageEntity,
    QAfterFilterCondition
  >
  payloadIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'payload', value: ''),
      );
    });
  }

  QueryBuilder<
    CharacterCachePageEntity,
    CharacterCachePageEntity,
    QAfterFilterCondition
  >
  payloadIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'payload', value: ''),
      );
    });
  }
}

extension CharacterCachePageEntityQueryObject
    on
        QueryBuilder<
          CharacterCachePageEntity,
          CharacterCachePageEntity,
          QFilterCondition
        > {}

extension CharacterCachePageEntityQueryLinks
    on
        QueryBuilder<
          CharacterCachePageEntity,
          CharacterCachePageEntity,
          QFilterCondition
        > {}

extension CharacterCachePageEntityQuerySortBy
    on
        QueryBuilder<
          CharacterCachePageEntity,
          CharacterCachePageEntity,
          QSortBy
        > {
  QueryBuilder<CharacterCachePageEntity, CharacterCachePageEntity, QAfterSortBy>
  sortByPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'page', Sort.asc);
    });
  }

  QueryBuilder<CharacterCachePageEntity, CharacterCachePageEntity, QAfterSortBy>
  sortByPageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'page', Sort.desc);
    });
  }

  QueryBuilder<CharacterCachePageEntity, CharacterCachePageEntity, QAfterSortBy>
  sortByPayload() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payload', Sort.asc);
    });
  }

  QueryBuilder<CharacterCachePageEntity, CharacterCachePageEntity, QAfterSortBy>
  sortByPayloadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payload', Sort.desc);
    });
  }
}

extension CharacterCachePageEntityQuerySortThenBy
    on
        QueryBuilder<
          CharacterCachePageEntity,
          CharacterCachePageEntity,
          QSortThenBy
        > {
  QueryBuilder<CharacterCachePageEntity, CharacterCachePageEntity, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CharacterCachePageEntity, CharacterCachePageEntity, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CharacterCachePageEntity, CharacterCachePageEntity, QAfterSortBy>
  thenByPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'page', Sort.asc);
    });
  }

  QueryBuilder<CharacterCachePageEntity, CharacterCachePageEntity, QAfterSortBy>
  thenByPageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'page', Sort.desc);
    });
  }

  QueryBuilder<CharacterCachePageEntity, CharacterCachePageEntity, QAfterSortBy>
  thenByPayload() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payload', Sort.asc);
    });
  }

  QueryBuilder<CharacterCachePageEntity, CharacterCachePageEntity, QAfterSortBy>
  thenByPayloadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payload', Sort.desc);
    });
  }
}

extension CharacterCachePageEntityQueryWhereDistinct
    on
        QueryBuilder<
          CharacterCachePageEntity,
          CharacterCachePageEntity,
          QDistinct
        > {
  QueryBuilder<CharacterCachePageEntity, CharacterCachePageEntity, QDistinct>
  distinctByPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'page');
    });
  }

  QueryBuilder<CharacterCachePageEntity, CharacterCachePageEntity, QDistinct>
  distinctByPayload({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'payload', caseSensitive: caseSensitive);
    });
  }
}

extension CharacterCachePageEntityQueryProperty
    on
        QueryBuilder<
          CharacterCachePageEntity,
          CharacterCachePageEntity,
          QQueryProperty
        > {
  QueryBuilder<CharacterCachePageEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CharacterCachePageEntity, int, QQueryOperations> pageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'page');
    });
  }

  QueryBuilder<CharacterCachePageEntity, String, QQueryOperations>
  payloadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'payload');
    });
  }
}
