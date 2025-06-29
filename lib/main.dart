import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'staff_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required for async setup
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Staff Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.orange,
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.dark(
          primary: Colors.orange,
        ),
      ),
      themeMode: ThemeMode.system,
      home: StaffListPage(),
    );
  }
}