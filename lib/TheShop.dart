import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/TheProduct.dart';

class Theshop extends StatefulWidget {
  const Theshop({super.key});

  @override
  State<Theshop> createState() => _TheshopState();
}

class _TheshopState extends State<Theshop> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                /// Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.notifications_outlined, size: 24.sp),
                    Text(
                      "متجر Apple",
                      style: GoogleFonts.cairo(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Image.asset(
                      "images/profile.png",
                      width: 50.w,
                      height: 50.h,
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                /// Statistics Row
                Row(
                  children: [
                    statCard("المنتجات", "20", Icons.shopping_bag),
                    SizedBox(width: 10.w),
                    statCard("جميع الطلبات", "10", Icons.receipt),
                    SizedBox(width: 10.w),
                    statCard("عدد الزيارات", "90", Icons.remove_red_eye),
                  ],
                ),

                SizedBox(height: 15.h),

                /// Grid (Clickable)
                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 10.w,
                  childAspectRatio: 1,
                  children: [
                    gridItem("إضافة منتج", Icons.add_circle, () {
                      print("اضافة منتج");
                      /*  Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Loginpage()), 
                      ); */
                    }),
                    gridItem("منتجاتي", Icons.inventory, () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Theproduct()),
                      );
                    }),
                    gridItem("الطلبات", Icons.list, () {
                      print("الطلبات");
                    }),
                    gridItem("الرسائل", Icons.message, () {
                      print("الرسائل");
                    }),
                    gridItem("الاحصائيات", Icons.show_chart, () {
                      print("الاحصائيات");
                    }),
                    gridItem("اعدادات المتجر", Icons.settings, () {
                      print("اعدادات المتجر");
                    }),
                  ],
                ),

                SizedBox(height: 15.h),

                /// Title
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "اخر الطلبات",
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                    ),
                  ),
                ),

                SizedBox(height: 10.h),

                /// Orders List
                Expanded(
                  child: ListView(
                    children: [
                      orderItem("مكتمل", const Color(0xff3EAA44)),
                      orderItem("قيد التنفيذ", const Color(0xff0755E6)),
                      orderItem("غير مكتمل", const Color(0xffFFB800)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Statistic Card
  Widget statCard(String title, String number, IconData icon) {
    return Expanded(
      child: Container(
        height: 110.h,
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff919191)),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: const Color(0xff2E7D32), size: 24.sp),
            SizedBox(height: 5.h),
            Text(
              number,
              style: GoogleFonts.cairo(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              title,
              style: GoogleFonts.cairo(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Grid Item (Clickable)
  Widget gridItem(String title, IconData icon, VoidCallback onTap) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff919191)),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Icon(icon, color: const Color(0xff2E7D32), size: 24.sp),
            ),
            SizedBox(height: 15.h),
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.cairo(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Order Item
  Widget orderItem(String status, Color color) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff919191)),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "احمد محمد",
                style: GoogleFonts.cairo(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff000000),
                ),
              ),
              Text(
                "سماعات headphone",
                style: GoogleFonts.cairo(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff000000),
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: 90.w,
            height: 30.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              status,
              style: GoogleFonts.cairo(color: Colors.white, fontSize: 12.sp),
            ),
          ),
        ],
      ),
    );
  }
}
