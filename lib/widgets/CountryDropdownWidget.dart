import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryDropdownWidget extends StatefulWidget {
  const CountryDropdownWidget({super.key});

  @override
  State<CountryDropdownWidget> createState() => _CountryDropdownWidgetState();
}

class _CountryDropdownWidgetState extends State<CountryDropdownWidget> {
  String? selectedCountry;

  final List<String> countries = [
    "فلسطين",
    "الأردن",
    "السعودية",
    "الإمارات",
    "مصر",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      width: double.infinity,

      padding: EdgeInsets.symmetric(horizontal: 12.w),

      decoration: BoxDecoration(
        color: const Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(12.r),
      ),

      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedCountry,

          isExpanded: true,

          alignment: Alignment.centerRight,

          dropdownColor: Colors.white,

          icon: Icon(
            Icons.keyboard_arrow_down,
            size: 22.sp,
            color: Colors.black,
          ),

          hint: Text(
            "اختر الدولة",
            style: TextStyle(fontSize: 14.sp, color: Colors.grey),
          ),

          style: TextStyle(fontSize: 14.sp, color: Colors.black),

          items:
              countries.map((country) {
                return DropdownMenuItem<String>(
                  value: country,

                  child: Align(
                    alignment: Alignment.centerRight,

                    child: Text(
                      country,
                      textAlign: TextAlign.right,

                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                );
              }).toList(),

          onChanged: (value) {
            setState(() {
              selectedCountry = value;
            });
          },
        ),
      ),
    );
  }
}
