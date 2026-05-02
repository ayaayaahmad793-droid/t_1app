import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/HomePage.dart';
import 'package:t_1app/models/Button_Model.dart';
import 'package:t_1app/widgets/Button.dart';
import 'package:t_1app/widgets/CurveHeader.dart';
import 'package:t_1app/widgets/OrWidget.dart';
import 'package:t_1app/widgets/Remember_Forget.dart';
import 'package:t_1app/widgets/Social1_button.dart';
import 'package:t_1app/widgets/TextFiled.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/providers/login_provider.dart';

class Log extends StatefulWidget {
  const Log({super.key});

  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: SingleChildScrollView(
          //   physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              const CurveHeader(title: "تسجيل الدخول"),

              Transform.translate(
                offset: Offset(0, -80.h), // زيدي أو قللي حسب الشكل
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "البريد الالكتروني",
                          style: GoogleFonts.cairo(fontSize: 20.sp),
                        ),
                      ),
                    ),

                    SizedBox(height: 8.h),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: CustomTextField(
                        hint: "ادخل البريد الالكتروني",
                        icon: Icons.email_outlined,
                        errorText: context.watch<LoginProvider>().emailError,
                        onChanged: (val) {
                          context.read<LoginProvider>().setEmail(val);
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "كلمة المرور",
                          style: GoogleFonts.cairo(fontSize: 20.sp),
                        ),
                      ),
                    ),

                    SizedBox(height: 8.h),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: CustomTextField(
                        hint: "ادخل كلمة المرور",
                        icon: Icons.lock_outline,
                        isPassword: true,
                        errorText: context.watch<LoginProvider>().passwordError,
                        onChanged: (val) {
                          context.read<LoginProvider>().setPassword(val);
                        },
                      ),
                    ),

                    RememberForgotRow(
                      rememberMe: context.watch<LoginProvider>().rememberMe,
                      onChanged: (val) {
                        context.read<LoginProvider>().toggleRemember(val!);
                      },
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: SizedBox(
                        height: 50.h,
                        width: double.infinity,
                        child: CustomButton(
                          button: ButtonModel(
                            text: "تسجيل الدخول",
                            color: Color(0xffF57C00),
                            onPressed: () {
                              final provider = context.read<LoginProvider>();

                              if (provider.login()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => Homepage()),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),

                    Orwidget(),
                    SizedBox(height: 20.h),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: const SocialButton(
                        text: "متابعة عبر جوجل",
                        imagePath: "images/Google.png",
                      ),
                    ),

                    SizedBox(height: 10.h),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: const SocialButton(
                        text: "متابعة عبر انستغرام",
                        imagePath: "images/instagram.png",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Row(
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
            ],
          ),
        ),
      ),
    );
  }
}
