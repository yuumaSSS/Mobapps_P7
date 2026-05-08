import 'package:flutter/material.dart';
import 'services/isar_service.dart';
import 'screens/primary.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await IsarService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pelatihan 7',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const PrimaryScreen(),
    );
  }
}