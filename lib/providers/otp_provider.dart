import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/Rest_App_Screens/Services/Auth_Supa.dart';

class OtpProvider extends ChangeNotifier {
  List<String> otp = List.generate(6, (_) => "");

  String? error;

  Future<bool> verifyCodeWithAuth(BuildContext context, String email, List<TextEditingController> controllers) async {
    String code = controllers.map((c) => c.text).join();
    if (code.length != 6) return false;

    return await context.read<AuthService>().verifyOTP(email, code);
  }

  void setDigit(int index, String value) {
    if (index >= 0 && index < otp.length) {
      otp[index] = value;
      error = null;
      notifyListeners();
    }
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
    otp = List.generate(6, (_) => "");
    notifyListeners();
  }
}
