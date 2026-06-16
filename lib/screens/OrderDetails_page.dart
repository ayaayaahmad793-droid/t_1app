import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/Rest_App_Screens/ChatListScreen.dart';
import 'package:t_1app/Rest_App_Screens/Pesron.dart';
import 'package:t_1app/models/Button_Model.dart';
import 'package:t_1app/providers/cart_provider.dart';
import 'package:t_1app/providers/order_provider.dart';
import 'package:t_1app/widgets/Button.dart';
import 'package:t_1app/widgets/greenHeader.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/providers/address_provider.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final address = context.watch<AddressProvider>().address;
    final order = context.watch<OrderProvider>().order;
    if (order == null) {
      return const Scaffold(body: Center(child: Text("لا يوجد طلب")));
    }
    final cartProvider = context.watch<CartProvider>();
    
    
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),

        body: Column(
          children: [
            /// Header
            GreenHeader(title: "تفاصيل الطلب",onBack: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => ProfileScreen()),
                );
              },),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(14.w),
                child: Column(
                  children: [
                    /// Order Status Card
                    buildCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "حالة الطلب",
                            style: GoogleFonts.cairo(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          SizedBox(height: 10.h),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 20.w,
                                height: 20.w,
                                decoration: const BoxDecoration(
                                  color: Color(0xffF2CE00),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                "قيد المعالجة",
                                style: GoogleFonts.cairo(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 5.h),

                          Text(
                            "يتم تجهيز طلبك حالياً",
                            style: GoogleFonts.cairo(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff545454),
                            ),
                          ),

                          SizedBox(height: 14.h),

                          SizedBox(
                            width: double.infinity,
                            height: 42.h,
                            child: CustomButton(
                              button: ButtonModel(
                                text: " مراسلة المتجر بخصوص الطلب",
                                color: Color(0xffF57C00),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ChatListScreen(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16.h),

                    /// Order Info Card
                    buildCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "معلومات الطلب",
                            style: GoogleFonts.cairo(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          SizedBox(height: 18.h),
                         buildInfoRow(order.orderNumber, "رقم الطلب:"),

                          SizedBox(height: 10.h),
                         buildInfoRow(order.deliveryMethod, "طريقة الاستلام:"),

                          SizedBox(height: 10.h),
                          buildInfoRow(
                            address != null
                                ? "${address.country} - ${address.city} - ${address.street}"
                                : "لم يتم إضافة عنوان",
                            "العنوان:",
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16.h),

                    /// Products Card
                    buildCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "المنتجات",
                            style: GoogleFonts.cairo(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          SizedBox(height: 18.h),
                          Wrap(
                            spacing: 10.w,
                            runSpacing: 10.h,
                            children:
                                order.products.map((product) {
                                  return buildCard(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(
                                          product.productImage,
                                          width: 50.w,
                                          height: 50.h,
                                          fit: BoxFit.cover,
                                        ),

                                        SizedBox(width: 8.w),

                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 90.w,
                                              child: Text(
                                                product.productName,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.cairo(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),

                                            Text(
                                              "الكمية: ${product.quantity}",
                                              style: GoogleFonts.cairo(
                                                fontSize: 11.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                          ),

                          SizedBox(height: 18.h),
                          Text(
                            "تفاصيل مجموع الاسعار",
                            style: GoogleFonts.cairo(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Divider(thickness: 1, color: Color(0xffB7B7B7)),
                          SizedBox(height: 10.h),
                          buildPriceRow(
                            "\$${order.subtotal.toStringAsFixed(2)}",
                            "السعر",
                          ),

                          SizedBox(height: 10.h),

                          buildPriceRow(
                            "\$${order.deliveryFee.toStringAsFixed(2)}",
                            "التوصيل",
                          ),

                          SizedBox(height: 10.h),

                          buildPriceRow(
                            "\$${order.total.toStringAsFixed(2)}",
                            "السعر الكلي",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// CARD
  Widget buildCard({required Widget child}) {
    return Container(
      // width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Color(0xff919191)),
      ),
      child: child,
    );
  }

  /// INFO ROW
  Widget buildInfoRow(String title, String value) {
    return Row(
      children: [
        Text(
          value,
          textAlign: TextAlign.right,
          style: GoogleFonts.cairo(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),

        Text(
          title,
          style: GoogleFonts.cairo(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Color(0xff4E4E4E),
          ),
        ),
      ],
    );
  }

  /// PRODUCT ITEM
  Widget buildProductItem({required String image, required String title}) {
    return Column(
      children: [
        Container(
          width: 70.w,
          height: 70.w,
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: const Color(0xffF7F7F7),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Image.network(image, fit: BoxFit.contain),
        ),

        SizedBox(height: 8.h),

        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11.sp),
        ),
      ],
    );
  }

  /// PRICE ROW
  Widget buildPriceRow(String price, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.cairo(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),

        Text(
          price,
          style: GoogleFonts.cairo(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Color(0xff4E4E4E),
          ),
        ),
      ],
    );
  }
}
