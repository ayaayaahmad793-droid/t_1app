import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/screens/productDetails.dart';
import 'package:t_1app/models/UniqeProduct.dart';

class Uniqeall extends StatefulWidget {
  const Uniqeall({super.key});

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
                  productCard(products[firstIndex]),
                  SizedBox(width: 10.w),

                  if (secondIndex < products.length)
                    productCard(products[secondIndex]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// PRODUCT CARD
  Widget productCard(Product product) {
    return InkWell(
      borderRadius: BorderRadius.circular(15.r),
      onTap: () {
        // هون شو بدك يصير عند الضغط
        /*  Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Productdetails(product: product),
          ),
        ); */
      },
      child: Container(
        width: 162.w,
        height: 200.h,
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
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(15.r),
                  ),
                  child: Image.asset(
                    product.productImage,
                    height: 110.h,
                    width: 162.w,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: CircleAvatar(
                    radius: 14.r,
                    backgroundColor: Colors.white,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          product.isFavorite = !product.isFavorite;
                        });
                      },
                      child: Icon(
                        product.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: product.isFavorite ? Colors.red : Colors.grey,
                        size: 20,
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
                    product.productName,
                    style: GoogleFonts.cairo(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff000000),
                    ),
                  ),
                  SizedBox(height: 4.h),

                  Text(
                    product.productDescription,
                    style: GoogleFonts.cairo(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff6B6B6B),
                    ),
                  ),

                  SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "\$${product.price}",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: Color(0xff000000),
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            "\$${product.oldPrice}",
                            style: GoogleFonts.cairo(
                              color: const Color(0xff8D8D8D),
                              decoration: TextDecoration.lineThrough,
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            product.evaluation.toString(),
                            style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff000000),
                            ),
                          ),
                          const Icon(
                            Icons.star,
                            color: Color(0xffFFB800),
                            size: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
