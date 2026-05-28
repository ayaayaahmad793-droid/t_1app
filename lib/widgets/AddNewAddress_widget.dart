import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/screens/Adress_page.dart';

class AddnewaddressWidget extends StatefulWidget {
  const AddnewaddressWidget({super.key});

  @override
  State<AddnewaddressWidget> createState() => _AddnewaddressWidgetState();
}

class _AddnewaddressWidgetState extends State<AddnewaddressWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: const Color(0xffFFFFFF),

        borderRadius: BorderRadius.circular(15.r),

        border: Border.all(color: const Color(0xff919191), width: 1.w),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "عنوان التسليم",
            style: GoogleFonts.cairo(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 40.r,
                color: Color(0xff2E7D32),
              ),
              Column(
                children: [
                  Text(
                    "قطاع غزة _ دير البلح ",
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: Color(0xff727272),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "شارع السلام",
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: Color(0xff727272),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 125.w),
              Icon(Icons.arrow_forward_ios, size: 30.r),
            ],
          ),
          SizedBox(height: 8.h),

          /// زر اضافة بطاقة
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => AddressPage()),
              );
            },

            borderRadius: BorderRadius.circular(10.r),

            child: Container(
              width: double.infinity,
              height: 42.h,

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(12.r),

                border: Border.all(color: const Color(0xff919191), width: 1.w),
              ),

              child: Center(
                child: Text(
                  "+ اضافة عنوان جديد",

                  style: GoogleFonts.cairo(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
