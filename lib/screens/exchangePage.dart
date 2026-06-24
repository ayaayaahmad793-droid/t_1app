import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/screens/department.dart';
import 'package:t_1app/widgets/AddExchangeItem.dart';
import 'package:t_1app/widgets/exchangeCard.dart';
import 'package:t_1app/widgets/greenHeader.dart';
import 'package:t_1app/widgets/searchBox.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/providers/exchange_provider.dart';
import 'package:t_1app/providers/favorite_provider.dart';

import '../models/UniqeProduct_model.dart';

class Exchange extends StatefulWidget {
  const Exchange({super.key});

  @override
  State<Exchange> createState() => _ExchangeState();
}

class _ExchangeState extends State<Exchange> {
 
  

  @override
  Widget build(BuildContext context) {
    final exchangeProvider = Provider.of<ExchangeProvider>(context);

    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    final exchangeList = exchangeProvider.exchangeList;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: Column(
          children: [
            GreenHeader(title: "بدل بفائدة",
              onBack: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => Department()),
                );
              },
            ),
            SizedBox(height: 15.h),
          SearchBox(
              onChanged: (value) {
                exchangeProvider.updateSearch(value);
              },
            ),
            SizedBox(height: 15.h),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  itemCount: exchangeList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 12.h,
                    childAspectRatio: 167 / 205,
                  ),
                  itemBuilder: (context, index) {
                    final currentItem = exchangeList[index];

                    // 🟢 الحل الجذري: إنشاء كائن ProductU1 مؤقت يحمل بيانات العنصر الحالي
                    final tempProduct = ProductU1(
                      productName: currentItem.title,
                      productDescription: currentItem.description,
                      price: 0.0,
                      oldPrice: 0.0,
                      evaluation: 0.0,
                      productImage: currentItem.image,
                    );

                    return ExchangeCard(
                      title: currentItem.title,
                      description: currentItem.description,
                      image: currentItem.image,

                      // 🟢 التحقق من المفضلة باستخدام الكائن المؤقت
                      isFavorite: favoriteProvider.isFavorite(tempProduct),

                      onFavoriteTap: () {
                        // 🟢 التفاعل مع المفضلة باستخدام الكائن المؤقت لتجنب أي أخطاء في التطابق
                        if (favoriteProvider.isFavorite(tempProduct)) {
                          favoriteProvider.removeFromFavorite(tempProduct);
                        } else {
                          favoriteProvider.addToFavorite(tempProduct);
                        }
                        setState(() {});
                      },
                    );
                  },
                ),
              ),
            ),

            // Expanded(
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 20.w),
            //     child: GridView.builder(
            //       padding: EdgeInsets.symmetric(vertical: 10.h),
            //       itemCount: exchangeList.length,
            //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2,
            //         crossAxisSpacing: 10.w,
            //         mainAxisSpacing: 12.h,
            //         childAspectRatio: 167 / 205,
            //       ),
            //       itemBuilder: (context, index) {
            //         return ExchangeCard(
            //           title: exchangeList[index].title,
            //           description: exchangeList[index].description,
            //           image: exchangeList[index].image,
            //          isFavorite: favoriteProvider.isFavorite(
            //             exchangeList[index],
            //           ),
            //          onFavoriteTap: () {
            //             final item = exchangeList[index];
            //
            //             if (favoriteProvider.isFavorite(item)) {
            //               favoriteProvider.removeFromFavorite(item);
            //             } else {
            //               favoriteProvider.addToFavorite(item);
            //             }
            //           },
            //         );
            //       },
            //     ),
            //   ),
            // ),
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
                    showDialog(
                      context: context,
                      builder:
                          (_) => AddProductDialog(
                            onAdd: (item) {
                             exchangeProvider.addItem(item);
                            },
                            title1: "قم بإضافة البيانات المطلوبة لتتم",
                            title2: "إضافة منتجك للتبادل",
                          ),
                    );
                  },
                  child: Text(
                    "أضف منتجك للتبديل +",
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
