import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/TheProduct.dart';
import 'package:t_1app/providers/shopData_provider.dart';
import 'package:t_1app/widgets/stat_card.dart';
import 'package:t_1app/widgets/order_item.dart';
import 'package:t_1app/widgets/grid_item.dart';
import 'package:t_1app/widgets/widshop_header.dart';

class Theshop extends StatefulWidget {
  const Theshop({super.key});

  @override
  State<Theshop> createState() => _TheshopState();
}

class _TheshopState extends State<Theshop> {
 
  @override
  Widget build(BuildContext context) {
     final provider =context.watch<ShopProvider>();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                /// 🔹 Header
               ShopHeader(name: provider.name, image: provider.image),
                SizedBox(height: 20.h),

                /// 🔹 Statistics
                Row(
                  children: [
                    StatCard(
                      title: "المنتجات",
                      number: "20",
                      icon: Icons.shopping_bag,
                    ),
                    SizedBox(width: 10.w),
                    StatCard(
                      title: "جميع الطلبات",
                      number: "10",
                      icon: Icons.receipt,
                    ),
                    SizedBox(width: 10.w),
                    StatCard(
                      title: "عدد الزيارات",
                      number: "90",
                      icon: Icons.remove_red_eye,
                    ),
                  ],
                ),

                SizedBox(height: 15.h),

                /// 🔹 Grid
                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 10.w,
                  childAspectRatio: 1,
                  children: [
                    GridItem(
                      title: "إضافة منتج",
                      icon: Icons.add_circle,
                      onTap: () {},
                    ),
                    GridItem(
                      title: "منتجاتي",
                      icon: Icons.inventory,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Theproduct()),
                        );
                      },
                    ),
                    GridItem(title: "الطلبات", icon: Icons.list, onTap: () {}),
                    GridItem(
                      title: "الرسائل",
                      icon: Icons.message,
                      onTap: () {},
                    ),
                    GridItem(
                      title: "الاحصائيات",
                      icon: Icons.show_chart,
                      onTap: () {},
                    ),
                    GridItem(
                      title: "اعدادات المتجر",
                      icon: Icons.settings,
                      onTap: () {},
                    ),
                  ],
                ),

                SizedBox(height: 15.h),

                ///  Title
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "اخر الطلبات",
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                    ),
                  ),
                ),

                SizedBox(height: 10.h),

                ///  Orders (Reusable)
                Expanded(
                  child: ListView(
                    children: [
                      OrderItem(
                        customerName: "احمد محمد",
                        productName: "سماعات headphone",
                        status: "مكتمل",
                        color: Color(0xff3EAA44),
                      ),
                      OrderItem(
                        customerName: "احمد محمد",
                        productName: "سماعات headphone",
                        status: "قيد التنفيذ",
                        color: Color(0xff0755E6),
                      ),
                      OrderItem(
                        customerName: "احمد محمد",
                        productName: "سماعات headphone",
                        status: "غير مكتمل",
                        color: Color(0xffFFB800),
                      ),
                    ],
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
