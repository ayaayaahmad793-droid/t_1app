import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:record/record.dart';
import 'package:t_1app/HomeBanner.dart';
import 'package:t_1app/HtheAll.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class Product {
  final String productName;
  final String shopName;
  final double price;
  final double oldPrice;
  final double evaluation;
  final Image productImage;

  Product({
    required this.productName,
    required this.productImage,
    required this.shopName,
    required this.price,
    required this.oldPrice,
    required this.evaluation,
  });
}

class _HomepageState extends State<Homepage> {
  final Record recorder = Record();
  bool isRecording = false;
  Future<void> startRecording() async {
    if (await recorder.hasPermission()) {
      await recorder.start(
        path: 'recording.m4a',
        encoder: AudioEncoder.aacLc,
        bitRate: 128000,
        samplingRate: 44100,
      );

      setState(() {
        isRecording = true;
      });
    }
  }

  Future<void> stopRecording() async {
    final path = await recorder.stop();

    print("تم حفظ التسجيل في: $path");

    setState(() {
      isRecording = false;
    });
  }

  @override
  void dispose() {
    recorder.dispose();
    super.dispose();
  }

  List<Product> filteredProducts = [];
  @override
  void initState() {
    super.initState();
    filteredProducts = products;
  }

  List<Product> products = [
    Product(
      productName: "product name",
      price: 4.999,
      oldPrice: 9.999,
      productImage: Image.asset("images/hp1.png"),
      evaluation: 4.3,
      shopName: "shop name",
    ),
    Product(
      productName: "product name",
      price: 4.999,
      oldPrice: 9.999,
      productImage: Image.asset("images/hp1.png"),
      evaluation: 4.3,
      shopName: "shop name",
    ),
    Product(
      productName: "product name",
      price: 4.999,
      oldPrice: 9.999,
      productImage: Image.asset("images/hp1.png"),
      evaluation: 4.3,
      shopName: "shop name",
    ),
    Product(
      productName: "product name",
      price: 4.999,
      oldPrice: 9.999,
      productImage: Image.asset("images/hp1.png"),
      evaluation: 4.3,
      shopName: "shop name",
    ),
  ];

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
                      child: IconButton(
                        icon: Icon(Icons.notifications_none),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),

                /// SEARCH
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 5.w),
                      child: Container(
                        width: 283.w,
                        height: 44.h,
                        decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(color: Color(0xff919191)),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 24.w,
                              height: 24.h,
                              child: Icon(
                                Icons.search,
                                color: Color(0xff292D32),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    filteredProducts =
                                        products.where((product) {
                                          return product.productName
                                              .toLowerCase()
                                              .contains(value.toLowerCase());
                                        }).toList();
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: "ابحث عن منتجات...",
                                  border: InputBorder.none,
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff9A9A9A),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 24.w,
                              height: 24.h,
                              child: IconButton(
                                icon: Icon(
                                  isRecording ? Icons.stop : Icons.mic,
                                  color: Color(0xff000000),
                                ),
                                onPressed: () async {
                                  if (isRecording) {
                                    await stopRecording();
                                  } else {
                                    await startRecording();
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => Htheall(), // غير اسم الصفحة هون
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          Image.asset(
                            "images/OrangeSmall.png",
                            width: 44.w,
                            height: 44.h,
                          ),
                          Positioned(
                            top: 10.h,
                            left: 11.w,
                            child: Image.asset(
                              "images/sett.png",
                              width: 24.w,
                              height: 24.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),

                /// BANNER
                HomeBanner(),

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

                /// 🔹 PRODUCTS
                Expanded(child: getSelectedPage()),
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
          selectedText = text;
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

  Widget getSelectedPage() {
    switch (selectedText) {
      case "الكل":
        return Htheall();

      case "عالم البيت":
        return Center(child: Text("صفحة عالم البيت"));

      case "عالم الخير":
        return Center(child: Text("صفحة عالم الخير"));

      case "الحياة":
        return Center(child: Text("صفحة الحياة"));

      default:
        return Htheall();
    }
  }
}
