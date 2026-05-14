import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/successDialog.dart';
import 'package:t_1app/widgets/header.dart';

class ProductDetailsPage extends StatefulWidget {
  final String title;
  final String description;
  final List<String> images;

  const ProductDetailsPage({
    super.key,
    required this.title,
    required this.description,
    required this.images,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,

        body: Column(
          children: [
            CustomHeader(title: "تفاصيل المنتج"),
            SizedBox(height: 15.h),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///  Slider  (3 صور + الصورة بالنص بارزة)
                      SizedBox(
                        height: 260.h,
                        child: PageView.builder(
                          controller: PageController(viewportFraction: 0.65),
                          itemCount: widget.images.length,
                          onPageChanged: (index) {
                            setState(() => currentIndex = index);
                          },
                          itemBuilder: (context, index) {
                            final img = widget.images[index];
                            final isActive = index == currentIndex;

                            return AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              margin: EdgeInsets.symmetric(
                                horizontal: 6.w,
                                vertical: isActive ? 0 : 20.h,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.r),
                                child:
                                    img.startsWith('/')
                                        ? Image.file(
                                          File(img),
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        )
                                        : Image.asset(
                                          img,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 35.h),

                      /// العنوان + التعليقات
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.title,
                            style: GoogleFonts.cairo(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "(20 من التعليقات)",
                            style: GoogleFonts.cairo(
                              fontSize: 12.sp,
                              color: Color(0xff4B4B4B),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20.h),

                      /// الوصف
                      Text(
                        "الوصف",
                        style: GoogleFonts.cairo(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "صندل مناسبات مزخرف وأنيق، استعملت مرة واحدة فقط، مقاس 38، وجاهز للاستخدام في أي مناسبة خاصة",
                        style: GoogleFonts.cairo(
                          fontSize: 14.sp,
                          color: Color(0xff2B2B2B),
                        ),
                      ),

                      SizedBox(height: 50.h),

                      /// معلومات إضافية
                      Row(
                        children: [
                          Image.asset("images/اشارة التبادل.png"),
                          SizedBox(width: 5.w),
                          Text(
                            "اريد تبادله مع حذاء مريح بمقاس مشابه",
                            style: GoogleFonts.cairo(fontSize: 16.sp),
                          ),
                        ],
                      ),

                      SizedBox(height: 10.h),

                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Color(0xff2E7D32),
                            size: 25.sp,
                          ),
                          SizedBox(width: 5.w),
                          Expanded(
                            child: Text(
                              "مكان التبادل : قطاع غزة _ دير البلح",
                              style: GoogleFonts.cairo(fontSize: 16.sp),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 110.h),

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
            ),
          ],
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
                                nextPage: ProductDetailsPage(
                                  title: widget.title,
                                  description: widget.description,
                                  images: widget.images,
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
