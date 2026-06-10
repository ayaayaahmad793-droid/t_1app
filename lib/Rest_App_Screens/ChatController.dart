import 'package:get/get.dart';

class ChatController extends GetxController {
  // القائمة الأصلية
  var chatList = <Map<String, dynamic>>[].obs;
  // القائمة التي سنعرضها (المفلترة)
  var filteredList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    // إضافة بيانات تجريبية عند التشغيل
    chatList.add({"id": "1", "name": "خدمة العملاء", "message": "أهلاً بك، كيف يمكننا مساعدتك؟", "time": "10:00 ص"});
    chatList.add({"id": "2", "name": "noor matar", "message": "مرحبا، هل الطلب جاهز؟", "time": "09:30 ص"});

    // عند البداية، تكون القائمة المفلترة هي نفس القائمة الأصلية
    filteredList.assignAll(chatList);
  }

  // دالة البحث
  void filterChats(String query) {
    if (query.isEmpty) {
      filteredList.assignAll(chatList);
    } else {
      filteredList.assignAll(chatList.where((chat) =>
          chat["name"].toString().toLowerCase().contains(query.toLowerCase())
      ).toList());
    }
  }

  // قاموس الرسائل لكل مستخدم
  var allMessages = <String, RxList<Map<String, String>>>{
    "1": [{"sender": "other", "text": "أهلاً بك في خدمة العملاء، كيف يمكننا مساعدتك؟"}].obs,
    "2": [{"sender": "other", "text": "مرحبا، هل الطلب جاهز؟"}].obs,
  }.obs;

  void sendMessage(String chatId, String text) {
    if (text.trim().isNotEmpty) {
      if (!allMessages.containsKey(chatId)) {
        allMessages[chatId] = <Map<String, String>>[].obs;
      }
      allMessages[chatId]!.add({"sender": "me", "text": text});
    }
  }

  RxList<Map<String, String>> getMessages(String chatId) {
    return allMessages[chatId] ?? <Map<String, String>>[].obs;
  }
}