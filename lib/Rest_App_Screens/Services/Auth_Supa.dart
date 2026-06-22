import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  final SupabaseClient _client = Supabase.instance.client;

  Future<AuthResponse> signIn(String email, String password) async =>
      await _client.auth.signInWithPassword(email: email, password: password);

  // Future<AuthResponse> signUp({required String email, required String password, required Map<String, dynamic> data}) async =>
  //     await _client.auth.signUp(email: email, password: password, data: data);

  Future<AuthResponse> signUp({required String email, required String password, required Map<String, dynamic> data}) async =>
      await _client.auth.signUp(email: email, password: password, data: data);

  Future<void> signOut() async => await _client.auth.signOut();

  // تعديل جوهري: نستخدم signInWithOtp بدلاً من resetPasswordForEmail
  Future<void> sendResetEmail(String email) async {
    try {
      print("جاري محاولة إرسال الكود لـ: $email");
      await _client.auth.signInWithOtp(
        email: email,
        emailRedirectTo: null,
      );
      print("تم الاتصال بسوبابيس بنجاح، يرجى فحص الإيميل");
    } on AuthException catch (e) {
      print("خطأ من سوبابيس: ${e.message}");
    } catch (e) {
      print("خطأ غير متوقع: $e");
    }
  }

  // ملاحظة: بما أننا نستخدم signInWithOtp، نوع الـ OTP هنا سيكون verify
// في ملف AuthService.dart
// في ملف AuthService.dart - استبدلي الدالة الحالية بهذه الدالة
  Future<bool> verifyOTP(String email, String token) async {
    try {
      // التغيير الجوهري هنا: استخدام OtpType.email بدلاً من magiclink
      final response = await _client.auth.verifyOTP(
        type: OtpType.magiclink,
        token: token,
        email: email,
      );

      // طباعة النتيجة للـ Debugging
      print("نتيجة التحقق: ${response.session != null}");
      return response.session != null;
    } catch (e) {
      print("خطأ التحقق في سوبابيس: $e");
      return false;
    }
  }

  Future<void> updatePassword(String newPassword) async {
    await _client.auth.updateUser(
      UserAttributes(password: newPassword),
    );
  }
}