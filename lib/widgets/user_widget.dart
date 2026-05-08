import 'package:flutter/material.dart';
import '../entities/user.dart';
import '../services/user_service.dart';
import '../services/mk_service.dart';

class UserWidget extends StatefulWidget {
  const UserWidget({super.key});

  @override
  State<UserWidget> createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  final _userService = UserService();
  final _mkService = MKService();
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final data = await _userService.getAll();
    if (!mounted) return;
    setState(() => _users = data);
  }

  void _showForm({User? user}) {
    final namaCtrl = TextEditingController(text: user?.nama ?? '');
    final umurCtrl = TextEditingController(
      text: user?.umur?.toString() ?? '',
    );

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(user == null ? 'Tambah Mahasiswa' : 'Edit Mahasiswa'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: namaCtrl,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: umurCtrl,
              decoration: const InputDecoration(
                labelText: 'Umur',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () async {
              final nama = namaCtrl.text.trim();
              final umur = int.tryParse(umurCtrl.text.trim()) ?? 0;
              if (nama.isEmpty) return;
              if (user == null) {
                await _userService.add(nama, umur);
              } else {
                await _userService.update(user, nama, umur);
              }
              if (!ctx.mounted) return;
              Navigator.pop(ctx);
              _load();
            },
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }

  void _showManageKelas(User user) async {
    final allMk = await _mkService.getAll();
    final enrolled = await _userService.loadKelas(user);
    if (!mounted) return;

    final enrolledIds = enrolled.map((mk) => mk.id).toSet();

    showDialog(
      context: context,
      builder: (ctx) {
        final selected = Set<int>.from(enrolledIds);
        return StatefulBuilder(
          builder: (ctx, setDialogState) => AlertDialog(
            title: Text('Kelas – ${user.nama ?? ''}'),
            content: SizedBox(
              width: double.maxFinite,
              child: allMk.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text('Belum ada MK tersedia.'),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: allMk.length,
                      itemBuilder: (_, i) {
                        final mk = allMk[i];
                        return CheckboxListTile(
                          title: Text(mk.nama ?? '-'),
                          subtitle: Text('Kapasitas: ${mk.kapasitas ?? 0}'),
                          value: selected.contains(mk.id),
                          onChanged: (val) {
                            setDialogState(() {
                              val == true
                                  ? selected.add(mk.id)
                                  : selected.remove(mk.id);
                            });
                          },
                        );
                      },
                    ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Batal'),
              ),
              FilledButton(
                onPressed: () async {
                  await _userService.syncKelas(user, selected, allMk);
                  if (!ctx.mounted) return;
                  Navigator.pop(ctx);
                },
                child: const Text('Simpan'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _confirmDelete(User user) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Hapus Mahasiswa'),
        content: Text('Hapus "${user.nama}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Batal'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              await _userService.delete(user.id);
              if (!ctx.mounted) return;
              Navigator.pop(ctx);
              _load();
            },
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _users.isEmpty
            ? const Center(
                child: Text(
                  'Belum ada mahasiswa',
                  style: TextStyle(color: Colors.grey),
                ),
              )
            : ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),
                itemCount: _users.length,
                separatorBuilder: (_, _) => const SizedBox(height: 8),
                itemBuilder: (_, i) {
                  final user = _users[i];
                  final initial = user.nama?.isNotEmpty == true
                      ? user.nama![0].toUpperCase()
                      : '?';
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondaryContainer,
                        child: Text(
                          initial,
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        user.nama ?? '-',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text('Umur: ${user.umur ?? '-'}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            tooltip: 'Kelola Kelas',
                            icon: const Icon(Icons.school_outlined),
                            onPressed: () => _showManageKelas(user),
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit_outlined),
                            onPressed: () => _showForm(user: user),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                            onPressed: () => _confirmDelete(user),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton.extended(
            onPressed: () => _showForm(),
            icon: const Icon(Icons.person_add_outlined),
            label: const Text('Tambah'),
          ),
        ),
      ],
    );
  }
}