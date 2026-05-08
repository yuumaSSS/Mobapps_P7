import 'package:isar/isar.dart';
import 'mk.dart';

part 'user.g.dart';

@collection
class User {
  Id id = Isar.autoIncrement;
  String? nama;
  int? umur;
  final kelas = IsarLinks<MK>();
}