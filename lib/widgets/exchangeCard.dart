import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/screens/Exchange_details_screen.dart';

class ExchangeCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;

  const ExchangeCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.isFavorite,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// الصورة + القلب
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
                child:
                    image.startsWith('/')
                        ? Image.file(
                          File(image),
                          width: double.infinity,
                          height: 114.h,
                          fit: BoxFit.cover,
                        )
                        : Image.asset(
                          image,
                          width: double.infinity,
                          height: 114.h,
                          fit: BoxFit.cover,
                        ),
              ),

              Positioned(
                top: 10.h,
                right: 10.w,
                child: GestureDetector(
                  onTap: onFavoriteTap,
                  child: Container(
                    width: 24.w,
                    height: 24.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.grey,
                      size: 18.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 7.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              title,
              style: GoogleFonts.cairo(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          SizedBox(height: 4.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              description,
              style: GoogleFonts.cairo(
                fontSize: 10.sp,
                color: Color(0xff6B6B6B),
              ),
            ),
          ),

          SizedBox(height: 12.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: SizedBox(
              width: 87.w,
              height: 22.h,
              child: ElevatedButton(
               onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => ProductDetailsPage(
                            title: title,
                            description: description,
                            images: [
                              image,
                              image,
                              image, // مؤقتاً نفس الصورة (تقدري تغيريهم لاحقاً)
                            ],
                          ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffF57C00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text(
                  "أرغب بالتبادل",
                  style: GoogleFonts.cairo(fontSize: 8.sp, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
