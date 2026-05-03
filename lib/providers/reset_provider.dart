import 'package:flutter/material.dart';

class ResetProvider extends ChangeNotifier {
  String password = '';
  String confirmPassword = '';

  String? passwordError;
  String? confirmError;

  void setPassword(String val) {
    password = val;
    passwordError = null;
    notifyListeners();
  }

  void setConfirmPassword(String val) {
    confirmPassword = val;
    confirmError = null;
    notifyListeners();
  }

  bool validate() {
    bool isValid = true;

    passwordError = null;
    confirmError = null;

    if (password.isEmpty) {
      passwordError = "ادخلي كلمة المرور";
      isValid = false;
    } else if (password.length < 6) {
      passwordError = "كلمة المرور ضعيفة";
      isValid = false;
    }

    if (confirmPassword.isEmpty) {
      confirmError = "ادخلي تأكيد كلمة المرور";
      isValid = false;
    } else if (confirmPassword != password) {
      confirmError = "كلمة المرور غير متطابقة";
      isValid = false;
    }

    notifyListeners();
    return isValid;
  }
}
