import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:t_1app/models/order_model.dart';

class OrderProvider extends ChangeNotifier {
  OrderModel? order;

  OrderProvider() {
    loadOrder();
  }

  void createOrder(OrderModel newOrder) {
    order = newOrder;
    saveOrder();
    notifyListeners();
  }

  Future<void> saveOrder() async {
    final prefs = await SharedPreferences.getInstance();

    if (order != null) {
      await prefs.setString('saved_order', jsonEncode(order!.toJson()));
    }
  }

  Future<void> loadOrder() async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getString('saved_order');

    if (data != null) {
      order = OrderModel.fromJson(jsonDecode(data));

      notifyListeners();
    }
  }

  Future<void> clearOrder() async {
    order = null;

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('saved_order');

    notifyListeners();
  }
}
