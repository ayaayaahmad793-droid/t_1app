import 'package:t_1app/models/Home_all_model/product_model.dart';

class FashionItem {
  final Product product;
  final String category;

  FashionItem({required this.product, required this.category});
}

// ignore: non_constant_identifier_names
List<FashionItem> Makeupandclothes = [
  FashionItem(
    category: "ملابس نسائية",
    product: Product(
      productName: "فستان قصير",
      shopName: "متجر الأناقة",
      price: 10,
      oldPrice: 20,
      evaluation: 4.5,
      productImage: "images/hp2.png",
    ),
  ),

  FashionItem(
    category: "مكياج",
    product: Product(
      productName: "فراشي مكياج",
      shopName: "هلا كوزمتكس",
      price: 5,
      oldPrice: 10,
      evaluation: 4.5,
      productImage: "images/hp1.png",
    ),
  ),

  FashionItem(
    category: "ملابس رجالية",
    product: Product(
      productName: "ترنق شتوي شبابي",
      shopName: "صافي فاشون",
      price: 200,
      oldPrice: 250,
      evaluation: 4.2,
      productImage: "images/Makeupandclothes3.png",
    ),
  ),

  FashionItem(
    category: "ملابس اطفال",
    product: Product(
      productName: "ترنق شتوي لطفل سنتين",
      shopName: "الجد سنتر",
      price: 15,
      oldPrice: 25,
      evaluation: 4.1,
      productImage: "images/Makeupandclothes4.png",
    ),
  ),

  FashionItem(
    category: "اكسسوارات",
    product: Product(
      productName: "بوت ابيض مع كعب داخلي",
      shopName: "سما شوز",
      price: 15,
      oldPrice: 25,
      evaluation: 4.2,
      productImage: "images/hp4.png",
    ),
  ),

  FashionItem(
    category: "اكسسوارات",
    product: Product(
      productName: "جزمة برتقالية",
      shopName: "الغمري شوز",
      price: 15,
      oldPrice: 25,
      evaluation: 4.1,
      productImage: "images/hp3.png",
    ),
  ),
];
