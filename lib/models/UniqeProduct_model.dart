class ProductU1 {
  final String productName;
  final String productDescription;
  final double price;
  final double oldPrice;
  final double evaluation;
  final String productImage;
  bool isFavorite;

  ProductU1({
    required this.productName,
    required this.productDescription,
    required this.price,
    required this.oldPrice,
    required this.evaluation,
    required this.productImage,
    this.isFavorite = false,
  });
}

List<ProductU1> products = [
  ProductU1(
    productName: "كريم العناية بالبشرة",
    price: 200,
    oldPrice: 250,
    productImage: "images/uniqeProductAll1.png",
    evaluation: 4.5,
    productDescription: "كريم يرطب البشرة و يعيد توازنها",
  ),
  ProductU1(
    productName: "كريم سكين براود",
    price: 50,
    oldPrice: 100,
    productImage: "images/uniqeProductAll2.png",
    evaluation: 4.0,
    productDescription: "مرطب يدعم حاجز البشرة",
  ),
  ProductU1(
    productName: "ايفون 17",
    price: 2500,
    oldPrice: 3000,
    productImage: "images/uniqeProductAll3.png",
    evaluation: 4.3,
    productDescription: "هاتف بتصميم عصري وشاشة ممتازة",
  ),
  ProductU1(
    productName: "ايفون 16",
    price: 1000,
    oldPrice: 1500,
    productImage: "images/uniqeProductAll4.png",
    evaluation: 4.3,
    productDescription: "هاتف بشريحةA18 وكاميرا 48MP",
  ),
  ProductU1(
    productName: "راديان-سي جوهر التفتيح",
    price: 100,
    oldPrice: 150,
    productImage: "images/uniqeProductAll5.png",
    evaluation: 4.4,
    productDescription: "يمنح البشرة إشراقة موحدة بفضل فيتامين C",
  ),
  ProductU1(
    productName: "ترانش كوت",
    price: 300,
    oldPrice: 350,
    productImage: "images/uniqeProductAll6.png",
    evaluation: 4.1,
    productDescription: "لمسة راقية لأيام الخريف والشتاء.",
  ),
];
