import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/models/Button_Model.dart';
import 'package:t_1app/models/notification_model.dart';
import 'package:t_1app/providers/notification_provider.dart';
import 'package:t_1app/screens/TheComplete_Order_page.dart';
import 'package:t_1app/successDialog.dart';
import 'package:t_1app/widgets/Button.dart';
import 'package:t_1app/widgets/header.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/providers/card_provider.dart';
import 'package:t_1app/models/card_model.dart';

class AddNewCardPage extends StatefulWidget {
  const AddNewCardPage({super.key});

  @override
  State<AddNewCardPage> createState() => _AddNewCardPageState();
}

class _AddNewCardPageState extends State<AddNewCardPage> {
  bool saveCard = true;

  final TextEditingController nameController = TextEditingController();

  final TextEditingController cardController = TextEditingController();

  final TextEditingController cvvController = TextEditingController();

  /// VARIABLES فوق build
  String? selectedMonth;
  String? selectedYear;

  List<String> months = [
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12",
  ];

  List<String> years = ["24", "25", "26", "27", "28", "29", "30"];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,

      child: Scaffold(
        backgroundColor: Colors.white,

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              /// HEADER
              CustomHeader(
                title: "اضافة بطاقة جديدة",
                onBack: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => ThecompleteOrderPage()),
                  );
                },
              ),
              SizedBox(height: 30.h),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Stack(
                      children: [
                        Center(
                          child: Image.asset(
                            "images/NewCard2.png",
                            width: 261.78.w,
                            height: 148.39.h,
                          ),
                        ),
                        Positioned(
                          right: 70.w,
                          top: 20.h,
                          child: Text(
                            "09/23",
                            style: TextStyle(fontSize: 11.sp),
                          ),
                        ),
                        Positioned(
                          left: 70.w,
                          top: 20.h,
                          child: SizedBox(
                            width: 42.w,
                            height: 28.h,

                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,

                                  child: CircleAvatar(
                                    radius: 12.r,
                                    backgroundColor: Colors.red,
                                  ),
                                ),

                                Positioned(
                                  left: 14.w,

                                  child: CircleAvatar(
                                    radius: 12.r,
                                    backgroundColor: Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right: 70.w,
                          top: 60.h,
                          child: Text(
                            "2689",
                            style: TextStyle(fontSize: 12.sp),
                          ),
                        ),
                        Positioned(
                          top: 60.h,
                          right: 150.w,
                          child: _cardNumber("...."),
                        ),
                        Positioned(
                          top: 60.h,
                          right: 200.w,
                          child: _cardNumber("...."),
                        ),
                        Positioned(
                          top: 60.h,
                          right: 250.w,
                          child: _cardNumber("...."),
                        ),
                        Positioned(
                          top: 110.h,
                          right: 70.w,
                          child: Text(
                            "Debit Card",
                            style: TextStyle(fontSize: 11.sp),
                          ),
                        ),
                        Positioned(
                          top: 110.h,
                          left: 70.w,
                          child: Text(
                            "mastercard",
                            style: TextStyle(fontSize: 11.sp),
                          ),
                        ),

                        /////////////////////////////////
                      ],
                    ),

                    SizedBox(height: 20.h),

                    /// NAME
                    _title("الاسم على البطاقة"),
                    SizedBox(height: 10.h),

                    _customTextField(
                      controller: nameController,
                      hint: "ادخل اسمك الكامل",
                    ),

                    SizedBox(height: 22.h),

                    /// CARD NUMBER
                    _title("رقم البطاقة"),
                    SizedBox(height: 10.h),

                    _customTextField(
                      controller: cardController,
                      hint: "2226*****",
                      prefix: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 8.r,
                            backgroundColor: Colors.red,
                          ),

                          Transform.translate(
                            offset: Offset(-5.w, 0),

                            child: CircleAvatar(
                              radius: 8.r,
                              backgroundColor: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 22.h),

                    /// DATE
                    _title("تاريخ الانتهاء"),
                    SizedBox(height: 10.h),

                    Row(
                      children: [
                        /// MONTH
                        Expanded(
                          child: Container(
                            height: 55.h,
                            padding: EdgeInsets.symmetric(horizontal: 12.w),

                            decoration: BoxDecoration(
                              color: const Color(0xffF3F3F3),
                              borderRadius: BorderRadius.circular(12.r),
                            ),

                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedMonth,

                                isExpanded: true,

                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 22.sp,
                                ),

                                hint: Text(
                                  "(MM) الشهر",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.black,
                                  ),
                                ),

                                items:
                                    months.map((String month) {
                                      return DropdownMenuItem(
                                        value: month,

                                        child: Text(
                                          month,
                                          textAlign: TextAlign.right,
                                        ),
                                      );
                                    }).toList(),

                                onChanged: (value) {
                                  setState(() {
                                    selectedMonth = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 14.w),

                        /// YEAR
                        Expanded(
                          child: Container(
                            height: 55.h,
                            padding: EdgeInsets.symmetric(horizontal: 12.w),

                            decoration: BoxDecoration(
                              color: const Color(0xffF3F3F3),
                              borderRadius: BorderRadius.circular(12.r),
                            ),

                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedYear,

                                isExpanded: true,

                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 22.sp,
                                ),

                                hint: Text(
                                  "(YY) السنة",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.black,
                                  ),
                                ),

                                items:
                                    years.map((String year) {
                                      return DropdownMenuItem(
                                        value: year,

                                        child: Text(
                                          year,
                                          textAlign: TextAlign.right,
                                        ),
                                      );
                                    }).toList(),

                                onChanged: (value) {
                                  setState(() {
                                    selectedYear = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 22.h),

                    /// CVV
                    _title("(CVV) كوت"),
                    SizedBox(height: 10.h),

                    _customTextField(controller: cvvController, hint: "*****"),

                    SizedBox(height: 18.h),

                    /// CHECKBOX
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        Checkbox(
                          value: saveCard,

                          activeColor: Color(0xffF57C00),

                          onChanged: (value) {
                            setState(() {
                              saveCard = value!;
                            });
                          },
                        ),

                        Text(
                          "حفظ البطاقة لاستخدامها",

                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 12.h),

                    /// BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 50.h,

                      child: CustomButton(
                        button: ButtonModel(
                          text: "اضافة البطاقة",
                          color: Color(0xffF57C00),
                          onPressed: () {
                            if (nameController.text.isEmpty ||
                                cardController.text.isEmpty ||
                                selectedMonth == null ||
                                selectedYear == null) {
                              return;
                            }

                            context.read<CardProvider>().addCard(
                              CardModel(
                                cardHolderName: nameController.text,
                                cardNumber: cardController.text,
                                expiryMonth: selectedMonth!,
                                expiryYear: selectedYear!,
                              ),
                            );
                            context
                                .read<NotificationProvider>()
                                .addNotification(
                                  NotificationItem(
                                    icon: "💳",
                                    title: "تمت إضافة بطاقة دفع جديدة بنجاح",
                                    time: "الآن",
                                    category: "شراء",
                                  ),
                                );

                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return Successdialog(
                                  message: "تمت اضافة البطاقة بنجاح",
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _title(String text) {
    return Align(
      alignment: Alignment.centerRight,

      child: Text(
        text,

        style: GoogleFonts.cairo(fontSize: 16.sp, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _customTextField({
    required TextEditingController controller,
    required String hint,
    Widget? prefix,
  }) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.right,

      decoration: InputDecoration(
        hintText: hint,

        prefixIcon: prefix,

        filled: true,
        fillColor: const Color(0xffF3F3F3),

        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),

          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),

          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),

          borderSide: BorderSide(color: Colors.orange, width: 1.w),
        ),
      ),
    );
  }

  Widget _dropDownBox(String text) {
    return Container(
      height: 55.h,

      padding: EdgeInsets.symmetric(horizontal: 14.w),

      decoration: BoxDecoration(
        color: const Color(0xffF3F3F3),

        borderRadius: BorderRadius.circular(12.r),
      ),

      child: Row(
        children: [
          Icon(Icons.keyboard_arrow_down, size: 22.sp),

          const Spacer(),

          Text(text, style: TextStyle(fontSize: 14.sp)),
        ],
      ),
    );
  }

  Widget _cardNumber(String text) {
    return Text(
      text,

      style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
    );
  }
}
