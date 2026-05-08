import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../entities/user.dart';
import '../entities/mk.dart';
import '../entities/lecturer.dart';

class IsarService {
  static late Isar _isar;

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [UserSchema, MKSchema, LecturerSchema],
      directory: dir.path,
    );
  }

  static Isar get instance => _isar;
}