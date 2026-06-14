import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/models/Home_all_model/product_model.dart';
import 'package:t_1app/models/UniqeProduct_model.dart';
import 'package:t_1app/providers/favorite_provider.dart';
import 'package:t_1app/screens/CartPage.dart';
import 'package:t_1app/screens/HomePage.dart';
import 'package:t_1app/screens/department.dart';
import 'package:t_1app/widgets/NavigationBar.dart';
import 'package:t_1app/widgets/Home_widget/product_card_widget.dart' as home;
import 'package:t_1app/widgets/Uniqe_widget/product_card_uniqe.dart';
import 'package:t_1app/widgets/exchangeCard.dart';
import 'package:t_1app/widgets/header.dart';

class Favpage extends StatefulWidget {
  const Favpage({super.key});

  @override
  State<Favpage> createState() => _FavpageState();
}

class _FavpageState extends State<Favpage> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    final List<dynamic> favoriteProduct = favoriteProvider.favoriteProducts;

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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => Cartpage()),
                );
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
              CustomHeader(title: "المفضلة",
                onBack: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => Homepage()),
                  );
                },
              ),

              SizedBox(height: 20.h),

              Expanded(
                child:
                    favoriteProduct.isEmpty
                        ? const Center(child: Text("لا توجد منتجات مفضلة"))
                        : ListView.builder(
                          padding: EdgeInsets.zero,

                          itemCount: (favoriteProduct.length / 2).ceil(),

                          itemBuilder: (context, rowIndex) {
                            int firstIndex = rowIndex * 2;

                            int secondIndex = firstIndex + 1;

                            return Padding(
                              padding: EdgeInsets.only(bottom: 10.h),

                              child: SizedBox(
                                height: 230.h,

                                child: ListView(
                                  scrollDirection: Axis.horizontal,

                                  physics: const BouncingScrollPhysics(),

                                  children: [
                                    /// المنتج الأول
                                    favoriteProduct[firstIndex] is ProductU1
                                        ? ProductCard(
                                          product: favoriteProduct[firstIndex],

                                          isFavPage: true,

                                          onFavoriteTap: () {
                                            favoriteProvider.removeFromFavorite(
                                              favoriteProduct[firstIndex],
                                            );
                                          },

                                          onTap: () {},
                                        )
                                        : favoriteProduct[firstIndex] is Product
                                        ? home.ProductCard(
                                          product:
                                              favoriteProduct[firstIndex]
                                                  as Product,
                                        )
                                        : ExchangeCard(
                                          title:
                                              favoriteProduct[firstIndex].title,

                                          description:
                                              favoriteProduct[firstIndex]
                                                  .description,

                                          image:
                                              favoriteProduct[firstIndex].image,

                                          isFavorite: true,

                                          onFavoriteTap: () {
                                            favoriteProvider.removeFromFavorite(
                                              favoriteProduct[firstIndex],
                                            );
                                          },
                                        ),

                                    SizedBox(width: 10.w),

                                    /// المنتج الثاني
                                    if (secondIndex < favoriteProduct.length)
                                      favoriteProduct[secondIndex] is ProductU1
                                          ? ProductCard(
                                            product:
                                                favoriteProduct[secondIndex],

                                            isFavPage: true,

                                            onFavoriteTap: () {
                                              favoriteProvider
                                                  .removeFromFavorite(
                                                    favoriteProduct[secondIndex],
                                                  );
                                            },

                                            onTap: () {},
                                          )
                                          : favoriteProduct[secondIndex]
                                              is Product
                                          ? home.ProductCard(
                                            product:
                                                favoriteProduct[secondIndex]
                                                    as Product,
                                          )
                                          : ExchangeCard(
                                            title:
                                                favoriteProduct[secondIndex]
                                                    .title,

                                            description:
                                                favoriteProduct[secondIndex]
                                                    .description,

                                            image:
                                                favoriteProduct[secondIndex]
                                                    .image,

                                            isFavorite: true,

                                            onFavoriteTap: () {
                                              favoriteProvider
                                                  .removeFromFavorite(
                                                    favoriteProduct[secondIndex],
                                                  );
                                            },
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
