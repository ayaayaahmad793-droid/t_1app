import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:t_1app/models/Home_all_model/product_model.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  Future<void> saveFavorite() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(widget.product.productName, widget.product.isFavorite);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 162.w,
      height: 230.h,
      margin: EdgeInsets.only(left: 10.w),

      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff8D8D8D)),
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),

                child: Image.asset(
                  widget.product.productImage,
                  height: 118.h,
                  width: 162.w,
                  fit: BoxFit.fill,
                ),
              ),

              Positioned(
                top: 8,
                right: 8,

                child: GestureDetector(
                  onTap: () async {
                    setState(() {
                      widget.product.isFavorite = !widget.product.isFavorite;
                    });

                    await saveFavorite();
                  },

                  child: CircleAvatar(
                    radius: 14.r,
                    backgroundColor: Colors.white,

                    child: Icon(
                      widget.product.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,

                      color:
                          widget.product.isFavorite ? Colors.red : Colors.grey,

                      size: 20.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.only(right: 10.w, top: 10.h),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  widget.product.productName,

                  style: GoogleFonts.cairo(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff000000),
                  ),
                ),

                SizedBox(height: 4.h),

                Row(
                  children: [
                    const Icon(Icons.store, color: Color(0xff2E7D32), size: 18),

                    Text(
                      widget.product.shopName,

                      style: GoogleFonts.cairo(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff1B1B1B),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 4.h),

                Row(
                  children: [
                    Text(
                      "\$${widget.product.price}",

                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                    ),

                    SizedBox(width: 4.w),

                    Text(
                      "\$${widget.product.oldPrice}",

                      style: GoogleFonts.cairo(
                        color: const Color(0xff8D8D8D),
                        decoration: TextDecoration.lineThrough,
                        decorationColor: const Color(0xff8D8D8D),
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(right: 100.w),

                  child: Row(
                    children: [
                      Text(
                        widget.product.evaluation.toString(),

                        style: GoogleFonts.cairo(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const Icon(
                        Icons.star,
                        color: Color(0xffFFB800),
                        size: 17,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
