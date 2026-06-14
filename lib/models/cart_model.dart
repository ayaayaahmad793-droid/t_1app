class CartModel {
  final String productImage;
  final String productName;
  final double productPrice;
  final String shopName;
  int quantity;

  CartModel({
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.shopName,
    this.quantity = 1,
  });

  /// تحويل إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'productImage': productImage,
      'productName': productName,
      'productPrice': productPrice,
      'shopName': shopName,
      'quantity': quantity,
    };
  }

  /// إنشاء كائن من JSON
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      productImage: json['productImage'],
      productName: json['productName'],
      productPrice: (json['productPrice'] as num).toDouble(),
      shopName: json['shopName'],
      quantity: json['quantity'] ?? 1,
    );
  }
}

final List<CartModel> cartProduct = [
  CartModel(
    productImage: "images/Technology1.png",
    productName: "سماعات لاسلكية Bluetooth",
    productPrice: 10.0,
    shopName: "الصرفندي",
  ),
  CartModel(
    productImage: "images/Everydaylife4.png",
    productName: "اقلام ماركة",
    productPrice: 3.0,
    shopName: "مكتبة جنان",
  ),
  CartModel(
    productImage: "images/Technology66.png",
    productName: "كاميرا 48MP",
    productPrice: 15.0,
    shopName: "المهتدي",
  ),
];
