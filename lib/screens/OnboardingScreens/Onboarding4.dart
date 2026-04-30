import 'package:flutter/material.dart';
import 'package:t_1app/WelcomePage.dart';
import 'package:t_1app/widgets/OnboardingWidgets.dart/OnboardingBody.dart';
import 'package:t_1app/widgets/OnboardingWidgets.dart/OnboardingFooter.dart';

class Onboarding4 extends StatelessWidget {
  const Onboarding4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Column(
        children: [
          /// الجزء العلوي
          OnboardingBody(
            imagePath: "images/Ellipse 3.png",
            texts: [
              "تبادل واستلم بسهولة",
              "أرسل واستقبل المنتجات",
              "بسهولة وأمان، وشارك في",
              "بناء مجتمع متعاون.",
            ],
            onSkip: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => Welcomepage()),
              );
            },
          ),

          /// الجزء السفلي
          OnboardingFooter(
            dotsImage: "images/Frame 2 (2).png",
            buttonText: "ابدأ",
            nextPage: Welcomepage(),
          ),
        ],
      ),
    );
  }
}
