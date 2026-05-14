import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/models/goodnees_model.dart';
import 'package:t_1app/widgets/DonateButton_widget.dart';
import 'package:t_1app/widgets/goodness_card_widget.dart';
import 'package:t_1app/widgets/header.dart';

class GiveyourgoodnessPage extends StatefulWidget {
  const GiveyourgoodnessPage({super.key});

  @override
  State<GiveyourgoodnessPage> createState() => _GiveyourgoodnessPageState();
}

class _GiveyourgoodnessPageState extends State<GiveyourgoodnessPage> {
  List<DonateCardModel> donateList = [];

  @override
  void initState() {
    super.initState();

    donateList = List.from(donateCards);
  }

  void addNewDonation(DonateCardModel item) {
    setState(() {
      donateList.insert(0, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: Column(
          children: [
            CustomHeader(title: "قدم خيرك"),

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

            DonateButton(onAddDonation: addNewDonation),

            SizedBox(height: 15.h),

            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: donateList.length,
                itemBuilder: (context, index) {
                  final card = donateList[index];

                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: DonateCard(
                      title: card.title,
                      subTitle: card.subTitle,
                      image: card.image,
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => card.page),
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
