import 'package:flutter/material.dart';
import '../entities/lecturer.dart';
import '../services/lecturer_service.dart';
import '../services/mk_service.dart';

class LecturerWidget extends StatefulWidget {
  const LecturerWidget({super.key});

  @override
  State<LecturerWidget> createState() => _LecturerWidgetState();
}

class _LecturerWidgetState extends State<LecturerWidget> {
  final _lecturerService = LecturerService();
  final _mkService = MKService();
  List<Lecturer> _lecturers = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final data = await _lecturerService.getAll();
    if (!mounted) return;
    setState(() => _lecturers = data);
  }

  void _showForm({Lecturer? lecturer}) {
    final namaCtrl = TextEditingController(text: lecturer?.nama ?? '');
    final umurCtrl = TextEditingController(
      text: lecturer?.umur?.toString() ?? '',
    );

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(lecturer == null ? 'Tambah Dosen' : 'Edit Dosen'),
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
              if (lecturer == null) {
                await _lecturerService.add(nama, umur);
              } else {
                await _lecturerService.update(lecturer, nama, umur);
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

  void _showManageKelas(Lecturer lecturer) async {
    final allMk = await _mkService.getAll();
    final enrolled = await _lecturerService.loadKelas(lecturer);
    if (!mounted) return;

    final enrolledIds = enrolled.map((mk) => mk.id).toSet();

    showDialog(
      context: context,
      builder: (ctx) {
        final selected = Set<int>.from(enrolledIds);
        return StatefulBuilder(
          builder: (ctx, setDialogState) => AlertDialog(
            title: Text('Kelas – ${lecturer.nama ?? ''}'),
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
                  await _lecturerService.syncKelas(lecturer, selected, allMk);
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

  void _confirmDelete(Lecturer lecturer) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Hapus Dosen'),
        content: Text('Hapus "${lecturer.nama}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Batal'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              await _lecturerService.delete(lecturer.id);
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
        _lecturers.isEmpty
            ? const Center(
                child: Text(
                  'Belum ada dosen',
                  style: TextStyle(color: Colors.grey),
                ),
              )
            : ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),
                itemCount: _lecturers.length,
                separatorBuilder: (_, _) => const SizedBox(height: 8),
                itemBuilder: (_, i) {
                  final lecturer = _lecturers[i];
                  final initial = lecturer.nama?.isNotEmpty == true
                      ? lecturer.nama![0].toUpperCase()
                      : '?';
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.tertiaryContainer,
                        child: Text(
                          initial,
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onTertiaryContainer,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        lecturer.nama ?? '-',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text('Umur: ${lecturer.umur ?? '-'}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            tooltip: 'Kelola Kelas',
                            icon: const Icon(Icons.class_outlined),
                            onPressed: () => _showManageKelas(lecturer),
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit_outlined),
                            onPressed: () => _showForm(lecturer: lecturer),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                            onPressed: () => _confirmDelete(lecturer),
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