import 'package:isar/isar.dart';
import '../entities/lecturer.dart';
import '../entities/mk.dart';
import 'isar_service.dart';

class LecturerService {
  Isar get _db => IsarService.instance;

  Future<List<Lecturer>> getAll() async {
    return _db.lecturers.where().findAll();
  }

  Future<void> add(String nama, int umur) async {
    final lecturer = Lecturer()
      ..nama = nama
      ..umur = umur;
    await _db.writeTxn(() async {
      await _db.lecturers.put(lecturer);
    });
  }

  Future<void> update(Lecturer lecturer, String nama, int umur) async {
    lecturer.nama = nama;
    lecturer.umur = umur;
    await _db.writeTxn(() async {
      await _db.lecturers.put(lecturer);
    });
  }

  Future<void> delete(int id) async {
    await _db.writeTxn(() async {
      await _db.lecturers.delete(id);
    });
  }

  Future<List<MK>> loadKelas(Lecturer lecturer) async {
    await lecturer.kelas.load();
    return lecturer.kelas.toList();
  }

  Future<void> syncKelas(Lecturer lecturer, Set<int> selectedIds, List<MK> allMk) async {
    await lecturer.kelas.load();
    final toAdd = allMk.where((mk) => selectedIds.contains(mk.id)).toList();
    final toRemove = lecturer.kelas.where((mk) => !selectedIds.contains(mk.id)).toList();
    await _db.writeTxn(() async {
      lecturer.kelas.addAll(toAdd);
      for (final mk in toRemove) {
        lecturer.kelas.remove(mk);
      }
      await lecturer.kelas.save();
    });
  }
}