import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/models/Home_all_model/product_model.dart';
import 'package:t_1app/providers/favorite_provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.product,
    this.onFavoriteTap,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // We use context.watch to rebuild when favorites change
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final isFav = favoriteProvider.isFavorite(product);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 162.w,
        height: 200.h,
        margin: EdgeInsets.only(left: 10.w),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff8D8D8D)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
                  child: Image.asset(
                    product.productImage,
                    height: 118.h,
                    width: 162.w,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {
                      favoriteProvider.toggleFavorite(product);
                      if (onFavoriteTap != null) onFavoriteTap!();
                    },
                    child: CircleAvatar(
                      radius: 14.r,
                      backgroundColor: Colors.white,
                      child: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        color: isFav ? Colors.red : Colors.grey,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.w, top: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.productName,
                    style: GoogleFonts.cairo(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff000000),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      const Icon(Icons.store, color: Color(0xff2E7D32), size: 18),
                      Text(
                        product.shopName,
                        style: GoogleFonts.cairo(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff1B1B1B),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Text(
                        "\$${product.price}",
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        "\$${product.oldPrice}",
                        style: GoogleFonts.cairo(
                          color: const Color(0xff8D8D8D),
                          decoration: TextDecoration.lineThrough,
                          decorationColor: const Color(0xff8D8D8D),
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            product.evaluation.toString(),
                            style: GoogleFonts.cairo(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Icon(
                            Icons.star,
                            color: Color(0xffFFB800),
                            size: 17,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
