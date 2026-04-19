import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/HomePage.dart';
import 'package:t_1app/RegularUser.dart';
import 'package:t_1app/ShopData.dart';

class Accounttype extends StatefulWidget {
  const Accounttype({super.key});

  @override
  State<Accounttype> createState() => _AccounttypeState();
}

class _AccounttypeState extends State<Accounttype> {
  int selectedIndex = -1;

  Widget accountCard({
    required int index,
    required String title,
    required String subtitle,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        height: 101.h,
        width: 350.w,
        margin: EdgeInsets.symmetric(vertical: 10.h),
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          border: Border.all(
            color:
                selectedIndex == index
                    ? const Color(0xffF57C00)
                    : const Color(0xff919191),
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 50.w,
              height: 50.h,
              child: const CircleAvatar(
                backgroundColor: Color(0xff2E7D32),
                child: Icon(Icons.person, color: Colors.white),
              ),
            ),

            SizedBox(width: 5.w),

            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.cairo(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      subtitle,
                      style: GoogleFonts.cairo(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(width: 10.w),

            SizedBox(
              width: 30.w,
              height: 30.h,
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xffF57C00),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "images/linear1.png",
                  fit: BoxFit.fill,
                  width: 415.w,
                  height: 115.h,
                ),

                Padding(
                  padding: EdgeInsets.only(top: 70.h),
                  child: Center(
                    child: Text(
                      "اختر نوع حسابك",
                      style: GoogleFonts.cairo(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xffFFFFFF),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 57.h,
                  left: 10.w,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xff000000),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),

            SizedBox(height: 35.h),

            Text(
              "حدد نوع الحساب لنقدم لك",
              style: GoogleFonts.cairo(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 15.h),

            Text(
              " افضل تجربة",
              style: GoogleFonts.cairo(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),

            accountCard(
              index: 0,
              title: "مستخدم عادي",
              subtitle: "لتصفح، الشراء، التبرع او التبادل",
            ),

            accountCard(
              index: 1,
              title: "صاحب محل",
              subtitle: "لعرض المنتجات ورؤية الطلبات",
            ),

            const Spacer(),

            Padding(
              padding: EdgeInsets.only(bottom: 20.h, left: 20, right: 20),
              child: SizedBox(
                width: 375.w,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffF57C00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  onPressed: () {
                    selectedIndex == 0
                        ? Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Homepage()),
                        )
                        : null;
                    selectedIndex == 1
                        ? Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ShopData()),
                        )
                        : null;
                  },
                  child: Text(
                    " المتابعة",
                    style: GoogleFonts.cairo(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
