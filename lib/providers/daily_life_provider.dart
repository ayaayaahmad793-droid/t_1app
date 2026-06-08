import 'package:flutter/material.dart';

class DailyLifeProvider extends ChangeNotifier {
  String selectedText = "الكل";
  String searchText = "";

  void selectCategory(String category) {
    selectedText = category;
    notifyListeners();
  }

  void updateSearch(String value) {
    searchText = value;
    notifyListeners();
  }
}
