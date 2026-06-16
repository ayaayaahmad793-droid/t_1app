import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/screens/AddNewCardPage.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/providers/card_provider.dart';

class PaymentMethodCard extends StatefulWidget {
  const PaymentMethodCard({super.key});

  @override
  State<PaymentMethodCard> createState() => _PaymentMethodCardState();
}

class _PaymentMethodCardState extends State<PaymentMethodCard> {
  int selectedIndex = 0;

 /* final List<Map<String, dynamic>> paymentMethods = [
    {
      "title": "visa",
      "subtitle": "******3256",
      "image": "images/Completetheorder1.png",
    },

    {
      "title": "Master card",
      "subtitle": "******2789",
      "image": "images/Completetheorder2.png",
    },

    {
      "title": "Paypal",
      "subtitle": "re******@gmail.com",
      "image": "images/Completetheorder3.png",
    },
  ]; */

  @override
  Widget build(BuildContext context) {
    final cards = context.watch<CardProvider>().cards;
    return Container(
      width: double.infinity,

      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: const Color(0xffFFFFFF),

        borderRadius: BorderRadius.circular(15.r),

        border: Border.all(color: const Color(0xff919191), width: 1.w),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          /// قائمة طرق الدفع
          ...List.generate(cards.length, (index) {
            final item = cards[index];

            return Padding(
              padding: EdgeInsets.only(bottom: 16.h),

              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    /// اللوجو
                   Image.asset(
                      "images/Completetheorder1.png",
                      width: 61.w,
                      height: 57.h,
                      fit: BoxFit.contain,
                    ),

                    SizedBox(width: 8.w),

                    /// النصوص
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.cardHolderName,

                            style: GoogleFonts.cairo(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),

                          SizedBox(height: 2.h),

                          Text(
                            item.cardNumber.length >= 4
                                ? "******${item.cardNumber.substring(item.cardNumber.length - 4)}"
                                : item.cardNumber,

                            style: GoogleFonts.cairo(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff727272),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: 10.w),

                    /// الراديو
                    Container(
                      width: 20.w,
                      height: 20.w,

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,

                        border: Border.all(
                          color:
                              selectedIndex == index
                                  ? Colors.grey
                                  : Colors.grey.shade500,
                          width: 1.2.w,
                        ),
                      ),

                      child:
                          selectedIndex == index
                              ? Center(
                                child: Icon(
                                  Icons.check,
                                  size: 13.sp,
                                  color: Color(0xff000000),
                                ),
                              )
                              : null,
                    ),
                  ],
                ),
              ),
            );
          }),

          SizedBox(height: 4.h),

          /// زر اضافة بطاقة
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => AddNewCardPage()),
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
                  "+ اضافة بطاقة دفع جديدة",

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
