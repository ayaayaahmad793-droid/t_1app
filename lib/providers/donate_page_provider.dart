import 'package:flutter/material.dart';

class DonatePageProvider extends ChangeNotifier {
  int selectedDonationType = -1;

  int selectedAmount = -1;

  String customAmount = "";
  String selectedCharity = "";
  void selectCharity(String charity) {
    selectedCharity = charity;
    notifyListeners();
  }

  void selectDonationType(int index) {
    selectedDonationType = index;
    notifyListeners();
  }

  void selectAmount(int amount) {
    selectedAmount = amount;
    customAmount = amount.toString();
    notifyListeners();
  }

 void setCustomAmount(String amount) {
    customAmount = amount;
    selectedAmount = -1;
    notifyListeners();
  }
  void resetDonationData() {
    selectedDonationType = -1;
    selectedAmount = -1;
    customAmount = "";
    selectedCharity = "";

    notifyListeners();
  }
}
