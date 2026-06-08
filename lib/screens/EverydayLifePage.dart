import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/SearchSett.dart';
import 'package:t_1app/screens/department.dart';
import 'package:t_1app/widgets/SelectedPage.dart';
import 'package:t_1app/widgets/EverydayLife_all.dart';
import 'package:t_1app/widgets/header.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/providers/daily_life_provider.dart';

class Everydaylifepage extends StatefulWidget {
  const Everydaylifepage({super.key});

  @override
  State<Everydaylifepage> createState() => _EverydaylifepageState();
}

class _EverydaylifepageState extends State<Everydaylifepage> {
    final TextEditingController searchController = TextEditingController();

  /// الصفحات الديناميكية
 final List<PageItem> myPages = [
    PageItem(title: "الكل", page: EverydaylifeAll()),

    PageItem(title: "مأكولات ومشروبات", page: EverydaylifeAll()),

    PageItem(title: "الصحة والدواء", page: EverydaylifeAll()),

    PageItem(title: "منتجات العناية", page: EverydaylifeAll()),

    PageItem(title: "منتجات التنظيف", page: EverydaylifeAll()),

    PageItem(title: "أدوات مكتبية ", page: EverydaylifeAll()),
  ];


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DailyLifeProvider>(context);
    return Directionality(
      textDirection: TextDirection.rtl,

      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              /// الهيدر
              CustomHeader(title: "الحياة اليومية",
                onBack: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => Department()),
                  );
                },
              ),

              SizedBox(height: 20.h),

              /// البحث
              Center(
                child: CustomSearchBar(
                  controller: searchController,
                  hintText: "ابحث عن المنتجات التي تريدها...",
                  
                  onFilterPressed: () {},
                ),
              ),

              SizedBox(height: 15.h),

              /// عنوان الاقسام
              Text(
                "الاقسام",
                style: GoogleFonts.cairo(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 12.h),

              /// الازرار
              /// الازرار
              Column(
                children: [
                  /// السطر الاول
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                        myPages.take(3).map((item) {
                         bool isSelected = provider.selectedText == item.title;

                          return GestureDetector(
                            onTap: () {
                              provider.selectCategory(item.title);
                            },

                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14.w,
                                vertical: 8.h,
                              ),

                              decoration: BoxDecoration(
                                color:
                                    isSelected
                                        ? const Color(0xffF57C00)
                                        : Colors.white,

                                borderRadius: BorderRadius.circular(20.r),

                                border: Border.all(
                                  color:
                                      isSelected
                                          ? const Color(0xffF57C00)
                                          : const Color(0xff919191),
                                ),
                              ),

                              child: Text(
                                item.title,

                                style: GoogleFonts.cairo(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                  ),

                  SizedBox(height: 10.h),

                  /// السطر الثاني
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                        myPages.skip(3).take(3).map((item) {
                          bool isSelected = provider.selectedText == item.title;

                          return GestureDetector(
                            onTap: () {
                             provider.selectCategory(item.title);
                            },

                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14.w,
                                vertical: 8.h,
                              ),

                              decoration: BoxDecoration(
                                color:
                                    isSelected
                                        ? const Color(0xffF57C00)
                                        : Colors.white,

                                borderRadius: BorderRadius.circular(20.r),

                                border: Border.all(
                                  color:
                                      isSelected
                                          ? const Color(0xffF57C00)
                                          : const Color(0xff919191),
                                ),
                              ),

                              child: Text(
                                item.title,

                                style: GoogleFonts.cairo(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: DynamicSelectedPage(
                  selectedText: provider.selectedText,
                  items: myPages,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
