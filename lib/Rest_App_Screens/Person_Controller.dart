import 'package:get/get.dart';
import 'package:t_1app/screens/Log.dart';

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
    Get.off(()=>Log());
  }
}