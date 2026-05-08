// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mk.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMKCollection on Isar {
  IsarCollection<MK> get mKs => this.collection();
}

const MKSchema = CollectionSchema(
  name: r'MK',
  id: -4923741471146162081,
  properties: {
    r'kapasitas': PropertySchema(
      id: 0,
      name: r'kapasitas',
      type: IsarType.long,
    ),
    r'nama': PropertySchema(
      id: 1,
      name: r'nama',
      type: IsarType.string,
    )
  },
  estimateSize: _mKEstimateSize,
  serialize: _mKSerialize,
  deserialize: _mKDeserialize,
  deserializeProp: _mKDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _mKGetId,
  getLinks: _mKGetLinks,
  attach: _mKAttach,
  version: '3.1.0+1',
);

int _mKEstimateSize(
  MK object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.nama;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _mKSerialize(
  MK object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.kapasitas);
  writer.writeString(offsets[1], object.nama);
}

MK _mKDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MK();
  object.id = id;
  object.kapasitas = reader.readLongOrNull(offsets[0]);
  object.nama = reader.readStringOrNull(offsets[1]);
  return object;
}

P _mKDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _mKGetId(MK object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _mKGetLinks(MK object) {
  return [];
}

void _mKAttach(IsarCollection<dynamic> col, Id id, MK object) {
  object.id = id;
}

extension MKQueryWhereSort on QueryBuilder<MK, MK, QWhere> {
  QueryBuilder<MK, MK, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MKQueryWhere on QueryBuilder<MK, MK, QWhereClause> {
  QueryBuilder<MK, MK, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MK, MK, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<MK, MK, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MK, MK, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MK, MK, QAfterWhereClause> idBetween(
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

extension MKQueryFilter on QueryBuilder<MK, MK, QFilterCondition> {
  QueryBuilder<MK, MK, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MK, MK, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<MK, MK, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<MK, MK, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MK, MK, QAfterFilterCondition> kapasitasIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'kapasitas',
      ));
    });
  }

  QueryBuilder<MK, MK, QAfterFilterCondition> kapasitasIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'kapasitas',
      ));
    });
  }

  QueryBuilder<MK, MK, QAfterFilterCondition> kapasitasEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kapasitas',
        value: value,
      ));
    });
  }

  QueryBuilder<MK, MK, QAfterFilterCondition> kapasitasGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'kapasitas',
        value: value,
      ));
    });
  }

  QueryBuilder<MK, MK, QAfterFilterCondition> kapasitasLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'kapasitas',
        value: value,
      ));
    });
  }

  QueryBuilder<MK, MK, QAfterFilterCondition> kapasitasBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'kapasitas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MK, MK, QAfterFilterCondition> namaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nama',
      ));
    });
  }

  QueryBuilder<MK, MK, QAfterFilterCondition> namaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nama',
      ));
    });
  }

  QueryBuilder<MK, MK, QAfterFilterCondition> namaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nama',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MK, MK, QAfterFilterCondition> namaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nama',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MK, MK, QAfterFilterCondition> namaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nama',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MK, MK, QAfterFilterCondition> namaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nama',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MK, MK, QAfterFilterCondition> namaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nama',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MK, MK, QAfterFilterCondition> namaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nama',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MK, MK, QAfterFilterCondition> namaContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nama',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MK, MK, QAfterFilterCondition> namaMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nama',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MK, MK, QAfterFilterCondition> namaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nama',
        value: '',
      ));
    });
  }

  QueryBuilder<MK, MK, QAfterFilterCondition> namaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nama',
        value: '',
      ));
    });
  }
}

extension MKQueryObject on QueryBuilder<MK, MK, QFilterCondition> {}

extension MKQueryLinks on QueryBuilder<MK, MK, QFilterCondition> {}

extension MKQuerySortBy on QueryBuilder<MK, MK, QSortBy> {
  QueryBuilder<MK, MK, QAfterSortBy> sortByKapasitas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kapasitas', Sort.asc);
    });
  }

  QueryBuilder<MK, MK, QAfterSortBy> sortByKapasitasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kapasitas', Sort.desc);
    });
  }

  QueryBuilder<MK, MK, QAfterSortBy> sortByNama() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nama', Sort.asc);
    });
  }

  QueryBuilder<MK, MK, QAfterSortBy> sortByNamaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nama', Sort.desc);
    });
  }
}

extension MKQuerySortThenBy on QueryBuilder<MK, MK, QSortThenBy> {
  QueryBuilder<MK, MK, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MK, MK, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MK, MK, QAfterSortBy> thenByKapasitas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kapasitas', Sort.asc);
    });
  }

  QueryBuilder<MK, MK, QAfterSortBy> thenByKapasitasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kapasitas', Sort.desc);
    });
  }

  QueryBuilder<MK, MK, QAfterSortBy> thenByNama() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nama', Sort.asc);
    });
  }

  QueryBuilder<MK, MK, QAfterSortBy> thenByNamaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nama', Sort.desc);
    });
  }
}

extension MKQueryWhereDistinct on QueryBuilder<MK, MK, QDistinct> {
  QueryBuilder<MK, MK, QDistinct> distinctByKapasitas() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'kapasitas');
    });
  }

  QueryBuilder<MK, MK, QDistinct> distinctByNama({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nama', caseSensitive: caseSensitive);
    });
  }
}

extension MKQueryProperty on QueryBuilder<MK, MK, QQueryProperty> {
  QueryBuilder<MK, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MK, int?, QQueryOperations> kapasitasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'kapasitas');
    });
  }

  QueryBuilder<MK, String?, QQueryOperations> namaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nama');
    });
  }
}
