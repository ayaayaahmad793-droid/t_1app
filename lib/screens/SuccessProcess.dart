import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/HomePage.dart';
import 'package:t_1app/models/Button_Model.dart';
import 'package:t_1app/widgets/Button.dart';
import 'package:t_1app/widgets/CurveHeader.dart';

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
              const CurveHeader(title: "نجاح العملية"),

              Transform.translate(
                offset: Offset(0, -70.h), // زيدي أو قللي حسب الشكل
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.only(right: 20.w),
                      child: Text(
                        "تم إعادة تعيين كلمة المرور بنجاح",
                        style: GoogleFonts.cairo(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff000000),
                        ),
                      ),
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
                      width: 340.w,
                      height: 48.h,
                      child: CustomButton(
                        button: ButtonModel(
                          text: "تسحيل الدخول",
                          color: Color(0xffF57C00),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => Homepage()),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
