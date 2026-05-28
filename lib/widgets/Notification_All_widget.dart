import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/widgets/Notification_Card.dart';

class NotificationAllWidget extends StatefulWidget {
  const NotificationAllWidget({super.key});
  @override
  State<NotificationAllWidget> createState() => _NotificationAllWidgetState();
}

class _NotificationAllWidgetState extends State<NotificationAllWidget> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,

      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Today
              Text(
                "اليوم",

                style: GoogleFonts.cairo(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 15.h),

              NotificationCard(
                icon: "🛒",
                title:
                    "تم تأكيد طلبك بنجاح! انتظر تحديثات الشراء من متجرنا المحلي ❤️",
                time: "08:30 صباحاً",
              ),

              NotificationCard(
                icon: "💬",
                title:
                    "البائع رد على استفسارك حول المنتج، اطلع على التفاصيل الآن.",
                time: "09:30 مساءً",
              ),
              NotificationCard(
                icon: "💬",
                title: "تم استلام تبرعك بنجاح، جزاك الله خيرًا 💕",
                time: "09:30 مساءً",
              ),

              SizedBox(height: 20.h),

              Divider(thickness: 1, color: Color(0xff000000)),

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

              NotificationCard(
                icon: "🛒",
                title:
                    " تمت الموافقة على طلب التبادل، يمكنك التواصل مع الطرف الآخر الآن.",
                time: "08:30 صباحاً",
              ),

              NotificationCard(
                icon: "💬",
                title: " تمت عملية الدفع بنجاح، نتمنى لك تجربة تسوق مميزة",
                time: "09:30 مساءً",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
