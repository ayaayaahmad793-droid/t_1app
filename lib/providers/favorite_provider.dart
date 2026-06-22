import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<dynamic> _favoriteProducts = [];
  final _supabase = Supabase.instance.client;

  List<dynamic> get favoriteProducts => _favoriteProducts;

  FavoriteProvider() {
    fetchFavorites();
  }

  Future<void> fetchFavorites() async {
    final user = _supabase.auth.currentUser;
    if (user == null) return;

    try {
      final data = await _supabase
          .from('favorites')
          .select('product_data')
          .eq('user_id', user.id);

      _favoriteProducts.clear();
      for (var item in data) {
        _favoriteProducts.add(item['product_data']);
      }
      notifyListeners();
    } catch (e) {
      print("Error fetching favorites: $e");
    }
  }

  Future<void> addToFavorite(dynamic product) async {
    final user = _supabase.auth.currentUser;
    if (user == null) return;

    if (!_favoriteProducts.contains(product)) {
      _favoriteProducts.add(product);
      notifyListeners();

      try {
        await _supabase.from('favorites').insert({
          'user_id': user.id,
          'product_data': product,
        });
      } catch (e) {
        print("Error saving favorite: $e");
      }
    }
  }

  Future<void> removeFromFavorite(dynamic product) async {
    final user = _supabase.auth.currentUser;
    if (user == null) return;

    _favoriteProducts.remove(product);
    notifyListeners();

    try {
      // Assuming product has an 'id' or we match the whole data
      // For simplicity, matching the whole product_data or a unique field if available
      await _supabase
          .from('favorites')
          .delete()
          .eq('user_id', user.id)
          .eq('product_data', product);
    } catch (e) {
      print("Error removing favorite: $e");
    }
  }

  bool isFavorite(dynamic product) {
    return _favoriteProducts.any((item) => item.toString() == product.toString());
  }
}
