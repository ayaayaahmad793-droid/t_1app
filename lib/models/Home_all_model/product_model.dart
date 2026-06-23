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

  Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'shopName': shopName,
      'price': price,
      'oldPrice': oldPrice,
      'evaluation': evaluation,
      'productImage': productImage,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productName: json['productName'] ?? '',
      shopName: json['shopName'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      oldPrice: (json['oldPrice'] as num?)?.toDouble() ?? 0.0,
      evaluation: (json['evaluation'] as num?)?.toDouble() ?? 0.0,
      productImage: json['productImage'] ?? '',
    );
  }
}
