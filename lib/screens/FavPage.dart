import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t_1app/HomePage.dart';
import 'package:t_1app/widgets/header.dart';
import 'package:t_1app/screens/department.dart';
import 'package:t_1app/widgets/NavigationBar.dart';
import 'package:t_1app/widgets/UniqeAll.dart';

class Favpage extends StatefulWidget {
  const Favpage({super.key});

  @override
  State<Favpage> createState() => _FavpageState();
}

class _FavpageState extends State<Favpage> {
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        bottomNavigationBar: CustomNavBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });

            switch (index) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Homepage()),
                );
                break;

              case 1:
                //انا هنا
                break;

              case 2:
                // CartPage
                break;

              case 3:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Department()),
                );
                break;

              case 4:
                // ProfilePage
                break;
            }
          },
        ),

        //  المحتوى
        body: Padding(
          padding: EdgeInsets.only(right: 15.w, left: 15.w),
          child: Column(
            children: [
              CustomHeader(title: "المفضلة"),
              SizedBox(height: 20.h),
              Expanded(child: Uniqeall()),
            ],
          ),
        ),
      ),
    );
  }
}
