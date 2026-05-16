import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/screens/AccountType.dart';
import 'package:t_1app/successDialog.dart';
import 'package:t_1app/widgets/AmmountButton.dart';
import 'package:t_1app/widgets/DonationTypeCard.dart';
import 'package:t_1app/widgets/charity_card.dart';

class DonateMoneyPage extends StatefulWidget {
  const DonateMoneyPage({super.key});

  @override
  State<DonateMoneyPage> createState() => _DonateMoneyPageState();
}

class _DonateMoneyPageState extends State<DonateMoneyPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 55.h),
            Center(
              child: Text(
                "تبرعك يصنع فرقا",
                style: GoogleFonts.cairo(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Center(
              child: Text(
                "يتم إدارة التبرعات من خلال جهات ",
                style: GoogleFonts.cairo(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 8.h),

            Center(
              child: Text(
                "موثوقة",
                style: GoogleFonts.cairo(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            CharityCard(
              charityName: "جمعية اليوسف",
              description: "مسؤولة عن استلام وتوزيع التبرعات المالية",
              buttonText: "اعرف المزيد",
              imagePath: "images/charity.png",

              onMorePressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Accounttype()),
                );
              },
            ),
            CharityCard(
              charityName: "جمعية العون المباشر",
              description: "من أكبر جهات العمل الإنساني في الشرق الأوسط",
              buttonText: "اعرف المزيد",
              imagePath: "images/charity.png",

              onMorePressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Accounttype()),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(left: 250.w),
              child: Text(
                "اختر نوع التبرع",
                style: GoogleFonts.cairo(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DonationTypeCard(
                  title: "حالات عاجلة",
                  description: "مساعدة فورية\nوطارئة",
                  isSelected: selectedIndex == 0,
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                ),

                const SizedBox(width: 10),

                DonationTypeCard(
                  title: "تبرع عام",
                  description: "دعم المحتاجين\nبشكل شامل",
                  isSelected: selectedIndex == 1,
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                ),

                const SizedBox(width: 10),

                DonationTypeCard(
                  title: "مشاريع إنسانية",
                  description: "تمويل مبادرات\nتنموية",
                  isSelected: selectedIndex == 2,
                  onTap: () {
                    setState(() {
                      selectedIndex = 2;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 15.w),
                  child: Text(
                    "أدخل المبلغ",
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                SizedBox(
                  width: 122.w,
                  height: 41.h,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      hintText: "\$",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey.shade500,
                      ),

                      filled: true,
                      fillColor: Colors.white,

                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 18,
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                          color: Color(0xFFF4A261),
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.only(right: 15.w),
              child: Row(
                children: [
                  Text(
                    "او قم بالضغط مباشرة على الرقم ",
                    style: GoogleFonts.cairo(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AmountButton(
                          amount: "20",
                          isSelected: selectedIndex == 3,
                          onTap: () {
                            setState(() {
                              selectedIndex = 3;
                            });
                          },
                        ),

                        SizedBox(width: 8.w),

                        AmountButton(
                          amount: "30",
                          isSelected: selectedIndex == 4,
                          onTap: () {
                            setState(() {
                              selectedIndex = 4;
                            });
                          },
                        ),

                        SizedBox(width: 8.w),

                        AmountButton(
                          amount: "50",
                          isSelected: selectedIndex == 5,
                          onTap: () {
                            setState(() {
                              selectedIndex = 5;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder:
                          (context) => Successdialog(
                            message:
                                "تمت عملية التبرع بنجاح شكراً لكرمك، ساهمت الآن في صناعة فرق حقيقي",
                            nextPage: DonateMoneyPage(),
                          ),
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E7D32),
                    elevation: 0,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),

                  child: Text(
                    "تبرع الآن",
                    style: GoogleFonts.cairo(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
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
