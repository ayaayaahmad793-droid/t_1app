import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/providers/forgot_provider.dart';
import 'package:t_1app/providers/otp_provider.dart';
import 'package:t_1app/screens/Resetpassword.dart';
import 'package:t_1app/models/Button_Model.dart';
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
  final List<TextEditingController> controllers = List.generate(6, (index) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());

  void nextField(int index, String value) {
    if (value.isNotEmpty) {
      if (index < focusNodes.length - 1) {
        focusNodes[index + 1].requestFocus();
      } else {
        focusNodes[index].unfocus();
      }
    } else {
      if (index > 0) {
        focusNodes[index - 1].requestFocus();
      }
    }
  }

  @override
  void dispose() {
    for (var c in controllers) c.dispose();
    for (var f in focusNodes) f.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CurveHeader(title: " أدخل رمز التحقق"),
              Transform.translate(
                offset: Offset(0, -70.h),
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
                    SizedBox(height: 30.h),
                    OtpFields(
                      controllers: controllers,
                      focusNodes: focusNodes,
                      onChanged: nextField,
                    ),
                    SizedBox(height: 30.h),
                    SizedBox(
                      width: 340.w,
                      height: 48.h,
                      child: CustomButton(
                        button: ButtonModel(
                          text: "تأكيد الرمز",
                          color: const Color(0xffF57C00),
                          onPressed: () async {
                            final otpProv = context.read<OtpProvider>();
                            final forgotProv = context.read<ForgotProvider>();

                            bool success = await otpProv.verifyCodeWithAuth(
                                context, forgotProv.email, controllers);

                            if (success) {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => const Resetpassword()));
                            } else {
                              Get.snackbar("خطأ", otpProv.error ?? "الرمز غير صحيح");
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    OtpTimer(onResend: () => print("Resend Code")),
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
