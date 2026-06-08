import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/models/UniqeProduct_model.dart';
import 'package:t_1app/providers/favorite_provider.dart';

class ProductCard extends StatefulWidget {
  final ProductU1 product;
  final bool isFavPage;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;

  const ProductCard({
    super.key,
    required this.product,
    this.isFavPage = false,
    this.onTap,
    this.onFavoriteTap,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    final isFav = favoriteProvider.isFavorite(widget.product);

    return InkWell(
      borderRadius: BorderRadius.circular(15.r),
      onTap: widget.onTap,

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
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(15.r),
                  ),

                  child: Image.asset(
                    widget.product.productImage,

                    height: 110.h,
                    width: 162.w,

                    fit: BoxFit.fill,
                  ),
                ),

                Positioned(
                  top: 8,
                  right: 8,

                  child: GestureDetector(
                    onTap: () {
                      if (isFav) {
                        favoriteProvider.removeFromFavorite(widget.product);
                      } else {
                        favoriteProvider.addToFavorite(widget.product);
                      }

                     
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
                    widget.product.productName,

                    style: GoogleFonts.cairo(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff000000),
                    ),
                  ),

                  SizedBox(height: 4.h),

                  Text(
                    widget.product.productDescription,

                    style: GoogleFonts.cairo(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff6B6B6B),
                    ),
                  ),

                  SizedBox(height: 4.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Row(
                        children: [
                          Text(
                            "\$${widget.product.price}",

                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,

                              fontSize: 12.sp,

                              color: const Color(0xff000000),
                            ),
                          ),

                          SizedBox(width: 4.w),

                          Text(
                            "\$${widget.product.oldPrice}",

                            style: GoogleFonts.cairo(
                              color: const Color(0xff8D8D8D),

                              decoration: TextDecoration.lineThrough,

                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Text(
                            widget.product.evaluation.toString(),

                            style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,

                              color: const Color(0xff000000),
                            ),
                          ),

                          const Icon(
                            Icons.star,
                            color: Color(0xffFFB800),
                            size: 16,
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
