import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CurveHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onBack;

  const CurveHeader({super.key, required this.title, this.onBack});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
            title,
            style: GoogleFonts.cairo(
              color: Colors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        Positioned(
          top: 80.h,
          left: 10.w,
          child: IconButton(
            icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
            onPressed: onBack ?? () => Navigator.pop(context),
          ),
        ),
      ],
    );
  }
}
