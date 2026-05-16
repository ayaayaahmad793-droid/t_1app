import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/SearchSett.dart';
import 'package:t_1app/SelectedPage.dart';
import 'package:t_1app/widgets/HomeWorld_all.dart';
import 'package:t_1app/widgets/header.dart';

class Homeworld extends StatefulWidget {
  const Homeworld({super.key});

  @override
  State<Homeworld> createState() => _HomeworldState();
}

class _HomeworldState extends State<Homeworld> {
  /// الصفحات الديناميكية
  final List<PageItem> myPages = [
    PageItem(title: "الكل", page: const HomeworldAll()),

    PageItem(
      title: "ادوات منزلية",
      page: const Center(child: Text("ادوات منزلية")),
    ),

    PageItem(
      title: "اجهزة منزلية صغيرة",
      page: const Center(child: Text("اجهزة منزلية صغيرة")),
    ),

    PageItem(title: "اثاث", page: const Center(child: Text("اثاث"))),

    PageItem(title: "ديكور", page: const Center(child: Text("ديكور"))),

    PageItem(
      title: "مستلزمات التخزين",
      page: const Center(child: Text("مستلزمات التخزين")),
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
              CustomHeader(title: "عالم البيت"),

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
              Wrap(
                spacing: 10.w,
                runSpacing: 10.h,

                children:
                    myPages.map((item) {
                      bool isSelected = selectedText == item.title;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedText = item.title;
                          });
                        },

                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
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
                                      : Color(0xff919191),
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
