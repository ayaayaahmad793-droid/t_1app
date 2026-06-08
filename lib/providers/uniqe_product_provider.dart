import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:t_1app/models/UniqeProduct_model.dart';

class UniqeProductProvider extends ChangeNotifier {
  final List<UniqeProductItem> _allProducts = List.from(products);

  List<UniqeProductItem> filteredProducts = [];

  String selectedText = "الكل";
  String searchText = "";

  UniqeProductProvider() {
    filteredProducts = List.from(_allProducts);
    loadFavorites();
  }

  /// فلترة موحدة
  void _applyFilters() {
    filteredProducts =
        _allProducts.where((item) {
          final matchesSearch =
              searchText.isEmpty ||
              item.product.productName.toLowerCase().contains(
                searchText.toLowerCase(),
              );

          final matchesCategory =
              selectedText == "الكل" || item.category == selectedText;

          return matchesSearch && matchesCategory;
        }).toList();

    notifyListeners();
  }

  /// البحث
  void searchProducts(String value) {
    searchText = value;
    _applyFilters();
  }

  /// اختيار قسم
  void selectCategory(String category) {
    selectedText = category;
    _applyFilters();
  }

  /// المفضلة
  Future<void> toggleFavorite(ProductU1 product) async {
    product.isFavorite = !product.isFavorite;

    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(product.productName, product.isFavorite);

    notifyListeners();
  }

  /// تحميل المفضلة
  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    for (var item in _allProducts) {
      item.product.isFavorite =
          prefs.getBool(item.product.productName) ?? false;
    }

    _applyFilters();
  }
}
