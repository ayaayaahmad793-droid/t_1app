import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:t_1app/screens/ForgotPassword.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool agree = false;
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),

        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /// 🔷 الهيدر
                  Stack(
                    children: [
                      /// الصورة العلوية
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
                          "انشاء حساب",
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

                      /// الاسم
                      Positioned(
                        bottom: 0,
                        right: 20,
                        left: 20,
                        child: textField("الاسم كامل", "ادخل اسمك الكامل"),
                      ),
                    ],
                  ),

                  /// الفورم (يتمدّد)
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        textField(
                          "البريد الالكتروني",
                          "ادخل البريد الالكتروني",
                          icon: Icons.email_outlined,
                        ),

                        /// الهاتف
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "رقم الهاتف",
                              style: GoogleFonts.cairo(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 5),
                            IntlPhoneField(
                              initialCountryCode: 'PS',
                              decoration: InputDecoration(
                                hintText: "590000000",
                                hintStyle: GoogleFonts.cairo(
                                  fontSize: 12,
                                  color: const Color(0xff797878),
                                ),
                                filled: true,
                                fillColor: const Color(0xffF5F5F5),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ],
                        ),

                        textField(
                          "كلمة المرور",
                          "ادخل كلمة المرور",
                          isPassword: true,
                          icon: Icons.lock_outline,
                        ),

                        /// checkbox
                        Row(
                          children: [
                            Checkbox(
                              value: agree,
                              onChanged: (value) {
                                setState(() {
                                  agree = value!;
                                });
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
                        SizedBox(height: 10.h),

                        /// زر
                        SizedBox(
                          width: double.infinity,
                          height: size.height * 0.06,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffF57C00),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Forgotpassword(),
                                ),
                              );
                            },
                            child: Text(
                              "إنشاء حساب",
                              style: GoogleFonts.cairo(
                                fontSize: size.width * 0.045,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),

                        /// او
                        Row(
                          children: [
                            Expanded(
                              child: Divider(thickness: 1, color: Colors.black),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                              child: Text(
                                "او",
                                style: GoogleFonts.cairo(
                                  fontSize: size.width * 0.04,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(thickness: 1, color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),

                        /// سوشيال
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            socialIcon("images/instagram.png"),
                            SizedBox(width: 20.h),
                            socialIcon("images/Google.png"),
                          ],
                        ),
                        SizedBox(height: 20.h),

                        /// تسجيل الدخول
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
        ),
      ),
    );
  }

  /// 🔹 TextField
  Widget textField(
    String title,
    String hint, {
    bool isPassword = false,
    IconData? icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.cairo(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 5.h),
        TextField(
          obscureText: isPassword ? this.isPassword : false,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.cairo(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xff797878),
            ),
            prefixIcon: icon != null ? Icon(icon, color: Colors.grey) : null,
            suffixIcon:
                isPassword
                    ? IconButton(
                      icon: Icon(
                        this.isPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          this.isPassword = !this.isPassword;
                        });
                      },
                    )
                    : null,
            filled: true,
            fillColor: const Color(0xffF5F5F5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  /// 🔹 سوشيال
  Widget socialIcon(String image) {
    return Container(
      width: 60.w,
      height: 45.h,
      decoration: BoxDecoration(
        color: const Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Center(child: Image.asset(image, width: 26.w)),
    );
  }
}
