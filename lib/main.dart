import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:t_1app/providers/favorite_provider.dart';
import 'package:t_1app/providers/account_type_provider.dart';
import 'package:t_1app/providers/forgot_provider.dart';
import 'package:t_1app/providers/otp_provider.dart';
import 'package:t_1app/providers/product_provider.dart';
import 'package:t_1app/providers/register_provider.dart';
import 'package:t_1app/providers/reset_provider.dart';
import 'package:t_1app/providers/shopData_provider.dart';
import 'package:t_1app/screens/OnboardingScreens/Onboarding1.dart';
import 'package:provider/provider.dart';
import 'providers/login_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final shopProvider = ShopProvider();
  await shopProvider.loadData(); //  مهم جداً

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ShopProvider>.value(value: shopProvider),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
        ChangeNotifierProvider(create: (_) => ForgotProvider()),
        ChangeNotifierProvider(create: (_) => OtpProvider()),
        ChangeNotifierProvider(create: (_) => ResetProvider()),
        ChangeNotifierProvider(create: (_) => AccountTypeProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
    //    ChangeNotifierProvider(create: (_) => FavoriteProvider())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final int? accountType;

  const MyApp({super.key, this.accountType});

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
