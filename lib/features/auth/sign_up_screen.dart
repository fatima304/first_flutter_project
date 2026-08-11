import 'package:first_flutter_project/features/auth/widgets/sign_up_form.dart';
import 'package:first_flutter_project/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.signUp)),
      body: const Padding(padding: EdgeInsets.all(16), child: SignUpForm()),
    );
  }
}
