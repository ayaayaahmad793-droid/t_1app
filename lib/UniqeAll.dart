import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Uniqeall extends StatefulWidget {
  const Uniqeall({super.key});

  @override
  State<Uniqeall> createState() => _UniqeallState();
}

class Product {
  final String productName;
  final String shopName;
  final double price;
  final double oldPrice;
  final double evaluation;
  final String productImage;

  Product({
    required this.productName,
    required this.shopName,
    required this.price,
    required this.oldPrice,
    required this.evaluation,
    required this.productImage,
  });
}

class _UniqeallState extends State<Uniqeall> {
  List<Product> products = [
    Product(
      productName: "product name",
      price: 4.999,
      oldPrice: 9.999,
      productImage: "images/hp1.png",
      evaluation: 4.3,
      shopName: "shop name",
    ),
    Product(
      productName: "product name",
      price: 4.999,
      oldPrice: 9.999,
      productImage: "images/hp1.png",
      evaluation: 4.3,
      shopName: "shop name",
    ),
    Product(
      productName: "product name",
      price: 4.999,
      oldPrice: 9.999,
      productImage: "images/hp1.png",
      evaluation: 4.3,
      shopName: "shop name",
    ),
    Product(
      productName: "product name",
      price: 4.999,
      oldPrice: 9.999,
      productImage: "images/hp1.png",
      evaluation: 4.3,
      shopName: "shop name",
    ),
  ];
  @override
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: productCard(products[index]),
          );
        },
      ),
    );
  }

  /// 🔹 PRODUCT CARD
  Widget productCard(Product product) {
    return Container(
      width: 162.w,
      height: 230.h, ///////////////

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
                  product.productImage,
                  height: 118.h,
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
                  child: const Icon(Icons.favorite_border, size: 24),
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
                Row(
                  children: [
                    Icon(Icons.store, color: Color(0xff2E7D32), size: 18),
                    Text(
                      product.shopName,
                      style: GoogleFonts.cairo(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff1B1B1B),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Text(
                      "\$${product.price.toString()}",
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      "\$${product.oldPrice.toString()}",
                      style: GoogleFonts.cairo(
                        color: Color(0xff8D8D8D),
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Color(0xff8D8D8D),
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
                        product.evaluation.toString(),
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

  /// DEPARTMENT
  Widget Department(List<Product> products, String departmentName) {
    return /* Column(
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

    */
    /// المنتجات
    SizedBox(
      height: 250.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: (products.length / 2).ceil(), //  مهم
        itemBuilder: (context, index) {
          int firstIndex = index * 2;
          int secondIndex = firstIndex + 1;

          return Row(
            children: [
              productCard(products[firstIndex]),

              SizedBox(width: 10.w),

              if (secondIndex < products.length)
                productCard(products[secondIndex]),
            ],
          );
        },
      ),
    );
  }
}
