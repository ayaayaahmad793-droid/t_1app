import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryChip extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryChip({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18.r),
      onTap: onTap,
      child: Container(
        width: 100.w,
        height: 35.h,
        margin: EdgeInsets.only(left: 8.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffF57C00) : Colors.transparent,

          border: Border.all(
            color:
                isSelected ? const Color(0xffF57C00) : const Color(0xff919191),
          ),

          borderRadius: BorderRadius.circular(18.r),
        ),

        child: Text(text, style: GoogleFonts.cairo(fontSize: 14.sp)),
      ),
    );
  }
}
