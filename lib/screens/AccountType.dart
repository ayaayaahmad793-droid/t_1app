import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/screens/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:t_1app/screens/ShopData.dart';
import 'package:t_1app/models/Button_Model.dart';
import 'package:t_1app/providers/account_type_provider.dart';
import 'package:t_1app/widgets/Button.dart';
import 'package:t_1app/widgets/greenHeader.dart';
import 'package:t_1app/widgets/account_type_card.dart';

class Accounttype extends StatefulWidget {
  const Accounttype({super.key});

  @override
  State<Accounttype> createState() => _AccounttypeState();
}

class _AccounttypeState extends State<Accounttype> {
  final List<Map<String, String>> accountTypes = [
    {"title": "مستخدم عادي", "subtitle": "لتصفح، الشراء، التبرع او التبادل"},
    {"title": "صاحب محل", "subtitle": "لعرض المنتجات ورؤية الطلبات"},
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AccountTypeProvider>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: Column(
          children: [
            GreenHeader(title: "اختر نوع حسابك"),

            SizedBox(height: 35.h),

            Text(
              "حدد نوع الحساب لنقدم لك",
              style: GoogleFonts.cairo(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 15.h),

            Text(
              " افضل تجربة",
              style: GoogleFonts.cairo(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),

            ...List.generate(accountTypes.length, (index) {
              return AccountTypeCard(
                index: index,
                selectedIndex: provider.selectedIndex,
                title: accountTypes[index]["title"]!,
                subtitle: accountTypes[index]["subtitle"]!,
                onTap: () {
                  provider.selectAccount(index);
                },
              );
            }),
            SizedBox(height: 280.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SizedBox(
                height: 50.h,
                width: double.infinity,
                child: CustomButton(
                  button: ButtonModel(
                    text: "المتابعة",
                    color: Color(0xffF57C00),
                    onPressed: () {
                      if (provider.selectedIndex == -1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("يرجى اختيار نوع الحساب")),
                        );
                        return;
                      }

                      final pages = [Homepage(), ShopData()];

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => pages[provider.selectedIndex],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
