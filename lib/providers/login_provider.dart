import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  String email = '';
  String password = '';
  bool rememberMe = false;

  String? emailError;
  String? passwordError;
  bool login() {
    if (validate()) {
      return true;
    }
    return false;
  }

  void setEmail(String val) {
    email = val;
    emailError = null;
    notifyListeners();
  }

  void setPassword(String val) {
    password = val;
    passwordError = null;
    notifyListeners();
  }

  void toggleRemember(bool val) {
    rememberMe = val;
    notifyListeners();
  }

  bool validate() {
    bool isValid = true;

    if (email.isEmpty) {
      emailError = "الرجاء إدخال البريد الإلكتروني";
      isValid = false;
    } else if (!email.contains("@")) {
      emailError = "بريد إلكتروني غير صالح";
      isValid = false;
    }

    if (password.isEmpty) {
      passwordError = "الرجاء إدخال كلمة المرور";
      isValid = false;
    } else if (password.length < 6) {
      passwordError = "كلمة المرور ضعيفة";
      isValid = false;
    }

    notifyListeners();
    return isValid;
  }
}
