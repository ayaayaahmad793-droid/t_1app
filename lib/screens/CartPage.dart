import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/models/Button_Model.dart';
import 'package:t_1app/models/cart_model.dart';
import 'package:t_1app/screens/FavPage.dart';
import 'package:t_1app/screens/HomePage.dart';
import 'package:t_1app/screens/TheComplete_Order_page.dart';
import 'package:t_1app/screens/department.dart';
import 'package:t_1app/widgets/Button.dart';
import 'package:t_1app/widgets/CouponWidget.dart';
import 'package:t_1app/widgets/NavigationBar.dart';
import 'package:t_1app/widgets/cart_Card.dart';
import 'package:t_1app/widgets/header.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/providers/cart_provider.dart';
class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  int _currentIndex = 2;
  final TextEditingController couponController = TextEditingController();
  

 

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Directionality(
      textDirection: TextDirection.rtl,

      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),

        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomHeader(title: "السلة",
                onBack: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => Homepage()),
                  );
                },
              ),

              SizedBox(height: 20.h),

              cartProvider.cartItems.isEmpty
                  ? Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 100.h),
                      child: Text(
                        "السلة فارغة",
                        style: GoogleFonts.cairo(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                  : ListView.builder(
                    shrinkWrap: true,

                    physics: const NeverScrollableScrollPhysics(),

                    padding: EdgeInsets.zero,

                    itemCount: cartProvider.cartItems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 12.h),

                        child: CartCard(
                          product: cartProvider.cartItems[index],

                         onDelete: () {
                            cartProvider.removeItem(
                              cartProvider.cartItems[index],
                            );
                          },

                         
                        ),
                      );
                    },
                  ),

              SizedBox(height: 5.h),

              /// COUPON
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),

                child: CouponWidget(
                  controller: couponController,

                  onApply: () {
                    print(couponController.text);
                  },
                ),
              ),

              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "اجمالي المنتجات",
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: Color(0xff555555),
                      ),
                    ),
                    Text(
                      "${cartProvider.subtotal.toStringAsFixed(2)}\$",
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "رسوم التوصيل",
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: Color(0xff555555),
                      ),
                    ),
                    Text(
                      "${cartProvider.deliveryFee.toStringAsFixed(2)}\$",
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: Color(0xff000000),
                indent: 15.w,
                endIndent: 15.w,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "المجموع النهائي",
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                        color: Color(0xff000000),
                      ),
                    ),
                    Text(
                      "${cartProvider.total.toStringAsFixed(2)}\$",
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                child: SizedBox(
                  height: 50.h,
                  width: double.infinity,
                  child: CustomButton(
                    button: ButtonModel(
                      text: "الاستمرار للدفع",
                      color: Color(0xffF57C00),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ThecompleteOrderPage(
 subtotal: cartProvider.subtotal,
                                  deliveryFee: cartProvider.deliveryFee,
                                  total: cartProvider.total,
),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

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
                Navigator.pushReplacement(
                  context,

                  MaterialPageRoute(builder: (_) => Favpage()),
                );
                break;

              case 2:
                // هنا
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
      ),
    );
  }
}
