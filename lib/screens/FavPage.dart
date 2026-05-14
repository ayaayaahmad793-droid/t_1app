import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t_1app/models/fav_model.dart';
import 'package:t_1app/screens/HomePage.dart';
import 'package:t_1app/widgets/UniqeAll.dart';
import 'package:t_1app/widgets/Uniqe_widget/product_card_uniqe.dart';
import 'package:t_1app/widgets/header.dart';
import 'package:t_1app/screens/department.dart';
import 'package:t_1app/widgets/NavigationBar.dart';

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
                Navigator.pushReplacement(
                  context,

                  MaterialPageRoute(builder: (_) => Homepage()),
                );
                break;

              case 1:
                break;

              case 2:
                break;

              case 3:
                Navigator.pushReplacement(
                  context,

                  MaterialPageRoute(builder: (_) => Department()),
                );
                break;

              case 4:
                break;
            }
          },
        ),

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),

          child: Column(
            children: [
              CustomHeader(title: "المفضلة"),

              SizedBox(height: 20.h),
              Expanded(
                child:
                    favoriteProduct.isEmpty
                        ? Center(child: Text("لا توجد منتجات مفضلة"))
                        : ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: (favoriteProduct.length / 2).ceil(),
                          itemBuilder: (context, rowIndex) {
                            int firstIndex = rowIndex * 2;
                            int secondIndex = firstIndex + 1;

                            return Padding(
                              padding: EdgeInsets.only(bottom: 10.h),
                              child: SizedBox(
                                height: 200.h,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  children: [
                                    ProductCard(
                                      product: favoriteProduct[firstIndex],
                                      isFavPage: true,
                                      onFavoriteTap: () {
                                        setState(() {
                                          favoriteProduct.removeAt(firstIndex);
                                        });
                                      },
                                      onTap: () {},
                                    ),

                                    SizedBox(width: 10.w),

                                    if (secondIndex < favoriteProduct.length)
                                      ProductCard(
                                        product: favoriteProduct[secondIndex],
                                        isFavPage: true,
                                        onFavoriteTap: () {
                                          setState(() {
                                            favoriteProduct.removeAt(
                                              secondIndex,
                                            );
                                          });
                                        },
                                        onTap: () {},
                                      ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
