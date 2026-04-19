import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:t_1app/AuthCode.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  String countryCode = "+970";
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  /// الصورة العلوية
                  Image.asset(
                    "images/curve1.png",
                    width: double.infinity,
                    height: 250.h,
                    fit: BoxFit.fill,
                  ),

                  /// العنوان
                  Positioned(
                    top: 80.h,
                    right: 20.w,
                    child: Text(
                      "هل نسيت كلمة المرور",
                      style: GoogleFonts.cairo(
                        color: Colors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  /// زر الرجوع
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

                  /// النص التوضيحي
                  Positioned(
                    top: 185.h,
                    right: 20.w,
                    left: 20.w,
                    child: Text(
                      "لا تقلق، هذا يحدث أحيانًا...يرجى إدخال البريد \nالإلكتروني المرتبط بحسابك أو رقم هاتفك.",
                      style: GoogleFonts.cairo(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),

              /// الإيميل
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: textField(
                  "البريد الإلكتروني",
                  "أدخل البريد الإلكتروني",
                  icon: Icons.email_outlined,
                ),
              ),
              SizedBox(height: 20.h),

              /// رقم الهاتف
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "رقم الهاتف",
                      style: GoogleFonts.cairo(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    SizedBox(
                      width: double.infinity,
                      height: 70.h,
                      child: IntlPhoneField(
                        initialCountryCode: 'PS',
                        decoration: InputDecoration(
                          hintText: "590000000",
                          hintStyle: GoogleFonts.cairo(
                            fontSize: 12.sp,
                            color: const Color(0xff797878),
                          ),
                          filled: true,
                          fillColor: const Color(0xffF5F5F5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),

              /// زر الإرسال
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffF57C00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AuthCode()),
                      );
                    },
                    child: Text(
                      "إرسال رمز التحقق",
                      style: GoogleFonts.cairo(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// TextField Widget
  Widget textField(String title, String hint, {IconData? icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.cairo(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 5.h),
        SizedBox(
          width: double.infinity,
          height: 50.h,
          child: TextField(
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: GoogleFonts.poppins(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xff797878),
              ),
              prefixIcon:
                  icon != null
                      ? Icon(icon, color: Color(0xff797878), size: 20.sp)
                      : null,
              filled: true,
              fillColor: const Color(0xffF5F5F5),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
