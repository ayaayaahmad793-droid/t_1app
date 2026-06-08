import 'package:flutter/material.dart';
import 'package:t_1app/models/Home_all_model/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProductProvider extends ChangeNotifier {
  /// البيانات الأصلية
  final List<Product> _allOffers = [
    Product(
      productName: "فستان قصير",
      shopName: "متجر الأناقة",
      price: 10,
      oldPrice: 20,
      evaluation: 4.5,
      productImage: "images/hp2.png",
    ),

    Product(
      productName: "فراشي مكياج",
      shopName: "هلا كوزمتكس",
      price: 5,
      oldPrice: 10,
      evaluation: 4.5,
      productImage: "images/hp1.png",
    ),
  ];

  final List<Product> _allNewProducts = [
    Product(
      productName: "بوت ابيض مع كعب داخلي",
      shopName: "سما شوز",
      price: 15,
      oldPrice: 25,
      evaluation: 4.2,
      productImage: "images/hp4.png",
    ),

    Product(
      productName: "جزمة برتقالية",
      shopName: "الغمري شوز",
      price: 15,
      oldPrice: 25,
      evaluation: 4.1,
      productImage: "images/hp3.png",
    ),
  ];

  final List<Product> _allPopular = [
    Product(
      productName: "شاورما مع سلطات",
      shopName: "مطعم سنابل",
      price: 5,
      oldPrice: 8,
      evaluation: 4.9,
      productImage: "images/hp6.png",
    ),

    Product(
      productName: "كلمنتينا طازجة",
      shopName: "أبو حمدة للفواكه",
      price: 6,
      oldPrice: 8,
      evaluation: 4.2,
      productImage: "images/hp5.png",
    ),
  ];

  /// القوائم الظاهرة
  List<Product> offers = [];

  List<Product> newProducts = [];

  List<Product> popular = [];

  /// constructor
  HomeProductProvider() {
    offers = List.from(_allOffers);

    newProducts = List.from(_allNewProducts);

    popular = List.from(_allPopular);
  }

  /// البحث
  void searchProducts(String value) {
    if (value.trim().isEmpty) {
      offers = List.from(_allOffers);

      newProducts = List.from(_allNewProducts);

      popular = List.from(_allPopular);
    } else {
      offers =
          _allOffers.where((product) {
            return product.productName.toLowerCase().contains(
              value.toLowerCase(),
            );
          }).toList();

      newProducts =
          _allNewProducts.where((product) {
            return product.productName.toLowerCase().contains(
              value.toLowerCase(),
            );
          }).toList();

      popular =
          _allPopular.where((product) {
            return product.productName.toLowerCase().contains(
              value.toLowerCase(),
            );
          }).toList();
    }

    notifyListeners();
  }

  /// المفضلة
  Future<void> toggleFavorite(Product product) async {
    product.isFavorite = !product.isFavorite;

    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(product.productName, product.isFavorite);

    notifyListeners();
  }
}
