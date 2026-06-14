import 'package:flutter/material.dart';
import 'package:t_1app/models/cart_model.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider extends ChangeNotifier {
  
  final List<CartModel> _cartItems = [];

  List<CartModel> get cartItems => _cartItems;
   CartProvider() {
    loadCart();
  }

  double get subtotal {
    return _cartItems.fold(
      0,
      (sum, item) => sum + (item.productPrice * item.quantity),
    );
  }

  double get deliveryFee => 30;

  double get total => subtotal + deliveryFee;

  /// زيادة الكمية
  void increaseQuantity(CartModel product) {
    product.quantity++;
    saveCart();
    notifyListeners();
  }

  /// إنقاص الكمية
  void decreaseQuantity(CartModel product) {
    if (product.quantity > 1) {
      product.quantity--;
      saveCart();
      notifyListeners();
    }
  }

  /// حذف منتج
  void removeItem(CartModel product) {
    _cartItems.remove(product);
    saveCart();
    notifyListeners();
  }
  void clearCart() {
    _cartItems.clear();
    saveCart();
    notifyListeners();
  }
  void addToCart(CartModel product) {
    final index = _cartItems.indexWhere(
      (item) => item.productName == product.productName,
    );

    if (index != -1) {
      _cartItems[index].quantity += product.quantity;
    } else {
      _cartItems.add(product);
    }
saveCart();
    notifyListeners();
  }
  Future<void> saveCart() async {
    final prefs = await SharedPreferences.getInstance();

    final data = _cartItems.map((item) => item.toJson()).toList();

    await prefs.setString('cart_items', jsonEncode(data));
  }
  Future<void> loadCart() async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getString('cart_items');

    if (data != null) {
      final decoded = jsonDecode(data) as List;

      _cartItems.clear();

      _cartItems.addAll(decoded.map((item) => CartModel.fromJson(item)));
    } else {
      _cartItems.addAll(cartProduct);
    }

    notifyListeners();
  }
}
