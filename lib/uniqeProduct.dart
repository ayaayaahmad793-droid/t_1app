import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/models/Home_all_model/product_model.dart';
import 'package:t_1app/screens/HomePage.dart';
import 'package:t_1app/SearchSett.dart';
import 'package:t_1app/SelectedPage.dart';
import 'package:t_1app/widgets/UniqeAll.dart';
import 'package:t_1app/widgets/header.dart';
import 'package:record/record.dart';

class Uniqeproduct extends StatefulWidget {
  const Uniqeproduct({super.key});

  @override
  State<Uniqeproduct> createState() => _UniqeproductState();
}



class _UniqeproductState extends State<Uniqeproduct> {
  ///  الصفحات الديناميكية
  final List<PageItem> myPages = [
    PageItem(title: "الكل", page: Uniqeall()),
    PageItem(title: "كوزمتكس", page: Center(child: Text("كوزمتكس"))),
    PageItem(
      title: "ادوات الكترونية",
      page: Center(child: Text("دوات الكترونية")),
    ),
    PageItem(title: "ملابس", page: Center(child: Text("ملابس"))),
  ];
  final Record recorder = Record();
  bool isRecording = false;
  Future<void> startRecording() async {
    if (await recorder.hasPermission()) {
      await recorder.start(
        path: 'recording.m4a',
        encoder: AudioEncoder.aacLc,
        bitRate: 128000,
        samplingRate: 44100,
      );

      setState(() {
        isRecording = true;
      });
    }
  }

  Future<void> stopRecording() async {
    final path = await recorder.stop();

    print("تم حفظ التسجيل في: $path");

    setState(() {
      isRecording = false;
    });
  }

  @override
  void dispose() {
    recorder.dispose();
    super.dispose();
  }

  List<Product> filteredProducts = [];
  @override
  void initState() {
    super.initState();
  }

  String selectedText = "الكل";

  @override
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),

        body: Padding(
          padding: EdgeInsets.only(right: 20.w, left: 10.w), //  padding عام
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeader(
                title: "منتجات مميزة",
                onBack: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => Homepage()));
                },
              ),

              SizedBox(height: 10.h),

              /// SEARCH
              CustomSearchBar(
                hintText: "ابحث عن المنتجات التي تريدها...",
                isRecording: isRecording,
                onMicPressed: () async {
                  if (isRecording) {
                    await stopRecording();
                  } else {
                    await startRecording();
                  }
                },
                onFilterPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Uniqeproduct()),
                  );
                },
                onChanged: (value) {},
              ),

              SizedBox(height: 20.h),

              /// TITLE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "الاقسام",
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    "شاهد الكل",
                    style: GoogleFonts.cairo(
                      fontSize: 13.sp,
                      color: const Color(0xff979797),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              /// CATEGORIES
              SizedBox(
                height: 35.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children:
                      myPages.map((item) {
                        return chip(item.title);
                      }).toList(),
                ),
              ),
              SizedBox(height: 20.h),

              /// الصفحات
              Expanded(
                child: DynamicSelectedPage(
                  selectedText: selectedText,
                  items: myPages,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///  CHIP
  Widget chip(String text) {
    return InkWell(
      borderRadius: BorderRadius.circular(18.r),
      onTap: () {
        setState(() {
          selectedText = text;
        });
      },
      child: Container(
        width: 100.w,
        height: 35.h,
        margin: EdgeInsets.only(left: 8.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selectedText == text ? Color(0xffF57C00) : Colors.transparent,
          border: Border.all(
            color: selectedText == text ? Color(0xffF57C00) : Color(0xff919191),
          ),
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Text(text, style: GoogleFonts.cairo(fontSize: 14.sp)),
      ),
    );
  }
}
