import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/models/Button_Model.dart';
import 'package:t_1app/models/notification_model.dart';
import 'package:t_1app/models/order_model.dart';
import 'package:t_1app/providers/notification_provider.dart';
import 'package:t_1app/providers/order_provider.dart';
import 'package:t_1app/screens/CartPage.dart';
import 'package:t_1app/screens/track_location_page.dart';
import 'package:t_1app/widgets/AddNewAddress_widget.dart';
import 'package:t_1app/widgets/Button.dart';
import 'package:t_1app/widgets/CouponWidget.dart';
import 'package:t_1app/widgets/PaymentMethodCard_widget.dart';
import 'package:t_1app/widgets/header.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/providers/cart_provider.dart';

class ThecompleteOrderPage extends StatefulWidget {
  const ThecompleteOrderPage({super.key});

  @override
  State<ThecompleteOrderPage> createState() => _ThecompleteOrderPageState();
}

class _ThecompleteOrderPageState extends State<ThecompleteOrderPage> {
  final TextEditingController couponController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Directionality(
      textDirection: TextDirection.rtl,

      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// الهيدر
            CustomHeader(
              title: "اتمام الطلب",
              onBack: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => Cartpage()),
                );
              },
            ),

            SizedBox(height: 20.h),

            /// المحتوى القابل للسكرول
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),

                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        "اختيار طريقة الدفع",
                        style: GoogleFonts.cairo(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      SizedBox(height: 20.h),

                      PaymentMethodCard(),

                      SizedBox(height: 10.h),
                      AddnewaddressWidget(),
                      SizedBox(height: 10.h),
                      Container(
                        width: double.infinity,
                        height: 76.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 14.w,
                          vertical: 14.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF),

                          borderRadius: BorderRadius.circular(15.r),

                          border: Border.all(
                            color: const Color(0xff919191),
                            width: 1.w,
                          ),
                        ),

                        child: Row(
                          children: [
                            Text(
                              "تفاصيل الطلب",
                              style: GoogleFonts.cairo(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 155.w),
                            Icon(Icons.arrow_forward_ios, size: 25.r),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),

                      /// COUPON
                      CouponWidget(
                        controller: couponController,

                        onApply: () {
                          print(couponController.text);
                        },
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "ملخص الطلبات",
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp,
                          color: Color(0xff000000),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
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
                      SizedBox(height: 10.h),
                      Row(
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

                      Divider(
                        thickness: 1,
                        color: Color(0xff000000),
                        indent: 15.w,
                        endIndent: 15.w,
                      ),
                      SizedBox(height: 10.h),
                      Row(
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
                      SizedBox(height: 10.h),
                      SizedBox(
                        height: 50.h,
                        width: double.infinity,
                        child: CustomButton(
                          button: ButtonModel(
                            text: "ادفع الان",
                            color: Color(0xffF57C00),
                            onPressed: () {
                              final cartProvider = context.read<CartProvider>();

                              context.read<OrderProvider>().createOrder(
                                OrderModel(
                                  orderNumber: "#123",
                                  deliveryMethod: "التوصيل للمنزل",
                                  products: List.from(cartProvider.cartItems),
                                  subtotal: cartProvider.subtotal,
                                  deliveryFee: cartProvider.deliveryFee,
                                  total: cartProvider.total,
                                ),
                              );

                              cartProvider.clearCart();

                              context
                                  .read<NotificationProvider>()
                                  .addNotification(
                                    NotificationItem(
                                      icon: "🛒",
                                      title: "تمت عملية الدفع بنجاح",
                                      time: "الآن",
                                      category: "شراء",
                                    ),
                                  );

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const TrackLocationPage(),
                                ),
                              );
                            }
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
