import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/models/Home_all_model/product_model.dart';
import 'package:t_1app/screens/HomePage.dart';
import 'package:t_1app/SearchSett.dart';
import 'package:t_1app/widgets/SelectedPage.dart';
import 'package:t_1app/widgets/UniqeAll.dart';
import 'package:t_1app/widgets/header.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/providers/uniqe_product_provider.dart';

class Uniqeproduct extends StatefulWidget {
  const Uniqeproduct({super.key});

  @override
  State<Uniqeproduct> createState() => _UniqeproductState();
}

class _UniqeproductState extends State<Uniqeproduct> {
  final TextEditingController searchController = TextEditingController();

  ///  الصفحات الديناميكية
  final List<PageItem> myPages = [
    PageItem(title: "الكل", page: Uniqeall()),
    PageItem(title: "كوزمتكس", page: Uniqeall()),
    PageItem(title: "ادوات الكترونية", page: Uniqeall()),
    PageItem(title: "ملابس", page: Uniqeall()),
  ];
  

 

  @override
  void dispose() {
    
    super.dispose();
  }

  List<Product> filteredProducts = [];
  @override
  void initState() {
    super.initState();
  }



  @override
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UniqeProductProvider>(context, listen: false);
    
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),

        body: Padding(
          padding: EdgeInsets.only(right: 20.w, left: 10.w), //  padding عام
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeader(
                title: "منتجات مميزة",
                onBack: () {
                  Navigator.of(
                    context,
                  ).pushReplacement(MaterialPageRoute(builder: (context) => Homepage()));
                },
              ),

              SizedBox(height: 10.h),

              /// SEARCH
              CustomSearchBar(
                controller: searchController,
                hintText: "ابحث عن المنتجات التي تريدها...",
                
                onFilterPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Uniqeproduct()),
                  );
                },
                onChanged: (value) {
                  provider.searchProducts(value);
                },
              ),

              SizedBox(height: 20.h),

              /// TITLE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "الاقسام",
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    "شاهد الكل",
                    style: GoogleFonts.cairo(
                      fontSize: 13.sp,
                      color: const Color(0xff979797),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              /// CATEGORIES
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
              SizedBox(height: 20.h),

              /// الصفحات
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

  ///  CHIP
  Widget chip(String text) {
    final provider = Provider.of<UniqeProductProvider>(context);

    return InkWell(
      borderRadius: BorderRadius.circular(18.r),
      onTap: () {
        provider.selectCategory(text);
      },
      child: Container(
        width: 100.w,
        height: 35.h,
        margin: EdgeInsets.only(left: 8.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color:
              provider.selectedText == text
                  ? const Color(0xffF57C00)
                  : Colors.transparent,
          border: Border.all(
            color:
                provider.selectedText == text
                    ? const Color(0xffF57C00)
                    : const Color(0xff919191),
          ),
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Text(text, style: GoogleFonts.cairo(fontSize: 14.sp)),
      ),
    );
  }
}
