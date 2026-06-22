import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/models/UniqeProduct_model.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/providers/cart_provider.dart';
import 'package:t_1app/models/cart_model.dart';

class ProductSliderPage extends StatefulWidget {
  final ProductU1 product;

  const ProductSliderPage({super.key, required this.product});

  @override
  State<ProductSliderPage> createState() => _ProductSliderPageState();
}

class _ProductSliderPageState extends State<ProductSliderPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ),
              SizedBox(height: 20.h),
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

              ///  المعلومات
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.r),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// الاسم + السعر
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.product.productName,
                            style: GoogleFonts.cairo(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "\$${widget.product.price}",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "(20 من التعليقات)",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff4B4B4B),
                            ),
                          ),
                          Image.asset("images/stars.png"),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        "الوصف",
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(height: 15.h),

                      /// الوصف
                      Text(
                        widget.product.productDescription,
                        style: GoogleFonts.cairo(
                          fontSize: 12.sp,
                          color: Color(0xff2B2B2B),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      // CategoryRadio(),
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
                                cartProvider.addToCart(
                                  CartModel(
                                    productImage: widget.product.productImage,
                                    productName: widget.product.productName,
                                    productPrice: widget.product.price,
                                    shopName: "منتجات مميزة",
                                    quantity: quantity,
                                  ),
                                );

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("تمت إضافة المنتج إلى السلة"),
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

