import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:t_1app/models/notification_model.dart';

class NotificationProvider extends ChangeNotifier {
  String selectedCategory = "الكل";

  List<NotificationItem> todayNotificationsData = [];

  List<NotificationItem> oldNotificationsData = [];

  NotificationProvider() {
    loadNotifications();
  }

  void selectCategory(String category) {
    selectedCategory = category;
    notifyListeners();
  }

  void addNotification(NotificationItem item) {
    todayNotificationsData.insert(0, item);

    saveNotifications();

    notifyListeners();
  }

  List<NotificationItem> get todayNotifications {
    if (selectedCategory == "الكل") {
      return todayNotificationsData;
    }

    return todayNotificationsData
        .where((item) => item.category == selectedCategory)
        .toList();
  }

  List<NotificationItem> get oldNotifications {
    if (selectedCategory == "الكل") {
      return oldNotificationsData;
    }

    return oldNotificationsData
        .where((item) => item.category == selectedCategory)
        .toList();
  }

  Future<void> saveNotifications() async {
    final prefs = await SharedPreferences.getInstance();

    final today = todayNotificationsData.map((e) => e.toJson()).toList();

    final old = oldNotificationsData.map((e) => e.toJson()).toList();

    await prefs.setString("today_notifications", jsonEncode(today));

    await prefs.setString("old_notifications", jsonEncode(old));
  }

  Future<void> loadNotifications() async {
    final prefs = await SharedPreferences.getInstance();

    final todayData = prefs.getString("today_notifications");

    final oldData = prefs.getString("old_notifications");

    if (todayData != null) {
      final decoded = jsonDecode(todayData) as List;

      todayNotificationsData =
          decoded.map((e) => NotificationItem.fromJson(e)).toList();
    } else {
      todayNotificationsData = [
        NotificationItem(
          icon: "🛒",
          title:
              "تم تأكيد طلبك بنجاح! انتظر تحديثات الشراء من متجرنا المحلي ❤️",
          time: "08:30 صباحاً",
          category: "شراء",
        ),
      ];
    }

    if (oldData != null) {
      final decoded = jsonDecode(oldData) as List;

      oldNotificationsData =
          decoded.map((e) => NotificationItem.fromJson(e)).toList();
    }

    notifyListeners();
  }
}
