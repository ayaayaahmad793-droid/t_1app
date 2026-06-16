import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/screens/HomePage.dart';
import 'package:t_1app/widgets/header.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/providers/address_provider.dart';

class TrackLocationPage extends StatelessWidget {
  const TrackLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final addressProvider = Provider.of<AddressProvider>(context);
    final address = addressProvider.address;
    return Directionality(
      textDirection: TextDirection.rtl,

      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),

        body: Stack(
          children: [
            /// الخلفية (الخريطة)
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset("images/map.png", fit: BoxFit.cover),
            ),

            /// العنوان بالأعلى
            Positioned(
              top: 0.h,
              right: 0,
              left: 0,
              child: CustomHeader(title: "تتبع الموقع",onBack: (){
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => Homepage()),
                  );
                },),
            ),

            /// البطاقة السفلية
            Positioned(
              bottom: 50.h,
              right: 20.w,
              left: 20.w,
              child: Container(
                padding: EdgeInsets.all(18.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.r,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// الصف الأول
                    Row(
                      children: [
                        /// صورة الشخص
                        CircleAvatar(
                          radius: 25.r,
                          backgroundImage: AssetImage("images/HomeProfile.png"),
                        ),

                        SizedBox(width: 8.w),

                        /// الاسم
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                address?.fullName ?? "لا يوجد اسم",
                                style: GoogleFonts.cairo(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),

                              SizedBox(height: 4.h),

                              Text(
                                "${address?.country ?? ""} - ${address?.city ?? ""} - ${address?.street ?? ""}",
                                textAlign: TextAlign.right,
                                style: GoogleFonts.cairo(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff727272),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 10.w),

                        /// الأيقونات
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.w),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Icon(Icons.message_outlined, size: 18.sp),
                            ),

                            SizedBox(width: 10.w),

                            Container(
                              padding: EdgeInsets.all(8.w),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Icon(Icons.call_outlined, size: 18.sp),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 40.h),

                    /// التاريخ
                    Row(
                      children: [
                        Icon(Icons.calendar_month, size: 40.sp),

                        SizedBox(width: 8.w),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "يوم الأحد/شهر 4",
                              style: GoogleFonts.cairo(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            SizedBox(height: 4.h),

                            Text(
                              "20/4/2026",
                              style: GoogleFonts.cairo(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff727272),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 18.h),

                    /// الوقت
                    Row(
                      children: [
                        Icon(Icons.access_time, size: 40.sp),

                        SizedBox(width: 8.w),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "الساعة الخامسة مساء",
                              style: GoogleFonts.cairo(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            SizedBox(height: 4.h),

                            Text(
                              " متبقي 48 ساعة لوصول الطلب",
                              style: GoogleFonts.cairo(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff727272),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
