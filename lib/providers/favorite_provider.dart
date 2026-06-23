import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:t_1app/models/Home_all_model/product_model.dart' as home_model;
import 'package:t_1app/models/UniqeProduct_model.dart' as uniqe_model;

class FavoriteProvider extends ChangeNotifier {
  final List<dynamic> _favoriteProducts = [];

  List<dynamic> get favoriteProducts => _favoriteProducts;

  FavoriteProvider() {
    loadFavorites();
  }

  void toggleFavorite(dynamic product) {
    if (isFavorite(product)) {
      removeFromFavorite(product);
    } else {
      addToFavorite(product);
    }
  }

  void addToFavorite(dynamic product) {
    bool exists = _favoriteProducts.any((item) => _getProductName(item) == _getProductName(product));

    if (!exists) {
      _favoriteProducts.add(product);
      saveFavorites();
      notifyListeners();
    }
  }

  void removeFromFavorite(dynamic product) {
    _favoriteProducts.removeWhere((item) => _getProductName(item) == _getProductName(product));
    saveFavorites();
    notifyListeners();
  }

  bool isFavorite(dynamic product) {
    return _favoriteProducts.any((item) => _getProductName(item) == _getProductName(product));
  }

  String _getProductName(dynamic product) {
    if (product is home_model.Product) return product.productName;
    if (product is uniqe_model.ProductU1) return product.productName;
    return "";
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> data = _favoriteProducts.map((item) {
      if (item is home_model.Product) {
        return jsonEncode({'type': 'Product', 'data': item.toJson()});
      } else if (item is uniqe_model.ProductU1) {
        return jsonEncode({'type': 'ProductU1', 'data': item.toJson()});
      }
      return "";
    }).where((s) => s.isNotEmpty).toList();

    await prefs.setStringList('favorites_list', data);
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? data = prefs.getStringList('favorites_list');

    if (data != null) {
      _favoriteProducts.clear();
      for (String itemStr in data) {
        try {
          final Map<String, dynamic> map = jsonDecode(itemStr);
          final String type = map['type'];
          final dynamic jsonData = map['data'];

          if (type == 'Product') {
            _favoriteProducts.add(home_model.Product.fromJson(jsonData));
          } else if (type == 'ProductU1') {
            _favoriteProducts.add(uniqe_model.ProductU1.fromJson(jsonData));
          }
        } catch (e) {
          print("Error decoding fav item: $e");
        }
      }
      notifyListeners();
    }
  }
}


// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:t_1app/models/Home_all_model/product_model.dart';
// import 'package:t_1app/models/UniqeProduct_model.dart';
//
// class FavoriteProvider extends ChangeNotifier {
//   final List<dynamic> _favoriteProducts = [];
//
//   List<dynamic> get favoriteProducts => _favoriteProducts;
//
//   FavoriteProvider() {
//     loadFavorites();
//   }
//
//   void toggleFavorite(dynamic product) {
//     if (isFavorite(product)) {
//       removeFromFavorite(product);
//     } else {
//       addToFavorite(product);
//     }
//   }
//
//   void addToFavorite(dynamic product) {
//     // Check if already exists based on unique name
//     bool exists = _favoriteProducts.any((item) => _getProductName(item) == _getProductName(product));
//
//     if (!exists) {
//       _favoriteProducts.add(product);
//       saveFavorites();
//       notifyListeners();
//     }
//   }
//
//   void removeFromFavorite(dynamic product) {
//     _favoriteProducts.removeWhere((item) => _getProductName(item) == _getProductName(product));
//     saveFavorites();
//     notifyListeners();
//   }
//
//   bool isFavorite(dynamic product) {
//     return _favoriteProducts.any((item) => _getProductName(item) == _getProductName(product));
//   }
//
//   String _getProductName(dynamic product) {
//     if (product is Product) return product.productName;
//     if (product is ProductU1) return product.productName;
//     if (product is Map) return product['productName'] ?? '';
//     return "";
//   }
//
//   Future<void> saveFavorites() async {
//     final prefs = await SharedPreferences.getInstance();
//     List<String> data = _favoriteProducts.map((item) {
//       if (item is Product) {
//         return jsonEncode({'type': 'Product', 'data': item.toJson()});
//       } else if (item is ProductU1) {
//         return jsonEncode({'type': 'ProductU1', 'data': item.toJson()});
//       }
//       return "";
//     }).where((s) => s.isNotEmpty).toList();
//
//     await prefs.setStringList('favorites_list', data);
//   }
//
//   Future<void> loadFavorites() async {
//     final prefs = await SharedPreferences.getInstance();
//     List<String>? data = prefs.getStringList('favorites_list');
//
//     if (data != null) {
//       _favoriteProducts.clear();
//       for (String itemStr in data) {
//         final Map<String, dynamic> map = jsonDecode(itemStr);
//         final String type = map['type'];
//         final dynamic jsonData = map['data'];
//
//         if (type == 'Product') {
//           _favoriteProducts.add(Product.fromJson(jsonData));
//         } else if (type == 'ProductU1') {
//           _favoriteProducts.add(ProductU1.fromJson(jsonData));
//         }
//       }
//       notifyListeners();
//     }
//   }
// }
