import 'package:first_flutter_project/l10n/app_localizations.dart';

class Validators {
  static String? validateFullName(String? value, AppLocalizations l10n) {
    if (value == null || value.trim().isEmpty) {
      return l10n.fullNameRequired;
    }

    return null;
  }

  static String? validateEmail(String? value, AppLocalizations l10n) {
    if (value == null || value.trim().isEmpty) {
      return l10n.emailRequired;
    }

    final emailRegex = RegExp(r'^[\w.-]+@[\w.-]+\.[A-Za-z]{2,}$');

    if (!emailRegex.hasMatch(value.trim())) {
      return l10n.invalidEmail;
    }

    return null;
  }

  static String? validatePassword(String? value, AppLocalizations l10n) {
    if (value == null || value.isEmpty) {
      return l10n.passwordRequired;
    }

    if (value.length < 6) {
      return l10n.passwordMinLength;
    }

    return null;
  }

  static String? validateConfirmPassword(
    String? value,
    String password,
    AppLocalizations l10n,
  ) {
    if (value == null || value.isEmpty) {
      return l10n.confirmPasswordRequired;
    }

    if (value != password) {
      return l10n.passwordsDoNotMatch;
    }

    return null;
  }
}
