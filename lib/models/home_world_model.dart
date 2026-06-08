import 'package:t_1app/models/Home_all_model/product_model.dart';

class HomeWorldItem {
  final Product product;
  final String category;

  HomeWorldItem({required this.product, required this.category});
}

List<HomeWorldItem> homeWorldCard = [
  HomeWorldItem(
    category: "اثاث",
    product: Product(
      productName: "كنب صالون معيشي",
      productImage: "images/Homeworld1.png",
      shopName: "النورس للمفروشات",
      price: 1000,
      oldPrice: 1500,
      evaluation: 4.9,
    ),
  ),

  HomeWorldItem(
    category: "ادوات منزلية",
    product: Product(
      productName: "طقم طناجر بعدة احجام",
      productImage: "images/Homeworld2.png",
      shopName: "متجر الراس",
      price: 500,
      oldPrice: 550,
      evaluation: 4.1,
    ),
  ),

  HomeWorldItem(
    category: "مستلزمات التخزين",
    product: Product(
      productName: "علب حافظات الطعام",
      productImage: "images/Homeworld3.png",
      shopName: "متجر الراس",
      price: 100,
      oldPrice: 150,
      evaluation: 4.1,
    ),
  ),

  HomeWorldItem(
    category: "ديكور",
    product: Product(
      productName: "الشموع لديكور",
      productImage: "images/Homeworld4.png",
      shopName: "متجر ذكرى",
      price: 50,
      oldPrice: 55,
      evaluation: 4.5,
    ),
  ),

  HomeWorldItem(
    category: "اثاث",
    product: Product(
      productName: "كنب صالون معيشي",
      productImage: "images/Homeworld1.png",
      shopName: "النورس للمفروشات",
      price: 1000,
      oldPrice: 1500,
      evaluation: 4.9,
    ),
  ),

  HomeWorldItem(
    category: "ادوات منزلية",
    product: Product(
      productName: "طقم طناجر بعدة احجام",
      productImage: "images/Homeworld2.png",
      shopName: "متجر الراس",
      price: 500,
      oldPrice: 550,
      evaluation: 4.1,
    ),
  ),
];
