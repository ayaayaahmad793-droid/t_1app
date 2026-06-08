import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/SearchSett.dart';
import 'package:t_1app/screens/department.dart';
import 'package:t_1app/widgets/SelectedPage.dart';
import 'package:t_1app/widgets/Technology_all.dart';
import 'package:t_1app/widgets/header.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/providers/technology_provider.dart';

class Technologypage extends StatefulWidget {
  const Technologypage({super.key});

  @override
  State<Technologypage> createState() => _TechnologypageState();
}

class _TechnologypageState extends State<Technologypage> {
    final TextEditingController searchController = TextEditingController();

  /// الصفحات الديناميكية
  final List<PageItem> myPages = [
    PageItem(title: "الكل", page: TechnologyAll()),

    PageItem(
      title: "هواتف ذكية",
     page: TechnologyAll(),
    ),

    PageItem(
      title: "اجهزة كمبيوتر ولابتوب",
      page: TechnologyAll(),
    ),

    PageItem(
      title: "اجهزة لوحية", page: TechnologyAll(),
    ),

    PageItem(
      title: "اجهزة صوت وصورة",
      page: TechnologyAll(),
    ),

    PageItem(
      title: "ملحقات واكسسوارات",
      page: TechnologyAll(),
    ),
  ];


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TechnologyProvider>(context);
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
              CustomHeader(title: "التكنولوجيا",
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
                  onChanged: (value) {
                    provider.updateSearch(value);
                  },
                 
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
                                horizontal: 5.w,
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
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
