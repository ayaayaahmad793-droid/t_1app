import 'package:get/get.dart';
import 'package:t_1app/screens/Log.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PersonController extends GetxController {
  final _supabase = Supabase.instance.client;

  var userName = "جاري التحميل...".obs;
  var userEmail = "".obs;
  var userPhone = "".obs;

  // حالة الإشعارات
  var isNotificationsEnabled = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final user = _supabase.auth.currentUser;
    if (user != null) {
      userEmail.value = user.email ?? "";
      
      // محاولة جلب الاسم من metadata أولاً
      final fullName = user.userMetadata?['full_name'];
      final phone = user.userMetadata?['phone'];
      
      if (fullName != null) userName.value = fullName;
      if (phone != null) userPhone.value = phone;

      // ثم محاولة الجلب من جدول profiles للتأكد من أحدث البيانات
      try {
        final data = await _supabase
            .from('profiles')
            .select('full_name, phone')
            .eq('id', user.id)
            .maybeSingle();

        if (data != null) {
          if (data['full_name'] != null) userName.value = data['full_name'];
          if (data['phone'] != null) userPhone.value = data['phone'];
        }
      } catch (e) {
        print("Error fetching profile: $e");
      }
    }
  }

  // دالة تغيير حالة الإشعارات
  void toggleNotifications(bool value) {
    isNotificationsEnabled.value = value;
  }

  // دالة تسجيل الخروج
  Future<void> logout() async {
    await _supabase.auth.signOut();
    Get.offAll(() => Log());
  }
}
