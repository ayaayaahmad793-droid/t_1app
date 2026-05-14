import 'package:flutter/material.dart';

class Product {
  final String name;
  final String code;
  final String price;
  final String oldPrice;
  final String image;
  final bool available;
  final String amount;

  Product({
    required this.name,
    required this.code,
    required this.price,
    required this.oldPrice,
    required this.image,
    required this.available,
    required this.amount,
  });
}

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  // 🟢 إضافة
  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  // 🟢 حذف
  void deleteProduct(int index) {
    _products.removeAt(index);
    notifyListeners();
  }

  // 🟢 تعديل
  void updateProduct(int index, Product newProduct) {
    _products[index] = newProduct;
    notifyListeners();
  }
}
