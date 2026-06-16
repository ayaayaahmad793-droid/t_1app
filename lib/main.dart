import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:t_1app/providers/address_provider.dart';
import 'package:t_1app/providers/cart_provider.dart';
import 'package:t_1app/providers/daily_life_provider.dart';
import 'package:t_1app/providers/donate_page_provider.dart';
import 'package:t_1app/providers/donation_provider.dart';
import 'package:t_1app/providers/exchange_provider.dart';
import 'package:t_1app/providers/fashion_provider.dart';
import 'package:t_1app/providers/favorite_provider.dart';
import 'package:t_1app/providers/account_type_provider.dart';
import 'package:t_1app/providers/forgot_provider.dart';
import 'package:t_1app/providers/home_product_provider.dart';
import 'package:t_1app/providers/homeworld_provider.dart';
import 'package:t_1app/providers/notification_provider.dart';
import 'package:t_1app/providers/order_provider.dart';
import 'package:t_1app/providers/otp_provider.dart';
import 'package:t_1app/providers/card_provider.dart';
import 'package:t_1app/providers/product_provider.dart';
import 'package:t_1app/providers/register_provider.dart';
import 'package:t_1app/providers/reset_provider.dart';
import 'package:t_1app/providers/shopData_provider.dart';
import 'package:t_1app/providers/technology_provider.dart';
import 'package:t_1app/screens/HomePage.dart';
import 'package:t_1app/screens/OnboardingScreens/Onboarding1.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/screens/ShopData.dart';
import 'providers/login_provider.dart';
import 'package:t_1app/providers/uniqe_product_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://azxsryrryrdwxuuzlnqq.supabase.co',
    publishableKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF6eHNyeXJyeXJkd3h1dXpsbnFxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODE0NDExNTAsImV4cCI6MjA5NzAxNzE1MH0.-OcjQYx4tJzTXvszDdnfEqUM9eQ39d-9f5wBfQBrR78',
  );

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
        ChangeNotifierProvider(create: (_) => HomeProductProvider()),
        ChangeNotifierProvider(create: (_) => UniqeProductProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => ExchangeProvider()),
        ChangeNotifierProvider(create: (_) => DonationProvider()),
        ChangeNotifierProvider(create: (_) => DonatePageProvider()),
        ChangeNotifierProvider(create: (_) => HomeworldProvider()),
        ChangeNotifierProvider(create: (_) => FashionProvider()),
        ChangeNotifierProvider(create: (_) => DailyLifeProvider()),
        ChangeNotifierProvider(create: (_) => TechnologyProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => AddressProvider()),
       ChangeNotifierProvider(create: (_) => CardProvider()),
       ChangeNotifierProvider(create: (_) => OrderProvider()),
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
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          locale: const Locale("ar"),

          /// مهم: خلي الاتجاه من هون
          home: Directionality(
            textDirection: TextDirection.rtl,
            child:
                accountType == null
                    ? const Onboarding1()
                    : (accountType == 0 ? Homepage() : ShopData()),
          ),
        );
      },
    );
  }
}
