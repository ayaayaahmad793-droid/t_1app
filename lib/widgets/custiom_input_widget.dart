import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final String? hint;
  final double width;
  final double height;

  const CustomInput({
    super.key,
    required this.controller,
    this.type = TextInputType.text,
    this.hint,
    this.width = double.infinity,
    this.height = 48,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: SizedBox(
        width: width.w,
        height: height.h,
        child: TextField(
          controller: controller,
          keyboardType: type,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: const Color(0xffFFFFFF),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
      ),
    );
  }
}
