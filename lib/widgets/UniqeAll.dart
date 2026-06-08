import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/providers/uniqe_product_provider.dart';
import 'package:t_1app/screens/productDetails.dart';
import 'package:t_1app/widgets/Uniqe_widget/product_card_uniqe.dart';
import 'package:t_1app/providers/favorite_provider.dart';

class Uniqeall extends StatefulWidget {
  final bool isFavPage;

  const Uniqeall({super.key, this.isFavPage = false});

  @override
  State<Uniqeall> createState() => _UniqeallState();
}

class _UniqeallState extends State<Uniqeall> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UniqeProductProvider>(context);
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return Directionality(
      textDirection: TextDirection.rtl,

      child: ListView.builder(
        padding: EdgeInsets.zero,

        itemCount: (provider.filteredProducts.length / 2).ceil(),

        itemBuilder: (context, rowIndex) {
          int firstIndex = rowIndex * 2;
          int secondIndex = firstIndex + 1;

          return Padding(
            padding: EdgeInsets.only(bottom: 10.h),

            child: SizedBox(
              height: 200.h,

              child: Row(
                children: [
                  /// المنتج الأول
                  Expanded(
                    child: ProductCard(
                      product: provider.filteredProducts[firstIndex].product,

                      isFavPage: widget.isFavPage,

                      onTap: () {
                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (context) => ProductSliderPage(),
                          ),
                        );
                      },

                     onFavoriteTap: () {
                        final product =
                            provider.filteredProducts[firstIndex].product;

                        if (favoriteProvider.isFavorite(product)) {
                          favoriteProvider.removeFromFavorite(product);
                        } else {
                          favoriteProvider.addToFavorite(product);
                        }
                      },
                    ),
                  ),

                  SizedBox(width: 10.w),

                  /// المنتج الثاني
                  if (secondIndex < provider.filteredProducts.length)
                    Expanded(
                      child: ProductCard(
                        product: provider.filteredProducts[secondIndex].product,

                        isFavPage: widget.isFavPage,

                        onTap: () {
                          Navigator.push(
                            context,

                            MaterialPageRoute(
                              builder: (context) => ProductSliderPage(),
                            ),
                          );
                        },

                       onFavoriteTap: () {
                          final product =
                              provider.filteredProducts[secondIndex].product;

                          if (favoriteProvider.isFavorite(product)) {
                            favoriteProvider.removeFromFavorite(product);
                          } else {
                            favoriteProvider.addToFavorite(product);
                          }
                        },
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
