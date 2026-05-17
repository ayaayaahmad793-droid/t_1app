import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/screens/HomePage.dart';
import 'package:t_1app/screens/FavPage.dart';
import 'package:t_1app/widgets/NavigationBar.dart';
import 'package:t_1app/models/depCategory.dart';
import 'package:t_1app/widgets/depCategoryCard.dart';
import 'package:t_1app/widgets/greenHeader.dart';

class Department extends StatefulWidget {
  const Department({super.key});

  @override
  State<Department> createState() => _DepartmentState();
}

class _DepartmentState extends State<Department> {
  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,

      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),

        body: Column(
          children: [
            GreenHeader(title: "الاقسام"),

            SizedBox(height: 20.h),

            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(right: 20.w),

              child: Text(
                "الأقسام الرئيسية",

                style: GoogleFonts.cairo(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
            ),
            SizedBox(height: 20.h),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),

                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: categories.length,

                  itemBuilder: (context, index) {
                    final category = categories[index];

                    return CategoryCard(
                      category: category,

                      onTap: () {
                        Navigator.pushReplacement(
                          context,

                          MaterialPageRoute(
                            builder: (context) => category.page,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),

        bottomNavigationBar: CustomNavBar(
          currentIndex: _currentIndex,

          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });

            switch (index) {
              case 0:
                Navigator.pushReplacement(
                  context,

                  MaterialPageRoute(builder: (_) => Homepage()),
                );
                break;

              case 1:
                Navigator.pushReplacement(
                  context,

                  MaterialPageRoute(builder: (_) => Favpage()),
                );
                break;

              case 2:
                break;

              case 3:
                break;

              case 4:
                break;
            }
          },
        ),
      ),
    );
  }
}
