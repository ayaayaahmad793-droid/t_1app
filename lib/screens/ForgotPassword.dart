import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/screens/AuthCode.dart';
import 'package:t_1app/models/Button_Model.dart';
import 'package:t_1app/providers/forgot_provider.dart';
import 'package:t_1app/widgets/Button.dart';
import 'package:t_1app/widgets/CurveHeader.dart';
import 'package:t_1app/widgets/Phone_Widget.dart';
import 'package:t_1app/widgets/TextFiled.dart';

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
              const CurveHeader(title: "هل نسيت كلمة المرور"),
              Transform.translate(
                offset: Offset(0, -80.h), // زيدي أو قللي حسب الشكل
                child: Column(
                  children: [
                    /// النص التوضيحي
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 20.w),
                      child: Text(
                        "لا تقلق، هذا يحدث أحيانًا...يرجى إدخال البريد \nالإلكتروني المرتبط بحسابك أو رقم هاتفك.",
                        style: GoogleFonts.cairo(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff000000),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),

                    /// الإيميل
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
                        errorText: context.watch<ForgotProvider>().emailError,
                        onChanged: (val) {
                          context.read<ForgotProvider>().setEmail(val);
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),

                    /// رقم الهاتف
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: PhoneWidget(
                        errorText: context.watch<ForgotProvider>().phoneError,
                        onChanged: (val) {
                          context.read<ForgotProvider>().setPhone(val);
                        },
                      ),
                    ),

                    SizedBox(height: 20.h),

                    /// زر الإرسال
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: SizedBox(
                        height: 50.h,
                        width: double.infinity,
                        child: CustomButton(
                          button: ButtonModel(
                            text: " ارسال رمز التحقق",
                            color: Color(0xffF57C00),
                           onPressed: () {
                              final provider = context.read<ForgotProvider>();

                              if (provider.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => AuthCode()),
                                );
                              }
                            },
                         
                        ),
                      ),
                    ),)
                  ],
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
