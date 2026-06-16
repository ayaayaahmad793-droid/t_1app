import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:t_1app/models/address_model.dart';

class AddressProvider extends ChangeNotifier {
  AddressModel? address;

  String fullName = '';
  String country = '';
  String city = '';
  String street = '';
  String phone = '';

  AddressProvider() {
    loadAddress();
  }

  void setFullName(String value) {
    fullName = value;
    notifyListeners();
  }

  void setCountry(String value) {
    country = value;
    notifyListeners();
  }

  void setCity(String value) {
    city = value;
    notifyListeners();
  }

  void setStreet(String value) {
    street = value;
    notifyListeners();
  }

  void setPhone(String value) {
    phone = value;
    notifyListeners();
  }

  void saveAddress(AddressModel newAddress) {
    address = newAddress;
    saveToStorage();
    notifyListeners();
  }

  Future<void> saveToStorage() async {
    final prefs = await SharedPreferences.getInstance();

    if (address != null) {
      await prefs.setString('saved_address', jsonEncode(address!.toJson()));
    }
  }

  Future<void> loadAddress() async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getString('saved_address');

    if (data != null) {
      address = AddressModel.fromJson(jsonDecode(data));

      fullName = address!.fullName;
      country = address!.country;
      city = address!.city;
      street = address!.street;
      phone = address!.phone;

      notifyListeners();
    }
  }
}
