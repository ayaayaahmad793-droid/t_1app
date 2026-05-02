import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t_1app/Resetpassword.dart';
import 'package:t_1app/widgets/CurveHeader.dart';

class AuthCode extends StatefulWidget {
  const AuthCode({super.key});

  @override
  State<AuthCode> createState() => _AuthCodeState();
}

class _AuthCodeState extends State<AuthCode> {
  int seconds = 60;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    seconds = 60;
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  String formatTime(int seconds) {
    int min = seconds ~/ 60;
    int sec = seconds % 60;
    return "${min.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  final List<TextEditingController> controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );

  final List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  void nextField(int index, String value) {
    if (value.length == 1 && index < 3) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    }
  }

  String getCode() {
    return controllers.map((c) => c.text).join();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: SingleChildScrollView(
          child: Column(
            children: [
              /// الانحناء
                           const CurveHeader(title: " أدخل رمز التحقق"),

              Transform.translate(
                offset: Offset(0, -80.h), // زيدي أو قللي حسب الشكل
                child: Column(
                  children: [

                  Padding(
                    padding: EdgeInsets.only(top: 185.h, right: 20.w),
                    child: Text(
                      "يرجى التحقق من بريدك الالكتروني\nللحصول على رمز المتابعة.",
                      style: GoogleFonts.cairo(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
              

              /// مربعات الإدخال
              SizedBox(height: 20.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Container(
                    width: 70.w,
                    height: 50.h,
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    child: TextField(
                      controller: controllers[index],
                      focusNode: focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w500,
                        fontSize: 24.sp,
                      ),
                      decoration: InputDecoration(
                        counterText: "",
                        filled: true,
                        fillColor: const Color(0xffF5F5F5),
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      onChanged: (value) => nextField(index, value),
                    ),
                  );
                }),
              ),

              SizedBox(height: 30.h),

              /// زر التأكيد
              SizedBox(
                width: 340.w,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffF57C00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                  ),
                  onPressed: () {
                    String code = getCode();
                    print("Code: $code");

                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Resetpassword()),
                    );
                  },
                  child: Text(
                    "تأكيد الرمز",
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff000000),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 15.h),

              /// المؤقت
              seconds > 0
                  ? Text(
                    "ما وصلك الرمز؟ أعد الإرسال بعد ${formatTime(seconds)}",
                    style: GoogleFonts.cairo(
                      color: const Color(0xff6C6767),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                  : TextButton(
                    onPressed: () {
                      startTimer();
                    },
                    child: Text(
                      "إعادة إرسال الرمز",
                      style: TextStyle(
                        color: Color(0xffF57C00),
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
            ],
          ),
        ),
     ] ),
       )) );
  }
}
