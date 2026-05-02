import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/screens/ForgotPassword.dart';

class RememberForgotRow extends StatelessWidget {
  final bool rememberMe;
  final Function(bool?) onChanged;

  const RememberForgotRow({
    super.key,
    required this.rememberMe,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: rememberMe,
          onChanged: onChanged,
          activeColor: const Color(0xffF57C00),
        ),
        Text("تذكرني لاحقا", style: GoogleFonts.cairo(fontSize: 14.sp)),
        const Spacer(),
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => Forgotpassword()),
              );
            },
            child: Text(
              "نسيت كلمة المرور؟",
              style: GoogleFonts.cairo(color: Colors.red, fontSize: 14.sp),
            ),
          ),
        ),
      ],
    );
  }
}
