import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t_1app/Rest_App_Screens/Services/SupabaseService.dart';

class RegisterProvider extends ChangeNotifier {
  bool isLoading = false;

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
      passwordError = "كلمة المرور ضعيفة (6 خانات على الأقل)";
      isValid = false;
    }

    if (!agree) {
      print("يجب الموافقة على الشروط");
      isValid = false;
    }

    notifyListeners();
    return isValid;
  }

  Future<bool> signUpUser(BuildContext context) async {
    if (!validate()) return false;

    isLoading = true;
    notifyListeners();

    try {
      final supabase = Supabase.instance.client;

      // 1. إنشاء الحساب في المصادقة (Auth)
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          'full_name': name,
          'phone': phone,
        },
      );

      // 2. المزامنة وإضافة البيانات لجدول profiles باستخدام الخدمة الجديدة
      if (response.user != null) {
        await SupabaseService().createUserProfile(
          userId: response.user!.id,
          fullName: name,
          phone: phone,
          accountType: 0, // القيمة الافتراضية
        );
      }

      isLoading = false;
      notifyListeners();
      return response.user != null;

    } on AuthException catch (e) {
      emailError = e.message;
      isLoading = false;
      notifyListeners();
      return false;
    } catch (e) {
      print("Registration error: $e");
      isLoading = false;
      notifyListeners();
      return false;
    }
  }
  // Future<bool> signUpUser(BuildContext context) async {
  //   if (!validate()) return false;
  //
  //   isLoading = true;
  //   notifyListeners();
  //
  //   try {
  //     final supabase = Supabase.instance.client;
  //
  //     // 1. إنشاء الحساب في المصادقة (Auth)
  //     final response = await supabase.auth.signUp(
  //       email: email,
  //       password: password,
  //       data: {
  //         'full_name': name,
  //         'phone': phone,
  //       },
  //     );
  //
  //     // 2. إذا تم إنشاء الحساب بنجاح في الـ Auth، نقوم بإضافة البروفايل يدوياً
  //     if (response.user != null) {
  //       await supabase.from('profiles').insert({
  //         'id': response.user!.id,
  //         'full_name': name,
  //         'phone': phone,
  //         'account_type': 0, // تأكدي من كتابتها هكذا
  //       });
  //
  //         // استدعاء الخدمة لحفظ بيانات البروفايل الأساسية بدلاً من كتابتها مباشرة
  //         await SupabaseService().createUserProfile(
  //           userId: response.user!.id,
  //           fullName: name,
  //           phone: phone,
  //           accountType: 0,
  //         );
  //     }
  //
  //     isLoading = false;
  //     notifyListeners();
  //     return response.user != null;
  //
  //   } on AuthException catch (e) {
  //     emailError = e.message;
  //     isLoading = false;
  //     notifyListeners();
  //     return false;
  //   } catch (e) {
  //     print("Registration error: $e");
  //     isLoading = false;
  //     notifyListeners();
  //     return false;
  //   }
  // }

}
