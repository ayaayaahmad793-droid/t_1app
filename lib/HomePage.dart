import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class Product {
  final String productName;
  final String shopName;
  final int price;
  final double evaluation;
  final Image productImage;

  Product({
    required this.productName,
    required this.productImage,
    required this.shopName,
    required this.price,
    required this.evaluation,
  });
}

class _HomepageState extends State<Homepage> {
  String selectedText = "الكل";
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

                /// SEARCH
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

                /// BANNER
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Image.asset(
                        "images/HomeRoot.png",
                        width: 343.w,
                        height: 197.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 20.h,
                      left: 15.w,
                      child: Text(
                        "تسوق محلي, وادعم \n مجتمعك",
                        style: GoogleFonts.cairo(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20.h,
                      right: 20.w,
                      child: Text(
                        "ابدا البيع بلمسة,\n وشارك الخير بصفقة",
                        style: GoogleFonts.cairo(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10.w,
                      bottom: 5.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffF57C00),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "تسوق الان",
                          style: GoogleFonts.cairo(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 80.h,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 80.h,
                      left: 0.w,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 15.h),
                Container(
                  child: Text(
                    "الاقسام الرئيسية",
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                SizedBox(height: 15.h),

                ////////////////////////////////////////////////////////////

                ///  CATEGORIES
                SizedBox(
                  height: 35.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Row(
                        children: [
                          chip("الكل"),
                          chip("عالم البيت"),
                          chip("عالم الخير"),
                          chip("الحياة"),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10.h),
                /*  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "قسم العروض",
                      style: GoogleFonts.cairo(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "شاهد الكل",
                      style: GoogleFonts.cairo(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff979797),
                      ),
                    ),
                  ],
                ), */
                SizedBox(height: 5.h),

                /// 🔹 PRODUCTS
                Expanded(
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "قسم العروض",
                                style: GoogleFonts.cairo(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "شاهد الكل",
                                style: GoogleFonts.cairo(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff979797),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              productCard(
                                "فستان قصير",
                                "shopName",
                                10,
                                20,
                                3,
                                "images/hp2.png",
                              ),
                              productCard(
                                "فراشي بعدة اشكال للمكياج",
                                "shopName",
                                10,
                                20,
                                3,
                                "images/hp1.png",
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                " وصل حديثا",
                                style: GoogleFonts.cairo(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "شاهد الكل",
                                style: GoogleFonts.cairo(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff979797),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              productCard(
                                "بوت ابيض مع كعب عالي",
                                "shopName",
                                10,
                                20,
                                3,
                                "images/hp4.png",
                              ),
                              productCard(
                                "جزمة برتقالية",
                                "shopName",
                                10,
                                20,
                                3,
                                "images/hp3.png",
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "  الاكثر طلبا",
                                style: GoogleFonts.cairo(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "شاهد الكل",
                                style: GoogleFonts.cairo(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff979797),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              productCard(
                                "شاورما مع سلطات",
                                "shopName",
                                10,
                                20,
                                3,
                                "images/hp6.png",
                              ),
                              productCard(
                                "كلمنتينا طازجة",
                                "shopName",
                                10,
                                20,
                                3,
                                "images/hp5.png",
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "تبادل",
                                style: GoogleFonts.cairo(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              productCard(
                                "productName",
                                "shopName",
                                10,
                                20,
                                3,
                                "images/hp8.png",
                              ),
                              productCard(
                                "productName",
                                "shopName",
                                10,
                                20,
                                3,
                                "images/hp7.png",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///  CHIP
  Widget chip(String text) {
    return InkWell(
      borderRadius: BorderRadius.circular(18.r),
      onTap: () {
        setState(() {
          selectedText = text; // خزني المختار
        });
      },
      child: Container(
        width: 100.w,
        height: 35.h,
        margin: EdgeInsets.only(left: 8.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color:
              selectedText == text
                  ? Color(0xffF57C00)
                  // لما يكون مختار
                  : Colors.transparent,
          border: Border.all(
            color: selectedText == text ? Color(0xffF57C00) : Color(0xff919191),
          ),
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Text(
          text,
          style: GoogleFonts.cairo(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: Color(0xff000000),
          ),
        ),
      ),
    );
  }

  /// 🔹 PRODUCT CARD
  Widget productCard(
    String productName,
    String shopName,
    int price,
    int oldPrice,
    double evaluation,
    String productImage,
  ) {
    return Container(
      width: 162.w,
      height: 205.h,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xff8D8D8D), width: 1),
          left: BorderSide(color: Color(0xff8D8D8D), width: 1),
          right: BorderSide(color: Color(0xff8D8D8D), width: 1),
        ),
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
                child: Image.asset(productImage, height: 118.h, width: 162.w),
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
            padding: EdgeInsets.only(right: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
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
                      shopName,
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
                      "\$${price.toString()}",
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      "\$${oldPrice.toString()}",
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
                        evaluation.toString(),
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
