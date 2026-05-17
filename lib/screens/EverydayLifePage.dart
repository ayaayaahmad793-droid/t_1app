import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/SearchSett.dart';
import 'package:t_1app/SelectedPage.dart';
import 'package:t_1app/widgets/EverydayLife_all.dart';
import 'package:t_1app/widgets/MakeupAndClothes_all.dart';
import 'package:t_1app/widgets/header.dart';

class Everydaylifepage extends StatefulWidget {
  const Everydaylifepage({super.key});

  @override
  State<Everydaylifepage> createState() => _EverydaylifepageState();
}

class _EverydaylifepageState extends State<Everydaylifepage> {
  /// الصفحات الديناميكية
  final List<PageItem> myPages = [
    PageItem(title: "الكل", page: EverydaylifeAll()),

    PageItem(
      title: "مأكولات ومشروبات",
      page: const Center(child: Text("مأكولات ومشروبات")),
    ),

    PageItem(
      title: "الصحة والدواء",
      page: const Center(child: Text("الصحة والدواء")),
    ),

    PageItem(
      title: "منتجات العناية",
      page: const Center(child: Text("منتجات العناية")),
    ),

    PageItem(
      title: "منتجات التنظيف",
      page: const Center(child: Text("منتجات التنظيف")),
    ),

    PageItem(
      title: "أدوات مكتبية ",
      page: const Center(child: Text("أدوات مكتبية وقرطاسية")),
    ),
  ];

  /// القسم المختار
  String selectedText = "الكل";
  @override
  Widget build(BuildContext context) {
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
              CustomHeader(title: "الحياة اليومية"),

              SizedBox(height: 20.h),

              /// البحث
              Center(
                child: CustomSearchBar(
                  hintText: "ابحث عن المنتجات التي تريدها...",
                  isRecording: false,
                  onMicPressed: () {},
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
                          bool isSelected = selectedText == item.title;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedText = item.title;
                              });
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
                          bool isSelected = selectedText == item.title;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedText = item.title;
                              });
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
                  selectedText: selectedText,
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
