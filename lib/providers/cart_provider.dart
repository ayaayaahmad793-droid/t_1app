import 'package:flutter/material.dart';
import 'package:t_1app/models/cart_model.dart';

class CartProvider extends ChangeNotifier {
  final List<CartModel> _cartItems = List.from(cartProduct);

  List<CartModel> get cartItems => _cartItems;

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
    notifyListeners();
  }

  /// إنقاص الكمية
  void decreaseQuantity(CartModel product) {
    if (product.quantity > 1) {
      product.quantity--;
      notifyListeners();
    }
  }

  /// حذف منتج
  void removeItem(CartModel product) {
    _cartItems.remove(product);
    notifyListeners();
  }
}
