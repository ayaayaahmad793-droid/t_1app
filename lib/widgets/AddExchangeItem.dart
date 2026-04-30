import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t_1app/models/exchangeItem.dart';

class AddProductDialog extends StatefulWidget {
  final Function(ExchangeItem) onAdd;

  const AddProductDialog({super.key, required this.onAdd});

  @override
  State<AddProductDialog> createState() => _AddProductDialogState();
}

class _AddProductDialogState extends State<AddProductDialog> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  XFile? selectedImage;
  final ImagePicker picker = ImagePicker();
  Future<void> pickImage(ImageSource source) async {
    final picked = await picker.pickImage(source: source);

    if (picked != null) {
      setState(() {
        selectedImage = picked;
      });
    }
  }

  Widget buildSuccessDialog() {
    return Dialog(
      backgroundColor: Color(0xffFFFFFF),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Container(
        width: 304.w,
        height: 323.h,
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/green_check.png", width: 107.w, height: 107.h),
            SizedBox(height: 20.h),
            Text(
              "تم اضافة المنتج\nبنجاح",
              textAlign: TextAlign.center,
              style: GoogleFonts.cairo(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: SizedBox(
          width: 331.w,
          height: 535.h,
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "قم باضافة البيانات المطلوبة لتتم ",
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    "اضافة منتجك للتبادل",
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),

                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "اسم المنتج",
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: 190.w,
                        height: 35.h,
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 15.h),
                  Text(
                    "اكتب وصفًا قصيرًا للمنتج وحدد ما تريد مقابله بالتبادل",
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 15.h),

                  /// الوصف
                  Container(
                    width: 299,
                    height: 64.h,
                    child: TextField(
                      controller: descController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "صورة المنتج",
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return SafeArea(
                            child: Wrap(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.camera_alt),
                                  title: Text("الكاميرا"),
                                  onTap: () {
                                    Navigator.pop(context);
                                    pickImage(ImageSource.camera);
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.photo),
                                  title: Text("المعرض"),
                                  onTap: () {
                                    Navigator.pop(context);
                                    pickImage(ImageSource.gallery);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },

                    child: Container(
                      height: 115.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xff919191)),
                      ),
                      child:
                          selectedImage == null
                              ? Center(
                                child: Text(
                                  "+ إضافة صورة من الجهاز",
                                  style: GoogleFonts.cairo(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                              : ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.file(
                                  File(selectedImage!.path),
                                  fit: BoxFit.cover,
                                ),
                              ),
                    ),
                  ),
                  SizedBox(height: 50.h),

                  /// زر التأكيد
                  SizedBox(
                    width: double.infinity,
                    height: 48.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffF57C00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      onPressed: () async {
                        if (nameController.text.isEmpty ||
                            descController.text.isEmpty ||
                            selectedImage == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("يرجى تعبئة جميع الحقول")),
                          );
                          return;
                        }

                        ExchangeItem newItem = ExchangeItem(
                          title: nameController.text,
                          description: descController.text,
                          image: selectedImage!.path,
                        );

                        widget.onAdd(newItem);

                        /// نخزن navigator قبل ما نسكر
                        final navigator = Navigator.of(
                          context,
                          rootNavigator: true,
                        );

                        /// سكري Dialog الإدخال
                        Navigator.pop(context);

                        /// ننتظر frame جديد (مهم جدًا)
                        await Future.delayed(Duration(milliseconds: 200));

                        /// نفتح Dialog النجاح
                        showDialog(
                          context: navigator.context,
                          barrierDismissible: false,
                          builder: (context) => buildSuccessDialog(),
                        );

                        /// ننتظر
                        await Future.delayed(Duration(seconds: 2));

                        /// نسكر Dialog النجاح
                        navigator.pop();
                      },
                      child: Text(
                        "تأكيد الطلب",
                        style: GoogleFonts.cairo(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
