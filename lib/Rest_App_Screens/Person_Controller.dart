import 'package:get/get.dart';

class PersonController extends GetxController {
  // بيانات المستخدم (يمكن استبدالها ببيانات حقيقية من API لاحقاً)
  var userName = "اية".obs;
  var userEmail = "aya_ahmed@email.com".obs;
  var userPhone = "+59 23459876".obs;

  // حالة الإشعارات
  var isNotificationsEnabled = true.obs;

  // دالة تغيير حالة الإشعارات
  void toggleNotifications(bool value) {
    isNotificationsEnabled.value = value;
  }

  // دالة تسجيل الخروج
  void logout() {
    // ضعي هنا كود تسجيل الخروج (مثل حذف التوكن أو الانتقال لصفحة الدخول)
    Get.offAllNamed('/login'); // مثال
  }
}