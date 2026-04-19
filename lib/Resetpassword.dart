import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/SuccessProcess.dart';

class Resetpassword extends StatefulWidget {
  const Resetpassword({super.key});

  @override
  State<Resetpassword> createState() => _ResetpasswordState();
}

class _ResetpasswordState extends State<Resetpassword> {
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
                      " إعادة تعيين كلمة المرور",
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

                  Container(
                    padding: EdgeInsets.only(top: 185.h, right: 20.w),
                    child: Text(
                      " أعد تعيين كلمة المرور لتتمكن من تسجيل \n الدخول الى حسابك",
                      style: GoogleFonts.cairo(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15.h),

              /// كلمة المرور
              Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "كلمة المرور",
                    style: GoogleFonts.cairo(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 8.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: TextField(
                  obscureText: true,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: "ادخل كلمة المرور",
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff797878),
                    ),
                    filled: true,
                    fillColor: Color(0xffF5F5F5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: Icon(Icons.visibility_off_outlined),
                  ),
                ),
              ),

              SizedBox(height: 15.h),

              /// تأكيد كلمة المرور
              Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    " تأكيد كلمة المرور  ",
                    style: GoogleFonts.cairo(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 8.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: TextField(
                  obscureText: true,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: "ادخل كلمة المرور",
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff797878),
                    ),
                    filled: true,
                    fillColor: Color(0xffF5F5F5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: Icon(Icons.visibility_off_outlined),
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              /// زر
              Container(
                width: 350.w,
                height: 70.h,
                padding: EdgeInsets.only(top: 15.h),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffF57C00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Successprocess()),
                    );
                  },
                  child: Text(
                    "تأكيد الرمز",
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 15.h),
            ],
          ),
        ),
      ),
    );
  }
}
