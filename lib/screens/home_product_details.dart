import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/models/Home_all_model/product_model.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/providers/cart_provider.dart';
import 'package:t_1app/models/cart_model.dart';

class HomeProductDetails extends StatefulWidget {
  final Product product;

  const HomeProductDetails({super.key, required this.product});

  @override
  State<HomeProductDetails> createState() => _HomeProductDetailsState();
}

class _HomeProductDetailsState extends State<HomeProductDetails> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ),

              SizedBox(height: 10.h),

              Center(
                child: Container(
                  width: 250.w,
                  height: 220.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.r),
                    image: DecorationImage(
                      image: AssetImage(widget.product.productImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.r),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.productName,
                        style: GoogleFonts.cairo(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 10.h),

                      Row(
                        children: [
                          const Icon(Icons.store, color: Color(0xff2E7D32)),
                          SizedBox(width: 5.w),
                          Text(
                            widget.product.shopName,
                            style: GoogleFonts.cairo(fontSize: 14.sp),
                          ),
                        ],
                      ),

                      SizedBox(height: 15.h),

                      Text(
                        "\$${widget.product.price}",
                        style: GoogleFonts.cairo(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xffF57C00),
                        ),
                      ),

                      SizedBox(height: 20.h),

                      Text(
                        "الوصف",
                        style: GoogleFonts.cairo(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 8.h),

                      Text(
                        "منتج مميز بجودة عالية وسعر مناسب.",
                        style: GoogleFonts.cairo(fontSize: 13.sp),
                      ),

                      const Spacer(),

                      ///  الكمية + زر
                      Row(
                        children: [
                          /// زر السلة
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffF57C00),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                              ),
                             onPressed: () {
                                context.read<CartProvider>().addToCart(
                                  CartModel(
                                    productImage: widget.product.productImage,
                                    productName: widget.product.productName,
                                    productPrice: widget.product.price,
                                    shopName: widget.product.shopName,
                                    quantity: quantity,
                                  ),
                                );

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "تمت إضافة المنتج إلى السلة",
                                      style: GoogleFonts.cairo(),
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Icon(Icons.shopping_cart_outlined),
                                  ),
                                  Container(
                                    child: Text(
                                      "الاضافة إلى السلة",
                                      style: GoogleFonts.cairo(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(width: 10.w),

                          /// الكمية
                          Container(
                            width: 117.w,
                            height: 34.h,
                            decoration: BoxDecoration(
                              color: Color(0xff2E7D32),
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (quantity > 1) quantity--;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                Text(
                                  quantity.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      quantity++;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
