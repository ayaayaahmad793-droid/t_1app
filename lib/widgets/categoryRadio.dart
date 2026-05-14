import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryRadio extends StatefulWidget {
  const CategoryRadio({super.key});

  @override
  State<CategoryRadio> createState() => _CategoryRadioState();
}

class _CategoryRadioState extends State<CategoryRadio> {
  String selectedCategory = "كريم ترطيب";

  final List<String> categories = ["كريم ترطيب", "كريم تفتيح", "كريم حماية"];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,

      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),

        color: const Color(0xffFFFFFF),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              "اقسام Skin Proad",

              style: GoogleFonts.cairo(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),

            SizedBox(height: 4.h),

            Text(
              "استكشف حسب الفئة",

              style: GoogleFonts.cairo(fontSize: 13.sp, color: Colors.black54),
            ),

            SizedBox(height: 20.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children:
                  categories.map((category) {
                    return Row(
                      children: [
                        SizedBox(
                          width: 22.w,
                          height: 22.h,

                          child: Radio<String>(
                            value: category,
                            groupValue: selectedCategory,

                            onChanged: (value) {
                              setState(() {
                                selectedCategory = value!;
                              });
                            },
                          ),
                        ),

                        SizedBox(width: 4.w),

                        Text(
                          category,

                          style: GoogleFonts.cairo(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
