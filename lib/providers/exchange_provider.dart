import 'package:flutter/material.dart';
import 'package:t_1app/models/exchangeItem.dart';

class ExchangeProvider extends ChangeNotifier {
  final List<ExchangeItem> _exchangeList = List.from(items);

  String _searchText = '';

  // القائمة النهائية المعروضة بعد البحث
  List<ExchangeItem> get exchangeList {
    if (_searchText.isEmpty) {
      return _exchangeList;
    }

    return _exchangeList.where((item) {
      return item.title.toLowerCase().contains(_searchText.toLowerCase()) ||
          item.description.toLowerCase().contains(_searchText.toLowerCase());
    }).toList();
  }

  // تحديث نص البحث
  void updateSearch(String value) {
    _searchText = value;

    notifyListeners();
  }

  // إضافة منتج جديد
  void addItem(ExchangeItem item) {
    _exchangeList.insert(0, item);

    notifyListeners();
  }
}
