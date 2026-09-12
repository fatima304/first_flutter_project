import 'package:first_flutter_project/features/auth/sign_up_screen.dart';
import 'package:first_flutter_project/features/auth/widgets/custom_button.dart';
import 'package:first_flutter_project/features/auth/widgets/custom_text_form_field.dart';
import 'package:first_flutter_project/features/auth/widgets/validators.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_project/l10n/app_localizations.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  bool isPasswordObscured = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
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
            label: l10n.email,
            controller: emailController,
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
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: CustomElevatedButton(text: l10n.login, onPressed: () {}),
          ),
          const SizedBox(height: 24),
          Center(
            child: Text.rich(
              TextSpan(
                text: '${l10n.dontHaveAccount} ',
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                    text: l10n.signUp,
                    style: const TextStyle(
                      color: Color(0xFF6A1B9A),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
