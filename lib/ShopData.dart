import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:t_1app/TheShop.dart';

class ShopData extends StatefulWidget {
  const ShopData({super.key});

  @override
  State<ShopData> createState() => _ShopDataState();
}

class _ShopDataState extends State<ShopData> {
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
                        "اكمال بيانات المحل",
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
                    "يجب تعبئة البيانات التالية:",
                    style: GoogleFonts.cairo(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 15.h),

              buildLabel("اسم المحل"),
              buildTextField(),

              buildLabel("فئة المحل"),
              buildTextField(),

              buildLabel("موقع المحل"),
              buildTextField(),

              Padding(
                padding: EdgeInsets.only(top: 0.h, bottom: 5.h, right: 20.w),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "رقم التواصل",
                    style: GoogleFonts.cairo(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              SizedBox(
                width: 0.9.sw,
                height: 70.h,
                child: IntlPhoneField(
                  initialCountryCode: 'PS',
                  decoration: InputDecoration(
                    hintText: "590000000",
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff797878),
                    ),
                    fillColor: Color(0xffF5F5F5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
              ),

              buildLabel("شعار المحل"),

              GestureDetector(
                onTap: showImageSourceDialog,
                onLongPress: () {
                  setState(() {
                    _image = null;
                  });
                },
                child: Container(
                  width: 0.9.sw,
                  height: 80.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child:
                      _image == null
                          ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add_a_photo, size: 30.sp),
                              SizedBox(height: 5.h),
                              Text(
                                "صورة PNG أو JPG",
                                style: GoogleFonts.cairo(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
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

              SizedBox(height: 40.h),

              SizedBox(
                width: 0.9.sw,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffF57C00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Theshop()));
                  },
                  child: Text(
                    "انهاء التسجيل كصاحب محل",
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
    );
  }

  Widget buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(top: 0.h, bottom: 5.h, right: 20.w),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          text,
          style: GoogleFonts.cairo(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget buildTextField({String hint = ""}) {
    return Container(
      width: 0.9.sw,
      height: 70.h,
      margin: EdgeInsets.only(bottom: 5.h),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          fillColor: Color(0xffF5F5F5),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
        ),
      ),
    );
  }
}
