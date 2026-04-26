import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/header.dart';
import 'package:t_1app/models/UniqeProduct.dart';
import 'package:t_1app/uniqeProduct.dart';

class Productdetails extends StatefulWidget {
  final Product product;

  const Productdetails({super.key, required this.product});

  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  int quantity = 1;
  int selectedSize = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    ///  اختصار الوصول للمنتج
    final product = widget.product;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),

        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(),
              child: CustomHeader(
                title: "",
                onBack: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Uniqeproduct()),
                  );
                },
              ),
            ),

            /// 🔹 HEADER + IMAGE
            Stack(
              children: [
                Container(
                  width: 230.w,
                  height: 263.h,
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.green.shade100,
                  ),
                  child: Image.asset(
                    product.productImage,
                    width: 230.w,
                    height: 263.h,
                    fit: BoxFit.fill,
                  ),
                ),

                /// زر المشاركة
                Positioned(
                  top: 3,
                  right: 10,
                  child: IconButton(
                    icon: const Icon(Icons.share_outlined, size: 16),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),

                /// أيقونة القلب
                Positioned(
                  top: 10,
                  right: 40,
                  child: CircleAvatar(
                    radius: 14.r,
                    backgroundColor: Colors.white,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          product.isFavorite = !product.isFavorite;
                        });
                      },
                      child: Icon(
                        product.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: product.isFavorite ? Colors.red : Colors.grey,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            /// 🔹 التفاصيل
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// السعر + الاسم
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${product.price}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          product.productName,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),

                    const SizedBox(height: 5),

                    /// التقييم ديناميك
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < product.evaluation.round()
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.orange,
                          size: 18,
                        );
                      }),
                    ),

                    const SizedBox(height: 10),

                    /// الوصف
                    const Text(
                      "الوصف",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),

                    Text(
                      product.productDescription,
                      style: const TextStyle(color: Colors.grey),
                    ),

                    const SizedBox(height: 15),

                    /// الحجم
                    const Text(
                      "الحجم",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Row(
                      children: List.generate(3, (index) {
                        List<String> sizes = ["كبير", "متوسط", "صغير"];
                        return Row(
                          children: [
                            Radio(
                              value: index,
                              groupValue: selectedSize,
                              onChanged: (value) {
                                setState(() {
                                  selectedSize = value!;
                                });
                              },
                            ),
                            Text(sizes[index]),
                          ],
                        );
                      }),
                    ),

                    const Spacer(),

                    /// 🔹 الكمية + زر
                    Row(
                      children: [
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

                        const SizedBox(width: 10),

                        /// زر السلة
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffF57C00),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            ),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(Icons.shopping_cart_outlined),
                                Text(
                                  "الاضافة إلى السلة",
                                  style: GoogleFonts.cairo(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),
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
