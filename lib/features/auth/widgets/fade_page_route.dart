import 'package:flutter/material.dart';

// Fade transition for page navigation
class FadePageRoute<T> extends PageRouteBuilder<T> {
  FadePageRoute({required Widget page})
    : super(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 400),
      );
}
