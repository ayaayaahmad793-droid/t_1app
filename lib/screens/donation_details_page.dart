import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/successDialog.dart';

class DonationDetailsPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const DonationDetailsPage({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ),

                SizedBox(height: 10.h),

                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child:
                      image.startsWith('images/')
                          ? Image.asset(
                            image,
                            width: 220.w,
                            height: 220.h,
                            fit: BoxFit.cover,
                          )
                          : Image.file(
                            File(image),
                            width: 220.w,
                            height: 220.h,
                            fit: BoxFit.cover,
                          ),
                ),

                SizedBox(height: 25.h),

                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    title,
                    style: GoogleFonts.cairo(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 15.h),

                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "الوصف",
                    style: GoogleFonts.cairo(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                SizedBox(height: 10.h),

                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    description,
                    style: GoogleFonts.cairo(
                      fontSize: 13.sp,
                      color: const Color(0xff555555),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "ملاحظة: يرجى التواصل مع المتبرع للحصول على المنتج.",
                    style: GoogleFonts.cairo(
                      fontSize: 12.sp,
                      color: Colors.grey,
                    ),
                  ),
                ),

                const Spacer(),

                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffF27C00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    onPressed: () {
                      showExchangeDialog(context);
                    },
                    child: Text(
                      "طلب الحصول عليه",
                      style: GoogleFonts.cairo(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10.h),

                Text(
                  "يتم استلام المنتج بعد موافقة المتبرع",
                  style: GoogleFonts.cairo(fontSize: 11.sp, color: Colors.grey),
                ),
              ],
            ),
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
                                nextPage: DonationDetailsPage(
                                  title: title,
                                  description: description,
                                  image: image,
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
