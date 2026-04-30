import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  bool isRecording = false;
  final TextEditingController controller = TextEditingController();

  void onMicPressed() {
    setState(() {
      isRecording = !isRecording;
    });

    // هون لاحقاً ممكن تضيفي voice recognition
    print(isRecording ? "Recording..." : "Stopped");
  }

  void onChanged(String value) {
    print("Search: $value");
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Container(
          height: 44.h,
          width: 343.w,
          decoration: BoxDecoration(
            color: const Color(0xffFFFFFF),

            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: const Color(0xff919191), width: 1.2.w),
          ),
          child: Row(
            children: [
              //  أيقونة البحث
              Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: Icon(
                  Icons.search,
                  size: 24.sp,
                  color: Color(0xff292D32),
                ),
              ),

              SizedBox(width: 6.w),

              // TextField
              Expanded(
                child: TextField(
                  controller: controller,
                  onChanged: onChanged,
                  decoration: InputDecoration(
                    hintText: "ابحث عن منتج ترغب بتبديله...",
                    border: InputBorder.none,
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 10.sp,
                      color: const Color(0xff9A9A9A),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),

              //  أيقونة المايك
              GestureDetector(
                onTap: onMicPressed,
                child: Icon(
                  isRecording ? Icons.stop : Icons.mic_none,
                  size: 24.sp,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
