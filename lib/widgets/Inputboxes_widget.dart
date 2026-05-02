import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class InputboxesWidget extends StatelessWidget {
   InputboxesWidget({super.key});
   final List<TextEditingController> controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );

final List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  void nextField(int index, String value) {
    if (value.length == 1 && index < 3) {
 //   FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Row(
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
              );
  }
}