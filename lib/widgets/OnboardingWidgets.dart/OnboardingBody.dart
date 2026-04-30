import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingBody extends StatelessWidget {
  final String imagePath;
  final List<String> texts;
  final VoidCallback? onSkip;

  const OnboardingBody({
    super.key,
    required this.imagePath,
    required this.texts,
    this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// الصورة
        Image.asset(imagePath, width: 1.sw, height: 0.8.sh, fit: BoxFit.fill),

        /// زر تخطي
        Positioned(
          top: 60.h,
          left: 10.w,
          child: TextButton(
            onPressed: onSkip,
            child: Text(
              "تخطي",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),

        /// النصوص (ديناميكية)
        Positioned(
          top: 0.63.sh,
          left: 0,
          right: 0,
          child: Column(
            children: List.generate(texts.length, (index) {
              return Padding(
                padding: EdgeInsets.only(top: index == 0 ? 0 : 8.h),
                child: Text(
                  texts[index],
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cairo(
                    fontWeight: index == 0 ? FontWeight.w600 : FontWeight.w400,
                    fontSize: index == 0 ? 24.sp : 20.sp,
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
