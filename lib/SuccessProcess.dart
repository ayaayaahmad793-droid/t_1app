import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Successprocess extends StatefulWidget {
  const Successprocess({super.key});

  @override
  State<Successprocess> createState() => _SuccessprocessState();
}

class _SuccessprocessState extends State<Successprocess> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: SingleChildScrollView(
          child: Column(
            children: [
              /// الانحناء
              Stack(
                children: [
                  Image.asset(
                    "images/curve1.png",
                    width: double.infinity,
                    height: 250.h,
                    fit: BoxFit.fill,
                  ),

                  Positioned(
                    top: 80.h,
                    right: 20.w,
                    child: Text(
                      "نجاح العملية",
                      style: GoogleFonts.cairo(
                        color: Colors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  Positioned(
                    top: 80.h,
                    left: 10.w,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 185.h, right: 20.w),
                    child: Text(
                      "تم إعادة تعيين كلمة المرور بنجاح",
                      style: GoogleFonts.cairo(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30.h),

              Image.asset(
                "images/green_check.png",
                width: 210.w,
                height: 210.h,
                fit: BoxFit.fill,
              ),

              SizedBox(height: 10.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  "أعد تعيين كلمة المرور لتتمكن من استعادة حسابك \nوتسجيل الدخول",

                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff575151),
                  ),
                ),
              ),

              SizedBox(height: 30.h),

              SizedBox(
                width: 335.w,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffF57C00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "تسجيل الدخول",
                    style: GoogleFonts.cairo(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff000000),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
