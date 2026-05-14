import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/screens/TheShop.dart';
import 'package:t_1app/models/Button_Model.dart';
import 'package:t_1app/providers/shopData_provider.dart';
import 'package:t_1app/widgets/Button.dart';
import 'package:t_1app/widgets/CustomImagePicker.dart';
import 'package:t_1app/widgets/CustomInputField.dart';
import 'package:t_1app/widgets/greenHeader.dart';

class ShopData extends StatefulWidget {
  const ShopData({super.key});

  @override
  State<ShopData> createState() => _ShopDataState();
}

class _ShopDataState extends State<ShopData> {
  bool imageError = false;
  final _formKey = GlobalKey<FormState>();
  String? phoneNumber;
  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final locationController = TextEditingController();
  File? _image;
  final ImagePicker _picker = ImagePicker();
  Future<void> pickImage(ImageSource source) async {
    if (source == ImageSource.camera) {
      var status = await Permission.camera.request();
      if (!status.isGranted) return;
    } else {
      var status = await Permission.storage.request(); //  الصح
      if (!status.isGranted) return;
    }

    final XFile? pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });

      Provider.of<ShopProvider>(context, listen: false).setImage(_image);
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
    final provider = Provider.of<ShopProvider>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                GreenHeader(title: "اكمال بيانات المحل"),

                SizedBox(height: 10.h),
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

                CustomInputField(
                  label: "اسم المحل",
                  controller: nameController,
                  onChanged: (value) => provider.setName(value),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "الرجاء إدخال اسم المحل";
                    }
                    return null;
                  },
                ),

                CustomInputField(
                  label: "فئة المحل",
                  controller: categoryController,
                  onChanged: (value) => provider.setCategory(value),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "الرجاء إدخال فئة المحل";
                    }
                    return null;
                  },
                ),
                CustomInputField(
                  label: "موقع المحل",
                  controller: locationController,
                  onChanged: (value) => provider.setLocation(value),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "الرجاء إدخال الموقع";
                    }
                    return null;
                  },
                ),
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
                      filled: true,
                      fillColor: Color(0xffFFFFFF),

                      // أهم جزء
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: Colors.grey),
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: Colors.grey),
                      ),

                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: Colors.red),
                      ),

                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: Colors.red, width: 2),
                      ),
                    ),
                    onChanged: (phone) {
                      phoneNumber = phone.completeNumber;
                      provider.setPhone(phone.completeNumber);
                    },
                  ),
                ),

                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 20.w, bottom: 5.h),

                  child: Text(
                    "شعار المحل",
                    style: GoogleFonts.cairo(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                CustomImagePicker(
                  image: _image,
                  onTap: showImageSourceDialog,
                  onLongPress: () {
                    setState(() {
                      _image = null;
                    });

                    Provider.of<ShopProvider>(
                      context,
                      listen: false,
                    ).setImage(null);
                  },
                ),
                if (imageError)
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: Text(
                      "الرجاء اختيار صورة",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                SizedBox(height: 40.h),
                SizedBox(
                  width: 0.9.sw,
                  height: 50.h,
                  child: CustomButton(
                    button: ButtonModel(
                      text: "انهاء التسجيل كصاحب محل",
                      color: Color(0xffF57C00),
                      onPressed: () {
                       if (!_formKey.currentState!.validate()) return;

                        //  خذي القيم مباشرة من الـ controllers
                        provider.setName(nameController.text);
                        provider.setCategory(categoryController.text);
                        provider.setLocation(locationController.text);

                        // تحقق من رقم الهاتف
                        if (provider.phone.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("أدخل رقم الهاتف")),
                          );
                          return;
                        }

                        // تحقق من الصورة
                        if (_image == null) {
                          setState(() {
                            imageError = true;
                          });
                          return;
                        } else {
                          //  مهم لإزالة الخطأ إذا اختار صورة بعدين
                          setState(() {
                            imageError = false;
                          });
                        }

                        print(provider.name);
                        print(provider.category);
                        print(provider.location);
                        print(provider.phone);

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Theshop()),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
