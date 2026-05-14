import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeHeader extends StatelessWidget {
  final String userName;
  final String profileImage;
  final VoidCallback onNotificationTap;

  const HomeHeader({
    super.key,
    required this.userName,
    required this.profileImage,
    required this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 110.w,
          height: 37.h,
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff919191)),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            children: [
              Image.asset(profileImage, width: 37.w, height: 37.h),

              SizedBox(width: 5.w),

              Text(userName, style: GoogleFonts.cairo(fontSize: 12.sp)),
            ],
          ),
        ),

        IconButton(
          icon: const Icon(Icons.notifications_none),
          onPressed: onNotificationTap,
        ),
      ],
    );
  }
}
