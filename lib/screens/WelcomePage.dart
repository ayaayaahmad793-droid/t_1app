import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/models/Button_Model.dart';
import 'package:t_1app/screens/Create_Account.dart';
import 'package:t_1app/screens/Log.dart';
import 'package:t_1app/widgets/Button.dart';

class Welcomepage extends StatelessWidget {
  const Welcomepage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    const primaryColor = Color(0xffF57C00);

    return Scaffold(
      body: Stack(
        children: [
          /// الخلفية
          SizedBox(
            width: width,
            height: height,
            child: Image.asset("images/Rectangle 97.png", fit: BoxFit.cover),
          ),

          /// المحتوى
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.07),
            child: Column(
              children: [
                SizedBox(height: height * 0.12),

                /// النص
                Center(
                  child: Text(
                    "مرحباً بك في متجر عون",
                    style: GoogleFonts.cairo(
                      fontSize: width * 0.06,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const Spacer(),

                /// زر تسجيل الدخول
                SizedBox(
                  height: height * 0.065,
                  width: double.infinity,
                  child: CustomButton(
                    button: ButtonModel(
                      text: "تسجيل الدخول",
                      color: primaryColor,
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).push(MaterialPageRoute(builder: (context) => Log()));
                      },
                    ),
                  ),
                ),

                SizedBox(height: height * 0.02),

                /// زر انشاء حساب
                SizedBox(
                  height: height * 0.065,
                  width: double.infinity,
                  child: CustomButton(
                    button: ButtonModel(
                      text: "انشاء حساب",
                      color: primaryColor,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Create_Account(),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                SizedBox(height: height * 0.1),

                /// تسجيل كزائر
                TextButton(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
