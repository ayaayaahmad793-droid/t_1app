import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/screens/AccountType.dart';
import 'package:t_1app/HomePage.dart';
import 'package:t_1app/models/Button_Model.dart';
import 'package:t_1app/widgets/Button.dart';
import 'package:t_1app/widgets/CurveHeader.dart';
import 'package:t_1app/widgets/OrWidget.dart';
import 'package:t_1app/widgets/Phone_Widget.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/providers/register_provider.dart';
import 'package:t_1app/widgets/TextFiled.dart';

class Create_Account extends StatefulWidget {
  const Create_Account({super.key});

  @override
  State<Create_Account> createState() => _Create_AccountState();
}

class _Create_AccountState extends State<Create_Account> {
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
              const CurveHeader(title: "انشاء حساب"),
              Transform.translate(
                offset: Offset(0, -90.h), // زيدي أو قللي حسب الشكل
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "الاسم كامل",
                          style: GoogleFonts.cairo(fontSize: 20.sp),
                        ),
                      ),
                    ),

                    SizedBox(height: 6.h),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: CustomTextField(
                        hint: "ادخل اسمك كامل",
                        icon: Icons.person,
                        errorText: context.watch<RegisterProvider>().nameError,
                        onChanged: (val) {
                          context.read<RegisterProvider>().setName(val);
                        },
                      ),
                    ),
                    SizedBox(height: 8.h),
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

                    SizedBox(height: 6.h),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: CustomTextField(
                        hint: "ادخل البريد الالكتروني",
                        icon: Icons.email_outlined,
                        errorText: context.watch<RegisterProvider>().emailError,
                        onChanged: (val) {
                          context.read<RegisterProvider>().setEmail(val);
                        },
                      ),
                    ),

                    SizedBox(height: 8.h),

                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: PhoneWidget(
                        onChanged: (val) {
                          context.read<RegisterProvider>().setPhone(val);
                        },
                      ),
                    ),

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

                    SizedBox(height: 6.h),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: CustomTextField(
                        hint: "ادخل كلمة المرور",
                        icon: Icons.lock_outline,
                        isPassword: true,
                        errorText:
                            context.watch<RegisterProvider>().passwordError,
                        onChanged: (val) {
                          context.read<RegisterProvider>().setPassword(val);
                        },
                      ),
                    ),

                    /// checkbox
                    Row(
                      children: [
                        Checkbox(
                          value: context.watch<RegisterProvider>().agree,
                          onChanged: (value) {
                            context.read<RegisterProvider>().toggleAgree(
                              value!,
                            );
                          },
                        ),
                        Expanded(
                          child: Text(
                            "اوافق على الشروط والاحكام الخاصة بالسياسة",
                            style: GoogleFonts.cairo(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: SizedBox(
                        height: 50.h,
                        width: double.infinity,
                        child: CustomButton(
                          button: ButtonModel(
                            text: "انشاء حساب",
                            color: Color(0xffF57C00),
                            onPressed: () {
                              final provider = context.read<RegisterProvider>();

                              if (provider.validate()) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => Accounttype(),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 8.h),

                    Orwidget(),

                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(8.r),
                          onTap: () {
                            print("Instagram Clicked");
                          },
                          child: Container(
                            width: 66.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                              color: const Color(0xffF5F5F5),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Center(
                              child: Image.asset(
                                "images/instagram.png",
                                width: 26.w,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: 15.w),

                        InkWell(
                          borderRadius: BorderRadius.circular(8.r),
                          onTap: () {
                            print("Google Clicked");
                            // حطي هون كود Google Sign-In
                          },
                          child: Container(
                            width: 66.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                              color: const Color(0xffF5F5F5),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Center(
                              child: Image.asset(
                                "images/Google.png",
                                width: 26.w,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "لديك حساب بالفعل؟ ",
                          style: GoogleFonts.cairo(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "سجل الدخول",
                          style: GoogleFonts.cairo(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
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
}
