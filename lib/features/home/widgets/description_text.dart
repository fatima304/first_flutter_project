import 'package:first_flutter_project/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
  const DescriptionText({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Text(
      l10n.imagesDisplayed,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1A237E),
        fontFamily: 'Suwannaphum',
      ),
    );
  }
}
