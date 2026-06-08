import 'package:flutter/material.dart';
import 'package:t_1app/models/goodnees_model.dart';

class DonationProvider extends ChangeNotifier {
  final List<DonateCardModel> _donateList = List.from(donateCards);

  List<DonateCardModel> get donateList => _donateList;

  void addDonation(DonateCardModel item) {
    _donateList.insert(0, item);

    print("تمت الإضافة");
    print(_donateList[0].title);
    print(_donateList.length);

    notifyListeners();
  }
}
