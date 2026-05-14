import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GridItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const GridItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff919191)),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Icon(icon, color: const Color(0xff2E7D32), size: 24.sp),
            ),
            SizedBox(height: 15.h),
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.cairo(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
