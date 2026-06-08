import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t_1app/models/makeupandclothes_model.dart';
import 'package:t_1app/screens/productDetails.dart';
import 'package:t_1app/widgets/Home_widget/product_card_widget.dart';
import 'package:provider/provider.dart';
import 'package:t_1app/providers/fashion_provider.dart';

class MakeupandclothesAll extends StatefulWidget {
  const MakeupandclothesAll({super.key});

  @override
  State<MakeupandclothesAll> createState() => _MakeupandclothesAllState();
}

class _MakeupandclothesAllState extends State<MakeupandclothesAll> {
  @override
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FashionProvider>(context);

    final filteredProducts =
        Makeupandclothes.where((item) {
          final matchesCategory =
              provider.selectedText == "الكل" ||
              item.category == provider.selectedText;

          final matchesSearch =
              provider.searchText.isEmpty ||
              item.product.productName.contains(provider.searchText);

          return matchesCategory && matchesSearch;
        }).toList();

    return Directionality(
      textDirection: TextDirection.rtl,

      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: (filteredProducts.length / 2).ceil(),

        itemBuilder: (context, rowIndex) {
          int firstIndex = rowIndex * 2;
          int secondIndex = firstIndex + 1;

          return Padding(
            padding: EdgeInsets.only(bottom: 10.h),

            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductSliderPage(),
                        ),
                      );
                    },

                    child: ProductCard(
                      product: filteredProducts[firstIndex].product,
                    ),
                  ),
                ),

                SizedBox(width: 10.w),

                if (secondIndex < filteredProducts.length)
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductSliderPage(),
                          ),
                        );
                      },

                      child: ProductCard(
                        product: filteredProducts[secondIndex].product,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
