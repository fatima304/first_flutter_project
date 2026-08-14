import 'package:first_flutter_project/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_project/features/home/widgets/description_text.dart';
import 'package:first_flutter_project/features/home/widgets/image_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          l10n.appTitle,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
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
