import 'package:flutter/material.dart';
import 'package:t_1app/screens/OnboardingScreens/Onboarding4.dart';
import 'package:t_1app/screens/WelcomePage.dart';
import 'package:t_1app/widgets/OnboardingWidgets.dart/OnboardingBody.dart';
import 'package:t_1app/widgets/OnboardingWidgets.dart/OnboardingFooter.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Column(
        children: [
          /// الجزء العلوي
          Expanded(
            child: OnboardingBody(
              imagePath: "images/Ellipse 2.png",
              texts: [
                "تبرع وشارك الخير",
                "ساعد المحتاجين بتبرعك أو",
                "تبادلك للمنتجات، واصنع فرقاً",
                "  .في غزة",
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
            dotsImage: "images/Frame 3.png",
            buttonText: "التالي",
            nextPage: Onboarding4(),
          ),
        ],
      ),
    );
  }
}
