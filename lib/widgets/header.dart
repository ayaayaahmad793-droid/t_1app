import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onBack;

  const CustomHeader({super.key, required this.title, this.onBack});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 60.h),
          child: Center(
            child: Container(
              padding: EdgeInsets.only(),
              child: Text(
                title,
                style: GoogleFonts.cairo(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff000000),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 57.h,
          left: 10.w,
          child: IconButton(
            icon: const Icon(Icons.arrow_forward_ios, color: Color(0xff000000)),
            onPressed:
                onBack ??
                () {
                  Navigator.pop(context);
                },
          ),
        ),
      ],
    );
  }
}
