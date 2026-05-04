import 'package:flutter/material.dart';

class AccountTypeProvider extends ChangeNotifier {
  int _selectedIndex = -1;

  int get selectedIndex => _selectedIndex;

  void selectAccount(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
