import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginProvider extends ChangeNotifier {
  String email = '';
  String password = '';
  bool rememberMe = false;
  bool isLoading = false;

  String? emailError;
  String? passwordError;

  Future<bool> loginUser() async {
    // 1. التحقق من البيانات محلياً أولاً
    if (!validate()) return false;

    isLoading = true;
    notifyListeners();

    try {
      final supabase = Supabase.instance.client;

      // 2. إرسال الطلب لـ Supabase
      await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      isLoading = false;
      notifyListeners();
      return true; // نجاح العملية
    } on AuthException catch (e) {
      // 3. التعامل مع أخطاء Supabase
      if (e.message.contains("Invalid login credentials")) {
        emailError = "البريد أو كلمة المرور غير صحيحة";
      } else {
        emailError = e.message;
      }
      isLoading = false;
      notifyListeners();
      return false;
    } catch (e) {
      isLoading = false;
      notifyListeners();
      return false;
    }
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
