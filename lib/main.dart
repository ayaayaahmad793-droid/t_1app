import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t_1app/screens/OnboardingScreens/Onboarding1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: const Locale("ar"),

          /// مهم: خلي الاتجاه من هون
          home: const Directionality(
            textDirection: TextDirection.rtl,
            child: Onboarding1(),
          ),
        );
      },
    );
  }
}
