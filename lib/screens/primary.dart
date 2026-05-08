import 'package:flutter/material.dart';
import '../widgets/user_widget.dart';
import '../widgets/mk_widget.dart';
import '../widgets/lecturer_widget.dart';

class PrimaryScreen extends StatelessWidget {
  const PrimaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Akademik',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: false,
          bottom: TabBar(
            tabs: const [
              Tab(icon: Icon(Icons.people_outline), text: 'Mahasiswa'),
              Tab(icon: Icon(Icons.menu_book_outlined), text: 'Mata Kuliah'),
              Tab(icon: Icon(Icons.badge_outlined), text: 'Dosen'),
            ],
            indicatorSize: TabBarIndicatorSize.tab,
          ),
        ),
        body: const TabBarView(
          children: [
            UserWidget(),
            MKWidget(),
            LecturerWidget(),
          ],
        ),
      ),
    );
  }
}