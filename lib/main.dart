import 'package:flutter/material.dart';
import 'package:first_flutter_project/features/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Suwannaphum'),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
