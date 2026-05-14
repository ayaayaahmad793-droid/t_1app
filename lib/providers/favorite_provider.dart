import 'package:flutter/material.dart';
import 'package:t_1app/models/UniqeProduct_model.dart';

class FavoriteProvider extends ChangeNotifier {
  List<ProductU1> favorites = [];

  void toggleFavorite(ProductU1 product) {
    if (favorites.contains(product)) {
      favorites.remove(product);
      product.isFavorite = false;
    } else {
      favorites.add(product);
      product.isFavorite = true;
    }

    notifyListeners();
  }
}
