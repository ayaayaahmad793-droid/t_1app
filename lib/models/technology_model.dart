import 'package:t_1app/models/Home_all_model/product_model.dart';

class TechnologyItem {
  final Product product;
  final String category;

  TechnologyItem({required this.product, required this.category});
}

// ignore: non_constant_identifier_names
List<TechnologyItem> technology = [
  TechnologyItem(
    category: "أجهزة صوت وصورة",
    product: Product(
      productName: "سماعات لاسلكية Bluetooth",
      shopName: "الصرفندي",
      price: 10,
      oldPrice: 20,
      evaluation: 4.5,
      productImage: "images/Technology1.png",
    ),
  ),

  TechnologyItem(
    category: "هواتف ذكية",
    product: Product(
      productName: "موبايل ايفون 17 برو ماكس",
      shopName: "القرم للهواتف",
      price: 5,
      oldPrice: 10,
      evaluation: 4.5,
      productImage: "images/Technology2.png",
    ),
  ),

  TechnologyItem(
    category: "أجهزة لوحية",
    product: Product(
      productName: "تابلت اندرويد",
      shopName: "اللمداني",
      price: 200,
      oldPrice: 250,
      evaluation: 4.2,
      productImage: "images/Technology3.png",
    ),
  ),

  TechnologyItem(
    category: "أجهزة كمبيوتر ولابتوب",
    product: Product(
      productName: "لابتوب ابل",
      shopName: "الصرفندي",
      price: 3,
      oldPrice: 5,
      evaluation: 4.1,
      productImage: "images/Technology4.png",
    ),
  ),

  TechnologyItem(
    category: "أجهزة صوت وصورة",
    product: Product(
      productName: "كاميرا 48MP",
      shopName: "المهتدي",
      price: 15,
      oldPrice: 25,
      evaluation: 4.2,
      productImage: "images/Technology5.png",
    ),
  ),

  TechnologyItem(
    category: "ملحقات واكسسوارات",
    product: Product(
      productName: "بيت جوال",
      shopName: "حمودة فون",
      price: 7,
      oldPrice: 15,
      evaluation: 4.1,
      productImage: "images/Technology7.png",
    ),
  ),
];
