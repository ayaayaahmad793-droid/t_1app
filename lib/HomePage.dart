import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class Product {
  final String name;
  final String price;
  final String image;

  Product({required this.name, required this.price, required this.image});
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),

        bottomNavigationBar: bottomBar(),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),

                /// HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 91.w,
                      height: 37.h,
                      alignment: Alignment.centerRight,

                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff919191), // لون البوردر
                          width: 1.w, // سماكة البوردر
                        ),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            "images/HomeProfile.png",
                            width: 37.w,
                            height: 37.h,
                          ),
                          Container(
                            child: Text(
                              "مرحبا نور",
                              style: GoogleFonts.cairo(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: 8.w),

                    Container(
                      width: 37.w,
                      height: 38.h,
                      child: Icon(Icons.notifications_none),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),

                /// 🔹 SEARCH
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 45.h,
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.search, color: Colors.grey),
                            SizedBox(width: 8.w),
                            Text(
                              "ابحث عن منتجات",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                      width: 45.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: const Icon(Icons.tune, color: Colors.white),
                    ),
                  ],
                ),

                SizedBox(height: 15.h),

                /// 🔹 BANNER
                Container(
                  height: 150.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    image: const DecorationImage(
                      image: AssetImage("assets/banner.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "تسوق معنا وادعم",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          "المنتج الفلسطيني",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 5.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Text(
                            "تسوق الآن",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 15.h),

                /// 🔹 CATEGORIES
                SizedBox(
                  height: 35.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      chip("الكل", true),
                      chip("ملابس", false),
                      chip("مواد غذائية", false),
                      chip("حلويات", false),
                    ],
                  ),
                ),

                SizedBox(height: 10.h),

                /// 🔹 PRODUCTS
                Expanded(
                  child: GridView.builder(
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 10.h,
                      childAspectRatio: 0.68,
                    ),
                    itemBuilder: (context, index) {
                      return productCard();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 🔹 CHIP
  Widget chip(String text, bool active) {
    return Container(
      margin: EdgeInsets.only(left: 8.w),
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      decoration: BoxDecoration(
        color: active ? Colors.orange : Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12.sp,
          color: active ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  /// 🔹 PRODUCT CARD
  Widget productCard() {
    return Container(
      decoration: BoxDecoration(
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
                  "images/hp1.png",
                  height: 120.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: CircleAvatar(
                  radius: 14.r,
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.favorite_border, size: 16),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "فستان برتقالي",
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 4.h),

                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 14),
                    Text(" 4.3", style: TextStyle(fontSize: 11.sp)),
                  ],
                ),

                SizedBox(height: 4.h),

                Text("₪520", style: TextStyle(fontSize: 12.sp)),

                Text(
                  "₪650",
                  style: TextStyle(
                    fontSize: 10.sp,
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 BOTTOM BAR
  Widget bottomBar() {
    return Container(
      height: 65.h,
      decoration: const BoxDecoration(color: Colors.green),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.grid_view, color: Colors.white),
          Icon(Icons.shopping_cart, color: Colors.white),
          Icon(Icons.favorite, color: Colors.white),
          Icon(Icons.person, color: Colors.white),
        ],
      ),
    );
  }
}
