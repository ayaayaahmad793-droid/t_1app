import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/screens/HomePage.dart';
import 'package:t_1app/widgets/Notification_All_widget.dart';
import 'package:t_1app/widgets/SelectedPage.dart';
import 'package:t_1app/widgets/header.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/providers/notification_provider.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  int selectedIndex = 0;
  late List<PageItem> myPages;

  void initState() {
    super.initState();

    myPages = [
      PageItem(title: "الكل", page: NotificationAllWidget()),

      PageItem(title: "بيع", page: NotificationAllWidget()),

      PageItem(title: "شراء", page: NotificationAllWidget()),

      PageItem(title: "تبادل", page: NotificationAllWidget()),
      PageItem(title: "تبرع", page: NotificationAllWidget()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotificationProvider>(context);
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
              CustomHeader(
                title: "الاشعارات",
                onBack: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => Homepage()),
                  );
                },
              ),

              SizedBox(height: 25.h),

              /// الازرار
              Wrap(
                spacing: 5.w,

                runSpacing: 10.h,
                children:
                    myPages.map((item) {
                      bool isSelected = provider.selectedCategory == item.title;

                      return GestureDetector(
                        onTap: () {
                          provider.selectCategory(item.title);
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
                  selectedText: provider.selectedCategory,
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
