import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterProvider extends ChangeNotifier {


  bool isLoading = false;

  Future<bool> signUpUser(BuildContext context) async {
    // 1. التأكد من الـ Validation أولاً
    if (!validate()) return false;

    isLoading = true;
    notifyListeners();

    try {
      final supabase = Supabase.instance.client;

      // 2. إرسال طلب التسجيل لـ Supabase
      await supabase.auth.signUp(
        email: email,
        password: password,
        data: {'full_name': name, 'phone': phone}, // إرسال بيانات إضافية
      );

      isLoading = false;
      notifyListeners();
      return true; // تم التسجيل بنجاح
    } on AuthException catch (e) {
      // 3. معالجة الأخطاء (مثلاً: الإيميل مسجل مسبقاً)
      emailError = e.message;
      isLoading = false;
      notifyListeners();
      return false;
    } catch (e) {
      isLoading = false;
      notifyListeners();
      return false;
    }
  }
  //////////////////////////////////////////////////////////////////////////////
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
