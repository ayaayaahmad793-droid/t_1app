import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  // الحصول على بيانات المستخدم الحالي
  User? get currentUser => _client.auth.currentUser;

  final SupabaseClient _client = Supabase.instance.client;

  // تسجيل دخول
  Future<AuthResponse> signIn(String email, String password) async {
    return await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }


  // إنشاء حساب جديد
  Future<AuthResponse> signUpWithProfile({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  }) async {
    // نرسل الطلب لسوبابيس فقط.
    // سوبابيس سيستلم الاسم في الـ data والـ Trigger (الذي وضعناه سابقاً) سيحفظه تلقائياً.
    return await _client.auth.signUp(
      data: {'full_name': fullName},
      email: email,
      phone: phone,
      password: password,
    );
  }
  ////////////////////////

  // تسجيل خروج
  Future<void> signOut() async {
    await _client.auth.signOut();
  }

  //////////////////////////////////////////////////////////////////////////////
  // إرسال رابط إعادة تعيين كلمة المرور للإيميل
  Future<void> resetPasswordEmail(String email) async {
    await _client.auth.resetPasswordForEmail(email);
  }

// تحديث كلمة المرور الجديدة
  Future<void> updatePassword(String newPassword) async {
    await _client.auth.updateUser(
      UserAttributes(password: newPassword),
    );
  }
  ////////////////////////
// 1. إرسال رمز OTP للإيميل
  Future<void> sendOTP(String email) async {
    // هذه الدالة مرتبطة بقالب "Reset Password" الذي قمتِ بتعديله في سوبابيس
    // وسوف ترسل الـ {{ .Token }} (الأرقام الستة) بدلاً من الرابط
    await _client.auth.resetPasswordForEmail(email);
  }

// 2. التحقق من صحة الرمز الذي أدخله المستخدم
  Future<bool> verifyOTP(String email, String token) async {
    try {
      final response = await _client.auth.verifyOTP(
        email: email,
        token: token,
        type: OtpType.recovery, // تأكدي من استخدام recovery وليس signup
      );
      return response.session != null;
    } catch (e) {
      print("خطأ في التحقق: $e");
      return false;
    }
  }

  /////////////////////
// Sign in with google
  Future<void> signInWithGoogle() async {
    try {
      await _client.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: 'io.supabase.flutter://callback',
      );
    } catch (e) {
      // طباعة الخطأ لمعرفة سبب قطع الاتصال
      print("Google Auth Error: $e");
      Get.snackbar("خطأ", "فشل الاتصال بجوجل: $e");
    }
  }

}