import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/models/Home_all_model/product_model.dart';
import 'package:t_1app/models/exchangeItem.dart';
import 'package:t_1app/providers/home_product_provider.dart';
import 'package:t_1app/widgets/Home_widget/product_card_widget.dart';
import 'package:t_1app/widgets/exchangeCard.dart';
import 'package:t_1app/screens/home_product_details.dart';

class Htheall extends StatefulWidget {
  const Htheall({super.key});

  @override
  State<Htheall> createState() => _HtheallState();
}

class _HtheallState extends State<Htheall> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProductProvider>(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView(
        children: [
          Department(provider.offers, "قسم العروض"),
          Department(provider.newProducts, "وصل حديثا"),
          Department(provider.popular, "الاكثر طلبا"),
        ],
      ),
    );
  }

  /// DEPARTMENT
  Widget Department(
    List<Product> products,
    String departmentName,
  ) {
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
                      ProductCard(
                        product: products[firstIndex],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => HomeProductDetails(
                                    product: products[firstIndex],
                                  ),
                            ),
                          );
                        },
                      ),
                      SizedBox(width: 10.w),
                      if (secondIndex < products.length)
                        ProductCard(
                          product: products[secondIndex],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => HomeProductDetails(
                                      product: products[secondIndex],
                                    ),
                              ),
                            );
                          },
                        ),
                    ],
                  );
                },
              ),
            ),
      ],
    );
  }
}
