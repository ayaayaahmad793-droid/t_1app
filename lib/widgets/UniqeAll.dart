import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/screens/productDetails.dart';
import 'package:t_1app/models/UniqeProduct_model.dart';
import 'package:t_1app/widgets/Uniqe_widget/product_card_uniqe.dart';

class Uniqeall extends StatefulWidget {
  final bool isFavPage;

  const Uniqeall({super.key, this.isFavPage = false});

  @override
  State<Uniqeall> createState() => _UniqeallState();
}

class _UniqeallState extends State<Uniqeall> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: (products.length / 2).ceil(),
        itemBuilder: (context, rowIndex) {
          int firstIndex = rowIndex * 2;
          int secondIndex = firstIndex + 1;

          return Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: SizedBox(
              height: 200.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: [
                  ProductCard(
                    product: products[firstIndex],

                    isFavPage: widget.isFavPage,

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductSliderPage(),
                        ),
                      );
                    }, onFavoriteTap: () {  },
                  ),

                  SizedBox(width: 10.w),

                  if (secondIndex < products.length)
                    ProductCard(
                      product: products[secondIndex],

                      isFavPage: widget.isFavPage,

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductSliderPage(),
                          ),
                        );
                      }, onFavoriteTap: () {  },
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
