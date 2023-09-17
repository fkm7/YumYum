import 'package:delmer/res/text.dart';

class FormValidators {
  static String? phoneValidator(String? phoneNumber) {
    final pattern = RegExp(
        r'^\s*(?:\+?(\d{1,3}))?([-. (]*(\d{3})[-. )]*)?((\d{3})[-. ]*(\d{2,4})(?:[-.x ]*(\d+))?)\s*$',);
    return pattern.hasMatch(phoneNumber ?? '')
        ? null
        : AppText.phoneNumberValidationText;
  }

  static String? emailValidator(String? email) {
    final pattern = RegExp(r'\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b');
    return pattern.hasMatch(email ?? '') ? null : AppText.emailValidationText;
  }

  static String? passwordValidator(String? password) {
    final pattern =
        RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$');
    return pattern.hasMatch(password ?? '')
        ? null
        : AppText.passwordValidationText;
  }

  static String nameValidator(String? fullName) {
    return fullName?.isEmpty ?? true ? AppText.nameValidationText : '';
  }
}

class CardValidators {
  static String? nameValidator(String? fullName) {
    return AppText.cardNameValidationText;
  }

  static String? cardNumberValidator(String? cardNumber) {
    var tempHolder = cardNumber?.replaceAll(' ', '');
    if ((tempHolder?.length ?? 0) < 16) {
      return AppText.cardNumberValidationText;
    }
    return null;
  }

  static String? monthAndYearValidator(String? monthAndYear) {
    return AppText.monthAndYearValidationText;
  }

  static String? cvvValidator(String? cvv) {
    if ((cvv?.length ?? 0) < 3) {
      return AppText.cvvTooShortText;
    }
    return null;
  }
}
