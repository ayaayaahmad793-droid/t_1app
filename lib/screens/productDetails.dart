import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/models/productDetails.dart';
import 'package:t_1app/widgets/categoryRadio.dart';

class ProductSliderPage extends StatefulWidget {
  const ProductSliderPage({super.key});

  @override
  State<ProductSliderPage> createState() => _ProductSliderPageState();
}

class _ProductSliderPageState extends State<ProductSliderPage> {
  final PageController _controller = PageController(viewportFraction: 0.7);

  double currentPage = 0;
  int quantity = 1;

  final List<DetProduct> products = [
    DetProduct(
      image: 'images/uniqeProductAll2.png',
      name: 'Skin Proad كريم',
      longDescription:
          "منتجات Skin Proud تمنح بشرتك ترطيباً عميقاً، تغذية وحماية يومية، مع مكونات طبيعية مناسبة لجميع أنواع البشرة ونتائج واضحة مع الاستخدام المنتظم.",
      price: 200,
    ),
    DetProduct(
      image: 'images/uniqeProductAll1.png',
      name: 'كريم العناية بالبشرة',
      longDescription: 'يعمل على ترطيب البشرة والعناية بها ولمعانها',
      price: 180,
    ),
    DetProduct(
      image: 'images/uniqeProductAll3.png',
      name: 'ايفون 17',
      longDescription:
          'هاتف يعمل بالعديد من التقنيات المدعومة بالذكاء الاصطناعي',
      price: 1500,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        currentPage = _controller.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    int currentIndex = currentPage.round();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20.h),

              ///  السلايدر
              SizedBox(
                height: 280.h,
                child: PageView.builder(
                  controller: _controller,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    double scale = (1 - (currentPage - index).abs()).clamp(
                      0.7,
                      1,
                    );

                    return GestureDetector(
                      onTap: () {
                        _controller.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Transform.scale(
                        scale: scale,
                        child: Container(
                          width: 230.w, //  العرض
                          height: 263.h, //  الطول
                          margin: EdgeInsets.symmetric(horizontal: 2.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.r),
                            image: DecorationImage(
                              image: AssetImage(products[index].image),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              if (index == currentIndex)
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 10.r,
                                  offset: const Offset(0, 5),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
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
                            products[currentIndex].name,
                            style: GoogleFonts.cairo(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "\$${products[currentIndex].price}",
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
                        products[currentIndex].longDescription,
                        style: GoogleFonts.cairo(
                          fontSize: 12.sp,
                          color: Color(0xff2B2B2B),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      CategoryRadio(),
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
                              onPressed: () {},
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

/*
                    /// 🔹 الكمية + زر
                    Row(
                      children: [
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
} */
