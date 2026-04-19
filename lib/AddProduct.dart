import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class Addproduct extends StatefulWidget {
  const Addproduct({super.key});

  @override
  State<Addproduct> createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> {
  String? available;
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    if (source == ImageSource.camera) {
      var status = await Permission.camera.request();
      if (!status.isGranted) return;
    } else {
      var status = await Permission.storage.request();
      if (!status.isGranted) return;
    }

    final XFile? pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, //  الإغلاق عند الضغط خارجه
      builder: (context) {
        return Dialog(
          backgroundColor: Color(0xffFFFFFF), // لون الخلفية
          child: Container(
            width: 304.w, //  العرض
            height: 323.h, //  الطول
            decoration: BoxDecoration(
              color: Colors.white, //  لون الديالوق
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //   الصح
                  Container(
                    child: Image.asset(
                      "images/green_check.png",
                      width: 107.w,
                      height: 107.h,
                    ),
                  ),

                  SizedBox(height: 20),

                  // النص
                  Text(
                    "تم اضافة المنتج\nبنجاح",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cairo(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: SingleChildScrollView(
          child: Column(
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
                        " اضافة المنتجات",
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
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.only(right: 20.w, top: 15.h),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "اضافة منتج جديد",
                    style: GoogleFonts.cairo(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 20.w),
                    child: Text(
                      "اسم المنتج",
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Container(
                    width: 267.w,
                    height: 48.h,
                    child: TextField(
                      keyboardType: TextInputType.text,

                      decoration: InputDecoration(
                        hintText: "",
                        fillColor: Color(0xffF5F5F5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.only(top: 20.h, right: 20.w),
                child: Text(
                  "وصف قصير عن المنتج",
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Container(
                width: 343.w,
                height: 56.h,

                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "",
                    fillColor: Color(0xffF5F5F5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.only(top: 10.h, right: 20.w),
                    child: Text(
                      "  صورة المنتج",
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.only(top: 10.h, right: 5.w),
                    child: Text(
                      "(يمكن وضع اكثر من صورة)",
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              GestureDetector(
                onTap: showImageSourceDialog,
                onLongPress: () {
                  setState(() {
                    _image = null;
                  });
                },
                child: Container(
                  width: 343.w,
                  height: 86.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff919191)),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child:
                      _image == null
                          ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Image.asset(
                                  "images/camera.png",
                                  width: 30.w,
                                  height: 30.h,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "صورة PNG أو JPG",
                                    style: GoogleFonts.cairo(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    " (صورة من الكاميرا)",
                                    style: GoogleFonts.cairo(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                      color: Color(0xff787878),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                          : ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: Image.file(
                              _image!,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 20.w),
                    child: Text(
                      "سعر المنتج",
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Container(
                    width: 121.w,
                    height: 30.h,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(right: 10.w),
                        hintText: "\$",
                        hintStyle: GoogleFonts.cairo(
                          color: Color(0xff707070),
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                        fillColor: Color(0xffF5F5F5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 20.w),
                    child: Text(
                      "السعر بعد الخصم",
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Container(
                    width: 121.w,
                    height: 30.h,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(right: 10.w),
                        hintText: "\$",
                        hintStyle: GoogleFonts.cairo(
                          color: Color(0xff707070),
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                        fillColor: Color(0xffF5F5F5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 20.w),
                    child: Text(
                      "الكمية",
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Container(
                    width: 86.w,
                    height: 30.h,
                    child: TextField(
                      keyboardType: TextInputType.number,

                      decoration: InputDecoration(
                        hintText: "",
                        fillColor: Color(0xffF5F5F5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 20.w),
                    child: Text(
                      "حالة التوفر:",
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),

                  Expanded(
                    child: RadioListTile(
                      activeColor: Color(0xff05FF5D),
                      title: Text(
                        "متوفر",
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: Color(0xff000000),
                        ),
                      ),
                      value: "متوفر",
                      groupValue: available,
                      onChanged: (val) {
                        setState(() {
                          available = val;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      activeColor: Color(0xffD90105),
                      title: Text(
                        "غير متوفر",
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: Color(0xff000000),
                        ),
                      ),
                      value: "غير متوفر",
                      groupValue: available,
                      onChanged: (val) {
                        setState(() {
                          available = val;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 35.h, left: 20, right: 20),
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
                      // بعد إضافة المنتج (firebase)
                      showSuccessDialog(context);
                    },
                    child: Text(
                      " تاكيد اضافة المنتج",
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
      ),
    );
  }
}
