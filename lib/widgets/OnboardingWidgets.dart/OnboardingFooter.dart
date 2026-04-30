import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t_1app/widgets/OnboardingWidgets.dart/nextButton.dart';

class OnboardingFooter extends StatelessWidget {
  final String dotsImage;
  final String buttonText;
  final Widget nextPage;

  const OnboardingFooter({
    super.key,
    required this.dotsImage,
    required this.buttonText,
    required this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25.h),
        Image.asset(dotsImage),

        SizedBox(height: 25.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Nextbutton(text: buttonText, nextPage: nextPage),
        ),
      ],
    );
  }
}
