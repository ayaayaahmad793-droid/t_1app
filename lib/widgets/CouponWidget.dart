import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CouponWidget extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onApply;

  const CouponWidget({
    super.key,
    required this.controller,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52.h,

      padding: EdgeInsets.all(10.w),

      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff919191)),

        borderRadius: BorderRadius.circular(20.r),

        color: Colors.white,
      ),

      child: Row(
        children: [
          /// TEXT FIELD
          Expanded(
            child: TextField(
              controller: controller,

              textAlign: TextAlign.right,

              decoration: InputDecoration(
                hintText: "كود الخصم",

                hintStyle: GoogleFonts.cairo(
                  fontSize: 16.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),

                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(width: 20.w),

          /// APPLY BUTTON
          SizedBox(
            width: 110.w,
            height: 42.h,

            child: ElevatedButton(
              onPressed: onApply,

              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffF57C00),

                elevation: 0,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
              ),

              child: Text(
                "تطبيق",

                style: GoogleFonts.cairo(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
