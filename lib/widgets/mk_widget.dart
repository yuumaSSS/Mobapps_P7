import 'package:flutter/material.dart';
import '../entities/mk.dart';
import '../services/mk_service.dart';

class MKWidget extends StatefulWidget {
  const MKWidget({super.key});

  @override
  State<MKWidget> createState() => _MKWidgetState();
}

class _MKWidgetState extends State<MKWidget> {
  final _service = MKService();
  List<MK> _mkList = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final data = await _service.getAll();
    if (!mounted) return;
    setState(() => _mkList = data);
  }

  void _showForm({MK? mk}) {
    final namaCtrl = TextEditingController(text: mk?.nama ?? '');
    final kapasitasCtrl = TextEditingController(
      text: mk?.kapasitas?.toString() ?? '',
    );

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(mk == null ? 'Tambah Mata Kuliah' : 'Edit Mata Kuliah'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: namaCtrl,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Nama MK',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: kapasitasCtrl,
              decoration: const InputDecoration(
                labelText: 'Kapasitas',
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
              final kapasitas = int.tryParse(kapasitasCtrl.text.trim()) ?? 0;
              if (nama.isEmpty) return;
              if (mk == null) {
                await _service.add(nama, kapasitas);
              } else {
                await _service.update(mk, nama, kapasitas);
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

  void _confirmDelete(MK mk) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Hapus Mata Kuliah'),
        content: Text('Hapus "${mk.nama}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Batal'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              await _service.delete(mk.id);
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
        _mkList.isEmpty
            ? const Center(
                child: Text(
                  'Belum ada Mata Kuliah',
                  style: TextStyle(color: Colors.grey),
                ),
              )
            : ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),
                itemCount: _mkList.length,
                separatorBuilder: (_, _) => const SizedBox(height: 8),
                itemBuilder: (_, i) {
                  final mk = _mkList[i];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        child: Text(
                          '${i + 1}',
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        mk.nama ?? '-',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text('Kapasitas: ${mk.kapasitas ?? 0}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit_outlined),
                            onPressed: () => _showForm(mk: mk),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                            onPressed: () => _confirmDelete(mk),
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
            icon: const Icon(Icons.add),
            label: const Text('Tambah MK'),
          ),
        ),
      ],
    );
  }
}