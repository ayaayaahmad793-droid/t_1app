import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GreenHeader extends StatelessWidget {
  final String title;

  const GreenHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "images/linear1.png",
          fit: BoxFit.fill,
          width: double.infinity,
          height: 115.h,
        ),

        Padding(
          padding: EdgeInsets.only(top: 70.h),
          child: Center(
            child: Text(
              title, //  هون صار ديناميك
              style: GoogleFonts.cairo(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xffFFFFFF),
              ),
            ),
          ),
        ),

        Positioned(
          top: 57.h,
          left: 10.w,
          child: IconButton(
            icon: const Icon(Icons.arrow_forward_ios, color: Color(0xff000000)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
