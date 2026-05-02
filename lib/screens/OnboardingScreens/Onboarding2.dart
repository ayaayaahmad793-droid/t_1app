import 'package:flutter/material.dart';
import 'package:t_1app/screens/OnboardingScreens/Onboarding3.dart';
import 'package:t_1app/screens/WelcomePage.dart';
import 'package:t_1app/widgets/OnboardingWidgets.dart/OnboardingBody.dart';
import 'package:t_1app/widgets/OnboardingWidgets.dart/OnboardingFooter.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Column(
        children: [
          /// الجزء العلوي
          Expanded(
            child: OnboardingBody(
              imagePath: "images/Ellipse 1.png",
              texts: [
                "تسوق وبيع بسهولة",
                "اكتشف المنتجات العصرية،",
                "وادعم الأعمال الصغيرة",
                "بسهولة وأمان.",
              ],
              onSkip: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Welcomepage()),
                );
              },
            ),
          ),

          /// الجزء السفلي
          OnboardingFooter(
            dotsImage: "images/Frame 2 (1).png",
            buttonText: "التالي",
            nextPage: Onboarding3(),
          ),
        ],
      ),
    );
  }
}
