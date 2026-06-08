import 'package:t_1app/models/Home_all_model/product_model.dart';

class DailyLifeItem {
  final Product product;
  final String category;

  DailyLifeItem({required this.product, required this.category});
}

// ignore: non_constant_identifier_names
List<DailyLifeItem> everydaylife = [
  DailyLifeItem(
    category: "فاكهونات ومشروبات",
    product: Product(
      productName: "كلمنتينا طازجة",
      shopName: "ابو جبر للفواكه",
      price: 5,
      oldPrice: 10,
      evaluation: 4.5,
      productImage: "images/Everydaylife2.png",
    ),
  ),

  DailyLifeItem(
    category: "مأكولات ومشروبات",
    product: Product(
      productName: "شاورما لحمة",
      shopName: "مطعم سنابل",
      price: 10,
      oldPrice: 20,
      evaluation: 4.5,
      productImage: "images/Everydaylife1.png",
    ),
  ),

  DailyLifeItem(
    category: "منتجات العناية",
    product: Product(
      productName: "شامبو دوف للشعر الجاف",
      shopName: "هلا كوزمتكس",
      price: 200,
      oldPrice: 250,
      evaluation: 4.2,
      productImage: "images/Everydaylife3.png",
    ),
  ),

  DailyLifeItem(
    category: "ادوات مكتبية وقرطاسية",
    product: Product(
      productName: "اقلام ماركة",
      shopName: "مكتبة جنان",
      price: 3,
      oldPrice: 5,
      evaluation: 4.1,
      productImage: "images/Everydaylife4.png",
    ),
  ),

  DailyLifeItem(
    category: "الصحة والدواء",
    product: Product(
      productName: "غسول فم",
      shopName: "صيدلية بلال",
      price: 15,
      oldPrice: 25,
      evaluation: 4.2,
      productImage: "images/Everydaylife5.png",
    ),
  ),

  DailyLifeItem(
    category: "فاكهونات ومشروبات",
    product: Product(
      productName: "بوظة بالنوتيلا",
      shopName: "بوظة حمادة",
      price: 7,
      oldPrice: 15,
      evaluation: 4.1,
      productImage: "images/Everydaylife6.png",
    ),
  ),
];
