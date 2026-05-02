import 'package:flutter/material.dart';

class ForgotProvider extends ChangeNotifier {
  String email = '';
  String phone = '';

  String? emailError;
  String? phoneError;

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

bool validate() {
    bool isValid = true;

    emailError = null;
    phoneError = null;

    // إذا الاثنين فاضيين
    if (email.isEmpty && phone.isEmpty) {
      emailError = "ادخلي ايميل او رقم";
      phoneError = "ادخلي ايميل او رقم";
      isValid = false;
    }

    // إذا كتب إيميل → تحقق منه
    if (email.isNotEmpty && !email.contains("@")) {
      emailError = "ايميل غير صالح";
      isValid = false;
    }

    //  إذا كتب رقم → تحقق منه
    if (phone.isNotEmpty && phone.length < 9) {
      phoneError = "رقم غير صحيح";
      isValid = false;
    }

    notifyListeners();
    return isValid;
  }
}
