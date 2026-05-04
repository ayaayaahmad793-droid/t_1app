import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountTypeCard extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const AccountTypeCard({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 101.h,
        width: 350.w,
        margin: EdgeInsets.symmetric(vertical: 10.h),
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          border: Border.all(
            color:
                selectedIndex == index
                    ? const Color(0xffF57C00)
                    : const Color(0xff919191),
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 50.w,
              height: 50.h,
              child: const CircleAvatar(
                backgroundColor: Color(0xff2E7D32),
                child: Icon(Icons.person, color: Colors.white),
              ),
            ),

            SizedBox(width: 5.w),

            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.cairo(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      subtitle,
                      style: GoogleFonts.cairo(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(width: 10.w),

            SizedBox(
              width: 30.w,
              height: 30.h,
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xffF57C00),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
