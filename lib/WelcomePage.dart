import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/LoginPage.dart';
import 'package:t_1app/CreateAccount.dart';

class Welcomepage extends StatefulWidget {
  const Welcomepage({super.key});

  @override
  State<Welcomepage> createState() => _WelcomepageState();
}

class _WelcomepageState extends State<Welcomepage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          /// الخلفية
          SizedBox(
            width: width,
            height: height,
            child: Image.asset("images/Rectangle 97.png", fit: BoxFit.cover),
          ),

          /// النص العلوي
          Positioned(
            top: height * 0.12,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "مرحباً بك في متجر عون",
                style: GoogleFonts.cairo(
                  fontSize: width * 0.06,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          /// زر تسجيل الدخول
          Positioned(
            top: height * 0.69,
            left: width * 0.07,
            right: width * 0.07,
            child: SizedBox(
              height: height * 0.065,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffF57C00),
                  elevation: 10,
                  shadowColor: Colors.black.withOpacity(0.9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => Loginpage()));
                },
                child: Text(
                  "تسجيل الدخول",
                  style: GoogleFonts.cairo(
                    fontSize: width * 0.045,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),

          /// زر انشاء حساب
          Positioned(
            top: height * 0.77,
            left: width * 0.07,
            right: width * 0.07,
            child: SizedBox(
              height: height * 0.065,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffF57C00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CreateAccount()),
                  );
                },
                child: Text(
                  "انشاء حساب",
                  style: GoogleFonts.cairo(
                    fontSize: width * 0.045,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),

          /// تسجيل كزائر
          Positioned(
            bottom: height * 0.01,
            left: 0,
            right: 0,
            child: Center(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "تسجيل الدخول كزائر",
                  style: GoogleFonts.cairo(
                    color: Colors.white,
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
