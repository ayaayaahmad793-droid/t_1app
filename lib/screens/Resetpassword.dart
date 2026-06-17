import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:t_1app/Rest_App_Screens/Services/Auth_Supa.dart';
import 'package:t_1app/screens/SuccessProcess.dart';
import 'package:t_1app/models/Button_Model.dart';
import 'package:t_1app/providers/reset_provider.dart';
import 'package:t_1app/widgets/Button.dart';
import 'package:t_1app/widgets/CurveHeader.dart';
import 'package:t_1app/widgets/TextFiled.dart';

class Resetpassword extends StatelessWidget {
  const Resetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CurveHeader(title: "اعادة تعيين كلمة المرور"),
              Transform.translate(
                offset: Offset(0, -70.h),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.only(right: 20.w),
                      child: Text(
                        " أعد تعيين كلمة المرور لتتمكن من تسجيل \n الدخول الى حسابك",
                        style: GoogleFonts.cairo(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff000000),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),

                    // كلمة المرور
                    Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text("كلمة المرور", style: GoogleFonts.cairo(fontSize: 20.sp, fontWeight: FontWeight.w500)),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: CustomTextField(
                        hint: "ادخل كلمة المرور",
                        icon: Icons.lock_outline,
                        isPassword: true,
                        errorText: context.watch<ResetProvider>().passwordError,
                        onChanged: (val) => context.read<ResetProvider>().setPassword(val),
                      ),
                    ),
                    SizedBox(height: 15.h),

                    // تأكيد كلمة المرور
                    Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text("تأكيد كلمة المرور", style: GoogleFonts.cairo(fontSize: 20.sp, fontWeight: FontWeight.w500)),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: CustomTextField(
                        hint: "ادخل كلمة المرور",
                        icon: Icons.lock_outline,
                        isPassword: true,
                        errorText: context.watch<ResetProvider>().confirmError,
                        onChanged: (val) => context.read<ResetProvider>().setConfirmPassword(val),
                      ),
                    ),
                    SizedBox(height: 20.h),

                    // الزر
                    SizedBox(
                      width: 340.w,
                      height: 48.h,
                      child: CustomButton(
                        button: ButtonModel(
                          text: "تغيير كلمة المرور",
                          color: const Color(0xffF57C00),
                          onPressed: () async {
                            final provider = context.read<ResetProvider>();
                            if (provider.validate()) {
                              try {
                                await AuthService().updatePassword(provider.password);
                                Get.offAll(() => const Successprocess());
                              } catch (e) {
                                Get.snackbar("خطأ", "فشل التحديث: $e");
                              }
                            }
                          },
                        ),
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
}
