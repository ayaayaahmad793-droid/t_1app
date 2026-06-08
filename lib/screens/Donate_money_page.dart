import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/providers/donate_page_provider.dart';
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
  final TextEditingController amountController = TextEditingController();
  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DonatePageProvider>(context);
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
              charityName: "جمعية اليونيسيف",
              description: "مسؤولة عن استلام وتوزيع التبرعات المالية",
              buttonText: "اعرف المزيد",
              imagePath: "images/charity.png",

              isSelected: provider.selectedCharity == "جمعية اليونيسيف",

              onTap: () {
                provider.selectCharity("جمعية اليونيسيف");
              },

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
              isSelected: provider.selectedCharity == "جمعية العون المباشر",
              onTap: () {
                provider.selectCharity("جمعية العون المباشر");
              },
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
                  isSelected: provider.selectedDonationType == 0,

                  onTap: () {
                    provider.selectDonationType(0);
                  },
                ),

                const SizedBox(width: 10),

                DonationTypeCard(
                  title: "تبرع عام",
                  description: "دعم المحتاجين\nبشكل شامل",
                  isSelected: provider.selectedDonationType == 1,

                  onTap: () {
                    provider.selectDonationType(1);
                  },
                ),

                const SizedBox(width: 10),

                DonationTypeCard(
                  title: "مشاريع إنسانية",
                  description: "تمويل مبادرات\nتنموية",
                  isSelected: provider.selectedDonationType == 2,

                  onTap: () {
                    provider.selectDonationType(2);
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
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.right,
                    onChanged: (value) {
                      provider.setCustomAmount(value);
                    },
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
                          isSelected: provider.selectedAmount == 20,
                          onTap: () {
                            provider.selectAmount(20);
                            amountController.text = "20";
                          },
                        ),

                        SizedBox(width: 8.w),

                        AmountButton(
                          amount: "30",
                          isSelected: provider.selectedAmount == 30,
                          onTap: () {
                            provider.selectAmount(30);
                            amountController.text = "30";
                          },
                        ),

                        SizedBox(width: 8.w),

                        AmountButton(
                          amount: "50",
                          isSelected: provider.selectedAmount == 50,
                          onTap: () {
                            provider.selectAmount(50);
                            amountController.text = "50";
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
                    if (provider.customAmount.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("يرجى إدخال مبلغ التبرع")),
                      );
                      return;
                    }

                    if (provider.selectedCharity.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("يرجى اختيار جهة التبرع")),
                      );
                      return;
                    }

                    if (provider.selectedDonationType == -1) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("يرجى اختيار نوع التبرع")),
                      );
                      return;
                    }

                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder:
                          (context) => Successdialog(
                            message: "تمت عملية التبرع بنجاح",
                            nextPage: DonateMoneyPage(),
                          ),
                    );
                    provider.resetDonationData();
                    amountController.clear();
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
