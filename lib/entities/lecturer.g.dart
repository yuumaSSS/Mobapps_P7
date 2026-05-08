// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecturer.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLecturerCollection on Isar {
  IsarCollection<Lecturer> get lecturers => this.collection();
}

const LecturerSchema = CollectionSchema(
  name: r'Lecturer',
  id: -3835890022930593559,
  properties: {
    r'nama': PropertySchema(
      id: 0,
      name: r'nama',
      type: IsarType.string,
    ),
    r'umur': PropertySchema(
      id: 1,
      name: r'umur',
      type: IsarType.long,
    )
  },
  estimateSize: _lecturerEstimateSize,
  serialize: _lecturerSerialize,
  deserialize: _lecturerDeserialize,
  deserializeProp: _lecturerDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'kelas': LinkSchema(
      id: 67986323118910155,
      name: r'kelas',
      target: r'MK',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _lecturerGetId,
  getLinks: _lecturerGetLinks,
  attach: _lecturerAttach,
  version: '3.1.0+1',
);

int _lecturerEstimateSize(
  Lecturer object,
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

void _lecturerSerialize(
  Lecturer object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.nama);
  writer.writeLong(offsets[1], object.umur);
}

Lecturer _lecturerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Lecturer();
  object.id = id;
  object.nama = reader.readStringOrNull(offsets[0]);
  object.umur = reader.readLongOrNull(offsets[1]);
  return object;
}

P _lecturerDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _lecturerGetId(Lecturer object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _lecturerGetLinks(Lecturer object) {
  return [object.kelas];
}

void _lecturerAttach(IsarCollection<dynamic> col, Id id, Lecturer object) {
  object.id = id;
  object.kelas.attach(col, col.isar.collection<MK>(), r'kelas', id);
}

extension LecturerQueryWhereSort on QueryBuilder<Lecturer, Lecturer, QWhere> {
  QueryBuilder<Lecturer, Lecturer, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LecturerQueryWhere on QueryBuilder<Lecturer, Lecturer, QWhereClause> {
  QueryBuilder<Lecturer, Lecturer, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Lecturer, Lecturer, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Lecturer, Lecturer, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Lecturer, Lecturer, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Lecturer, Lecturer, QAfterWhereClause> idBetween(
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

extension LecturerQueryFilter
    on QueryBuilder<Lecturer, Lecturer, QFilterCondition> {
  QueryBuilder<Lecturer, Lecturer, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Lecturer, Lecturer, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Lecturer, Lecturer, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Lecturer, Lecturer, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Lecturer, Lecturer, QAfterFilterCondition> namaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nama',
      ));
    });
  }

  QueryBuilder<Lecturer, Lecturer, QAfterFilterCondition> namaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nama',
      ));
    });
  }

  QueryBuilder<Lecturer, Lecturer, QAfterFilterCondition> namaEqualTo(
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

  QueryBuilder<Lecturer, Lecturer, QAfterFilterCondition> namaGreaterThan(
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

  QueryBuilder<Lecturer, Lecturer, QAfterFilterCondition> namaLessThan(
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

  QueryBuilder<Lecturer, Lecturer, QAfterFilterCondition> namaBetween(
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

  QueryBuilder<Lecturer, Lecturer, QAfterFilterCondition> namaStartsWith(
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

  QueryBuilder<Lecturer, Lecturer, QAfterFilterCondition> namaEndsWith(
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

  QueryBuilder<Lecturer, Lecturer, QAfterFilterCondition> namaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nama',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lecturer, Lecturer, QAfterFilterCondition> namaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nama',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lecturer, Lecturer, QAfterFilterCondition> namaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nama',
        value: '',
      ));
    });
  }

  QueryBuilder<Lecturer, Lecturer, QAfterFilterCondition> namaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nama',
        value: '',
      ));
    });
  }

  QueryBuilder<Lecturer, Lecturer, QAfterFilterCondition> umurIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'umur',
      ));
    });
  }

  QueryBuilder<Lecturer, Lecturer, QAfterFilterCondition> umurIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'umur',
      ));
    });
  }

  QueryBuilder<Lecturer, Lecturer, QAfterFilterCondition> umurEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'umur',
        value: value,
      ));
    });
  }

  QueryBuilder<Lecturer, Lecturer, QAfterFilterCondition> umurGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'umur',
        value: value,
      ));
    });
  }

  QueryBuilder<Lecturer, Lecturer, QAfterFilterCondition> umurLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'umur',
        value: value,
      ));
    });
  }

  QueryBuilder<Lecturer, Lecturer, QAfterFilterCondition> umurBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'umur',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LecturerQueryObject
    on QueryBuilder<Lecturer, Lecturer, QFilterCondition> {}

extension LecturerQueryLinks
    on QueryBuilder<Lecturer, Lecturer, QFilterCondition> {
  QueryBuilder<Lecturer, Lecturer, QAfterFilterCondition> kelas(
      FilterQuery<MK> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'kelas');
    });
  }

  QueryBuilder<Lecturer, Lecturer, QAfterFilterCondition> kelasLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'kelas', length, true, length, true);
    });
  }

  QueryBuilder<Lecturer, Lecturer, QAfterFilterCondition> kelasIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'kelas', 0, true, 0, true);
    });
  }

  QueryBuilder<Lecturer, Lecturer, QAfterFilterCondition> kelasIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'kelas', 0, false, 999999, true);
    });
  }

  QueryBuilder<Lecturer, Lecturer, QAfterFilterCondition> kelasLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'kelas', 0, true, length, include);
    });
  }

  QueryBuilder<Lecturer, Lecturer, QAfterFilterCondition>
      kelasLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'kelas', length, include, 999999, true);
    });
  }

  QueryBuilder<Lecturer, Lecturer, QAfterFilterCondition> kelasLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'kelas', lower, includeLower, upper, includeUpper);
    });
  }
}

extension LecturerQuerySortBy on QueryBuilder<Lecturer, Lecturer, QSortBy> {
  QueryBuilder<Lecturer, Lecturer, QAfterSortBy> sortByNama() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nama', Sort.asc);
    });
  }

  QueryBuilder<Lecturer, Lecturer, QAfterSortBy> sortByNamaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nama', Sort.desc);
    });
  }

  QueryBuilder<Lecturer, Lecturer, QAfterSortBy> sortByUmur() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'umur', Sort.asc);
    });
  }

  QueryBuilder<Lecturer, Lecturer, QAfterSortBy> sortByUmurDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'umur', Sort.desc);
    });
  }
}

extension LecturerQuerySortThenBy
    on QueryBuilder<Lecturer, Lecturer, QSortThenBy> {
  QueryBuilder<Lecturer, Lecturer, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Lecturer, Lecturer, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Lecturer, Lecturer, QAfterSortBy> thenByNama() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nama', Sort.asc);
    });
  }

  QueryBuilder<Lecturer, Lecturer, QAfterSortBy> thenByNamaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nama', Sort.desc);
    });
  }

  QueryBuilder<Lecturer, Lecturer, QAfterSortBy> thenByUmur() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'umur', Sort.asc);
    });
  }

  QueryBuilder<Lecturer, Lecturer, QAfterSortBy> thenByUmurDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'umur', Sort.desc);
    });
  }
}

extension LecturerQueryWhereDistinct
    on QueryBuilder<Lecturer, Lecturer, QDistinct> {
  QueryBuilder<Lecturer, Lecturer, QDistinct> distinctByNama(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nama', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Lecturer, Lecturer, QDistinct> distinctByUmur() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'umur');
    });
  }
}

extension LecturerQueryProperty
    on QueryBuilder<Lecturer, Lecturer, QQueryProperty> {
  QueryBuilder<Lecturer, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Lecturer, String?, QQueryOperations> namaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nama');
    });
  }

  QueryBuilder<Lecturer, int?, QQueryOperations> umurProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'umur');
    });
  }
}
