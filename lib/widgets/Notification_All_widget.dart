import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/providers/notification_provider.dart';
import 'package:t_1app/widgets/Notification_Card.dart';

class NotificationAllWidget extends StatelessWidget {
  const NotificationAllWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotificationProvider>(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// اليوم
            Text(
              "اليوم",
              style: GoogleFonts.cairo(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 15.h),

            ...provider.todayNotifications.map(
              (item) => NotificationCard(
                icon: item.icon,
                title: item.title,
                time: item.time,
              ),
            ),

            if (provider.oldNotifications.isNotEmpty) ...[
              SizedBox(height: 20.h),

              Divider(thickness: 1, color: const Color(0xff000000)),

              SizedBox(height: 20.h),

              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "آخر ثلاث أيام",
                  style: GoogleFonts.cairo(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              SizedBox(height: 15.h),

              ...provider.oldNotifications.map(
                (item) => NotificationCard(
                  icon: item.icon,
                  title: item.title,
                  time: item.time,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
