import 'package:first_flutter_project/features/auth/widgets/fade_page_route.dart';
import 'package:first_flutter_project/features/auth/widgets/validators.dart';
import 'package:first_flutter_project/features/shopping/shopping_screen.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_project/l10n/app_localizations.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final formKey = GlobalKey<FormState>();
  bool isPasswordObscured = true;
  bool isConfirmPasswordObscured = true;
  final passwordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              return Validators.validateFullName(value, l10n);
            },
            decoration: InputDecoration(
              labelText: l10n.fullName,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            validator: (value) {
              return Validators.validateEmail(value, l10n);
            },
            decoration: InputDecoration(
              labelText: l10n.email,
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: passwordController,
            obscureText: isPasswordObscured,
            validator: (value) {
              return Validators.validatePassword(value, l10n);
            },
            decoration: InputDecoration(
              labelText: l10n.password,
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isPasswordObscured = !isPasswordObscured;
                  });
                },
                icon: Icon(
                  isPasswordObscured ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            obscureText: isConfirmPasswordObscured,
            validator: (value) {
              return Validators.validateConfirmPassword(
                value,
                passwordController.text,
                l10n,
              );
            },
            decoration: InputDecoration(
              labelText: l10n.confirmPassword,
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isConfirmPasswordObscured = !isConfirmPasswordObscured;
                  });
                },
                icon: Icon(
                  isConfirmPasswordObscured
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                _showSuccessDialog(l10n);
              }
            },
            child: Text(l10n.signUp),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog(AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(l10n.success),
          content: Text(l10n.accountCreatedSuccessfully),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  FadePageRoute(page: const ShoppingScreen()),
                );
              },
              child: Text(l10n.ok),
            ),
          ],
        );
      },
    );
  }
}
