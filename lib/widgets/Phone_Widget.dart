import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneWidget extends StatelessWidget {
  final Function(String)? onChanged;
  final String? errorText;

  const PhoneWidget({super.key, this.onChanged, this.errorText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "رقم الهاتف",
          style: GoogleFonts.cairo(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        IntlPhoneField(
          initialCountryCode: 'PS',
          onChanged: (phone) {
            onChanged?.call(phone.completeNumber); //  المهم
          },
          decoration: InputDecoration(
            hintText: "590000000",
            errorText: errorText,
            hintStyle: GoogleFonts.cairo(
              fontSize: 12,
              color: const Color(0xff797878),
            ),
            filled: true,
            fillColor: const Color(0xffF5F5F5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
