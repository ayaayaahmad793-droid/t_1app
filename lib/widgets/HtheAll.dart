import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/models/exchangeItem.dart';
import 'package:t_1app/widgets/exchangeCard.dart';
import 'package:t_1app/models/Home_all_model/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:t_1app/widgets/Home_widget/product_card_widget.dart';

class Htheall extends StatefulWidget {
  const Htheall({super.key});

  @override
  State<Htheall> createState() => _HtheallState();
}

class _HtheallState extends State<Htheall> {
  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  Future<void> saveFavorite(Product product) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(product.productName, product.isFavorite);
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    for (var product in [...offers, ...newProducts, ...popular]) {
      product.isFavorite = prefs.getBool(product.productName) ?? false;
    }

    setState(() {});
  }

  List<Product> offers = [
    Product(
      productName: "فستان قصير",
      shopName: "متجر الأناقة",
      price: 10,
      oldPrice: 20,
      evaluation: 4.5,
      productImage: "images/hp2.png",
    ),
    Product(
      productName: "فراشي مكياج",
      shopName: "هلا كوزمتكس",
      price: 5,
      oldPrice: 10,
      evaluation: 4.5,
      productImage: "images/hp1.png",
    ),
  ];

  List<Product> newProducts = [
    Product(
      productName: "بوت ابيض مع كعب داخلي",
      shopName: "سما شوز",
      price: 15,
      oldPrice: 25,
      evaluation: 4.2,
      productImage: "images/hp4.png",
    ),
    Product(
      productName: "جزمة برتقالية",
      shopName: "صافي شوز",
      price: 15,
      oldPrice: 25,
      evaluation: 4.1,
      productImage: "images/hp3.png",
    ),
  ];

  List<Product> popular = [
    Product(
      productName: "شاةروما مع سلطات",
      shopName: "مطعم سنابل",
      price: 5,
      oldPrice: 8,
      evaluation: 4.9,
      productImage: "images/hp6.png",
    ),
    Product(
      productName: "كلمنتينا طازجة",
      shopName: "أبو حمدة للفواكه",
      price: 6,
      oldPrice: 8,
      evaluation: 4.2,
      productImage: "images/hp5.png",
    ),
  ];
  List<Product> exchange = [
    Product(
      productName: "شاورما 😄",
      shopName: "مطعم",
      price: 5,
      oldPrice: 8,
      evaluation: 4.8,
      productImage: "images/hp6.png",
    ),
    Product(
      productName: "شاورما 😄",
      shopName: "مطعم",
      price: 5,
      oldPrice: 8,
      evaluation: 4.8,
      productImage: "images/hp6.png",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        child: ListView(
          children: [
            Department(offers, "قسم العروض"),
            Department(newProducts, "وصل حديثا"),
            Department(popular, "الاكثر طلبا"),
            Department(exchange, "تبادل"),
          ],
        ),
      ),
    );
  }

  /// DEPARTMENT
  Widget Department(List<Product> products, String departmentName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// العنوان
        departmentName == "تبادل"
            ? Text(
              departmentName,
              style: GoogleFonts.cairo(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            )
            : Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      departmentName,
                      style: GoogleFonts.cairo(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "شاهد الكل",
                      style: GoogleFonts.cairo(
                        fontSize: 13.sp,
                        color: const Color(0xff979797),
                      ),
                    ),
                  ],
                ),
              ],
            ),

        /// المنتجات
        SizedBox(height: 3.h),
        departmentName == "تبادل"
            ? SizedBox(
              height: 250.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,

                itemBuilder: (context, index) {
                  final item = items[index];

                  return Padding(
                    padding: EdgeInsets.only(left: 10.w),

                    child: ExchangeCard(
                      title: item.title,
                      description: item.description,
                      image: item.image,

                      isFavorite: item.isFavorite,

                      onFavoriteTap: () {
                        setState(() {
                          item.isFavorite = !item.isFavorite;
                        });
                      },
                    ),
                  );
                },
              ),
            )
            : SizedBox(
              height: 250.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: (products.length / 2).ceil(),

                itemBuilder: (context, index) {
                  int firstIndex = index * 2;
                  int secondIndex = firstIndex + 1;

                  return Row(
                    children: [
                      ProductCard(product: products[firstIndex]),

                      SizedBox(width: 10.w),

                      if (secondIndex < products.length)
                        ProductCard(product: products[secondIndex]),
                    ],
                  );
                },
              ),
            ),
      ],
    );
  }
}
