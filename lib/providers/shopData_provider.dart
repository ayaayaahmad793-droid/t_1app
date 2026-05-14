import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShopProvider extends ChangeNotifier {
  String _name = "";
  String _category = "";
  String _location = "";
  String _phone = "";
  File? _image;

  // getters
  String get name => _name;
  String get category => _category;
  String get location => _location;
  String get phone => _phone;
  File? get image => _image;

  // setters
  void setName(String value) {
    _name = value;
    saveData();
    notifyListeners();
  }

  void setCategory(String value) {
    _category = value;
    saveData();
    notifyListeners();
  }

  void setLocation(String value) {
    _location = value;
    saveData();
    notifyListeners();
  }

  void setPhone(String value) {
    _phone = value;
    saveData();
    notifyListeners();
  }

  void setImage(File? file) {
    _image = file;
    saveData();
    notifyListeners();
  }

  // 🟢 حفظ البيانات
  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("name", _name);
    await prefs.setString("category", _category);
    await prefs.setString("location", _location);
    await prefs.setString("phone", _phone);

    if (_image != null) {
      await prefs.setString("imagePath", _image!.path);
    }
  }

  // 🟢 تحميل البيانات
  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();

    _name = prefs.getString("name") ?? "";
    _category = prefs.getString("category") ?? "";
    _location = prefs.getString("location") ?? "";
    _phone = prefs.getString("phone") ?? "";

    String? imagePath = prefs.getString("imagePath");
    if (imagePath != null && imagePath.isNotEmpty) {
      _image = File(imagePath);
    }

    notifyListeners();
  }
}
