import 'package:flutter/material.dart';
import 'package:t_1app/models/notification_model.dart';

class NotificationProvider extends ChangeNotifier {
  String selectedCategory = "الكل";

  final List<NotificationItem> todayNotificationsData = [
    NotificationItem(
      icon: "🛒",
      title: "تم تأكيد طلبك بنجاح! انتظر تحديثات الشراء من متجرنا المحلي ❤️",
      time: "08:30 صباحاً",
      category: "شراء",
    ),

    NotificationItem(
      icon: "💬",
      title: "البائع رد على استفسارك حول المنتج، اطلع على التفاصيل الآن.",
      time: "09:30 مساءً",
      category: "بيع",
    ),

    NotificationItem(
      icon: "💬",
      title: "تم استلام تبرعك بنجاح، جزاك الله خيرًا 💕",
      time: "09:30 مساءً",
      category: "تبرع",
    ),
  ];

  final List<NotificationItem> oldNotificationsData = [
    NotificationItem(
      icon: "🛒",
      title: "تمت الموافقة على طلب التبادل، يمكنك التواصل مع الطرف الآخر الآن.",
      time: "08:30 صباحاً",
      category: "تبادل",
    ),

    NotificationItem(
      icon: "💬",
      title: "تمت عملية الدفع بنجاح، نتمنى لك تجربة تسوق مميزة",
      time: "09:30 مساءً",
      category: "شراء",
    ),
  ];

  void selectCategory(String category) {
    selectedCategory = category;
    notifyListeners();
  }

  List<NotificationItem> get todayNotifications {
    if (selectedCategory == "الكل") {
      return todayNotificationsData;
    }

    return todayNotificationsData.where((item) {
      return item.category == selectedCategory;
    }).toList();
  }

  List<NotificationItem> get oldNotifications {
    if (selectedCategory == "الكل") {
      return oldNotificationsData;
    }

    return oldNotificationsData.where((item) {
      return item.category == selectedCategory;
    }).toList();
  }
}
