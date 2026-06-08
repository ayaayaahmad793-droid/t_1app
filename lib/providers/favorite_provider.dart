import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<dynamic> _favoriteProducts = [];

  List<dynamic> get favoriteProducts => _favoriteProducts;

  void addToFavorite(dynamic product) {
    if (!_favoriteProducts.contains(product)) {
      _favoriteProducts.add(product);

      notifyListeners();
    }
  }

  void removeFromFavorite(dynamic product) {
    _favoriteProducts.remove(product);

    notifyListeners();
  }

  bool isFavorite(dynamic product) {
    return _favoriteProducts.contains(product);
  }
}
