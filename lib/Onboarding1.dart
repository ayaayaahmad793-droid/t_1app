import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t_1app/Onboarding2.dart';

class Onboarding1 extends StatefulWidget {
  const Onboarding1({super.key});

  @override
  State<Onboarding1> createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Stack(
          children: [
            /// الصورة الخلفية
            SizedBox(
              width: 1.sw,
              height: 1.sh,
              child: Image.asset("images/Diamond.png", fit: BoxFit.fill),
            ),

            /// اللوجو
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(bottom: 290.h),
                child: Image.asset("images/Logo.png", width: 1.6.sw),
              ),
            ),

            /// النص الأول
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: 250.h),
                child: Text(
                  "مرحباً بك في سوق غزة الانساني",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cairo(
                    fontSize: 24.sp,
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            /// النص الثاني
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: 320.h),
                child: Text(
                  "انطلق وابدأ رحلتك معنا",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cairo(
                    fontSize: 22.sp,
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            /// زر انطلق
            Positioned(
              bottom: 30.h,
              right: 20.w,
              child: SizedBox(
                width: 185.w,
                height: 51.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2E7D32),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 25.w,
                      vertical: 12.h,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Onboarding2()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("images/Arrow 1.png", width: 20.w),
                      SizedBox(width: 15.w),
                      Text(
                        "انطلق",
                        style: GoogleFonts.cairo(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
