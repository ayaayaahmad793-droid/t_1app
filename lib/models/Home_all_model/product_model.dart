class Product {
  final String productName;
  final String shopName;
  final double price;
  final double oldPrice;
  final double evaluation;
  final String productImage;

  bool isFavorite;

  Product({
    required this.productName,
    required this.productImage,
    required this.shopName,
    required this.price,
    required this.oldPrice,
    required this.evaluation,
    this.isFavorite = false,
  });
}
