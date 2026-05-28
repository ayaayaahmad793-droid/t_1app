import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CityDropdownWidget extends StatefulWidget {
  const CityDropdownWidget({super.key});

  @override
  State<CityDropdownWidget> createState() => _CityDropdownWidgetState();
}

class _CityDropdownWidgetState extends State<CityDropdownWidget> {
  String? selectedCity;

  final List<String> cities = [
    "غزة",
    "خانيونس",
    "رفح",
    "دير البلح",
    "جباليا",
    "بيت لاهيا",
    "بيت حانون",
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
          value: selectedCity,

          isExpanded: true,

          alignment: Alignment.centerRight,

          dropdownColor: Colors.white,

          icon: Icon(
            Icons.keyboard_arrow_down,
            size: 22.sp,
            color: Colors.black,
          ),

          hint: Text(
            "اختر المدينة",
            style: TextStyle(fontSize: 14.sp, color: Colors.grey),
          ),

          style: TextStyle(fontSize: 14.sp, color: Colors.black),

          items:
              cities.map((city) {
                return DropdownMenuItem<String>(
                  value: city,

                  child: Align(
                    alignment: Alignment.centerRight,

                    child: Text(
                      city,
                      textAlign: TextAlign.right,

                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                );
              }).toList(),

          onChanged: (value) {
            setState(() {
              selectedCity = value;
            });
          },
        ),
      ),
    );
  }
}
