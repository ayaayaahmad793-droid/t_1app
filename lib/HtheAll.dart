import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Htheall extends StatefulWidget {
  const Htheall({super.key});

  @override
  State<Htheall> createState() => _HtheallState();
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

class _HtheallState extends State<Htheall> {
  List<Product> offers = [
    Product(
      productName: "فستان",
      shopName: "متجر 1",
      price: 10,
      oldPrice: 20,
      evaluation: 4.5,
      productImage: "images/hp2.png",
    ),
  ];

  List<Product> newProducts = [
    Product(
      productName: "جزمة",
      shopName: "متجر 2",
      price: 15,
      oldPrice: 25,
      evaluation: 4.2,
      productImage: "images/hp3.png",
    ),
    Product(
      productName: "جزمة",
      shopName: "متجر 2",
      price: 15,
      oldPrice: 25,
      evaluation: 4.2,
      productImage: "images/hp3.png",
    ),
  ];

  List<Product> popular = [
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
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView(
              children: [
                Department(offers, "قسم العروض"),
                Department(newProducts, "وصل حديثا"),
                Department(popular, "الاكثر طلبا"),
                Department(exchange, "الاكثر طلبا"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 🔹 PRODUCT CARD
  Widget productCard(Product product) {
    return Container(
      width: 162.w,

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

                SizedBox(height: 5.h),
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
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Text(
                      "\$${product.price.toString()}",
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(width: 5.w),
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

                SizedBox(height: 2.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 DEPARTMENT
  Widget Department(List<Product> products, String departmentName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// العنوان
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

        SizedBox(height: 10.h),

        /// المنتجات
        SizedBox(
          height: 230.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: (products.length / 2).ceil(), // 🔥 مهم
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
        ),

        SizedBox(height: 20.h),
      ],
    );
  }
}
