import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Successdialog extends StatefulWidget {
  final String message;
  final Widget nextPage;

  const Successdialog({
    super.key,
    required this.message,
    required this.nextPage,
  });

  @override
  State<Successdialog> createState() => _SuccessdialogState();
}

class _SuccessdialogState extends State<Successdialog> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.pop(context);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => widget.nextPage),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xffFFFFFF),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Container(
        width: 304.w,
        height: 323.h,
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/green_check.png", width: 107.w, height: 107.h),

            SizedBox(height: 20.h),

            Text(
              widget.message,
              textAlign: TextAlign.center,
              style: GoogleFonts.cairo(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
