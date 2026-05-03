import 'package:flutter/material.dart';

class OtpProvider extends ChangeNotifier {
  List<String> otp = ["", "", "", ""];

  String? error;

  void setDigit(int index, String value) {
    otp[index] = value;
    error = null;
    notifyListeners();
  }

  String getCode() {
    return otp.join();
  }

  bool validate() {
    if (otp.any((e) => e.isEmpty)) {
      error = "ادخلي الرمز كامل";
      notifyListeners();
      return false;
    }
    return true;
  }

  void clear() {
    otp = ["", "", "", ""];
    notifyListeners();
  }
}
