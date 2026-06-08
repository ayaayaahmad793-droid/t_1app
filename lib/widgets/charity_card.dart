import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CharityCard extends StatelessWidget {
  final String charityName;
  final String description;
  final String buttonText;
  final VoidCallback onMorePressed;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;

  const CharityCard({
    super.key,
    required this.charityName,
    required this.description,
    required this.buttonText,
    required this.onMorePressed,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: InkWell(
        borderRadius: BorderRadius.circular(12.r),
        onTap: onTap,
        child: Container(
          height: 145.h,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color:
                  isSelected
                      ? const Color(0xFF2E7D32)
                      : const Color(0xff919191),
              width: isSelected ? 2 : 1,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// الصف العلوي
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// صورة الجمعية
                    Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      width: 50.w,
                      height: 50.h,
                    ),

                    const SizedBox(width: 10),

                    /// الاسم والوصف
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            charityName,
                            textAlign: TextAlign.right,
                            style: GoogleFonts.cairo(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          SizedBox(height: 8.h),

                          Text(
                            description,
                            textAlign: TextAlign.right,
                            style: GoogleFonts.cairo(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                /// زر اعرف المزيد
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 136.w,
                    height: 28.h,
                    child: ElevatedButton(
                      onPressed: onMorePressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffF57C00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        buttonText,
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
