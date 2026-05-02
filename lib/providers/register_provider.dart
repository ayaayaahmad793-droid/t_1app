import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  String name = '';
  String email = '';
  String phone = '';
  String password = '';
  bool agree = false;

  // Errors (للـ validation)
  String? nameError;
  String? emailError;
  String? phoneError;
  String? passwordError;

  void setName(String val) {
    name = val;
    nameError = null;
    notifyListeners();
  }

  void setEmail(String val) {
    email = val;
    emailError = null;
    notifyListeners();
  }

  void setPhone(String val) {
    phone = val;
    phoneError = null;
    notifyListeners();
  }

  void setPassword(String val) {
    password = val;
    passwordError = null;
    notifyListeners();
  }

  void toggleAgree(bool val) {
    agree = val;
    notifyListeners();
  }

  // 🔥 Validation
  bool validate() {
    bool isValid = true;

    if (name.isEmpty) {
      nameError = "ادخلي الاسم";
      isValid = false;
    }

    if (email.isEmpty || !email.contains("@")) {
      emailError = "ايميل غير صالح";
      isValid = false;
    }

    if (phone.isEmpty) {
      phoneError = "ادخلي رقم الهاتف";
      isValid = false;
    }

    if (password.length < 6) {
      passwordError = "كلمة المرور ضعيفة";
      isValid = false;
    }

    if (!agree) {
      print("يجب الموافقة على الشروط");
      isValid = false;
    }

    notifyListeners();
    return isValid;
  }
}
