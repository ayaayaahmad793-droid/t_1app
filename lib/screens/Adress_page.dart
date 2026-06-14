import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/models/Button_Model.dart';
import 'package:t_1app/providers/forgot_provider.dart';
import 'package:t_1app/screens/AddNewCardPage.dart';
import 'package:t_1app/screens/CartPage.dart';
import 'package:t_1app/screens/TheComplete_Order_page.dart';
import 'package:t_1app/successDialog.dart';
import 'package:t_1app/widgets/Button.dart';
import 'package:t_1app/widgets/CityDropdownWidget.dart';
import 'package:t_1app/widgets/CountryDropdownWidget.dart';
import 'package:t_1app/widgets/Phone_Widget.dart';
import 'package:t_1app/providers/address_provider.dart';
import 'package:t_1app/models/address_model.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final TextEditingController fullNameController = TextEditingController();

  final TextEditingController streetController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,

        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  /// Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.edit,
                        color: const Color(0xff2E7D32),
                        size: 22.sp,
                      ),

                      Text(
                        "العنوان",
                        style: GoogleFonts.cairo(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_forward_ios, size: 20.sp),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),

                  /// الاسم الكامل
                  buildLabel("الاسم كامل"),
                  SizedBox(height: 10.h),

                  buildTextField(
                    hint: "ادخل اسمك الكامل",
                    onChanged: (value) {
                      context.read<AddressProvider>().setFullName(value);
                    },
                  ),

                  SizedBox(height: 25.h),

                  /// الدولة
                  buildLabel("الدولة"),
                  SizedBox(height: 10.h),

                  CountryDropdownWidget(),

                  SizedBox(height: 25.h),

                  /// المدينة
                  buildLabel("المدينة"),
                  SizedBox(height: 10.h),

                  CityDropdownWidget(),

                  SizedBox(height: 25.h),

                  /// الشارع
                  buildLabel("الشارع"),
                  SizedBox(height: 10.h),

                  buildTextField(
                    onChanged: (value) {
                      context.read<AddressProvider>().setStreet(value);
                    },
                  ),

                  SizedBox(height: 25.h),

                  PhoneWidget(
                    errorText: context.watch<ForgotProvider>().phoneError,
                    onChanged: (val) {
                      context.read<AddressProvider>().setPhone(val);
                    },
                  ),

                  SizedBox(height: 60.h),

                  /// زر تم
                  SizedBox(
                    height: 50.h,
                    width: double.infinity,
                    child: CustomButton(
                      button: ButtonModel(
                        text: "تم",
                        color: const Color(0xffF57C00),
                        onPressed: () {
                          final provider = context.read<AddressProvider>();

                          provider.saveAddress(
                            AddressModel(
                              fullName: provider.fullName,
                              country: provider.country,
                              city: provider.city,
                              street: provider.street,
                              phone: provider.phone,
                            ),
                          );

                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return Successdialog(
                                message: "تمت اضافة العنوان بنجاح",
                                nextPage: ThecompleteOrderPage(),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Label
  Widget buildLabel(String text) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        text,
        style: GoogleFonts.cairo(fontSize: 20.sp, fontWeight: FontWeight.w600),
      ),
    );
  }

  /// TextField
  Widget buildTextField({String? hint, Function(String)? onChanged}) {
    return SizedBox(
      child: TextField(
        textAlign: TextAlign.right,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),

          filled: true,
          fillColor: const Color(0xffF5F5F5),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none,
          ),

          contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
        ),
      ),
    );
  }
}
