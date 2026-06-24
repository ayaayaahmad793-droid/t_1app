import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/models/Home_all_model/product_model.dart' as home_model;
import 'package:t_1app/models/UniqeProduct_model.dart' as uniqe_model;
import 'package:t_1app/providers/favorite_provider.dart';
import 'package:t_1app/screens/CartPage.dart';
import 'package:t_1app/screens/HomePage.dart';
import 'package:t_1app/screens/department.dart';
import 'package:t_1app/widgets/NavigationBar.dart';
import 'package:t_1app/widgets/Home_widget/product_card_widget.dart' as home_widget;
import 'package:t_1app/widgets/Uniqe_widget/product_card_uniqe.dart' as uniqe_widget;
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
    final List<dynamic> favoriteProducts = favoriteProvider.favoriteProducts;

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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Homepage()));
                break;
              case 2:
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Cartpage()));
                break;
              case 3:
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Department()));
                break;
            }
          },
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              CustomHeader(
                title: "المفضلة",
                onBack: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Homepage()));
                },
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: favoriteProducts.isEmpty
                    ? const Center(child: Text("لا توجد منتجات مفضلة"))
                    : ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: (favoriteProducts.length / 2).ceil(),
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
                            // المنتج الأول
                            _buildProductCard(favoriteProducts[firstIndex], favoriteProvider),

                            SizedBox(width: 10.w),

                            // المنتج الثاني (إن وجد)
                            if (secondIndex < favoriteProducts.length)
                              _buildProductCard(favoriteProducts[secondIndex], favoriteProvider),
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

  Widget _buildProductCard(dynamic product, FavoriteProvider provider) {
    if (product is home_model.Product) {
      return home_widget.ProductCard(
        product: product,
        onFavoriteTap: () {
          provider.removeFromFavorite(product);
        },
        onTap: () {},
      );
    } else if (product is uniqe_model.ProductU1) {
      return uniqe_widget.ProductCard(
        product: product,
        isFavPage: true,
        onFavoriteTap: () {
          provider.removeFromFavorite(product);
        },
        onTap: () {},
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:t_1app/models/UniqeProduct_model.dart';
// import 'package:t_1app/providers/favorite_provider.dart';
// import 'package:t_1app/screens/CartPage.dart';
// import 'package:t_1app/screens/HomePage.dart';
// import 'package:t_1app/screens/department.dart';
// import 'package:t_1app/widgets/NavigationBar.dart';
// import 'package:t_1app/widgets/Uniqe_widget/product_card_uniqe.dart';
// import 'package:t_1app/widgets/header.dart';
//
// class Favpage extends StatefulWidget {
//   const Favpage({super.key});
//
//   @override
//   State<Favpage> createState() => _FavpageState();
// }
//
// class _FavpageState extends State<Favpage> {
//   int _currentIndex = 1;
//
//   @override
//   Widget build(BuildContext context) {
//     final favoriteProvider = Provider.of<FavoriteProvider>(context);
//     final List<dynamic> favoriteProducts = favoriteProvider.favoriteProducts;
//
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         backgroundColor: const Color(0xffFFFFFF),
//         bottomNavigationBar: CustomNavBar(
//           currentIndex: _currentIndex,
//           onTap: (index) {
//             setState(() {
//               _currentIndex = index;
//             });
//             switch (index) {
//               case 0:
//                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Homepage()));
//                 break;
//               case 2:
//                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Cartpage()));
//                 break;
//               case 3:
//                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Department()));
//                 break;
//             }
//           },
//         ),
//         body: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 15.w),
//           child: Column(
//             children: [
//               CustomHeader(
//                 title: "المفضلة",
//                 onBack: () {
//                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Homepage()));
//                 },
//               ),
//               SizedBox(height: 20.h),
//               Expanded(
//                 child: favoriteProducts.isEmpty
//                     ? const Center(child: Text("لا توجد منتجات مفضلة"))
//                     : ListView.builder(
//                   padding: EdgeInsets.zero,
//                   itemCount: (favoriteProducts.length / 2).ceil(),
//                   itemBuilder: (context, rowIndex) {
//                     int firstIndex = rowIndex * 2;
//                     int secondIndex = firstIndex + 1;
//
//                     return Padding(
//                       padding: EdgeInsets.only(bottom: 10.h),
//                       child: SizedBox(
//                         height: 230.h,
//                         child: ListView(
//                           scrollDirection: Axis.horizontal,
//                           physics: const BouncingScrollPhysics(),
//                           children: [
//                             // المنتج الأول يُعرض تماماً كما هو في صفحة الهوم
//                             ProductCard(
//                               product: favoriteProducts[firstIndex],
//                               isFavPage: true,
//                               onFavoriteTap: () {
//                                 favoriteProvider.removeFromFavorite(favoriteProducts[firstIndex]);
//                               },
//                               onTap: () {},
//                             ),
//
//                             SizedBox(width: 10.w),
//
//                             // المنتج الثاني
//                             if (secondIndex < favoriteProducts.length)
//                               ProductCard(
//                                 product: favoriteProducts[secondIndex],
//                                 isFavPage: true,
//                                 onFavoriteTap: () {
//                                   favoriteProvider.removeFromFavorite(favoriteProducts[secondIndex]);
//                                 },
//                                 onTap: () {},
//                               ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }