import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/providers/otp_provider.dart';

class OtpFields extends StatelessWidget {
  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;
  final Function(int, String) onChanged;

  const OtpFields({
    super.key,
    required this.controllers,
    required this.focusNodes,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Container(
          width: 70.w,
          height: 50.h,
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: TextField(
            controller: controllers[index],
            focusNode: focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            style: GoogleFonts.cairo(
              fontWeight: FontWeight.w500,
              fontSize: 24.sp,
            ),
            decoration: InputDecoration(
              counterText: "",
              filled: true,
              fillColor: const Color(0xffF5F5F5),
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
           onChanged: (value) {
              context.read<OtpProvider>().setDigit(index, value);
              onChanged(index, value); // تبع الفوكس
            },
          ),
        );
      }),
    );
  }
}
