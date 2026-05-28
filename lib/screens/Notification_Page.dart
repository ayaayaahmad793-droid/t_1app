import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/widgets/Notification_All_widget.dart';
import 'package:t_1app/widgets/Notification_Card.dart';
import 'package:t_1app/widgets/SelectedPage.dart';
import 'package:t_1app/widgets/header.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  int selectedIndex = 0;
  late List<PageItem> myPages;

  String selectedText = "الكل";
  void initState() {
    super.initState();

    myPages = [
      PageItem(title: "الكل", page: NotificationAllWidget()),

      PageItem(title: "بيع", page: Center(child: Text("بيع"))),

      PageItem(title: "شراء", page: Center(child: Text("شراء"))),

      PageItem(title: "تبادل", page: Center(child: Text("تبادل"))),
      PageItem(title: "تبرع", page: Center(child: Text("تبرع"))),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,

      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              /// Header
              CustomHeader(title: "الاشعارات"),

              SizedBox(height: 25.h),

              /// الازرار
              Wrap(
                spacing: 5.w,

                runSpacing: 10.h,
                children:
                    myPages.map((item) {
                      bool isSelected = selectedText == item.title;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedText = item.title;
                          });
                        },

                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 8.h,
                          ),

                          decoration: BoxDecoration(
                            color:
                                isSelected
                                    ? const Color(0xffF57C00)
                                    : Colors.white,

                            borderRadius: BorderRadius.circular(8.r),

                            border: Border.all(
                              color:
                                  isSelected
                                      ? const Color(0xffF57C00)
                                      : Color(0xff919191),
                            ),
                          ),

                          child: Text(
                            item.title,

                            style: GoogleFonts.cairo(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),

              SizedBox(height: 20.h),
              Expanded(
                child: DynamicSelectedPage(
                  selectedText: selectedText,
                  items: myPages,
                ),
              ),

              SizedBox(height: 25.h),
            ],
          ),
        ),
      ),
    );
  }
}
