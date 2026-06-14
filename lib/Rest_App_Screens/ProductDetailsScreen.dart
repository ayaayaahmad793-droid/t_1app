import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailsPage extends StatefulWidget {
  final dynamic product; // نستخدم dynamic لاستقبال أي نوع من الموديلات

  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    // استخراج البيانات بشكل ديناميكي بغض النظر عن نوع الكلاس
    final product = widget.product;
    final String name = product.productName ?? product.name ?? "غير معروف";
    final double price = (product.price is int) ? (product.price as int).toDouble() : (product.price ?? 0.0);
    final String image = product.productImage ?? product.image ?? "";
    final String desc = product.productDescription ?? "لا يوجد وصف";

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            // السلايدر أو صورة المنتج
            Container(
              height: 300.h,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(40.r)),
              ),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(name, style: GoogleFonts.cairo(fontSize: 20.sp, fontWeight: FontWeight.bold)),
                        Text("\$$price", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.orange)),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Text("الوصف", style: GoogleFonts.cairo(fontWeight: FontWeight.w600)),
                    Text(desc, style: GoogleFonts.cairo(color: Colors.grey)),
                    Spacer(),

                    // زر الإضافة والكمية
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Color(0xffF57C00), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r))),
                            onPressed: () {},
                            child: Text("الاضافة إلى السلة", style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        // حاوية الكمية
                        Container(
                          height: 50.h,
                          decoration: BoxDecoration(color: Color(0xff2E7D32), borderRadius: BorderRadius.circular(15.r)),
                          child: Row(
                            children: [
                              IconButton(icon: Icon(Icons.remove, color: Colors.white), onPressed: () => setState(() => quantity--)),
                              Text("$quantity", style: TextStyle(color: Colors.white)),
                              IconButton(icon: Icon(Icons.add, color: Colors.white), onPressed: () => setState(() => quantity++)),
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
    );
  }
}