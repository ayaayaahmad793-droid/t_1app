import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/SearchSett.dart';
import 'package:t_1app/SelectedPage.dart';
import 'package:t_1app/widgets/HomeWorld_all.dart';
import 'package:t_1app/widgets/MakeupAndClothes_all.dart';
import 'package:t_1app/widgets/header.dart';

class Makeupandclothespage extends StatefulWidget {
  const Makeupandclothespage({super.key});

  @override
  State<Makeupandclothespage> createState() => _MakeupandclothespageState();
}

class _MakeupandclothespageState extends State<Makeupandclothespage> {
  /// الصفحات الديناميكية
  final List<PageItem> myPages = [
    PageItem(title: "الكل", page: MakeupandclothesAll()),

    PageItem(title: "مكياج", page: const Center(child: Text("مكياج"))),

    PageItem(
      title: "ملابس نسائية",
      page: const Center(child: Text("ملابس نسائية")),
    ),

    PageItem(
      title: "ملابس رجالية",
      page: const Center(child: Text("ملابس رجالية")),
    ),

    PageItem(
      title: "ملابس اطفال",
      page: const Center(child: Text("ملابس اطفال")),
    ),

    PageItem(title: "اكسسوارات", page: const Center(child: Text("اكسسوارات"))),
    PageItem(
      title: "ملابس رياضة",
      page: const Center(child: Text("ملابس رياضة")),
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
              CustomHeader(title: "عالم الملابس والمكياج"),

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
              Column(
                children: [
                  /// السطر الاول
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                        myPages.take(4).map((item) {
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:
                        myPages.skip(4).map((item) {
                          bool isSelected = selectedText == item.title;

                          return Padding(
                            padding: EdgeInsets.only(left: 10.w),

                            child: GestureDetector(
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
