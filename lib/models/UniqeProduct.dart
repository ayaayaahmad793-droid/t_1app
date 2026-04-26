class Product {
  final String productName;
  final String productDescription;
  final double price;
  final double oldPrice;
  final double evaluation;
  final String productImage;
  bool isFavorite;

  Product({
    required this.productName,
    required this.productDescription,
    required this.price,
    required this.oldPrice,
    required this.evaluation,
    required this.productImage,
    this.isFavorite = false,
  });
}
List<Product> products = [
  Product(
    productName: "product name",
    price: 4.999,
    oldPrice: 9.999,
    productImage: "images/hp1.png",
    evaluation: 4.3,
    productDescription: "productDescription",
  ),
  Product(
    productName: "product name",
    price: 4.999,
    oldPrice: 9.999,
    productImage: "images/hp1.png",
    evaluation: 4.3,
    productDescription: "productDescription",
  ),
  Product(
    productName: "product name",
    price: 4.999,
    oldPrice: 9.999,
    productImage: "images/hp1.png",
    evaluation: 4.3,
    productDescription: "productDescription",
  ),
  Product(
    productName: "product name",
    price: 4.999,
    oldPrice: 9.999,
    productImage: "images/hp1.png",
    evaluation: 4.3,
    productDescription: "productDescription",
  ),
  Product(
    productName: "product name",
    price: 4.999,
    oldPrice: 9.999,
    productImage: "images/hp1.png",
    evaluation: 4.3,
    productDescription: "productDescription",
  ),
  Product(
    productName: "product name",
    price: 4.999,
    oldPrice: 9.999,
    productImage: "images/hp1.png",
    evaluation: 4.3,
    productDescription: "productDescription",
  ),
];
