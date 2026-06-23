class Product {
  final String name;
  final String code;
  final String price;
  final String oldPrice;
  final String image;
  final bool available;
  final String amount;

  bool isFavorite;

  Product({
    required this.name,
    required this.code,
    required this.price,
    required this.oldPrice,
    required this.image,
    required this.available,
    required this.amount,
    this.isFavorite = false,
  });

  // 🟢 أضيفي هذه الدالة هنا داخل ملف الموديل الخاص بـ shopkeeper_model
  Map<String, dynamic> toJson() {
    return {
      'productName': name,
      'code': code,
      'price': price,
      'oldPrice': oldPrice,
      'productImage': image,
      'available': available,
      'amount': amount,
    };
  }
}
