import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:t_1app/models/card_model.dart';

class CardProvider extends ChangeNotifier {
  final List<CardModel> _cards = [];

  List<CardModel> get cards => _cards;

  CardProvider() {
    loadCards();
  }

  void addCard(CardModel card) {
    _cards.add(card);
    saveCards();
    notifyListeners();
  }

  Future<void> saveCards() async {
    final prefs = await SharedPreferences.getInstance();

    final data = _cards.map((card) => card.toJson()).toList();

    await prefs.setString('saved_cards', jsonEncode(data));
  }

  Future<void> loadCards() async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getString('saved_cards');

    if (data != null) {
      final decoded = jsonDecode(data) as List;

      _cards.clear();

      _cards.addAll(decoded.map((item) => CardModel.fromJson(item)));
    } else {
      _cards.addAll([
        CardModel(
          cardHolderName: "Visa",
          cardNumber: "3256",
          expiryMonth: "09",
          expiryYear: "23",
        ),
        CardModel(
          cardHolderName: "Master Card",
          cardNumber: "2789",
          expiryMonth: "08",
          expiryYear: "24",
        ),
      ]);
    }

    notifyListeners();
  }
}
