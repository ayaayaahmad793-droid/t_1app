import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/models/cart_model.dart';

class CartCard extends StatefulWidget {
  final CartModel product;
  final VoidCallback onQuantityChanged;

  /// delete function
  final VoidCallback onDelete;

  const CartCard({super.key, required this.product, required this.onDelete,
    required this.onQuantityChanged,
  });

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.product.productName),

      direction: DismissDirection.startToEnd,

      onDismissed: (direction) {
        widget.onDelete();
      },

      background: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),

        padding: EdgeInsets.symmetric(horizontal: 20.w),

        alignment: Alignment.centerLeft,

        decoration: BoxDecoration(
          color: Colors.red,

          borderRadius: BorderRadius.circular(14.r),
        ),

        child: Icon(Icons.delete_outline, color: Colors.white, size: 32.sp),
      ),

      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),

        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r),

          border: Border.all(color: const Color(0xff919191), width: 1),

          color: Colors.white,
        ),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            /// IMAGE
            Image.asset(
              widget.product.productImage,
              width: 98.w,
              height: 98.h,
              fit: BoxFit.fill,
            ),

            SizedBox(width: 10.w),

            /// INFO
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  /// PRODUCT NAME
                  Text(
                    widget.product.productName,

                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,

                    style: GoogleFonts.cairo(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: 4.h),

                  /// SHOP NAME
                  Text(
                    widget.product.shopName,

                    style: GoogleFonts.cairo(
                      fontSize: 12.sp,
                      color: const Color(0xff1B1B1B),
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 14.h),

                  /// PRICE + COUNTER
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      /// PRICE
                      Text(
                        "\$${(widget.product.productPrice * widget.product.quantity).toStringAsFixed(2)}",

                        style: GoogleFonts.cairo(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),

                      /// COUNTER
                      Container(
                        width: 85.w,
                        height: 30.h,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),

                          border: Border.all(color: Colors.grey.shade500),
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [
                            /// PLUS
                            GestureDetector(
                             onTap: () {
                                setState(() {
                                  widget.product.quantity++;
                                });

                                widget.onQuantityChanged();
                              },
                              child: Icon(Icons.add, size: 16.sp),
                            ),

                            /// NUMBER
                            Text(
                              widget.product.quantity.toString(),

                              style: TextStyle(fontSize: 14.sp),
                            ),

                            /// MINUS
                            GestureDetector(
                             onTap: () {
                                if (widget.product.quantity > 1) {
                                  setState(() {
                                    widget.product.quantity--;
                                  });

                                  widget.onQuantityChanged();
                                }
                              },
                              child: Icon(Icons.remove, size: 16.sp),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(width: 12.w),
          ],
        ),
      ),
    );
  }
}
