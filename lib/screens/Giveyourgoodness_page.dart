import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/providers/donation_provider.dart';
import 'package:t_1app/screens/department.dart';
import 'package:t_1app/screens/donation_details_page.dart';
import 'package:t_1app/widgets/DonateButton_widget.dart';
import 'package:t_1app/widgets/goodness_card_widget.dart';
import 'package:t_1app/widgets/header.dart';

class GiveyourgoodnessPage extends StatelessWidget {
  const GiveyourgoodnessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final donationProvider = context.watch<DonationProvider>();

    print("LIST LENGTH = ${donationProvider.donateList.length}");
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: Column(
          children: [
            CustomHeader(
              title: "قدم خيرك",
              onBack: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => Department()),
                );
              },
            ),

            SizedBox(height: 20.h),

            Center(
              child: Text(
                "تتبرع بما لم تعد تحتاجه وامنح غيرك",
                style: GoogleFonts.cairo(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            SizedBox(height: 5.h),

            Center(
              child: Text(
                "فرصة للاستفادة منه",
                style: GoogleFonts.cairo(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            SizedBox(height: 15.h),

            DonateButton(),

            SizedBox(height: 15.h),

            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: donationProvider.donateList.length,
                itemBuilder: (context, index) {
                  final card = donationProvider.donateList[index];

                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: DonateCard(
                      title: card.title,
                      subTitle: card.subTitle,
                      image: card.image,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => DonationDetailsPage(
                                  title: card.title,
                                  description: card.subTitle,
                                  image: card.image,
                                ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
