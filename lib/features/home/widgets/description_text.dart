import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
  const DescriptionText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'The two images are displayed',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1A237E),
      ),
    );
  }
}
