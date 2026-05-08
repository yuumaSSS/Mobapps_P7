import 'package:isar/isar.dart';
import '../entities/mk.dart';
import 'isar_service.dart';

class MKService {
  Isar get _db => IsarService.instance;

  Future<List<MK>> getAll() async {
    return _db.mKs.where().findAll();
  }

  Future<void> add(String nama, int kapasitas) async {
    final mk = MK()
      ..nama = nama
      ..kapasitas = kapasitas;
    await _db.writeTxn(() async {
      await _db.mKs.put(mk);
    });
  }

  Future<void> update(MK mk, String nama, int kapasitas) async {
    mk.nama = nama;
    mk.kapasitas = kapasitas;
    await _db.writeTxn(() async {
      await _db.mKs.put(mk);
    });
  }

  Future<void> delete(int id) async {
    await _db.writeTxn(() async {
      await _db.mKs.delete(id);
    });
  }
}