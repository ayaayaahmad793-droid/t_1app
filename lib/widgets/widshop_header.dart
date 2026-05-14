import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopHeader extends StatelessWidget {
  final String name;
  final File? image;

  const ShopHeader({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            // الكود اللي بدك ينفذ عند الضغط
            print("Notification clicked");
          },
          icon: Icon(Icons.notifications_outlined, size: 24.sp),
        ),

        Text(
          name.isEmpty ? "اسم المتجر" : name,
          style: GoogleFonts.cairo(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
          ),
        ),

        ClipRRect(
          borderRadius: BorderRadius.circular(25.r),
          child:
              image != null
                  ? Image.file(
                    image!,
                    width: 50.w,
                    height: 50.h,
                    fit: BoxFit.cover,
                  )
                  : Image.asset(
                    "images/profile.png",
                    width: 50.w,
                    height: 50.h,
                    fit: BoxFit.cover,
                  ),
        ),
      ],
    );
  }
}
