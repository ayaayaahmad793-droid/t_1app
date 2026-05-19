class CartModel {
  final String productImage;
  final String productName;
  final double productPrice;
  final String shopName;

  CartModel({
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.shopName,
  });
}

final List<CartModel> cartProduct = [
  CartModel(
    productImage: "images/Technology1.png",
    productName: "سماعات لاسلكية Bluetooth ",
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
