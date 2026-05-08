import 'package:isar/isar.dart';

part 'mk.g.dart';

@collection
class MK {
  Id id = Isar.autoIncrement;
  String? nama;
  int? kapasitas;
}