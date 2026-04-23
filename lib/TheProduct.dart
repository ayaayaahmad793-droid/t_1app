import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/AddProduct.dart';
import 'package:t_1app/HomePage.dart';
import 'package:record/record.dart';

class Product {
  final String name;
  final String code;
  final String price;
  final String oldPrice;
  final String image;
  final bool available;
  final String amount;

  Product({
    required this.name,
    required this.code,
    required this.price,
    required this.oldPrice,
    required this.image,
    required this.available,
    required this.amount,
  });
}

class Theproduct extends StatefulWidget {
  const Theproduct({super.key});

  @override
  State<Theproduct> createState() => _TheproductState();
}

class _TheproductState extends State<Theproduct> {
  final Record recorder = Record();
  bool isRecording = false;
  Future<void> startRecording() async {
    if (await recorder.hasPermission()) {
      await recorder.start(
        path: 'recording.m4a',
        encoder: AudioEncoder.aacLc,
        bitRate: 128000,
        samplingRate: 44100,
      );

      setState(() {
        isRecording = true;
      });
    }
  }

  Future<void> stopRecording() async {
    final path = await recorder.stop();

    print("تم حفظ التسجيل في: $path");

    setState(() {
      isRecording = false;
    });
  }

  @override
  void dispose() {
    recorder.dispose();
    super.dispose();
  }

  List<Product> filteredProducts = [];
  @override
  void initState() {
    super.initState();
    filteredProducts = products;
  }

  List<Product> products = [
    Product(
      name: "Apple MacBook Air",
      code: "الكود: SKU12345",
      price: "\$4,999",
      oldPrice: "\$9,999",
      image: "images/product1.png",
      available: true,
      amount: "الكمية: 5",
    ),
    Product(
      name: "Apple AirPods Pro",
      code: "الكود: SKU-AIRP123",
      price: "\$4,999",
      oldPrice: "\$9,999",
      image: "images/product2.png",
      available: false,
      amount: "الكمية: 0",
    ),
    Product(
      name: "iPhone 17 Pro Max",
      code: "الكود:SKU-IP17PM",
      price: "\$4,999",
      oldPrice: "\$9,999",
      image: "images/product3.png",
      available: true,
      amount: "الكمية: 5",
    ),
    Product(
      name: "iPhone 16 Pro Max",
      code: "الكود: SKU12345",
      price: "\$4,999",
      oldPrice: "\$9,999",
      image: "images/product4.png",
      available: true,
      amount: "الكمية: 5",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "images/linear1.png",
                  fit: BoxFit.fill,
                  width: 415.w,
                  height: 115.h,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 70.h),
                  child: Center(
                    child: Text(
                      "  المنتجات",
                      style: GoogleFonts.cairo(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xffFFFFFF),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 57.h,
                  left: 10.w,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xff000000),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Homepage()),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),

            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: Container(
                    width: 283.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: Color(0xff919191)),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 24.w,
                          height: 24.h,
                          child: Icon(Icons.search, color: Color(0xff292D32)),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                filteredProducts =
                                    products.where((product) {
                                      return product.name
                                          .toLowerCase()
                                          .contains(value.toLowerCase());
                                    }).toList();
                              });
                            },
                            decoration: InputDecoration(
                              hintText: "ابحث...",
                              border: InputBorder.none,
                              hintStyle: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff9A9A9A),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 24.w,
                          height: 24.h,
                          child: IconButton(
                            icon: Icon(
                              isRecording ? Icons.stop : Icons.mic,
                              color: Color(0xff000000),
                            ),
                            onPressed: () async {
                              if (isRecording) {
                                await stopRecording();
                              } else {
                                await startRecording();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                InkWell(
                  onTap: () {
                    /*   Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => SecondPage(), // غير اسم الصفحة هون 
                      ),
                    ); */
                  },
                  child: Stack(
                    children: [
                      Image.asset(
                        "images/OrangeSmall.png",
                        width: 44.w,
                        height: 44.h,
                      ),
                      Positioned(
                        top: 10.h,
                        left: 11.w,
                        child: Image.asset(
                          "images/sett.png",
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Expanded(
              child: ListView.builder(
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];

                  return ProductCard(
                    name: product.name,
                    code: product.code,
                    price: product.price,
                    oldPrice: product.oldPrice,
                    image: product.image,
                    available: product.available,
                    amount: product.amount,
                    onDelete: () {
                      setState(() {
                        products.removeAt(index);
                      });
                    },
                    onEdit: () {
                      final nameController = TextEditingController(
                        text: product.name,
                      );
                      final codeController = TextEditingController(
                        text: product.code,
                      );
                      final priceController = TextEditingController(
                        text: product.price,
                      );
                      final oldPriceController = TextEditingController(
                        text: product.oldPrice,
                      );
                      final amountController = TextEditingController(
                        text: product.amount,
                      );

                      bool available = product.available;

                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("تعديل المنتج"),
                            content: SingleChildScrollView(
                              child: Column(
                                children: [
                                  TextField(
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      labelText: "الاسم",
                                    ),
                                  ),
                                  TextField(
                                    controller: codeController,
                                    decoration: InputDecoration(
                                      labelText: "الكود",
                                    ),
                                  ),
                                  TextField(
                                    controller: priceController,
                                    decoration: InputDecoration(
                                      labelText: "السعر",
                                    ),
                                  ),
                                  TextField(
                                    controller: oldPriceController,
                                    decoration: InputDecoration(
                                      labelText: "السعر القديم",
                                    ),
                                  ),
                                  TextField(
                                    controller: amountController,
                                    decoration: InputDecoration(
                                      labelText: "الكمية",
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: available,
                                        onChanged: (val) {
                                          available = val!;
                                          (context as Element).markNeedsBuild();
                                        },
                                      ),
                                      Text("متوفر"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("إلغاء"),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    products[index] = Product(
                                      name: nameController.text,
                                      code: codeController.text,
                                      price: priceController.text,
                                      oldPrice: oldPriceController.text,
                                      image: product.image,
                                      available: available,
                                      amount: amountController.text,
                                    );
                                  });
                                  Navigator.pop(context);
                                },
                                child: Text("حفظ"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 20.h, left: 20, right: 20),
              child: SizedBox(
                width: 375.w,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffF57C00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Addproduct()),
                    );
                  },
                  child: Text(
                    " اضافة المنتج",
                    style: GoogleFonts.cairo(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff000000),
                    ),
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

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String oldPrice;
  final String image;
  final bool available;
  final String code;
  final String amount;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.oldPrice,
    required this.image,
    required this.available,
    required this.code,
    required this.amount,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.all(10.w),
        width: 343.w,
        height: 135.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Color(0xff919191)),
        ),
        child: Row(
          children: [
            Container(
              width: 102.w,
              height: 119.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.cairo(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff000000),
                        ),
                      ),
                      SizedBox(width: 20.w),
                      GestureDetector(
                        onTap: onDelete,
                        child: Icon(Icons.delete, color: Color(0xffD50004)),
                      ),
                      SizedBox(width: 10.w),
                      GestureDetector(
                        onTap: onEdit,
                        child: Icon(
                          Icons.drive_file_rename_outline_rounded,
                          color: Color(0xff2E7D32),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    code,
                    style: GoogleFonts.cairo(
                      fontSize: 12.sp,
                      color: Color(0xff4A4A4A),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Text(
                        price,
                        style: TextStyle(fontSize: 14.sp, color: Colors.black),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        oldPrice,
                        style: GoogleFonts.cairo(
                          fontSize: 12.sp,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Text(amount),
                      Spacer(),
                      Container(
                        width: 14.w,
                        height: 14.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: CircleAvatar(
                          radius: 6.r,
                          backgroundColor:
                              available ? Color(0xff05FF5D) : Color(0xffD90105),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Text(available ? "متوفر" : "غير متوفر"),
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
