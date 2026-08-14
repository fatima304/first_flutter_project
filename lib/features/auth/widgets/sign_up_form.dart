import 'package:first_flutter_project/features/auth/widgets/custom_button.dart';
import 'package:first_flutter_project/features/auth/widgets/custom_text_form_field.dart';
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
          CustomTextFormField(
            label: l10n.fullName,
            validator: (value) => Validators.validateFullName(value, l10n),
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            label: l10n.email,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => Validators.validateEmail(value, l10n),
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            controller: passwordController,
            label: l10n.password,
            obscureText: isPasswordObscured,
            validator: (value) => Validators.validatePassword(value, l10n),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isPasswordObscured = !isPasswordObscured;
                });
              },
              icon: Icon(
                isPasswordObscured ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey[600],
              ),
            ),
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            label: l10n.confirmPassword,
            obscureText: isConfirmPasswordObscured,
            validator: (value) => Validators.validateConfirmPassword(
              value,
              passwordController.text,
              l10n,
            ),
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
                color: Colors.grey[600],
              ),
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: CustomElevatedButton(
              text: l10n.signUp,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  _showSuccessDialog(l10n);
                }
              },
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: Text.rich(
              TextSpan(
                text: '${l10n.haveAccount} ',
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
                children: [
                  TextSpan(
                    text: l10n.signIn,
                    style: const TextStyle(
                      color: Color(0xFF6A1B9A),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text.rich(
              TextSpan(
                text: '${l10n.termsAgreement} ',
                style: TextStyle(color: Colors.grey[500], fontSize: 12),
                children: [
                  TextSpan(
                    text: l10n.termsAndPolicy,
                    style: const TextStyle(color: Color(0xFF6A1B9A)),
                  ),
                ],
              ),
            ),
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
                  FadePageRoute(page: ShoppingScreen()),
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
