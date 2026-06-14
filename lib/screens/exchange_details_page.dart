import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/models/exchangeItem.dart';
import 'package:t_1app/successDialog.dart';
import 'package:t_1app/widgets/header.dart';

class ExchangeDetailsPage extends StatelessWidget {
  final ExchangeItem item;

  const ExchangeDetailsPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeader(title: "تفاصيل المنتج"),

              SizedBox(height: 20.h),

              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.asset(
                    item.image,
                    height: 250.h,
                    width: 250.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(height: 25.h),

              Text(
                item.title,
                style: GoogleFonts.cairo(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 20.h),

              Text(
                "الوصف",
                style: GoogleFonts.cairo(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10.h),

              Text(item.description, style: GoogleFonts.cairo(fontSize: 14.sp)),

              SizedBox(height: 25.h),

              Row(
                children: [
                  const Icon(Icons.swap_horiz, color: Colors.green),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      item.description,
                      style: GoogleFonts.cairo(fontSize: 14.sp),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15.h),

              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.green),
                  SizedBox(width: 8.w),
                  Text(
                    "مكان التبادل: قطاع غزة - دير البلح",
                    style: GoogleFonts.cairo(fontSize: 14.sp),
                  ),
                ],
              ),

              SizedBox(height: 180.h),

              /// زر
              SizedBox(
                width: double.infinity,
                height: 45.h,
                child: ElevatedButton(
                  onPressed: () {
                    showExchangeDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffF57C00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Text(
                    "أرغب بالتبادل",
                    style: GoogleFonts.cairo(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showExchangeDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          backgroundColor: Color(0xffFFFFFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: SizedBox(
            height: 561.h,
            width: 330.w,
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// العنوان
                  Text(
                    "لتواصل من اجل الحصول على المنتج \n قم بتعبئة البيانات المطلوبة   ",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cairo(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 30.h),

                  Container(
                    alignment: Alignment.bottomRight,

                    child: Text(
                      "الاسم كامل",
                      style: GoogleFonts.cairo(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    width: 298.w,
                    height: 39.h,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    alignment: Alignment.bottomRight,

                    child: Text(
                      " رقم الجوال او وسيلة تواصل",
                      style: GoogleFonts.cairo(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    width: 298.w,
                    height: 39.h,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    alignment: Alignment.bottomRight,

                    child: Text(
                      "العنوان \\ المنطقة",
                      style: GoogleFonts.cairo(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    width: 298.w,
                    height: 39.h,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10.h),
                  Container(
                    alignment: Alignment.bottomRight,

                    child: Text(
                      "طريقة الاستلام",
                      style: GoogleFonts.cairo(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  SizedBox(height: 10.h),

                  /// أزرار
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffF57C00),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: Text(
                            "توصيل للمنزل",
                            style: GoogleFonts.cairo(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffF57C00),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: Text(
                            "استلام من مركز",
                            style: GoogleFonts.cairo(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 60.h),

                  /// زر
                  SizedBox(
                    width: double.infinity,
                    height: 48.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);

                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder:
                              (_) => Successdialog(
                                message:
                                    "تم إرسال طلبك بنجاح، سيتم التواصل معك قريبًا",
                                nextPage: ExchangeDetailsPage(item: item),
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
                        "ارسال الطلب",
                        style: GoogleFonts.cairo(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
