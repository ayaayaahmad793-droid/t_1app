import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:record/record.dart';
import 'package:t_1app/FavoritePage.dart';
import 'package:t_1app/widgets/HomeWorld_all.dart';
import 'package:t_1app/widgets/Home_widget/HomeBanner.dart';
import 'package:t_1app/screens/FavPage.dart';
import 'package:t_1app/screens/department.dart';
import 'package:t_1app/screens/exchangePage.dart';
import 'package:t_1app/widgets/HtheAll.dart';
import 'package:t_1app/SearchSett.dart';
import 'package:t_1app/SelectedPage.dart';
import 'package:t_1app/widgets/NavigationBar.dart';
import 'package:t_1app/widgets/category_chip.dart';
import 'package:t_1app/widgets/home_header.dart';
import 'package:t_1app/models/Home_all_model/product_model.dart';

class Homepage extends StatefulWidget {
  final String userName;
  final String profileImage;

  const Homepage({
    super.key,
    this.userName = "مرحبا اية",
    this.profileImage = "images/HomeProfile.png",
  });

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;

  late List<PageItem> myPages;

  String selectedText = "الكل";

  final Record recorder = Record();

  bool isRecording = false;

  /// المفضلة
  List<Product> favoriteProducts = [];

  /// المنتجات
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
  ];

  List<Product> filteredProducts = [];

  @override
  void initState() {
    super.initState();

    filteredProducts = products;

    myPages = [
      PageItem(title: "الكل", page: Htheall()),

      PageItem(title: "عالم البيت", page: Center(child: Text("عالم البيت"))),

      PageItem(title: "عالم الخير", page: Center(child: Text("عالم الخير"))),

      PageItem(title: "الحياة", page: Center(child: Text("الحياة"))),
    ];
  }

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

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,

      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),

        /// الناف بار
        bottomNavigationBar: CustomNavBar(
          currentIndex: _currentIndex,

          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });

            switch (index) {
              case 0:
                break;

              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Favpage()),
                );
                break;

              case 2:
                break;

              case 3:
                MaterialPageRoute(builder: (_) => Department());
                break;

              case 4:
                break;
            }
          },
        ),

        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                SizedBox(height: 10.h),

                /// HEADER
                HomeHeader(
                  userName: widget.userName,

                  profileImage: widget.profileImage,

                  onNotificationTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeworldAll()),
                    );
                  },
                ),

                SizedBox(height: 10.h),

                /// SEARCH
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
                      MaterialPageRoute(builder: (context) => Favpage()),
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

                /// BANNER
                HomeBanner(),

                SizedBox(height: 15.h),

                Text(
                  "الاقسام الرئيسية",
                  style: GoogleFonts.cairo(fontSize: 16.sp),
                ),

                SizedBox(height: 15.h),

                /// الأقسام
                SizedBox(
                  height: 35.h,

                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,

                    itemCount: myPages.length,

                    itemBuilder: (context, index) {
                      final item = myPages[index];

                      return CategoryChip(
                        text: item.title,

                        isSelected: selectedText == item.title,

                        onTap: () {
                          setState(() {
                            selectedText = item.title;
                          });
                        },
                      );
                    },
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
}
