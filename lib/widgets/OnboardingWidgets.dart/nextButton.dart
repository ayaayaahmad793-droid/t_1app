import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Nextbutton extends StatelessWidget {
  final String text;
  final Widget nextPage;

  const Nextbutton({super.key, required this.text, required this.nextPage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff2E7D32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => nextPage));
        },
        child: Text(
          text,
          style: GoogleFonts.cairo(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
