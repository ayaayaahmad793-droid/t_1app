import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/AccountType.dart';
import 'package:t_1app/ForgotPassword.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool rememberMe = false;

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
                      " تسجيل الدخول",
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
                  Positioned(
                    bottom: 60.h,
                    right: 20.w,
                    child: Text(
                      "البريد الالكتروني",
                      style: GoogleFonts.cairo(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  Positioned(
                    top: 200.h,
                    right: 20.w,
                    left: 20.w,
                    child: SizedBox(
                      height: 50.h,
                      child: TextField(
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          hintText: "ادخل البريد الالكتروني",
                          hintStyle: GoogleFonts.poppins(fontSize: 12.sp),
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            size: 20.sp,
                            color: Color(0xff797878),
                          ),
                          filled: true,
                          fillColor: Color(0xffF5F5F5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15.h),

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
                    hintStyle: GoogleFonts.poppins(fontSize: 12.sp),
                    filled: true,
                    fillColor: Color(0xffF5F5F5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      size: 20.sp,
                      color: Color(0xff797878),
                    ),
                    suffixIcon: Icon(
                      Icons.visibility_off_outlined,
                      size: 20.sp,
                      color: Color(0xff797878),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10.h),

              Row(
                children: [
                  Checkbox(
                    value: rememberMe,
                    onChanged: (value) {
                      setState(() => rememberMe = value!);
                    },
                    activeColor: Color(0xffF57C00),
                  ),
                  Text(
                    "تذكرني لاحقا",
                    style: GoogleFonts.cairo(fontSize: 14.sp),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Forgotpassword(),
                          ),
                        );
                      },
                      child: Text(
                        "نسيت كلمة المرور؟",
                        style: GoogleFonts.cairo(
                          color: Colors.red,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SizedBox(
                  width: double.infinity, // ✅ بدل 375
                  height: 50.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffF57C00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Accounttype()),
                      );
                    },
                    child: Text(
                      "تسجيل الدخول",
                      style: GoogleFonts.cairo(
                        fontSize: 16.sp,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      indent: 20, // بداية الخط من اليسار
                      endIndent: 20, // نهاية الخط من اليمين
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      "او",
                      style: GoogleFonts.cairo(fontSize: 16.sp),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      indent: 20, // بداية الخط من اليسار
                      endIndent: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: socialButton(
                  text: "متابعة عبر جوجل",
                  icon: Image.asset(
                    "images/Google.png",
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
              ),

              SizedBox(height: 10.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: socialButton(
                  text: "متابعة عبر انستغرام",
                  icon: Image.asset(
                    "images/instagram.png",
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              Padding(
                padding: EdgeInsets.only(top: 90.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ليس لديك حساب؟ ",
                      style: GoogleFonts.cairo(fontSize: 16.sp),
                    ),
                    Text(
                      "سجل الآن",
                      style: GoogleFonts.cairo(
                        color: Color(0xffF57C00),
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget socialButton({required String text, required Widget icon}) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xffF5F5F5),
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(width: 8.w),
            Text(text, style: GoogleFonts.cairo(fontSize: 16.sp)),
          ],
        ),
      ),
    );
  }
}
