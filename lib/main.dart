// import 'package:first_flutter_project/features/shopping/shopping_screen.dart';
import 'package:first_flutter_project/features/auth/sign_up_screen.dart';
import 'package:flutter/material.dart';
// import 'package:first_flutter_project/features/home/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:first_flutter_project/l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ar')],
      theme: ThemeData(fontFamily: 'Suwannaphum'),
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
    );
  }
}
