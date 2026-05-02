import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Orwidget extends StatelessWidget {
  const Orwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            indent: 20, // بداية الخط من اليسار
            endIndent: 20, // نهاية الخط من اليمين
            color: Colors.black,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text("او", style: GoogleFonts.cairo(fontSize: 16.sp)),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            indent: 20, // بداية الخط من اليسار
            endIndent: 20,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
