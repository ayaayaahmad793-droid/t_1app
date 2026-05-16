import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t_1app/models/home_world_model.dart';
import 'package:t_1app/screens/productDetails.dart';
import 'package:t_1app/widgets/Home_widget/product_card_widget.dart';

class HomeworldAll extends StatefulWidget {
  const HomeworldAll({super.key});

  @override
  State<HomeworldAll> createState() => _HomeworldAllState();
}

class _HomeworldAllState extends State<HomeworldAll> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,

      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: (homeWorldCard.length / 2).ceil(),

        itemBuilder: (context, rowIndex) {
          int firstIndex = rowIndex * 2;
          int secondIndex = firstIndex + 1;

          return Padding(
            padding: EdgeInsets.only(bottom: 10.h),

            child: Row(
              children: [
                /// الكارد الاول
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductSliderPage(),
                        ),
                      );
                    },

                    child: ProductCard(product: homeWorldCard[firstIndex]),
                  ),
                ),

                SizedBox(width: 10.w),

                /// الكارد الثاني
                if (secondIndex < homeWorldCard.length)
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductSliderPage(),
                          ),
                        );
                      },

                      child: ProductCard(product: homeWorldCard[secondIndex]),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
