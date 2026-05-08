import 'package:isar/isar.dart';
import '../entities/user.dart';
import '../entities/mk.dart';
import 'isar_service.dart';

class UserService {
  Isar get _db => IsarService.instance;

  Future<List<User>> getAll() async {
    return _db.users.where().findAll();
  }

  Future<void> add(String nama, int umur) async {
    final user = User()
      ..nama = nama
      ..umur = umur;
    await _db.writeTxn(() async {
      await _db.users.put(user);
    });
  }

  Future<void> update(User user, String nama, int umur) async {
    user.nama = nama;
    user.umur = umur;
    await _db.writeTxn(() async {
      await _db.users.put(user);
    });
  }

  Future<void> delete(int id) async {
    await _db.writeTxn(() async {
      await _db.users.delete(id);
    });
  }

  Future<List<MK>> loadKelas(User user) async {
    await user.kelas.load();
    return user.kelas.toList();
  }

  Future<void> syncKelas(User user, Set<int> selectedIds, List<MK> allMk) async {
    await user.kelas.load();
    final toAdd = allMk.where((mk) => selectedIds.contains(mk.id)).toList();
    final toRemove = user.kelas.where((mk) => !selectedIds.contains(mk.id)).toList();
    await _db.writeTxn(() async {
      user.kelas.addAll(toAdd);
      for (final mk in toRemove) {
        user.kelas.remove(mk);
      }
      await user.kelas.save();
    });
  }
}