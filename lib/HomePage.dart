import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:record/record.dart';
import 'package:t_1app/HomeBanner.dart';
import 'package:t_1app/HtheAll.dart';
import 'package:t_1app/SearchSett.dart';
import 'package:t_1app/SelectedPage.dart';
import 'package:t_1app/uniqeProduct.dart';

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
  ///  الصفحات الديناميكية
  final List<PageItem> myPages = [
    PageItem(title: "الكل", page: Htheall()),
    PageItem(title: "عالم البيت", page: Center(child: Text("عالم البيت"))),
    PageItem(title: "عالم الخير", page: Center(child: Text("عالم الخير"))),
    PageItem(title: "الحياة", page: Center(child: Text("الحياة"))),
  ];

  String selectedText = "الكل";

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
  ];

  List<Product> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = products;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        bottomNavigationBar: bottomBar(),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),

                /// 🔹 HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 91.w,
                      height: 37.h,
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff919191)),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            "images/HomeProfile.png",
                            width: 37.w,
                            height: 37.h,
                          ),
                          Text(
                            "مرحبا نور",
                            style: GoogleFonts.cairo(fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications_none),
                      onPressed: () {},
                    ),
                  ],
                ),

                SizedBox(height: 10.h),

                /// 🔹 SEARCH
                CustomSearchBar(
                  hintText: "ابحث عن منتجات...",
                  isRecording: isRecording,
                  onMicPressed: () async {
                    if (isRecording) {
                      await stopRecording();
                    } else {
                      await startRecording();
                    }
                  },
                  onFilterPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Uniqeproduct()),
                    );
                  },
                  onChanged: (value) {
                    setState(() {
                      filteredProducts =
                          products.where((product) {
                            return product.productName.toLowerCase().contains(
                              value.toLowerCase(),
                            );
                          }).toList();
                    });
                  },
                ),

                SizedBox(height: 15.h),

                /// 🔹 BANNER
                HomeBanner(),

                SizedBox(height: 15.h),

                Text(
                  "الاقسام الرئيسية",
                  style: GoogleFonts.cairo(fontSize: 16.sp),
                ),

                SizedBox(height: 15.h),

                ///  CATEGORIES (ديناميكي)
                SizedBox(
                  height: 35.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children:
                        myPages.map((item) {
                          return chip(item.title);
                        }).toList(),
                  ),
                ),

                SizedBox(height: 10.h),

                /// الصفحات
                Expanded(
                  child: DynamicSelectedPage(
                    selectedText: selectedText,
                    items: myPages,
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
          selectedText = text;
        });
      },
      child: Container(
        width: 100.w,
        height: 35.h,
        margin: EdgeInsets.only(left: 8.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selectedText == text ? Color(0xffF57C00) : Colors.transparent,
          border: Border.all(
            color: selectedText == text ? Color(0xffF57C00) : Color(0xff919191),
          ),
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Text(text, style: GoogleFonts.cairo(fontSize: 14.sp)),
      ),
    );
  }

  /// 🔹 BOTTOM BAR
  Widget bottomBar() {
    return Container(
      height: 65.h,
      color: Colors.green,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
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
