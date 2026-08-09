import 'package:flutter/material.dart';
import 'package:first_flutter_project/features/home/widgets/description_text.dart';
import 'package:first_flutter_project/features/home/widgets/image_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My First Project',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ImageSection(), SizedBox(height: 24), DescriptionText()],
        ),
      ),
    );
  }
}
