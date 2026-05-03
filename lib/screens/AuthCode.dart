import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/screens/Resetpassword.dart';
import 'package:t_1app/models/Button_Model.dart';
import 'package:t_1app/providers/otp_provider.dart';
import 'package:t_1app/widgets/Button.dart';
import 'package:t_1app/widgets/CurveHeader.dart';
import 'package:t_1app/widgets/OTPfiled_widget.dart';
import 'package:t_1app/widgets/OTPtimer_widget.dart';

class AuthCode extends StatefulWidget {
  const AuthCode({super.key});

  @override
  State<AuthCode> createState() => _AuthCodeState();
}

class _AuthCodeState extends State<AuthCode> {
  final List<TextEditingController> controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );

  final List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  void nextField(int index, String value) {
    // إذا كتب رقم  يروح للي بعده
    if (value.isNotEmpty) {
      if (index < focusNodes.length - 1) {
        focusNodes[index + 1].requestFocus();
      } else {
        focusNodes[index].unfocus(); // آخر حقل
      }
    }
    // إذا حذف الرقم يرجع للي قبله
    else {
      if (index > 0) {
        focusNodes[index - 1].requestFocus();
      }
    }
  }

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

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
              const CurveHeader(title: " أدخل رمز التحقق"),

              Transform.translate(
                offset: Offset(0, -70.h), // زيدي أو قللي حسب الشكل
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.only(right: 20.w),
                      child: Text(
                        "يرجى التحقق من بريدك الالكتروني\nللحصول على رمز المتابعة.",
                        style: GoogleFonts.cairo(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff000000),
                        ),
                      ),
                    ),

                    /// مربعات الإدخال
                    SizedBox(height: 30.h),

                    OtpFields(
                      controllers: controllers,
                      focusNodes: focusNodes,
                      onChanged: nextField,
                    ),

                    SizedBox(height: 30.h),

                    /// زر التأكيد
                    SizedBox(
                      width: 340.w,
                      height: 48.h,
                      child: CustomButton(
                        button: ButtonModel(
                          text: "تأكيد الرمز",
                          color: Color(0xffF57C00),
                          onPressed: () {
                            final provider = context.read<OtpProvider>();

                            if (provider.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Resetpassword(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(provider.error ?? "")),
                              );
                            }
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: 15.h),

                    /// المؤقت
                    OtpTimer(
                      onResend: () {
                        print("Resend Code");
                      },
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
