import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final Function(String)? onChanged;
  final bool isRecording;
  final VoidCallback onMicPressed;
  final VoidCallback onFilterPressed;

  const CustomSearchBar({
    super.key,
    required this.hintText,
    this.onChanged,
    required this.isRecording,
    required this.onMicPressed,
    required this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 5.w),
          child: Container(
            width: 283.w,
            height: 44.h,
            decoration: BoxDecoration(
              color: const Color(0xffFFFFFF),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: const Color(0xff919191)),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 24.w,
                  height: 24.h,
                  child: const Icon(Icons.search, color: Color(0xff292D32)),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: TextField(
                    onChanged: onChanged,
                    decoration: InputDecoration(
                      hintText: hintText, //  صار متغير
                      border: InputBorder.none,
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff9A9A9A),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 24.w,
                  height: 24.h,
                  child: IconButton(
                    icon: Icon(
                      isRecording ? Icons.stop : Icons.mic,
                      color: const Color(0xff000000),
                    ),
                    onPressed: onMicPressed,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 10.w),
        InkWell(
          onTap: onFilterPressed,
          child: Stack(
            children: [
              Image.asset("images/OrangeSmall.png", width: 44.w, height: 44.h),
              Positioned(
                top: 10.h,
                left: 11.w,
                child: Image.asset(
                  "images/sett.png",
                  width: 24.w,
                  height: 24.h,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
