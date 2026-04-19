import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/Onboarding3.dart';
import 'package:t_1app/WelcomePage.dart';

class Onboarding2 extends StatefulWidget {
  const Onboarding2({super.key});

  @override
  State<Onboarding2> createState() => _Onboarding2State();
}

class _Onboarding2State extends State<Onboarding2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Column(
        children: [
          /// الجزء العلوي
          Stack(
            children: [
              /// الصورة المائلة
              Image.asset(
                "images/Ellipse 1.png",
                width: 1.sw,
                height: 0.8.sh,
                fit: BoxFit.fill,
              ),

              /// زر تخطي
              Positioned(
                top: 60.h,
                left: 10.w,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Welcomepage()),
                    );
                  },
                  child: Text(
                    "تخطي",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              /// النصوص
              Container(
                padding: EdgeInsets.only(top: 0.63.sh),
                alignment: Alignment.center,
                child: Text(
                  "تسوق و بيع بسهولة",
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.w600,
                    fontSize: 24.sp,
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(top: 0.69.sh),
                alignment: Alignment.center,
                child: Text(
                  ",اكتشف المنتجات العصرية",
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.w400,
                    fontSize: 20.sp,
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(top: 0.73.sh),
                alignment: Alignment.center,
                child: Text(
                  "وادعم الاعمال الصغيرة",
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.w400,
                    fontSize: 20.sp,
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(top: 0.77.sh),
                alignment: Alignment.center,
                child: Text(
                  " .بسهولة وأمان",
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.w400,
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ],
          ),

          /// المؤشر (dots)
          SizedBox(height: 25.h),
          Image.asset("images/Frame 2 (1).png", width: 100.w),

          /// زر التالي
          SizedBox(height: 25.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SizedBox(
              width: 1.sw,
              height: 50.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff2E7D32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Onboarding3()),
                  );
                },
                child: Text(
                  "التالي",
                  style: GoogleFonts.cairo(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
