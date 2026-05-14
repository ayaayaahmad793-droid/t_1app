import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImagePicker extends StatelessWidget {
  final File? image;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const CustomImagePicker({
    super.key,
    required this.image,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        width: 0.9.sw,
        height: 80.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child:
            image == null
                ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_a_photo, size: 30.sp),
                    SizedBox(height: 5.h),
                    Text("صورة PNG أو JPG"),
                  ],
                )
                : ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.file(
                    image!,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
      ),
    );
  }
}
