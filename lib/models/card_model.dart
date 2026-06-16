class CardModel {
  final String cardHolderName;
  final String cardNumber;
  final String expiryMonth;
  final String expiryYear;

  CardModel({
    required this.cardHolderName,
    required this.cardNumber,
    required this.expiryMonth,
    required this.expiryYear,
  });

  Map<String, dynamic> toJson() {
    return {
      'cardHolderName': cardHolderName,
      'cardNumber': cardNumber,
      'expiryMonth': expiryMonth,
      'expiryYear': expiryYear,
    };
  }

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      cardHolderName: json['cardHolderName'] ?? '',
      cardNumber: json['cardNumber'] ?? '',
      expiryMonth: json['expiryMonth'] ?? '',
      expiryYear: json['expiryYear'] ?? '',
    );
  }
}
