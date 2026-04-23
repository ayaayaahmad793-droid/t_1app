import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  final PageController _controller = PageController();
  int currentPage = 0;

  final List<String> images = [
    "images/HomeRoot.png",
    "images/HomeRoot.png",
    "images/HomeRoot.png",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 197.h,
      child: Stack(
        children: [
          /// Slider
          PageView.builder(
            controller: _controller,
            itemCount: images.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.asset(
                  images[index],
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),

          ///  النص العلوي
          Positioned(
            top: 20.h,
            left: 15.w,
            child: Text(
              "تسوق محلي, وادعم \n مجتمعك",
              style: GoogleFonts.cairo(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xffFFFFFF),
              ),
            ),
          ),

          ///  النص السفلي
          Positioned(
            bottom: 20.h,
            right: 20.w,
            child: Text(
              "ابدا البيع بلمسة,\n وشارك الخير بصفقة",
              style: GoogleFonts.cairo(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xffFFFFFF),
              ),
            ),
          ),

          ///  زر
          Positioned(
            left: 10.w,
            bottom: 5.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffF57C00),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
              onPressed: () {},
              child: Text(
                "تسوق الان",
                style: GoogleFonts.cairo(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff000000),
                ),
              ),
            ),
          ),

          ///  زر السابق
          Positioned(
            top: 80.h,
            left: 5.w,
            child: IconButton(
              onPressed: () {
                _controller.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
            ),
          ),

          ///  زر التالي
          Positioned(
            top: 80.h,
            right: 5.w,
            child: IconButton(
              onPressed: () {
                _controller.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
