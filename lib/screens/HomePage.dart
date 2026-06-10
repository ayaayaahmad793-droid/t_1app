import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/Rest_App_Screens/Pesron.dart';
import 'package:t_1app/providers/homeworld_provider.dart';
import 'package:t_1app/screens/CartPage.dart';
import 'package:t_1app/screens/Notification_Page.dart';
import 'package:t_1app/screens/exchangePage.dart';
import 'package:t_1app/widgets/EverydayLife_all.dart';
import 'package:t_1app/widgets/HomeWorld_all.dart';
import 'package:t_1app/widgets/Home_widget/HomeBanner.dart';
import 'package:t_1app/screens/FavPage.dart';
import 'package:t_1app/screens/department.dart';
import 'package:t_1app/widgets/HtheAll.dart';
import 'package:t_1app/SearchSett.dart';
import 'package:t_1app/widgets/SelectedPage.dart';
import 'package:t_1app/widgets/NavigationBar.dart';
import 'package:t_1app/widgets/category_chip.dart';
import 'package:t_1app/widgets/home_header.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/providers/home_product_provider.dart';
import 'package:t_1app/providers/daily_life_provider.dart';

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

 
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    myPages = [
      PageItem(title: "الكل", page: Htheall()),

      PageItem(title: "عالم البيت", page: HomeworldAll()),

      PageItem(title: "عالم الخير", page: Center(child: Text("عالم الخير"))),

      PageItem(title: "الحياة اليومية", page: EverydaylifeAll()),
    ];
  }

 

 

  @override
  void dispose() {
   
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<HomeProductProvider>(
      context,
      listen: false,
    );
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => Favpage()),
                );
                break;

              case 2:
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => Cartpage()),
                );
                break;

              case 3:
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => Department()),
                );
                break;

              case 4:
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => ProfileScreen()),
                );
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => NotificationsPage()),
                    );
                  },
                ),

                SizedBox(height: 10.h),

                /// SEARCH
                CustomSearchBar(
                  hintText: "ابحث عن منتجات...",
                  controller: searchController,
                 

                  onFilterPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Exchange()),
                    );
                  },

                 onChanged: (value) {
                    if (selectedText == "الكل") {
                      context.read<HomeProductProvider>().searchProducts(value);
                    }

                    if (selectedText == "عالم البيت") {
                      context.read<HomeworldProvider>().updateSearch(value);
                    }

                    if (selectedText == "الحياة اليومية") {
                      context.read<DailyLifeProvider>().updateSearch(value);
                    }
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