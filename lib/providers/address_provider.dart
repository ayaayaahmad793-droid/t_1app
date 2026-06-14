import 'package:flutter/material.dart';
import 'package:t_1app/models/address_model.dart';

class AddressProvider extends ChangeNotifier {
  AddressModel? address;

  String fullName = "";
  String country = "";
  String city = "";
  String street = "";
  String phone = "";

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
    notifyListeners();
  }
}
