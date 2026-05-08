import 'package:isar/isar.dart';
import 'mk.dart';

part 'lecturer.g.dart';

@collection
class Lecturer {
  Id id = Isar.autoIncrement;
  String? nama;
  int? umur;
  final kelas = IsarLinks<MK>();
}